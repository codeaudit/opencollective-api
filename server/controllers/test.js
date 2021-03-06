import config from 'config';
import Sequelize from 'sequelize';
import models, { setupModels } from '../models';
import { type } from '../constants/transactions';
import roles from '../constants/roles';
import errors from '../lib/errors';
import { exportToPDF } from '../lib/utils';
import { getTransactions } from '../lib/transactions';
import moment from 'moment';

const envsAndDatabases = {
  development: 'opencollective_test',
  circleci: 'circle_test'
};

/**
 * This resets the test-api database (and only the test-api database)
 */
export const resetTestDatabase = function(req, res, next) {

  // Hard code database name to avoid resetting the production db by mistake
  let databaseName;
  switch (process.env.NODE_ENV) {
    case 'circleci':
      databaseName = envsAndDatabases.circleci;
      break;
    case 'development':
      databaseName = envsAndDatabases.development;
      break;
    default:
      return next(new errors.BadRequest(`Unsupported NODE_ENV ${process.env.NODE_ENV} for reset API`));
  }

  const sequelize = new Sequelize(
    databaseName,
    config.database.username,
    config.database.password,
    config.database.options
  );

  const models = setupModels(sequelize);

  const userData = {
    email: 'testuser@opencollective.com',
    password: 'password'
  };

  const memberData = {
    email: 'member@opencollective.com',
    firstName: 'Xavier',
    lastName: 'Damman',
    avatar: 'https://pbs.twimg.com/profile_images/3075727251/5c825534ad62223ae6a539f6a5076d3c.jpeg'
  }

  const backerData = {
    email: 'backer@opencollective.com',
    firstName: 'Aseem',
    lastName: 'Sood',
    avatar: 'https://opencollective-production.s3-us-west-1.amazonaws.com/908fbcbca45e4a52a4309d00e980018c_e554f450-2127-11e6-9a76-e98f5a4a50b6.jpeg'
  }

  const backer2Data = {
    email: 'backer2@opencollective.com',
    firstName: 'Pia',
    lastName: 'Mancini',
    avatar: 'https://opencollective-production.s3-us-west-1.amazonaws.com/9EflVQqM_400x400jpg_2aee92e0-858d-11e6-9fd7-73dd31eb7c0c.jpeg'
  }

  const groupData = {
    name: 'OpenCollective Test Group',
    description: 'OpenCollective test group on the test server',
    slug: 'testcollective',
    mission: 'our awesome mission',
    tags: ['open source'],
    tiers: [
      { "name": "backer", "range": [2,100000], "presets": [2,10,25], "interval": "monthly" },
      { "name": "sponsor", "range": [100,500000], "presets": [100,250,500], "interval": "monthly" }
    ],
    currency: 'EUR',
    isActive: true
  };

  let testHost, testGroup, testMember, testBacker, testBacker2;
  return sequelize.sync({force: true})
    .then(() => models.User.create(userData))
    .tap(u => testHost = u)
    .then(() => {
      groupData.HostId = testHost.id;
      return models.Group.create(groupData);
    })
    .then(g => testGroup = g)
    .then(() => testGroup.addUserWithRole(testHost, roles.HOST))
    .then(() => models.User.create(memberData))
    .tap(m => testMember = m)
    .then(() => testGroup.addUserWithRole(testMember, roles.MEMBER))
    .then(() => models.User.create(backerData))
    .then(b => {
      testBacker = b;
      return testGroup.addUserWithRole(testBacker, roles.BACKER);
    })
    .then(() => models.User.create(backer2Data))
    .then(b => {
      testBacker2 = b;
      return testGroup.addUserWithRole(testBacker2, roles.BACKER);
    })
    .then(() => models.StripeAccount.create({
      accessToken: 'sk_test_WhpjxwngkrwC7S0A3AMTKjTs',
      refreshToken: 'rt_7imjrsTAPAcFc8koqCWKDEI8PNd3bumf102Z975H3E11mBWE',
      stripePublishableKey: 'pk_test_M41BhQOKfRljIeHUJUXjA6YC',
      stripeUserId: 'acct_17TL97HrqFRlDDP2',
      scope: 'read_write'
    }))
    .then(stripeAccount => testHost.setStripeAccount(stripeAccount))
    .then(() => models.ConnectedAccount.create({
      provider: 'paypal',
      // Sandbox api keys
      clientId: 'AZaQpRstiyI1ymEOGUXXuLUzjwm3jJzt0qrI__txWlVM29f0pTIVFk5wM9hLY98w5pKCE7Rik9QYvdYA',
      secret: 'EILQQAMVCuCTyNDDOWTGtS7xBQmfzdMcgSVZJrCaPzRbpGjQFdd8sylTGE-8dutpcV0gJkGnfDE0PmD8'
    }))
    .then((connectedAccount) => connectedAccount.setUser(testHost))
    .then(() => models.PaymentMethod.create({ service: 'paypal', UserId: testHost.id}))
    .then(() => models.Donation.create({
      title: "Donation 1",
      amount: 100,
      currency: 'EUR',
      GroupId: testGroup.id,
      UserId: testBacker.id
    }))
    .then(donation => models.Transaction.create({
      amount: 100,
      GroupId: testGroup.id,
      type: type.DONATION,
      currency: "EUR",
      UserId: testBacker.id,
      DonationId: donation.id,
      HostId: testHost.id
    }))
    .then(() => models.Donation.create({
      title: "Donation 2",
      amount: 200,
      currency: 'EUR',
      GroupId: testGroup.id,
      UserId: testBacker2.id
    }))
    .then(donation => models.Transaction.create({
      amount: 200,
      type: type.DONATION,
      currency: "EUR",
      UserId: testBacker2.id,
      DonationId: donation.id,
      GroupId: testGroup.id,
      HostId: testHost.id
    }))
    .then(() => models.Expense.create({
      title: "Expense 2",
      amount: 100,
      currency: "EUR",
      incurredAt: "2016-03-01T08:00:00.000Z",
      createdAt: "2016-03-01T08:00:00.000Z",
      GroupId: testGroup.id,
      UserId: testHost.id,
      lastEditedById: testHost.id,
      payoutMethod: 'paypal'
    }))
    // We add a second expense that incurred before the first expense we created
    .then(() => models.Expense.create({
      title: "Expense 1",
      amount: 200,
      currency: "EUR",
      incurredAt: "2016-02-29T08:00:00.000Z",
      createdAt: "2016-03-01T08:00:00.000Z",
      GroupId: testGroup.id,
      UserId: testMember.id,
      lastEditedById: testMember.id,
      payoutMethod: 'manual'
    }))
    .then(() => {
      res.send({
        success: true
      });
    })
    .catch(next);
};

export const getTestUserLoginUrl = function(req, res, next) {
  if (envsAndDatabases[process.env.NODE_ENV]) {
    return models.User.findOne({where: {email: 'testuser@opencollective.com'}})
    .then(user => res.redirect(user.generateLoginLink('')))
    .catch(next)
  }
  return next(new errors.BadRequest(`Unsupported NODE_ENV ${process.env.NODE_ENV} for retreiving test API login token`));
}


export const exportPDF = function(req, res, next) {

  if (!envsAndDatabases[process.env.NODE_ENV]) {
    return next(new errors.BadRequest(`Unsupported NODE_ENV ${process.env.NODE_ENV} for testing export PDF`));
  }

  const d = new Date;
  d.setMonth(d.getMonth() - 1);
  const month = moment(d).format('MMMM');

  const startDate = new Date(d.getFullYear(), d.getMonth(), 1);
  const endDate = new Date(d.getFullYear(), d.getMonth()+1, 1);

  console.log("startDate", startDate,"endDate", endDate);

  const paper = req.query.papaer || 'Letter';
  const format = req.query.format || 'html';
  const wwcodeids = ['524','47','292','275','521','525','522','262','51','295','280','283','286','510','14','515','516','518','519','520','523','512','511','513','517','59','584','299','430','48','260','261','298','272','293','273','294','263','274','276','277','301','195','241','265','297','259','266','279','267','278','12','269','270','281','10','282','3','284','264','287','268','4','300','289','13','291','285','288','271','290','15','2'];
  getTransactions(wwcodeids, startDate, endDate, { where: { type: 'EXPENSE' }, include: ["User", "Expense", "Group"] }).then(transactions => {
    console.log("transactions", JSON.stringify(transactions));
    const data = { host: { name: "WWCode", currency: 'USD' }, year: (new Date).getFullYear(), month };
    let page = 1;
    let currentPage = 0;
    const transactionsPerTOCPage = 30; // number of transaction per page of the Table Of Content (for PDF export)
    const note = `using fxrate of the day of the transaction as provided by the ECB. Your effective fxrate may vary.`;
    data.expensesPerPage = [ [] ];
    data.totalPaidExpenses = transactions.length;
    data.transactions = transactions.map(t => {
      t.page = page++;
      t.group = t.Group;
      t.group.shortSlug = t.group.slug.replace(/^wwcode-?(.)/, '$1');
      t.notes = t.Expense && t.Expense.notes;
      if (t.data && t.data.fxrateSource) {
        t.notes = (t.notes) ? `${t.notes} (${note})` : note;
        data.notes = note;
      }
      if (page - 1 % transactionsPerTOCPage === 0) {
        currentPage++;
        data.expensesPerPage[currentPage] = [];
      }
      data.expensesPerPage[currentPage].push(t);
      return t;
    });
    exportToPDF("expenses", data, { format, paper }).then(html => {
      if (format === 'pdf') {
        res.setHeader('content-type','application/pdf');      
      }
      res.send(html);
    });
  })
}