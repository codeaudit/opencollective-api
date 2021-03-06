toc.dat                                                                                             0000600 0004000 0002000 00000223476 13124477142 0014462 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       1    0                u           wwcode_test    9.6.3    9.6.3 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                    1262    2643141    wwcode_test    DATABASE     }   CREATE DATABASE wwcode_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE wwcode_test;
             dbuser    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                    0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    4                     3079    12655    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                    0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                     3079    2643142    postgis 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
    DROP EXTENSION postgis;
                  false    4                    0    0    EXTENSION postgis    COMMENT     g   COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';
                       false    2         4           1247    3444780    enum_Groups_membership_type    TYPE     i   CREATE TYPE "enum_Groups_membership_type" AS ENUM (
    'donation',
    'monthlyfee',
    'yearlyfee'
);
 0   DROP TYPE public."enum_Groups_membership_type";
       public       xdamman    false    4         7           1247    3444788    enum_UserGroups_role    TYPE     X   CREATE TYPE "enum_UserGroups_role" AS ENUM (
    'admin',
    'writer',
    'viewer'
);
 )   DROP TYPE public."enum_UserGroups_role";
       public       xdamman    false    4         �            1259    3444795 
   Activities    TABLE     �   CREATE TABLE "Activities" (
    id integer NOT NULL,
    type character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "GroupId" integer,
    "UserId" integer,
    "TransactionId" integer
);
     DROP TABLE public."Activities";
       public         dbuser    false    4         �            1259    3444801    Activities_id_seq    SEQUENCE     u   CREATE SEQUENCE "Activities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Activities_id_seq";
       public       dbuser    false    4    201                    0    0    Activities_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "Activities_id_seq" OWNED BY "Activities".id;
            public       dbuser    false    202         �            1259    3444803    ApplicationGroup    TABLE     �   CREATE TABLE "ApplicationGroup" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "GroupId" integer NOT NULL,
    "ApplicationId" integer NOT NULL
);
 &   DROP TABLE public."ApplicationGroup";
       public         dbuser    false    4         �            1259    3444806    Applications    TABLE     g  CREATE TABLE "Applications" (
    id integer NOT NULL,
    api_key character varying(255),
    name character varying(255),
    href character varying(255),
    description character varying(255),
    disabled boolean DEFAULT false,
    _access double precision DEFAULT 0,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
 "   DROP TABLE public."Applications";
       public         dbuser    false    4         �            1259    3444814    Applications_id_seq    SEQUENCE     w   CREATE SEQUENCE "Applications_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Applications_id_seq";
       public       dbuser    false    4    204                    0    0    Applications_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE "Applications_id_seq" OWNED BY "Applications".id;
            public       dbuser    false    205         �            1259    3444816    PaymentMethods    TABLE     �  CREATE TABLE "PaymentMethods" (
    id integer NOT NULL,
    number character varying(255),
    token character varying(255),
    "customerId" character varying(255),
    service character varying(255) DEFAULT 'stripe'::character varying,
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "confirmedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "UserId" integer,
    "expiryDate" timestamp with time zone
);
 $   DROP TABLE public."PaymentMethods";
       public         dbuser    false    4         �            1259    3444823    Cards_id_seq    SEQUENCE     p   CREATE SEQUENCE "Cards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Cards_id_seq";
       public       dbuser    false    4    206                    0    0    Cards_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE "Cards_id_seq" OWNED BY "PaymentMethods".id;
            public       dbuser    false    207         �            1259    3444825    Comments    TABLE     N  CREATE TABLE "Comments" (
    id integer NOT NULL,
    text text,
    "createdAt" timestamp with time zone,
    "approvedAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "UserId" integer NOT NULL,
    "GroupId" integer NOT NULL,
    "ExpenseId" integer NOT NULL
);
    DROP TABLE public."Comments";
       public         dbuser    false    4         �            1259    3444831    Comments_id_seq    SEQUENCE     s   CREATE SEQUENCE "Comments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Comments_id_seq";
       public       dbuser    false    208    4                    0    0    Comments_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE "Comments_id_seq" OWNED BY "Comments".id;
            public       dbuser    false    209         �            1259    3444833    ConnectedAccounts    TABLE     �  CREATE TABLE "ConnectedAccounts" (
    id integer NOT NULL,
    provider character varying(255),
    username character varying(255),
    "clientId" character varying(255),
    secret character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "UserId" integer,
    "GroupId" integer
);
 '   DROP TABLE public."ConnectedAccounts";
       public         dbuser    false    4         �            1259    3444839    ConnectedAccounts_id_seq    SEQUENCE     |   CREATE SEQUENCE "ConnectedAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ConnectedAccounts_id_seq";
       public       dbuser    false    210    4                    0    0    ConnectedAccounts_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "ConnectedAccounts_id_seq" OWNED BY "ConnectedAccounts".id;
            public       dbuser    false    211         �            1259    3444841 	   Donations    TABLE       CREATE TABLE "Donations" (
    id integer NOT NULL,
    "UserId" integer,
    "GroupId" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    amount integer,
    title character varying(255),
    "SubscriptionId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "PaymentMethodId" integer,
    "isProcessed" boolean DEFAULT false,
    "processedAt" timestamp with time zone,
    "ResponseId" integer,
    notes text
);
    DROP TABLE public."Donations";
       public         dbuser    false    4         �            1259    3444849    Donations_id_seq    SEQUENCE     t   CREATE SEQUENCE "Donations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Donations_id_seq";
       public       dbuser    false    4    212                    0    0    Donations_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE "Donations_id_seq" OWNED BY "Donations".id;
            public       dbuser    false    213         �            1259    3444851    Events    TABLE     �  CREATE TABLE "Events" (
    id integer NOT NULL,
    name character varying(255),
    description text,
    "createdByUserId" integer,
    "GroupId" integer,
    slug character varying(255),
    "locationName" character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "maxAmount" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    address character varying(255),
    "backgroundImage" character varying(255),
    "geoLocationLatLong" geometry(Point),
    timezone text
);
    DROP TABLE public."Events";
       public         dbuser    false    4    2    2    4    2    4    4    2    4    2    4    2    4    2    4    2    4         �            1259    3444858    Events_id_seq    SEQUENCE     q   CREATE SEQUENCE "Events_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Events_id_seq";
       public       dbuser    false    4    214                    0    0    Events_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE "Events_id_seq" OWNED BY "Events".id;
            public       dbuser    false    215         �            1259    3444860    ExpenseHistories    TABLE     �  CREATE TABLE "ExpenseHistories" (
    id integer,
    "UserId" integer,
    "GroupId" integer,
    currency character varying(255),
    amount integer,
    title character varying(255),
    "payoutMethod" character varying(255),
    notes text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255),
    "incurredAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);
 &   DROP TABLE public."ExpenseHistories";
       public         dbuser    false    4         �            1259    3444866    ExpenseHistories_hid_seq    SEQUENCE     |   CREATE SEQUENCE "ExpenseHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."ExpenseHistories_hid_seq";
       public       dbuser    false    4    216                    0    0    ExpenseHistories_hid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "ExpenseHistories_hid_seq" OWNED BY "ExpenseHistories".hid;
            public       dbuser    false    217         �            1259    3444868    Expenses    TABLE     �  CREATE TABLE "Expenses" (
    id integer NOT NULL,
    "UserId" integer NOT NULL,
    "GroupId" integer NOT NULL,
    currency character varying(255) NOT NULL,
    amount integer NOT NULL,
    title character varying(255) NOT NULL,
    notes text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer NOT NULL,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    "incurredAt" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "payoutMethod" character varying(255) NOT NULL
);
    DROP TABLE public."Expenses";
       public         dbuser    false    4         �            1259    3444875    Expenses_id_seq    SEQUENCE     s   CREATE SEQUENCE "Expenses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Expenses_id_seq";
       public       dbuser    false    4    218                    0    0    Expenses_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE "Expenses_id_seq" OWNED BY "Expenses".id;
            public       dbuser    false    219         �            1259    3444877    GroupHistories    TABLE     �  CREATE TABLE "GroupHistories" (
    id integer,
    name character varying(255),
    description character varying(255),
    currency character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean,
    "longDescription" text,
    logo character varying(255),
    video character varying(255),
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    tiers json,
    burnrate integer,
    mission character varying(255),
    budget integer,
    "expensePolicy" text,
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    "whyJoin" text,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean,
    "lastEditedByUserId" integer,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);
 $   DROP TABLE public."GroupHistories";
       public         dbuser    false    4         �            1259    3444883    GroupHistories_hid_seq    SEQUENCE     z   CREATE SEQUENCE "GroupHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."GroupHistories_hid_seq";
       public       dbuser    false    4    220                     0    0    GroupHistories_hid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE "GroupHistories_hid_seq" OWNED BY "GroupHistories".hid;
            public       dbuser    false    221         �            1259    3444885    Groups    TABLE     �  CREATE TABLE "Groups" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean DEFAULT false,
    "longDescription" text,
    logo character varying(255),
    video character varying(255),
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    tiers json,
    burnrate integer,
    mission character varying(128),
    budget integer,
    "expensePolicy" text,
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    "whyJoin" text,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean DEFAULT false,
    "lastEditedByUserId" integer
);
    DROP TABLE public."Groups";
       public         dbuser    false    4         �            1259    3444894    Groups_id_seq    SEQUENCE     q   CREATE SEQUENCE "Groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Groups_id_seq";
       public       dbuser    false    4    222         !           0    0    Groups_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE "Groups_id_seq" OWNED BY "Groups".id;
            public       dbuser    false    223         �            1259    3444896    Notifications    TABLE     m  CREATE TABLE "Notifications" (
    id integer NOT NULL,
    channel character varying(255) DEFAULT 'email'::character varying,
    type character varying(255),
    active boolean DEFAULT true,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "UserId" integer,
    "GroupId" integer,
    "webhookUrl" character varying(255)
);
 #   DROP TABLE public."Notifications";
       public         dbuser    false    4         �            1259    3444904    Paykeys    TABLE     o  CREATE TABLE "Paykeys" (
    id integer NOT NULL,
    "trackingId" character varying(255),
    paykey character varying(255),
    status character varying(255),
    payload json,
    data json,
    error json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "TransactionId" integer
);
    DROP TABLE public."Paykeys";
       public         dbuser    false    4         �            1259    3444910    Paykeys_id_seq    SEQUENCE     r   CREATE SEQUENCE "Paykeys_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Paykeys_id_seq";
       public       dbuser    false    225    4         "           0    0    Paykeys_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE "Paykeys_id_seq" OWNED BY "Paykeys".id;
            public       dbuser    false    226         �            1259    3444912 	   Responses    TABLE     �  CREATE TABLE "Responses" (
    id integer NOT NULL,
    "UserId" integer,
    "GroupId" integer,
    "TierId" integer,
    "EventId" integer,
    "confirmedAt" timestamp with time zone,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    quantity integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    description character varying(255)
);
    DROP TABLE public."Responses";
       public         dbuser    false    4         �            1259    3444919    Responses_id_seq    SEQUENCE     t   CREATE SEQUENCE "Responses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Responses_id_seq";
       public       dbuser    false    227    4         #           0    0    Responses_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE "Responses_id_seq" OWNED BY "Responses".id;
            public       dbuser    false    228         �            1259    3444921    SequelizeMeta    TABLE     K   CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);
 #   DROP TABLE public."SequelizeMeta";
       public         dbuser    false    4         �            1259    3444924    Sessions    TABLE     �   CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Sessions";
       public         dbuser    false    4         �            1259    3444930    StripeAccounts    TABLE     �  CREATE TABLE "StripeAccounts" (
    id integer NOT NULL,
    "accessToken" character varying(255),
    "refreshToken" character varying(255),
    "tokenType" character varying(255),
    "stripePublishableKey" character varying(255),
    "stripeUserId" character varying(255),
    scope character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);
 $   DROP TABLE public."StripeAccounts";
       public         dbuser    false    4         �            1259    3444936    StripeAccounts_id_seq    SEQUENCE     y   CREATE SEQUENCE "StripeAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."StripeAccounts_id_seq";
       public       dbuser    false    4    231         $           0    0    StripeAccounts_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE "StripeAccounts_id_seq" OWNED BY "StripeAccounts".id;
            public       dbuser    false    232         �            1259    3444938    Subscriptions    TABLE     �  CREATE TABLE "Subscriptions" (
    id integer NOT NULL,
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "interval" character varying(255),
    "isActive" boolean DEFAULT false,
    data json,
    "stripeSubscriptionId" character varying(255),
    "activatedAt" timestamp with time zone,
    "deactivatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);
 #   DROP TABLE public."Subscriptions";
       public         dbuser    false    4         �            1259    3444946    Subscriptions_id_seq    SEQUENCE     x   CREATE SEQUENCE "Subscriptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Subscriptions_id_seq";
       public       dbuser    false    224    4         %           0    0    Subscriptions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE "Subscriptions_id_seq" OWNED BY "Notifications".id;
            public       dbuser    false    234         �            1259    3444948    Subscriptions_id_seq1    SEQUENCE     y   CREATE SEQUENCE "Subscriptions_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Subscriptions_id_seq1";
       public       dbuser    false    4    233         &           0    0    Subscriptions_id_seq1    SEQUENCE OWNED BY     D   ALTER SEQUENCE "Subscriptions_id_seq1" OWNED BY "Subscriptions".id;
            public       dbuser    false    235         �            1259    3444950    Tiers    TABLE       CREATE TABLE "Tiers" (
    id integer NOT NULL,
    "EventId" integer,
    name character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    password character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    slug character varying(255)
);
    DROP TABLE public."Tiers";
       public         dbuser    false    4         �            1259    3444957    Tiers_id_seq    SEQUENCE     p   CREATE SEQUENCE "Tiers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Tiers_id_seq";
       public       dbuser    false    4    236         '           0    0    Tiers_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE "Tiers_id_seq" OWNED BY "Tiers".id;
            public       dbuser    false    237         �            1259    3444959    Transactions    TABLE     B  CREATE TABLE "Transactions" (
    id integer NOT NULL,
    type character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    "GroupId" integer,
    "UserId" integer,
    "PaymentMethodId" integer,
    "deletedAt" timestamp with time zone,
    data json,
    "DonationId" integer,
    "platformFeeInTxnCurrency" integer,
    "hostFeeInTxnCurrency" integer,
    "paymentProcessorFeeInTxnCurrency" integer,
    "txnCurrency" character varying(255),
    "txnCurrencyFxRate" double precision,
    "amountInTxnCurrency" integer,
    "netAmountInGroupCurrency" integer,
    "ExpenseId" integer,
    uuid character varying(36),
    "HostId" integer
);
 "   DROP TABLE public."Transactions";
       public         dbuser    false    4         �            1259    3444966    Transactions_id_seq    SEQUENCE     w   CREATE SEQUENCE "Transactions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Transactions_id_seq";
       public       dbuser    false    238    4         (           0    0    Transactions_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE "Transactions_id_seq" OWNED BY "Transactions".id;
            public       dbuser    false    239         �            1259    3444968 
   UserGroups    TABLE     B  CREATE TABLE "UserGroups" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "UserId" integer NOT NULL,
    "GroupId" integer NOT NULL,
    role character varying(255) DEFAULT 'MEMBER'::character varying NOT NULL,
    id integer NOT NULL
);
     DROP TABLE public."UserGroups";
       public         dbuser    false    4         �            1259    3444972    UserGroups_id_seq    SEQUENCE     u   CREATE SEQUENCE "UserGroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."UserGroups_id_seq";
       public       dbuser    false    240    4         )           0    0    UserGroups_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "UserGroups_id_seq" OWNED BY "UserGroups".id;
            public       dbuser    false    241         �            1259    3444974    Users    TABLE     �  CREATE TABLE "Users" (
    id integer NOT NULL,
    _access integer DEFAULT 0,
    username character varying(255),
    avatar character varying(255),
    email character varying(255),
    _salt character varying(255) DEFAULT '$2a$10$JqAcT6sBbBs5pO9FkwqLEu'::character varying,
    refresh_token character varying(255) DEFAULT '$2a$10$IHs8e8FdK1.bqjvZxr4Zvu'::character varying,
    password_hash character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "seenAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "ApplicationId" integer,
    "paypalEmail" character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    "StripeAccountId" integer,
    "resetPasswordTokenHash" character varying(255),
    "resetPasswordSentAt" timestamp with time zone,
    "referrerId" integer,
    "isOrganization" boolean DEFAULT false,
    description character varying(256),
    "longDescription" text,
    mission character varying(128),
    "firstName" character varying(128),
    "lastName" character varying(128),
    "billingAddress" character varying(255),
    currency character varying(255),
    "isHost" boolean DEFAULT false
);
    DROP TABLE public."Users";
       public         dbuser    false    4         �            1259    3444985    Users_id_seq    SEQUENCE     p   CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public       dbuser    false    4    242         *           0    0    Users_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;
            public       dbuser    false    243         +           0    0    geography_columns    ACL     h   GRANT ALL ON TABLE geography_columns TO opencollective;
GRANT ALL ON TABLE geography_columns TO dbuser;
            public       xdamman    false    189         ,           0    0    geometry_columns    ACL     f   GRANT ALL ON TABLE geometry_columns TO opencollective;
GRANT ALL ON TABLE geometry_columns TO dbuser;
            public       xdamman    false    190         -           0    0    raster_columns    ACL     b   GRANT ALL ON TABLE raster_columns TO opencollective;
GRANT ALL ON TABLE raster_columns TO dbuser;
            public       xdamman    false    199         .           0    0    raster_overviews    ACL     f   GRANT ALL ON TABLE raster_overviews TO opencollective;
GRANT ALL ON TABLE raster_overviews TO dbuser;
            public       xdamman    false    200         /           0    0    spatial_ref_sys    ACL     �   REVOKE SELECT ON TABLE spatial_ref_sys FROM PUBLIC;
REVOKE ALL ON TABLE spatial_ref_sys FROM xdamman;
GRANT ALL ON TABLE spatial_ref_sys TO dbuser;
GRANT SELECT ON TABLE spatial_ref_sys TO PUBLIC;
            public       dbuser    false    187         �           2604    3444987    Activities id    DEFAULT     d   ALTER TABLE ONLY "Activities" ALTER COLUMN id SET DEFAULT nextval('"Activities_id_seq"'::regclass);
 >   ALTER TABLE public."Activities" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    202    201         �           2604    3444988    Applications id    DEFAULT     h   ALTER TABLE ONLY "Applications" ALTER COLUMN id SET DEFAULT nextval('"Applications_id_seq"'::regclass);
 @   ALTER TABLE public."Applications" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    205    204         �           2604    3444989    Comments id    DEFAULT     `   ALTER TABLE ONLY "Comments" ALTER COLUMN id SET DEFAULT nextval('"Comments_id_seq"'::regclass);
 <   ALTER TABLE public."Comments" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    209    208         �           2604    3444990    ConnectedAccounts id    DEFAULT     r   ALTER TABLE ONLY "ConnectedAccounts" ALTER COLUMN id SET DEFAULT nextval('"ConnectedAccounts_id_seq"'::regclass);
 E   ALTER TABLE public."ConnectedAccounts" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    211    210         �           2604    3444991    Donations id    DEFAULT     b   ALTER TABLE ONLY "Donations" ALTER COLUMN id SET DEFAULT nextval('"Donations_id_seq"'::regclass);
 =   ALTER TABLE public."Donations" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    213    212         �           2604    3444992 	   Events id    DEFAULT     \   ALTER TABLE ONLY "Events" ALTER COLUMN id SET DEFAULT nextval('"Events_id_seq"'::regclass);
 :   ALTER TABLE public."Events" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    215    214         �           2604    3444993    ExpenseHistories hid    DEFAULT     r   ALTER TABLE ONLY "ExpenseHistories" ALTER COLUMN hid SET DEFAULT nextval('"ExpenseHistories_hid_seq"'::regclass);
 E   ALTER TABLE public."ExpenseHistories" ALTER COLUMN hid DROP DEFAULT;
       public       dbuser    false    217    216         �           2604    3444994    Expenses id    DEFAULT     `   ALTER TABLE ONLY "Expenses" ALTER COLUMN id SET DEFAULT nextval('"Expenses_id_seq"'::regclass);
 <   ALTER TABLE public."Expenses" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    219    218         �           2604    3444995    GroupHistories hid    DEFAULT     n   ALTER TABLE ONLY "GroupHistories" ALTER COLUMN hid SET DEFAULT nextval('"GroupHistories_hid_seq"'::regclass);
 C   ALTER TABLE public."GroupHistories" ALTER COLUMN hid DROP DEFAULT;
       public       dbuser    false    221    220         �           2604    3444996 	   Groups id    DEFAULT     \   ALTER TABLE ONLY "Groups" ALTER COLUMN id SET DEFAULT nextval('"Groups_id_seq"'::regclass);
 :   ALTER TABLE public."Groups" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    223    222         �           2604    3444997    Notifications id    DEFAULT     j   ALTER TABLE ONLY "Notifications" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq"'::regclass);
 A   ALTER TABLE public."Notifications" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    234    224         �           2604    3444998 
   Paykeys id    DEFAULT     ^   ALTER TABLE ONLY "Paykeys" ALTER COLUMN id SET DEFAULT nextval('"Paykeys_id_seq"'::regclass);
 ;   ALTER TABLE public."Paykeys" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    226    225         �           2604    3444999    PaymentMethods id    DEFAULT     c   ALTER TABLE ONLY "PaymentMethods" ALTER COLUMN id SET DEFAULT nextval('"Cards_id_seq"'::regclass);
 B   ALTER TABLE public."PaymentMethods" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    207    206         �           2604    3445000    Responses id    DEFAULT     b   ALTER TABLE ONLY "Responses" ALTER COLUMN id SET DEFAULT nextval('"Responses_id_seq"'::regclass);
 =   ALTER TABLE public."Responses" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    228    227         �           2604    3445001    StripeAccounts id    DEFAULT     l   ALTER TABLE ONLY "StripeAccounts" ALTER COLUMN id SET DEFAULT nextval('"StripeAccounts_id_seq"'::regclass);
 B   ALTER TABLE public."StripeAccounts" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    232    231         �           2604    3445002    Subscriptions id    DEFAULT     k   ALTER TABLE ONLY "Subscriptions" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq1"'::regclass);
 A   ALTER TABLE public."Subscriptions" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    235    233         �           2604    3445003    Tiers id    DEFAULT     Z   ALTER TABLE ONLY "Tiers" ALTER COLUMN id SET DEFAULT nextval('"Tiers_id_seq"'::regclass);
 9   ALTER TABLE public."Tiers" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    237    236         �           2604    3445004    Transactions id    DEFAULT     h   ALTER TABLE ONLY "Transactions" ALTER COLUMN id SET DEFAULT nextval('"Transactions_id_seq"'::regclass);
 @   ALTER TABLE public."Transactions" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    239    238         �           2604    3445005    UserGroups id    DEFAULT     d   ALTER TABLE ONLY "UserGroups" ALTER COLUMN id SET DEFAULT nextval('"UserGroups_id_seq"'::regclass);
 >   ALTER TABLE public."UserGroups" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    241    240         �           2604    3445006    Users id    DEFAULT     Z   ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public       dbuser    false    243    242         �          0    3444795 
   Activities 
   TABLE DATA               b   COPY "Activities" (id, type, data, "createdAt", "GroupId", "UserId", "TransactionId") FROM stdin;
    public       dbuser    false    201       4068.dat 0           0    0    Activities_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"Activities_id_seq"', 27901, true);
            public       dbuser    false    202         �          0    3444803    ApplicationGroup 
   TABLE DATA               [   COPY "ApplicationGroup" ("createdAt", "updatedAt", "GroupId", "ApplicationId") FROM stdin;
    public       dbuser    false    203       4070.dat �          0    3444806    Applications 
   TABLE DATA               t   COPY "Applications" (id, api_key, name, href, description, disabled, _access, "createdAt", "updatedAt") FROM stdin;
    public       dbuser    false    204       4071.dat 1           0    0    Applications_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"Applications_id_seq"', 4, true);
            public       dbuser    false    205         2           0    0    Cards_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Cards_id_seq"', 3023, true);
            public       dbuser    false    207         �          0    3444825    Comments 
   TABLE DATA               ~   COPY "Comments" (id, text, "createdAt", "approvedAt", "updatedAt", "deletedAt", "UserId", "GroupId", "ExpenseId") FROM stdin;
    public       dbuser    false    208       4075.dat 3           0    0    Comments_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('"Comments_id_seq"', 1, false);
            public       dbuser    false    209         �          0    3444833    ConnectedAccounts 
   TABLE DATA               �   COPY "ConnectedAccounts" (id, provider, username, "clientId", secret, data, "createdAt", "updatedAt", "deletedAt", "UserId", "GroupId") FROM stdin;
    public       dbuser    false    210       4077.dat 4           0    0    ConnectedAccounts_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"ConnectedAccounts_id_seq"', 977, true);
            public       dbuser    false    211         �          0    3444841 	   Donations 
   TABLE DATA               �   COPY "Donations" (id, "UserId", "GroupId", currency, amount, title, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "isProcessed", "processedAt", "ResponseId", notes) FROM stdin;
    public       dbuser    false    212       4079.dat 5           0    0    Donations_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"Donations_id_seq"', 2912, true);
            public       dbuser    false    213         �          0    3444851    Events 
   TABLE DATA                 COPY "Events" (id, name, description, "createdByUserId", "GroupId", slug, "locationName", "startsAt", "endsAt", "maxAmount", currency, "maxQuantity", "createdAt", "updatedAt", "deletedAt", address, "backgroundImage", "geoLocationLatLong", timezone) FROM stdin;
    public       dbuser    false    214       4081.dat 6           0    0    Events_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('"Events_id_seq"', 26, true);
            public       dbuser    false    215         �          0    3444860    ExpenseHistories 
   TABLE DATA               �   COPY "ExpenseHistories" (id, "UserId", "GroupId", currency, amount, title, "payoutMethod", notes, attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM stdin;
    public       dbuser    false    216       4083.dat 7           0    0    ExpenseHistories_hid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"ExpenseHistories_hid_seq"', 1607, true);
            public       dbuser    false    217         �          0    3444868    Expenses 
   TABLE DATA               �   COPY "Expenses" (id, "UserId", "GroupId", currency, amount, title, notes, attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM stdin;
    public       dbuser    false    218       4085.dat 8           0    0    Expenses_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('"Expenses_id_seq"', 1159, true);
            public       dbuser    false    219         �          0    3444877    GroupHistories 
   TABLE DATA               u  COPY "GroupHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", logo, video, image, slug, website, "twitterHandle", tiers, burnrate, mission, budget, "expensePolicy", "backgroundImage", "hostFeePercent", settings, "whyJoin", data, tags, "isSupercollective", "lastEditedByUserId", hid, "archivedAt") FROM stdin;
    public       dbuser    false    220       4087.dat 9           0    0    GroupHistories_hid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"GroupHistories_hid_seq"', 31393, true);
            public       dbuser    false    221         �          0    3444885    Groups 
   TABLE DATA               Z  COPY "Groups" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", logo, video, image, slug, website, "twitterHandle", tiers, burnrate, mission, budget, "expensePolicy", "backgroundImage", "hostFeePercent", settings, "whyJoin", data, tags, "isSupercollective", "lastEditedByUserId") FROM stdin;
    public       dbuser    false    222       4089.dat :           0    0    Groups_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Groups_id_seq"', 685, true);
            public       dbuser    false    223         �          0    3444896    Notifications 
   TABLE DATA               z   COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "GroupId", "webhookUrl") FROM stdin;
    public       dbuser    false    224       4091.dat �          0    3444904    Paykeys 
   TABLE DATA               �   COPY "Paykeys" (id, "trackingId", paykey, status, payload, data, error, "createdAt", "updatedAt", "deletedAt", "TransactionId") FROM stdin;
    public       dbuser    false    225       4092.dat ;           0    0    Paykeys_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Paykeys_id_seq"', 1, false);
            public       dbuser    false    226         �          0    3444816    PaymentMethods 
   TABLE DATA               �   COPY "PaymentMethods" (id, number, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "UserId", "expiryDate") FROM stdin;
    public       dbuser    false    206       4073.dat �          0    3444912 	   Responses 
   TABLE DATA               �   COPY "Responses" (id, "UserId", "GroupId", "TierId", "EventId", "confirmedAt", status, quantity, "createdAt", "updatedAt", "deletedAt", description) FROM stdin;
    public       dbuser    false    227       4094.dat <           0    0    Responses_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('"Responses_id_seq"', 227, true);
            public       dbuser    false    228                    0    3444921    SequelizeMeta 
   TABLE DATA               (   COPY "SequelizeMeta" (name) FROM stdin;
    public       dbuser    false    229       4096.dat           0    3444924    Sessions 
   TABLE DATA               K   COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
    public       dbuser    false    230       4097.dat           0    3444930    StripeAccounts 
   TABLE DATA               �   COPY "StripeAccounts" (id, "accessToken", "refreshToken", "tokenType", "stripePublishableKey", "stripeUserId", scope, "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public       dbuser    false    231       4098.dat =           0    0    StripeAccounts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('"StripeAccounts_id_seq"', 46, true);
            public       dbuser    false    232                   0    3444938    Subscriptions 
   TABLE DATA               �   COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM stdin;
    public       dbuser    false    233       4100.dat >           0    0    Subscriptions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"Subscriptions_id_seq"', 17102, true);
            public       dbuser    false    234         ?           0    0    Subscriptions_id_seq1    SEQUENCE SET     A   SELECT pg_catalog.setval('"Subscriptions_id_seq1"', 2214, true);
            public       dbuser    false    235                   0    3444950    Tiers 
   TABLE DATA               �   COPY "Tiers" (id, "EventId", name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug) FROM stdin;
    public       dbuser    false    236       4103.dat @           0    0    Tiers_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('"Tiers_id_seq"', 39, true);
            public       dbuser    false    237         	          0    3444959    Transactions 
   TABLE DATA               y  COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "GroupId", "UserId", "PaymentMethodId", "deletedAt", data, "DonationId", "platformFeeInTxnCurrency", "hostFeeInTxnCurrency", "paymentProcessorFeeInTxnCurrency", "txnCurrency", "txnCurrencyFxRate", "amountInTxnCurrency", "netAmountInGroupCurrency", "ExpenseId", uuid, "HostId") FROM stdin;
    public       dbuser    false    238       4105.dat A           0    0    Transactions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('"Transactions_id_seq"', 10341, true);
            public       dbuser    false    239                   0    3444968 
   UserGroups 
   TABLE DATA               e   COPY "UserGroups" ("createdAt", "updatedAt", "deletedAt", "UserId", "GroupId", role, id) FROM stdin;
    public       dbuser    false    240       4107.dat B           0    0    UserGroups_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('"UserGroups_id_seq"', 4718, true);
            public       dbuser    false    241                   0    3444974    Users 
   TABLE DATA               �  COPY "Users" (id, _access, username, avatar, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "ApplicationId", "paypalEmail", website, "twitterHandle", "StripeAccountId", "resetPasswordTokenHash", "resetPasswordSentAt", "referrerId", "isOrganization", description, "longDescription", mission, "firstName", "lastName", "billingAddress", currency, "isHost") FROM stdin;
    public       dbuser    false    242       4109.dat C           0    0    Users_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('"Users_id_seq"', 4973, true);
            public       dbuser    false    243         �          0    2643439    spatial_ref_sys 
   TABLE DATA               Q   COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public       dbuser    false    187       3797.dat            2606    3445010    Activities Activities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_pkey";
       public         dbuser    false    201    201                    2606    3445012 &   ApplicationGroup ApplicationGroup_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY "ApplicationGroup"
    ADD CONSTRAINT "ApplicationGroup_pkey" PRIMARY KEY ("GroupId", "ApplicationId");
 T   ALTER TABLE ONLY public."ApplicationGroup" DROP CONSTRAINT "ApplicationGroup_pkey";
       public         dbuser    false    203    203    203                    2606    3445014    Applications Applications_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY "Applications"
    ADD CONSTRAINT "Applications_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Applications" DROP CONSTRAINT "Applications_pkey";
       public         dbuser    false    204    204         	           2606    3445016    PaymentMethods Cards_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id);
 G   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_pkey";
       public         dbuser    false    206    206                    2606    3445018    Comments Comments_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY "Comments"
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY (id, "UserId", "GroupId", "ExpenseId");
 D   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_pkey";
       public         dbuser    false    208    208    208    208    208                    2606    3445020 (   ConnectedAccounts ConnectedAccounts_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_pkey";
       public         dbuser    false    210    210                    2606    3445022    Donations Donations_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_pkey";
       public         dbuser    false    212    212                    2606    3445024    Events Events_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY "Events"
    ADD CONSTRAINT "Events_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Events" DROP CONSTRAINT "Events_pkey";
       public         dbuser    false    214    214                    2606    3445026 &   ExpenseHistories ExpenseHistories_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "ExpenseHistories"
    ADD CONSTRAINT "ExpenseHistories_pkey" PRIMARY KEY (hid);
 T   ALTER TABLE ONLY public."ExpenseHistories" DROP CONSTRAINT "ExpenseHistories_pkey";
       public         dbuser    false    216    216                    2606    3445028    Expenses Expenses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_pkey";
       public         dbuser    false    218    218                    2606    3445030 "   GroupHistories GroupHistories_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY "GroupHistories"
    ADD CONSTRAINT "GroupHistories_pkey" PRIMARY KEY (hid);
 P   ALTER TABLE ONLY public."GroupHistories" DROP CONSTRAINT "GroupHistories_pkey";
       public         dbuser    false    220    220                    2606    3445032    Groups Groups_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY "Groups"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Groups" DROP CONSTRAINT "Groups_pkey";
       public         dbuser    false    222    222                     2606    3445034    Paykeys Paykeys_paykey_key 
   CONSTRAINT     T   ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_paykey_key" UNIQUE (paykey);
 H   ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_paykey_key";
       public         dbuser    false    225    225         "           2606    3445036    Paykeys Paykeys_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_pkey";
       public         dbuser    false    225    225         $           2606    3445038    Responses Responses_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY "Responses"
    ADD CONSTRAINT "Responses_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Responses" DROP CONSTRAINT "Responses_pkey";
       public         dbuser    false    227    227         &           2606    3445040     SequelizeMeta SequelizeMeta_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);
 N   ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
       public         dbuser    false    229    229         (           2606    3445042    Sessions Sessions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);
 D   ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_pkey";
       public         dbuser    false    230    230         *           2606    3445044 "   StripeAccounts StripeAccounts_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY "StripeAccounts"
    ADD CONSTRAINT "StripeAccounts_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."StripeAccounts" DROP CONSTRAINT "StripeAccounts_pkey";
       public         dbuser    false    231    231                    2606    3445046     Notifications Subscriptions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_pkey";
       public         dbuser    false    224    224         ,           2606    3445048 !   Subscriptions Subscriptions_pkey1 
   CONSTRAINT     \   ALTER TABLE ONLY "Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey1" PRIMARY KEY (id);
 O   ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_pkey1";
       public         dbuser    false    233    233         .           2606    3445050    Tiers Tiers_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_pkey";
       public         dbuser    false    236    236         1           2606    3445052    Transactions Transactions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_pkey";
       public         dbuser    false    238    238         5           2606    3445054    UserGroups UserGroups_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY "UserGroups"
    ADD CONSTRAINT "UserGroups_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."UserGroups" DROP CONSTRAINT "UserGroups_pkey";
       public         dbuser    false    240    240         7           2606    3445056    Users Users_email_key 
   CONSTRAINT     N   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
 C   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
       public         dbuser    false    242    242         9           2606    3445058    Users Users_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public         dbuser    false    242    242         ;           2606    3445060    Users Users_username_key 
   CONSTRAINT     T   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);
 F   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key";
       public         dbuser    false    242    242         =           2606    3445062    Users email_unique_idx 
   CONSTRAINT     M   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT email_unique_idx UNIQUE (email);
 B   ALTER TABLE ONLY public."Users" DROP CONSTRAINT email_unique_idx;
       public         dbuser    false    242    242         /           1259    3445063    Transactions_GroupId    INDEX     \   CREATE INDEX "Transactions_GroupId" ON "Transactions" USING btree ("GroupId", "deletedAt");
 *   DROP INDEX public."Transactions_GroupId";
       public         dbuser    false    238    238                    1259    3445064    UniqueGroupIdSlugIndex    INDEX     X   CREATE UNIQUE INDEX "UniqueGroupIdSlugIndex" ON "Events" USING btree ("GroupId", slug);
 ,   DROP INDEX public."UniqueGroupIdSlugIndex";
       public         dbuser    false    214    214                    1259    3445065    UniqueSlugIndex    INDEX     F   CREATE UNIQUE INDEX "UniqueSlugIndex" ON "Groups" USING btree (slug);
 %   DROP INDEX public."UniqueSlugIndex";
       public         dbuser    false    222         3           1259    3445066    UserGroups_3way    INDEX     _   CREATE UNIQUE INDEX "UserGroups_3way" ON "UserGroups" USING btree ("GroupId", "UserId", role);
 %   DROP INDEX public."UserGroups_3way";
       public         dbuser    false    240    240    240                    1259    3445067 %   subscriptions_type__group_id__user_id    INDEX     v   CREATE UNIQUE INDEX subscriptions_type__group_id__user_id ON "Notifications" USING btree (type, "GroupId", "UserId");
 9   DROP INDEX public.subscriptions_type__group_id__user_id;
       public         dbuser    false    224    224    224         2           1259    3445068    transactions_uuid    INDEX     L   CREATE UNIQUE INDEX transactions_uuid ON "Transactions" USING btree (uuid);
 %   DROP INDEX public.transactions_uuid;
       public         dbuser    false    238         >           2606    3445069 "   Activities Activities_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_GroupId_fkey";
       public       dbuser    false    222    201    3866         ?           2606    3445074 (   Activities Activities_TransactionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_TransactionId_fkey";
       public       dbuser    false    3889    201    238         @           2606    3445079 !   Activities Activities_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 O   ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_UserId_fkey";
       public       dbuser    false    3897    242    201         A           2606    3445084 4   ApplicationGroup ApplicationGroup_ApplicationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ApplicationGroup"
    ADD CONSTRAINT "ApplicationGroup_ApplicationId_fkey" FOREIGN KEY ("ApplicationId") REFERENCES "Applications"(id);
 b   ALTER TABLE ONLY public."ApplicationGroup" DROP CONSTRAINT "ApplicationGroup_ApplicationId_fkey";
       public       dbuser    false    203    204    3847         B           2606    3445089 .   ApplicationGroup ApplicationGroup_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ApplicationGroup"
    ADD CONSTRAINT "ApplicationGroup_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public."ApplicationGroup" DROP CONSTRAINT "ApplicationGroup_GroupId_fkey";
       public       dbuser    false    203    222    3866         C           2606    3445094     PaymentMethods Cards_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_UserId_fkey";
       public       dbuser    false    242    3897    206         D           2606    3445099     Comments Comments_ExpenseId_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY "Comments"
    ADD CONSTRAINT "Comments_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id);
 N   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_ExpenseId_fkey";
       public       dbuser    false    208    218    3862         E           2606    3445104    Comments Comments_GroupId_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY "Comments"
    ADD CONSTRAINT "Comments_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id);
 L   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_GroupId_fkey";
       public       dbuser    false    208    222    3866         F           2606    3445109    Comments Comments_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Comments"
    ADD CONSTRAINT "Comments_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_UserId_fkey";
       public       dbuser    false    208    242    3897         G           2606    3445114 0   ConnectedAccounts ConnectedAccounts_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_GroupId_fkey";
       public       dbuser    false    210    222    3866         H           2606    3445119 /   ConnectedAccounts ConnectedAccounts_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 ]   ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_UserId_fkey";
       public       dbuser    false    210    242    3897         I           2606    3445124     Donations Donations_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_GroupId_fkey";
       public       dbuser    false    212    222    3866         J           2606    3445129 (   Donations Donations_PaymentMethodId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_PaymentMethodId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_PaymentMethodId_fkey";
       public       dbuser    false    212    206    3849         K           2606    3445134 #   Donations Donations_ResponseId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_ResponseId_fkey" FOREIGN KEY ("ResponseId") REFERENCES "Responses"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_ResponseId_fkey";
       public       dbuser    false    227    212    3876         L           2606    3445139 '   Donations Donations_SubscriptionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_SubscriptionId_fkey" FOREIGN KEY ("SubscriptionId") REFERENCES "Subscriptions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_SubscriptionId_fkey";
       public       dbuser    false    212    3884    233         M           2606    3445144    Donations Donations_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_UserId_fkey";
       public       dbuser    false    3897    212    242         [           2606    3445149    Tiers EventId_foreign_idx    FK CONSTRAINT     �   ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "EventId_foreign_idx" FOREIGN KEY ("EventId") REFERENCES "Events"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "EventId_foreign_idx";
       public       dbuser    false    214    3857    236         N           2606    3445154    Events Events_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Events"
    ADD CONSTRAINT "Events_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public."Events" DROP CONSTRAINT "Events_GroupId_fkey";
       public       dbuser    false    214    3866    222         O           2606    3445159 "   Events Events_createdByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Events"
    ADD CONSTRAINT "Events_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public."Events" DROP CONSTRAINT "Events_createdByUserId_fkey";
       public       dbuser    false    214    3897    242         P           2606    3445164    Expenses Expenses_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_GroupId_fkey";
       public       dbuser    false    3866    218    222         Q           2606    3445169    Expenses Expenses_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_UserId_fkey";
       public       dbuser    false    3897    242    218         R           2606    3445174 %   Expenses Expenses_lastEditedById_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_lastEditedById_fkey" FOREIGN KEY ("lastEditedById") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_lastEditedById_fkey";
       public       dbuser    false    218    3897    242         S           2606    3445179 %   Groups Groups_lastEditedByUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Groups"
    ADD CONSTRAINT "Groups_lastEditedByUserId_fkey" FOREIGN KEY ("lastEditedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Groups" DROP CONSTRAINT "Groups_lastEditedByUserId_fkey";
       public       dbuser    false    242    222    3897         V           2606    3445184 "   Paykeys Paykeys_TransactionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 P   ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_TransactionId_fkey";
       public       dbuser    false    3889    238    225         W           2606    3445189     Responses Responses_EventId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Responses"
    ADD CONSTRAINT "Responses_EventId_fkey" FOREIGN KEY ("EventId") REFERENCES "Events"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public."Responses" DROP CONSTRAINT "Responses_EventId_fkey";
       public       dbuser    false    227    3857    214         X           2606    3445194     Responses Responses_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Responses"
    ADD CONSTRAINT "Responses_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public."Responses" DROP CONSTRAINT "Responses_GroupId_fkey";
       public       dbuser    false    3866    222    227         Y           2606    3445199    Responses Responses_TierId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Responses"
    ADD CONSTRAINT "Responses_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public."Responses" DROP CONSTRAINT "Responses_TierId_fkey";
       public       dbuser    false    3886    236    227         Z           2606    3445204    Responses Responses_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Responses"
    ADD CONSTRAINT "Responses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public."Responses" DROP CONSTRAINT "Responses_UserId_fkey";
       public       dbuser    false    3897    242    227         T           2606    3445209 (   Notifications Subscriptions_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_GroupId_fkey";
       public       dbuser    false    3866    222    224         U           2606    3445214 '   Notifications Subscriptions_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 U   ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_UserId_fkey";
       public       dbuser    false    242    3897    224         \           2606    3445219    Tiers Tiers_EventId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_EventId_fkey" FOREIGN KEY ("EventId") REFERENCES "Events"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_EventId_fkey";
       public       dbuser    false    214    236    3857         ]           2606    3445224 %   Transactions Transactions_CardId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_CardId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_CardId_fkey";
       public       dbuser    false    206    238    3849         ^           2606    3445229 )   Transactions Transactions_DonationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_DonationId_fkey" FOREIGN KEY ("DonationId") REFERENCES "Donations"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 W   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_DonationId_fkey";
       public       dbuser    false    212    3855    238         _           2606    3445234 (   Transactions Transactions_ExpenseId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 V   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_ExpenseId_fkey";
       public       dbuser    false    238    3862    218         `           2606    3445239 &   Transactions Transactions_GroupId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 T   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_GroupId_fkey";
       public       dbuser    false    3866    238    222         a           2606    3445244 %   Transactions Transactions_HostId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_HostId_fkey" FOREIGN KEY ("HostId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_HostId_fkey";
       public       dbuser    false    238    3897    242         b           2606    3445249 %   Transactions Transactions_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_UserId_fkey";
       public       dbuser    false    3897    242    238         c           2606    3445254 "   UserGroups UserGroups_GroupId_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY "UserGroups"
    ADD CONSTRAINT "UserGroups_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id);
 P   ALTER TABLE ONLY public."UserGroups" DROP CONSTRAINT "UserGroups_GroupId_fkey";
       public       dbuser    false    3866    222    240         d           2606    3445259 !   UserGroups UserGroups_UserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "UserGroups"
    ADD CONSTRAINT "UserGroups_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public."UserGroups" DROP CONSTRAINT "UserGroups_UserId_fkey";
       public       dbuser    false    242    3897    240         e           2606    3445264    Users Users_ApplicationId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_ApplicationId_fkey" FOREIGN KEY ("ApplicationId") REFERENCES "Applications"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_ApplicationId_fkey";
       public       dbuser    false    242    3847    204         f           2606    3445269     Users Users_StripeAccountId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_StripeAccountId_fkey" FOREIGN KEY ("StripeAccountId") REFERENCES "StripeAccounts"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_StripeAccountId_fkey";
       public       dbuser    false    3882    242    231         g           2606    3445274    Users Users_referrerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_referrerId_fkey" FOREIGN KEY ("referrerId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_referrerId_fkey";
       public       dbuser    false    242    3897    242                                                                                                                                                                                                          4068.dat                                                                                            0000600 0004000 0002000 00000000005 13124477142 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4070.dat                                                                                            0000600 0004000 0002000 00000000005 13124477142 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4071.dat                                                                                            0000600 0004000 0002000 00000000005 13124477142 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4075.dat                                                                                            0000600 0004000 0002000 00000000005 13124477142 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4077.dat                                                                                            0000600 0004000 0002000 00000000442 13124477142 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        7	github	piamancini	*****	*****	\N	2016-05-23 10:23:51.553-07	2016-05-23 10:24:25.036-07	\N	30	\N
3	github	asood123	*****	*****	\N	2016-05-23 10:14:54.648-07	2016-08-13 04:56:21.771-07	\N	8	\N
4	github	xdamman	*****	*****	\N	2016-05-23 10:19:57.6-07	2017-05-03 07:31:33.249-07	\N	2	\N
\.


                                                                                                                                                                                                                              4079.dat                                                                                            0000600 0004000 0002000 00000042313 13124477142 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        102	2	13	USD	100	Recurring subscription	2	2016-04-01 07:32:16.704-07	2016-04-01 07:32:16.704-07	2016-04-07 07:32:16.691-07	\N	f	\N	\N	\N
13	30	12	USD	1000	Donation to WWCode Atlanta	\N	2016-04-01 07:32:16.445-07	2017-02-02 07:06:14.763-08	\N	39	f	\N	\N	\N
15	108	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 07:32:16.447-07	2017-02-02 07:06:14.785-08	\N	71	f	\N	\N	\N
25	129	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 07:32:16.462-07	2017-02-02 07:06:14.962-08	\N	94	f	\N	\N	\N
67	30	14	USD	100	Monthly donation to wwcode seattle	6	2016-04-01 07:32:16.552-07	2017-02-02 07:06:15.538-08	\N	41	f	\N	\N	\N
69	30	13	USD	100	Monthly donation to wwcode washington dc	7	2016-04-01 07:32:16.561-07	2017-02-02 07:06:15.552-08	\N	43	f	\N	\N	\N
71	8	14	USD	100	Monthly donation to wwcode seattle	8	2016-04-01 07:32:16.574-07	2017-02-02 07:06:15.567-08	\N	45	f	\N	\N	\N
72	2	13	USD	100	Monthly donation to wwcode washington dc	2	2016-04-01 07:32:16.577-07	2017-02-02 07:06:15.583-08	\N	46	f	\N	\N	\N
68	80	10	MXN	500	Monthly donation to wwcode mexico city	4	2016-04-01 07:32:16.557-07	2017-02-02 07:06:15.653-08	\N	42	f	\N	\N	\N
97	30	14	USD	100	Recurring subscription	6	2016-04-01 07:32:16.68-07	2016-04-01 07:32:16.68-07	2016-04-07 07:32:16.68-07	\N	f	\N	\N	\N
122	7	10	MXN	100	Recurring subscription	16	2016-04-01 07:32:16.774-07	2016-04-01 07:32:16.774-07	2016-04-01 07:32:16.774-07	\N	f	\N	\N	\N
98	80	10	MXN	500	Recurring subscription	4	2016-04-01 07:32:16.686-07	2016-04-01 07:32:16.686-07	2016-04-07 07:32:16.686-07	\N	f	\N	\N	\N
99	30	13	USD	100	Recurring subscription	7	2016-04-01 07:32:16.691-07	2016-04-01 07:32:16.691-07	2016-04-07 07:32:16.691-07	\N	f	\N	\N	\N
100	30	13	USD	100	Recurring subscription	3	2016-04-01 07:32:16.697-07	2016-04-01 07:32:16.697-07	2016-04-07 07:32:16.691-07	\N	f	\N	\N	\N
87	2	10	USD	500	Recurring subscription	1	2016-04-01 07:32:16.648-07	2016-04-01 07:32:16.648-07	2016-04-07 07:32:16.648-07	\N	f	\N	\N	\N
101	8	14	USD	100	Recurring subscription	8	2016-04-01 07:32:16.701-07	2016-04-01 07:32:16.701-07	2016-04-07 07:32:16.701-07	\N	f	\N	\N	\N
83	7	10	MXN	100	Monthly donation to wwcode mexico city	16	2016-04-01 07:32:16.636-07	2016-10-14 13:08:31.996-07	\N	\N	f	\N	\N	\N
95	126	13	USD	100	Monthly donation to wwcode washington dc	33	2016-04-01 07:32:16.673-07	2017-02-02 07:06:15.838-08	\N	93	f	\N	\N	\N
153	224	2	USD	20000	Donation to WWCode Austin	\N	2016-04-13 09:46:10.093-07	2017-02-02 07:06:16.24-08	\N	173	f	\N	\N	\N
181	283	13	USD	50000	Donation to WWCode Washington DC	\N	2016-04-28 08:01:17.431-07	2017-02-02 07:06:16.319-08	\N	213	f	\N	\N	\N
183	303	13	USD	50000	Donation to WWCode Washington DC	\N	2016-04-29 06:51:18.715-07	2017-02-02 07:06:16.329-08	\N	216	f	\N	\N	\N
191	308	2	USD	150000	Donation to WWCode Austin	\N	2016-05-03 06:07:27.747-07	2017-02-02 07:06:16.352-08	\N	230	f	\N	\N	\N
246	392	2	USD	50000	Donation to WWCode Austin	\N	2016-05-19 12:24:42.786-07	2017-02-02 07:06:17.118-08	\N	288	f	\N	\N	\N
258	426	2	USD	50000	Donation to WWCode Austin	\N	2016-05-23 13:27:28.19-07	2017-02-02 07:06:17.13-08	\N	306	f	\N	\N	\N
312	551	2	USD	150000	Donation to WWCode Austin	\N	2016-06-06 12:04:36.791-07	2017-02-02 07:06:18.114-08	\N	377	f	\N	\N	\N
316	555	13	USD	100000	Donation to WWCode Washington DC	\N	2016-06-06 17:53:47.064-07	2017-02-02 07:06:18.126-08	\N	381	f	\N	\N	\N
320	8	3	USD	100	Monthly donation to wwcode new york	224	2016-06-09 10:28:13.93-07	2017-02-02 07:06:18.32-08	\N	385	f	\N	\N	\N
359	642	12	USD	100	Donation to WWCode Atlanta	\N	2016-06-21 09:02:55.605-07	2017-02-02 07:06:18.833-08	\N	430	f	\N	\N	\N
360	642	4	USD	100	Donation to WWCode San Francisco	\N	2016-06-21 09:05:00.946-07	2017-02-02 07:06:18.844-08	\N	431	f	\N	\N	\N
361	642	48	USD	100	Donation to WWCode Twin Cities	\N	2016-06-21 09:06:05.176-07	2017-02-02 07:06:18.855-08	\N	432	f	\N	\N	\N
364	646	2	USD	75000	Donation to WWCode Austin	\N	2016-06-22 13:09:45.975-07	2017-02-02 07:06:18.866-08	\N	435	f	\N	\N	\N
386	686	2	USD	1000	Monthly donation to wwcode austin	286	2016-07-01 15:31:45.982-07	2017-02-02 07:06:19.11-08	\N	461	f	\N	\N	\N
488	883	2	USD	150000	Donation to WWCode Austin	\N	2016-08-01 08:54:13.775-07	2017-02-02 07:06:19.784-08	\N	561	f	\N	\N	\N
489	884	2	USD	20000	Donation to WWCode Austin	\N	2016-08-01 08:55:26.677-07	2017-02-02 07:06:19.797-08	\N	562	f	\N	\N	\N
498	896	4	USD	10000	Monthly donation to wwcode san francisco	378	2016-08-03 10:47:17.188-07	2017-02-02 07:06:20.1-08	\N	571	f	\N	\N	\N
513	192	2	USD	150000	Donation to WWCode Austin	\N	2016-08-05 13:48:07.943-07	2017-02-02 07:06:20.648-08	\N	589	f	\N	\N	\N
622	1094	2	USD	200000	Donation to WWCode Austin	\N	2016-09-01 07:41:33.696-07	2016-09-01 07:41:37.79-07	\N	707	t	2016-09-01 07:41:37.782-07	\N	\N
653	1178	2	USD	50000	Donation to WWCode Austin	\N	2016-09-12 21:15:02.18-07	2016-09-12 21:15:05.541-07	\N	737	t	2016-09-12 21:15:05.541-07	\N	\N
647	1158	241	USD	1000	Monthly donation to wwcode taipei	496	2016-09-09 20:42:49.15-07	2016-10-14 13:08:32.241-07	\N	731	t	2016-09-09 20:42:51.443-07	\N	\N
700	1263	59	USD	25000	Donation to WWCode Portland	\N	2016-09-22 18:07:06.293-07	2016-09-22 18:07:10.714-07	\N	790	t	2016-09-22 18:07:10.713-07	\N	\N
768	1299	2	USD	19000	Donation to WWCode Austin	\N	2016-09-28 14:47:15.105-07	2016-09-28 14:47:19.41-07	\N	842	t	2016-09-28 14:47:19.41-07	\N	\N
686	1244	4	USD	0	Monthly donation to wwcode san francisco	530	2016-09-20 13:58:49.811-07	2016-10-14 13:08:32.409-07	\N	773	t	2016-09-20 13:58:51.909-07	\N	\N
808	1438	2	USD	12500	Donation to WWCode Austin	\N	2016-10-06 11:36:35.208-07	2016-10-06 11:36:39.093-07	\N	880	t	2016-10-06 11:36:39.092-07	\N	\N
812	1446	241	USD	2500	Donation to WWCode Taipei	\N	2016-10-07 09:49:14.682-07	2016-10-07 09:49:20.396-07	\N	884	t	2016-10-07 09:49:20.395-07	\N	\N
70	30	13	USD	100	Monthly donation to wwcode washington dc	3	2016-04-01 07:32:16.57-07	2017-02-02 07:06:21.68-08	\N	44	f	\N	\N	\N
1098	1808	59	USD	50000	Donation to WWCode Portland	\N	2016-11-17 09:43:26.405-08	2016-11-17 09:43:31.282-08	\N	1179	t	2016-11-17 09:43:31.281-08	\N	\N
1129	1846	59	USD	30000	Donation to WWCode Portland	\N	2016-11-22 07:22:36.145-08	2016-11-22 07:22:40.436-08	\N	1211	t	2016-11-22 07:22:40.436-08	\N	\N
1167	1890	2	USD	4000	Donation to WWCode Austin	\N	2016-11-28 07:33:12.038-08	2016-11-28 07:33:15.883-08	\N	1249	t	2016-11-28 07:33:15.882-08	\N	\N
1175	1908	301	EUR	25000	Donation to WWCode Berlin	\N	2016-11-29 02:03:21.531-08	2016-11-29 02:03:23.984-08	\N	1257	t	2016-11-29 02:03:23.983-08	\N	\N
1215	1957	2	USD	20000	Donation to WWCode Austin	\N	2016-11-30 08:11:39.696-08	2016-11-30 08:11:42.626-08	\N	1296	t	2016-11-30 08:11:42.626-08	\N	\N
1388	2220	259	USD	2500	Donation to WWCode Birmingham	\N	2016-12-18 17:41:26.702-08	2016-12-18 17:41:29.227-08	\N	1471	t	2016-12-18 17:41:29.226-08	\N	\N
1389	2220	259	USD	2500	Donation to WWCode Birmingham	\N	2016-12-18 17:41:58.846-08	2016-12-18 17:42:01.434-08	2016-12-27 16:00:00-08	1472	t	2016-12-18 17:42:01.433-08	\N	\N
1466	2416	2	USD	20000	Donation to WWCode Austin	\N	2017-01-03 12:59:34.554-08	2017-01-03 12:59:38.801-08	\N	1553	t	2017-01-03 12:59:38.8-08	\N	\N
1531	2549	270	USD	1000	Monthly donation to WWCode Chicago	1238	2017-01-14 09:11:39.405-08	2017-01-14 09:11:43.298-08	\N	1616	t	2017-01-14 09:11:43.297-08	\N	\N
1537	2561	48	USD	50000	Donation to WWCode Twin Cities	\N	2017-01-16 10:03:53.812-08	2017-01-16 10:03:57.019-08	\N	1622	t	2017-01-16 10:03:57.019-08	\N	\N
1557	2594	48	USD	10000	Donation to WWCode Twin Cities	\N	2017-01-18 05:54:47.782-08	2017-01-18 05:54:51.04-08	\N	1647	t	2017-01-18 05:54:51.04-08	\N	\N
1709	2898	48	USD	22500	Donation to WWCode Twin Cities	\N	2017-02-01 07:16:17.78-08	2017-02-01 07:16:22.469-08	\N	1801	t	2017-02-01 07:16:22.468-08	\N	\N
1712	2906	271	USD	2500	Monthly donation to WWCode Dallas	1366	2017-02-01 09:30:44.044-08	2017-02-01 09:30:50.454-08	\N	1804	t	2017-02-01 09:30:50.453-08	\N	\N
64	192	2	USD	30000	Donation to WWCode Austin	\N	2016-04-01 07:32:16.52-07	2017-02-02 07:06:15.499-08	\N	152	f	\N	\N	\N
65	2	10	USD	500	Monthly donation to wwcode mexico city	1	2016-04-01 07:32:16.527-07	2017-02-02 07:06:21.656-08	\N	34	f	\N	\N	\N
1801	3053	15	USD	84241	Donation to WWCode Boulder/Denver	\N	2017-02-10 08:47:30.962-08	2017-02-10 08:47:34.968-08	\N	1890	t	2017-02-10 08:47:34.967-08	\N	\N
1935	3301	522	CAD	30000	Donation to Women Who Code Vancouver	\N	2017-02-27 16:25:15.618-08	2017-02-27 16:25:20.42-08	\N	2030	t	2017-02-27 16:25:20.419-08	\N	\N
1953	1263	59	USD	25000	Donation to WWCode Portland	\N	2017-03-01 14:51:17.006-08	2017-03-01 14:51:20.789-08	\N	2048	t	2017-03-01 14:51:20.789-08	\N	\N
2003	3442	259	USD	6000	Donation to WWCode Birmingham	\N	2017-03-09 10:29:52.29-08	2017-03-09 10:29:55.868-08	\N	2104	t	2017-03-09 10:29:55.867-08	\N	\N
2154	3	277	USD	100000	Leadership Development: Google I/O Travel Grant: Lydia L.	\N	2017-03-27 10:53:48.436-07	2017-03-27 10:53:48.659-07	\N	\N	t	2017-03-27 10:53:48.658-07	\N	
2151	3	12	USD	50000	Leadership Development: Google i/o grant for Alicia C.	\N	2017-03-27 10:10:04.532-07	2017-03-27 10:10:04.637-07	\N	\N	t	2017-03-27 10:10:04.636-07	\N	
2152	3	59	USD	20000	Google I/O travel grant: Kezia W. 	\N	2017-03-27 10:45:17.489-07	2017-03-27 10:45:17.596-07	\N	\N	t	2017-03-27 10:45:17.596-07	\N	
2153	3	277	USD	100000	Leadership Development: Google I/O travel grant: Chee Yim G.	\N	2017-03-27 10:52:38.07-07	2017-03-27 10:52:38.138-07	\N	\N	t	2017-03-27 10:52:38.137-07	\N	
2204	3	2	USD	50000	Google I/O Travel Grant: Patricia C. 	\N	2017-03-31 10:17:51.642-07	2017-03-31 10:17:51.712-07	\N	\N	t	2017-03-31 10:17:51.711-07	\N	
2206	3	267	GBP	79600	Google I/O Travel Grant: Rabeb O. 	\N	2017-03-31 10:20:23.87-07	2017-03-31 10:20:23.928-07	\N	\N	t	2017-03-31 10:20:23.928-07	\N	
2208	3	278	GBP	80500	Google I/O travel grant: Kanke I.	\N	2017-03-31 10:54:33.373-07	2017-03-31 10:54:33.566-07	\N	\N	t	2017-03-31 10:54:33.565-07	\N	
2209	3	278	GBP	39800	Google I/O travel grant: Anastasia D. 	\N	2017-03-31 11:01:48.379-07	2017-03-31 11:01:48.43-07	\N	\N	t	2017-03-31 11:01:48.43-07	\N	
2212	3	286	USD	100000	Leadership Development: Google I/O Travel grant for Karina M.	\N	2017-03-31 15:32:34.085-07	2017-03-31 15:32:34.135-07	\N	\N	t	2017-03-31 15:32:34.135-07	\N	
2215	3	286	USD	7500	PayPal Fees for Google I/O transfer	\N	2017-03-31 15:52:45.044-07	2017-03-31 15:52:45.089-07	\N	\N	t	2017-03-31 15:52:45.089-07	\N	
2217	3	291	CAD	50000	Google I/O Travel Grant: Evangelique L.	\N	2017-03-31 16:37:30.782-07	2017-03-31 16:37:30.831-07	\N	\N	t	2017-03-31 16:37:30.83-07	\N	
2214	3	286	USD	20000	Leadership Development: Conference support for Karina M. 	\N	2017-03-31 15:50:23.845-07	2017-03-31 15:50:23.931-07	2017-03-31 17:00:00-07	\N	t	2017-03-31 15:50:23.931-07	\N	
2332	3999	2	USD	20000	Donation to WWCode Austin	\N	2017-04-04 12:51:02.781-07	2017-04-04 12:51:04.976-07	\N	2438	t	2017-04-04 12:51:04.975-07	\N	\N
2393	3	516	USD	20000	Global Development	\N	2017-04-07 05:25:51.051-07	2017-04-07 05:25:51.101-07	\N	\N	t	2017-04-07 05:25:51.1-07	\N	
2421	4153	13	USD	25000	Donation to WWCode Washington DC	\N	2017-04-10 18:09:47.558-07	2017-04-10 18:09:50.716-07	\N	2535	t	2017-04-10 18:09:50.716-07	\N	\N
2430	4173	13	USD	2500	Donation to WWCode Washington DC	\N	2017-04-11 19:05:32.82-07	2017-04-11 19:05:36.109-07	\N	2546	t	2017-04-11 19:05:36.108-07	\N	\N
2470	3	267	GBP	4000	PayPal Fees to transfer Google I/O stipend	\N	2017-04-17 12:31:52.832-07	2017-04-17 12:31:52.941-07	\N	\N	t	2017-04-17 12:31:52.94-07	\N	
2471	3	277	USD	9000	PayPal fees to transfer Google I/O stipend	\N	2017-04-17 12:41:07.575-07	2017-04-17 12:41:07.676-07	\N	\N	t	2017-04-17 12:41:07.675-07	\N	
2472	3	517	USD	100000	Director Travel Stipend CONNECT	\N	2017-04-17 13:41:37.54-07	2017-04-17 13:41:37.67-07	\N	\N	t	2017-04-17 13:41:37.669-07	\N	
2473	3	517	USD	5000	PayPal Fees	\N	2017-04-17 13:41:53.536-07	2017-04-17 13:41:53.62-07	\N	\N	t	2017-04-17 13:41:53.619-07	\N	
2474	3	278	GBP	85000	Travel Stipend for CONNECT	\N	2017-04-17 14:05:14.99-07	2017-04-17 14:05:15.087-07	\N	\N	t	2017-04-17 14:05:15.087-07	\N	
2475	3	278	GBP	4250	PayPal Fees	\N	2017-04-17 14:06:54.729-07	2017-04-17 14:06:54.818-07	\N	\N	t	2017-04-17 14:06:54.817-07	\N	
2477	3	270	USD	100000	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	\N	2017-04-17 15:09:42.506-07	2017-04-17 15:09:42.582-07	\N	\N	t	2017-04-17 15:09:42.582-07	\N	
2486	3	278	GBP	41000	Leadership Development: Director Stipend to attend NY Stock Exchange Bell Ringing	\N	2017-04-17 15:31:52.609-07	2017-04-17 15:31:52.754-07	\N	\N	t	2017-04-17 15:31:52.754-07	\N	
2487	3	511	MXN	25000	Leadership Development: Director Travel Stipend to attend CONNECT 2017	\N	2017-04-17 15:34:32.173-07	2017-04-17 15:34:32.292-07	\N	\N	t	2017-04-17 15:34:32.289-07	\N	
2488	3	511	MXN	18800	Leadership Development: Director travel stipend to attend CONNECT 2017	\N	2017-04-17 15:35:06.028-07	2017-04-17 15:35:06.109-07	\N	\N	t	2017-04-17 15:35:06.109-07	\N	
2489	3	511	MXN	2200	PayPal Fees	\N	2017-04-17 15:35:54.945-07	2017-04-17 15:35:55.035-07	\N	\N	t	2017-04-17 15:35:55.034-07	\N	
2490	3	430	USD	100000	Google I/O Travel Grant: Yelyzaveta L.	\N	2017-04-17 15:40:40.287-07	2017-04-17 15:40:40.376-07	\N	\N	t	2017-04-17 15:40:40.376-07	\N	
2503	3	278	GBP	3562	PayPal Fees for Google I/O travel stipend	\N	2017-04-18 12:41:30.217-07	2017-04-18 12:41:30.305-07	\N	\N	t	2017-04-18 12:41:30.304-07	\N	
2505	3	12	USD	1198	PayPal Fees Google I/O Ticket	\N	2017-04-18 17:19:14.259-07	2017-04-18 17:19:14.339-07	\N	\N	t	2017-04-18 17:19:14.339-07	\N	
2506	3	12	USD	1480	PayPal Fees Google I/O Ticket	\N	2017-04-18 17:20:11.451-07	2017-04-18 17:20:11.557-07	\N	\N	t	2017-04-18 17:20:11.552-07	\N	
2507	3	195	USD	1400	PayPal Fees for Google I/O	\N	2017-04-18 17:31:31.884-07	2017-04-18 17:31:31.962-07	\N	\N	t	2017-04-18 17:31:31.961-07	\N	
2508	3	14	USD	1480	PayPal fees Google I/O Travel Stipend	\N	2017-04-18 17:39:23.089-07	2017-04-18 17:39:23.171-07	\N	\N	t	2017-04-18 17:39:23.17-07	\N	
2519	3	2	USD	1480	PayPal Fee for Google I/O Ticket	\N	2017-04-19 11:18:17.942-07	2017-04-19 11:18:19.333-07	\N	\N	t	2017-04-19 11:18:19.333-07	\N	
2520	3	3	USD	40000	Google I/O Travel Expense	\N	2017-04-19 11:26:01.156-07	2017-04-19 11:26:01.247-07	\N	\N	t	2017-04-19 11:26:01.247-07	\N	
2521	3	3	USD	1190	PayPal Fees for Google I/O	\N	2017-04-19 11:26:58.952-07	2017-04-19 11:26:59.01-07	\N	\N	t	2017-04-19 11:26:59.009-07	\N	
2522	3	59	USD	610	PayPal Fees for Google I/O	\N	2017-04-19 11:35:02.98-07	2017-04-19 11:35:03.062-07	\N	\N	t	2017-04-19 11:35:03.062-07	\N	
2532	4348	59	USD	10000	Donation to WWCode Portland	\N	2017-04-20 03:17:20.169-07	2017-04-20 03:17:23.35-07	\N	2643	t	2017-04-20 03:17:23.349-07	\N	\N
2636	3419	516	USD	200	Monthly donation to Women Who Code Huntsville	2031	2017-04-30 18:40:26.938-07	2017-04-30 18:40:31.729-07	\N	2749	t	2017-04-30 18:40:31.727-07	\N	\N
2644	4550	516	USD	500	Monthly donation to Women Who Code Huntsville	2039	2017-05-01 10:13:32.223-07	2017-05-01 10:13:36.337-07	\N	2757	t	2017-05-01 10:13:36.337-07	\N	\N
2649	3	13	USD	154800	iOS Dev Camp 2016 (Capital One)	\N	2017-05-01 11:02:20.457-07	2017-05-01 11:02:20.53-07	\N	\N	t	2017-05-01 11:02:20.529-07	\N	
2662	3	3	USD	2930	PayPal fees for Google I/O	\N	2017-05-01 17:33:45.604-07	2017-05-01 17:33:45.819-07	\N	\N	t	2017-05-01 17:33:45.81-07	\N	
2676	3	12	USD	300000	FullStory - Global Development	\N	2017-05-02 11:43:43.093-07	2017-05-02 11:43:43.175-07	\N	\N	t	2017-05-02 11:43:43.174-07	\N	
2677	3	51	USD	60000	Fullstory + WWCode Atlanta	\N	2017-05-02 11:45:44.196-07	2017-05-02 11:45:44.266-07	\N	\N	t	2017-05-02 11:45:44.265-07	\N	
2693	3	12	USD	150000	User Testing - Global Development	\N	2017-05-03 10:32:39.617-07	2017-05-03 10:32:39.663-07	\N	\N	t	2017-05-03 10:32:39.662-07	\N	
2694	3	51	USD	30000	User Testing and WWCode ATL	\N	2017-05-03 10:33:13.357-07	2017-05-03 10:33:13.7-07	\N	\N	t	2017-05-03 10:33:13.7-07	\N	
2696	3	12	USD	75000	Zapier - Global Development	\N	2017-05-03 10:44:10.796-07	2017-05-03 10:44:10.856-07	\N	\N	t	2017-05-03 10:44:10.856-07	\N	
2697	3	51	USD	15000	Zapier + WWCode Atlanta	\N	2017-05-03 10:44:48.667-07	2017-05-03 10:44:48.731-07	\N	\N	t	2017-05-03 10:44:48.73-07	\N	
2702	3	259	USD	2175	Catherine L. - fees and Global development	\N	2017-05-03 17:12:19.758-07	2017-05-03 17:12:19.828-07	\N	\N	t	2017-05-03 17:12:19.827-07	\N	
2710	3	276	USD	2175	In honour of Maya Johnston	\N	2017-05-04 09:21:53.626-07	2017-05-04 09:21:53.703-07	\N	\N	t	2017-05-04 09:21:53.702-07	\N	
2713	3	430	USD	1200	Western Union Fees for Google I/O grant	\N	2017-05-04 11:58:24.782-07	2017-05-04 11:58:24.948-07	\N	\N	t	2017-05-04 11:58:24.947-07	\N	
2741	3	301	EUR	16563	Regional Leadership Event: Sofia	\N	2017-05-08 08:30:18.503-07	2017-05-08 08:30:18.616-07	\N	\N	t	2017-05-08 08:30:18.616-07	\N	
2750	4711	517	USD	1000	Monthly donation to Women Who Code Manila	2103	2017-05-08 22:59:11.956-07	2017-05-08 22:59:17.596-07	\N	2855	t	2017-05-08 22:59:17.591-07	\N	\N
2755	4720	2	USD	84000	Donation to WWCode Austin	\N	2017-05-09 11:14:19.702-07	2017-05-09 11:14:23.386-07	\N	2860	t	2017-05-09 11:14:23.385-07	\N	\N
2783	4749	522	CAD	1000	Donation to Women Who Code Vancouver	\N	2017-05-10 16:45:43.437-07	2017-05-10 16:45:46.821-07	\N	2888	t	2017-05-10 16:45:46.821-07	\N	\N
2794	3	59	USD	90000	Adroit Resources - Global Development	\N	2017-05-11 09:41:16.673-07	2017-05-11 09:41:16.796-07	\N	\N	t	2017-05-11 09:41:16.796-07	\N	
2817	4834	14	USD	20000	Donation to WWCode Seattle	\N	2017-05-15 05:07:56.843-07	2017-05-15 05:07:59.734-07	\N	2922	t	2017-05-15 05:07:59.733-07	\N	\N
\.


                                                                                                                                                                                                                                                                                                                     4081.dat                                                                                            0000600 0004000 0002000 00000000005 13124477142 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4083.dat                                                                                            0000600 0004000 0002000 00000000005 13124477142 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4085.dat                                                                                            0000600 0004000 0002000 00000131127 13124477142 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        737	171	59	USD	2439	Event supplies for Leads	\N	******	Leadership Supplies	\N	3	PAID	2017-01-20 12:05:09.337-08	2017-01-21 12:30:22.616-08	2017-02-07 10:38:15.924-08	\N	paypal
57	28	2	USD	15316	Mar 7 Lightning Talks	\N	******	Lightning Talks	\N	3	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2017-03-14 10:21:29.439-07	\N	paypal
887	3	282	MXN	50616	Leadership Development	\N	******	Conference	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 05:02:11.16-08	2017-03-14 11:17:52.017-07	\N	manual
907	70	12	USD	20000	payment to artists (spoken word) for performance at IWD event	\N	******	Other WWCode Event	\N	3	PAID	2017-03-11 16:06:03.02-08	2017-03-12 11:10:39.133-07	2017-03-27 05:47:26.687-07	\N	paypal
101	3	13	USD	100	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-26 20:56:08.086-07	2016-04-26 20:56:08.086-07	2016-06-14 11:14:21.062-07	\N	manual
653	3	284	USD	6000	Meetup Fee	\N	******	Fees	\N	3	PAID	2016-12-27 10:13:06.365-08	2016-12-27 10:34:55.519-08	2016-12-27 10:35:08.976-08	\N	manual
650	3	282	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:56:16.269-08	2016-12-27 09:57:29.639-08	2016-12-27 09:57:54.703-08	\N	manual
648	3	280	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:48:20.364-08	2016-12-27 09:49:26.92-08	2016-12-27 09:49:40.165-08	\N	manual
649	3	281	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:52:26.758-08	2016-12-27 09:53:15.394-08	2016-12-27 09:54:01.244-08	\N	manual
652	3	283	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 10:10:37.485-08	2016-12-27 10:11:36.927-08	2016-12-27 10:11:52.22-08	\N	manual
651	3	10	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:58:18.741-08	2016-12-27 10:00:31.933-08	2016-12-27 10:01:07.996-08	\N	manual
654	3	59	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 10:35:56.094-08	2016-12-27 10:38:25.72-08	2016-12-27 10:38:47.561-08	\N	manual
655	3	287	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:33:09.199-08	2016-12-27 11:46:38.03-08	2016-12-27 11:46:51.448-08	\N	manual
656	3	288	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:47:27.946-08	2016-12-27 11:49:57.05-08	2016-12-27 11:50:17.29-08	\N	manual
657	3	14	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:51:59.27-08	2016-12-27 11:52:56.386-08	2016-12-27 11:53:07.813-08	\N	manual
658	3	4	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 11:53:23.261-08	2016-12-27 11:55:42.961-08	2016-12-28 07:44:45.209-08	\N	manual
659	3	300	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:46:39.253-08	2016-12-28 07:49:03.856-08	2016-12-28 07:49:16.715-08	\N	manual
660	3	289	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:51:51.23-08	2016-12-28 07:52:34.697-08	2016-12-28 07:53:06.333-08	\N	manual
661	3	297	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:54:27.49-08	2016-12-28 07:56:08.504-08	2016-12-28 07:56:29.497-08	\N	manual
662	3	241	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 07:56:55.397-08	2016-12-28 07:58:20.587-08	2016-12-28 07:58:50.601-08	\N	manual
663	3	291	CAD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:20:10.433-08	2016-12-28 08:21:39.298-08	2016-12-28 08:21:52.881-08	\N	manual
664	3	48	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:24:24.058-08	2016-12-28 08:25:18.14-08	2016-12-28 08:25:49.763-08	\N	manual
665	3	292	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:26:41.188-08	2016-12-28 08:28:01.61-08	2016-12-28 08:28:16.458-08	\N	manual
736	171	59	USD	4431	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	\N	******	Other	\N	3	PAID	2017-01-20 12:05:09.337-08	2017-01-21 12:28:40.38-08	2017-02-07 10:40:28.327-08	\N	paypal
790	171	59	USD	9050	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	\N	******	Leadership Development	\N	3	PAID	2017-02-01 14:40:18.153-08	2017-02-01 15:46:50.968-08	2017-02-07 10:40:50.169-08	\N	paypal
80	3	59	USD	10000	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.052-07	\N	manual
86	3	13	USD	100	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-15 10:29:50.291-07	2016-04-15 10:29:50.291-07	2016-06-14 11:14:21.055-07	\N	manual
195	3	48	USD	3418	FedEx Office	\N	\N	Leadership Supplies	\N	3	PAID	2016-01-24 16:00:00-08	2016-01-24 16:00:00-08	2016-06-14 11:14:21.118-07	\N	manual
888	69	12	USD	54783	Plaques for IWD awards ceremony​ 	\N	******	Other WWCode Event	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 07:45:43.298-08	2017-03-15 06:57:14.51-07	\N	paypal
814	142	48	USD	25700	Movie screening for "She Started It"	\N	******	Other WWCode Event	\N	3	PAID	2017-02-09 18:26:00.889-08	2017-02-10 16:22:48.586-08	2017-03-14 10:59:53.192-07	\N	paypal
74	3	14	USD	11815	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	\N	\N	Conference	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.046-07	\N	manual
190	3	48	USD	20000	Conference Grant - Sarah Olson	\N	\N	Scholarship	\N	3	PAID	2016-05-25 09:39:09.882-07	2016-05-25 09:39:09.882-07	2016-06-14 11:14:21.116-07	\N	manual
75	3	59	USD	6500	Reimburse Caterina for travel expenses to CONNECT 2016	\N	\N	Scholarship	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.047-07	\N	manual
82	3	4	USD	163	Meetup Transaction Fee	\N	\N	Transaction Fees	\N	3	REJECTED	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.052-07	\N	manual
97	3	13	USD	100	Global Developement	\N	\N	Global Development	\N	3	REJECTED	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	manual
156	3	48	USD	110000	Conference Grant - Sarah Olson	Conference Grant - Airfare/Board	\N	Scholarship	\N	3	PAID	2016-05-10 12:19:21.785-07	2016-05-10 12:19:21.785-07	2016-06-14 11:14:21.099-07	\N	manual
95	3	13	USD	125	WePay fee	Jasna	\N	Transaction Fees	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	manual
189	3	3	USD	100000	Conference Grant	Google Event - Elizabeth	\N	Scholarship	\N	3	PAID	2016-05-24 12:42:50.307-07	2016-05-24 12:42:50.307-07	2016-06-14 11:14:21.116-07	\N	manual
175	3	12	USD	120000	Conference Grant	Alicia V Carr - Conference Grant	\N	Scholarship	\N	3	PAID	2016-05-19 12:07:13.723-07	2016-05-19 12:07:13.723-07	2016-06-14 11:14:21.109-07	\N	manual
136	68	15	USD	1115	Mile High Agile outreach- supplies	\N	\N	Leadership Supplies	\N	68	PAID	2016-04-02 17:00:00-07	2016-04-02 17:00:00-07	2016-06-14 11:14:21.091-07	\N	paypal
194	3	48	USD	12700	A Small Orange	\N	\N	Other WWCode Event	\N	3	PAID	2016-02-01 16:00:00-08	2016-02-01 16:00:00-08	2016-06-14 11:14:21.119-07	\N	manual
774	31	14	USD	6100	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	\N	******	Other	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:49:43.515-08	2017-02-22 07:27:02.688-08	\N	paypal
889	3419	516	USD	14630	Stickers	\N	******	Leadership Supplies	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 11:01:52.82-08	2017-04-07 05:58:45.571-07	\N	paypal
815	142	48	USD	33412	Wearable Clothing Workshop	\N	******	Workshop	\N	3	PAID	2017-02-09 18:26:00.889-08	2017-02-10 16:23:45.137-08	2017-03-14 11:00:11.49-07	\N	paypal
198	3	13	USD	80000	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-31 10:47:01.276-07	2016-05-31 10:47:01.276-07	2016-06-14 11:14:21.121-07	\N	manual
218	31	14	USD	5161	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	\N	\N	Leadership Development	\N	3	PAID	2016-06-06 17:21:31.531-07	2016-06-06 17:21:31.531-07	2016-06-14 11:14:21.131-07	\N	paypal
79	3	4	USD	150	Global Developement	\N	\N	Global Development	\N	3	PAID	2016-04-12 11:46:49.263-07	2016-04-12 11:46:49.263-07	2016-06-14 11:14:21.05-07	\N	manual
99	3	14	USD	2452	CONNECT 2016	Reimbursement for Sara Adineh	\N	Conference	\N	3	PAID	2016-04-25 17:00:00-07	2016-04-25 17:00:00-07	2016-06-14 11:14:21.061-07	\N	manual
104	3	48	USD	400	WePay Fee	For Andrea and Leslie donation 	\N	Transaction Fees	\N	3	PAID	2016-04-10 17:00:00-07	2016-04-10 17:00:00-07	2016-06-14 11:14:21.064-07	\N	manual
92	3	15	USD	2322	Stacey Schipper Reimbursement	April 6, 2016 Expense	\N	Other WWCode Event	\N	3	REJECTED	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.058-07	\N	paypal
164	3	10	MXN	50000	Conference Grant	Conference Grant - Elsa Balderrama	\N	Scholarship	\N	3	PAID	2016-05-16 07:49:37.27-07	2016-05-16 07:49:37.27-07	2016-06-14 11:14:21.102-07	\N	manual
188	3	13	USD	15000	Conference Grant	Grant to Udisha 	\N	Scholarship	\N	3	PAID	2016-05-24 12:42:50.307-07	2016-05-24 12:42:50.307-07	2016-06-14 11:14:21.115-07	\N	manual
193	3	48	USD	65000	Photographer: Mike Ross	 	\N	Conference	\N	3	PAID	2016-01-05 16:00:00-08	2016-01-05 16:00:00-08	2016-06-14 11:14:21.118-07	\N	manual
224	3	59	USD	9995	Reimburse Caterina Paun for Program Expenses	Gift cards and thank you notes for workshop presenters	\N	Other WWCode Event	\N	3	PAID	2016-02-24 16:00:00-08	2016-02-24 16:00:00-08	2016-06-14 11:14:21.134-07	\N	manual
81	3	4	USD	163	Meetup Donation Transaction Fee	\N	\N	Transaction Fees	\N	3	PAID	2016-04-12 11:52:16.188-07	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.051-07	\N	manual
96	3	48	USD	250	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.06-07	\N	manual
225	3	59	USD	5504	Reimburse Caterina Paun for supplies and mailing expenses	\N	\N	Leadership Supplies	\N	3	PAID	2015-12-14 16:00:00-08	2015-12-14 16:00:00-08	2016-06-14 11:14:21.135-07	\N	manual
196	3	59	USD	50000	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-10 17:00:00-07	2016-05-10 17:00:00-07	2016-06-14 11:14:21.12-07	\N	manual
775	31	14	USD	5458	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	\N	******	Other	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:56:09.32-08	2017-02-22 07:27:45.559-08	\N	paypal
103	3	48	USD	150	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-27 09:21:00.228-07	2016-04-27 09:21:00.228-07	2016-06-14 11:14:21.063-07	\N	manual
145	3	13	USD	50000	Conference Grant	Conference Grant: Udisha	\N	Scholarship	\N	3	PAID	2016-05-04 14:14:39.136-07	2016-05-04 14:14:39.136-07	2016-06-14 11:14:21.094-07	\N	manual
227	3	59	USD	5000	Global Development	Nike Donation	\N	Global Development	\N	3	PAID	2016-02-21 16:00:00-08	2016-02-21 16:00:00-08	2016-06-14 11:14:21.135-07	\N	manual
76	3	59	USD	3798	Reimburse Caterina for program materials	\N	\N	Other WWCode Event	\N	3	PAID	2016-04-05 12:44:01.338-07	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.048-07	\N	manual
93	3	4	USD	150	Global Development	\N	\N	Global Development	\N	3	PAID	2016-04-17 15:19:12.094-07	2016-04-17 15:19:12.094-07	2016-07-08 20:52:41.064-07	\N	manual
255	31	14	USD	10294	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	\N	******	Leadership Development	\N	31	PAID	2016-07-02 17:00:00-07	2016-07-04 13:23:49.309-07	2016-08-02 06:38:06.274-07	\N	paypal
374	171	59	USD	2077	Event Food	\N	******	Hack Night	\N	3	PAID	2016-09-27 19:15:48.098-07	2016-09-27 19:46:35.645-07	2016-10-05 09:43:29.036-07	\N	paypal
293	142	48	USD	10212	STEM Toys for Coding with Kids Event	\N	******	Other WWCode Event	\N	3	PAID	2016-07-16 17:00:00-07	2016-07-20 13:35:52.294-07	2016-08-16 07:58:32.981-07	\N	paypal
192	3	48	USD	2698	Leadership Tools (director tees)	Sarah Olson	\N	Leadership Supplies	\N	3	PAID	2015-12-14 16:00:00-08	2015-12-14 16:00:00-08	2016-06-14 11:14:21.117-07	\N	manual
294	142	48	USD	8496	STEM Toys for Coding with Kids Event	\N	******	Other WWCode Event	\N	3	PAID	2016-07-16 17:00:00-07	2016-07-20 13:41:41.183-07	2016-08-16 07:58:02.246-07	\N	paypal
318	142	48	USD	1500	Coding books for our study groups (Humble Bundle -- Joy of Coding)	\N	******	Technical Study Group	\N	3	PAID	2016-08-18 05:03:51.47-07	2016-08-18 05:07:07.685-07	2016-08-19 13:58:55.155-07	\N	paypal
346	171	59	USD	3224	Event food	\N	******	Food & Beverage	\N	3	PAID	2016-09-09 09:56:27.706-07	2016-09-09 09:56:59.265-07	2016-09-13 07:57:05.808-07	\N	paypal
345	171	59	USD	2911	Event food	\N	******	Supplies & materials	\N	3	PAID	2016-09-09 09:47:46.738-07	2016-09-09 09:56:23.297-07	2016-09-15 17:09:43.894-07	\N	paypal
366	142	48	USD	4898	Two VR headsets for our AR/VR event at Best Buy.	\N	******	Supplies & materials	\N	3	PAID	2016-09-21 13:21:09.898-07	2016-09-21 13:23:17.18-07	2016-09-27 12:31:43.772-07	\N	paypal
367	142	48	USD	2500	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	\N	******	Other	\N	3	PAID	2016-09-22 08:22:21.436-07	2016-09-22 08:24:30.617-07	2016-09-27 12:33:54.695-07	\N	paypal
256	31	14	USD	749	Transportation for Sandra and Cici to get to meeting location with core team members	\N	******	Leadership Development	\N	31	PAID	2016-07-02 17:00:00-07	2016-07-04 13:25:35.824-07	2016-08-02 06:39:16.46-07	\N	paypal
197	3	59	USD	34750	CONFERENCE GRANT	\N	\N	Scholarship	\N	3	PAID	2016-05-26 12:05:53.771-07	2016-05-26 12:05:53.771-07	2016-06-14 11:14:21.121-07	\N	manual
222	3	4	USD	150	Global Development 	\N	\N	Global Development	\N	3	PAID	2016-06-09 11:38:16.857-07	2016-06-09 11:38:16.857-07	2016-06-14 11:14:21.133-07	\N	manual
307	31	14	USD	11757	Leadership team dinner - Sondry interview	\N	******	Scholarship	\N	31	PAID	2016-08-02 06:42:02.991-07	2016-08-02 06:43:29.423-07	2016-08-02 06:44:04.899-07	\N	paypal
333	142	48	USD	53720	Conference Travel	\N	******	Conference	\N	3	PAID	2016-08-26 17:03:45.469-07	2016-08-26 17:13:37.309-07	2016-11-03 14:27:23.523-07	\N	paypal
319	142	48	USD	13526	Dinner for last night's HackNight	\N	******	Hack Night	\N	3	PAID	2016-08-18 06:17:48.926-07	2016-08-18 06:19:12.087-07	2016-08-19 13:58:34.842-07	\N	paypal
375	171	59	USD	2715	Event supplies	\N	******	Leadership Supplies	\N	3	PAID	2016-09-27 19:46:42.795-07	2016-09-27 19:53:14.232-07	2016-10-05 09:44:00.917-07	\N	paypal
500	171	59	USD	2374	We Code Hackathon 2016	\N	******	Sponsorship	\N	3	PAID	2016-11-20 12:26:33.118-08	2016-11-20 12:29:20.497-08	2016-12-06 08:50:36.397-08	\N	paypal
158	3	48	USD	8320	Conference Expense	Sarah Olson	\N	Conference	\N	3	REJECTED	2016-05-10 12:19:21.785-07	2016-05-10 12:19:21.785-07	2016-06-14 11:14:21.1-07	\N	manual
178	3	3	USD	70000	Conference Grant	Sara Morsi Conference Grant	\N	Scholarship	\N	3	PAID	2016-05-19 12:07:13.723-07	2016-05-19 12:07:13.723-07	2016-06-14 11:14:21.11-07	\N	manual
378	171	59	USD	7167	Event Food	\N	******	Hack Night	\N	3	PAID	2016-09-27 19:55:23.801-07	2016-09-27 19:58:27.408-07	2016-10-05 09:44:48.383-07	\N	paypal
376	171	59	USD	2475	Marketing Materials	\N	******	Other	\N	3	PAID	2016-09-27 19:53:17.638-07	2016-09-27 19:54:27.309-07	2016-10-05 09:45:15.524-07	\N	paypal
377	171	59	USD	6471	Event Food	\N	******	Other WWCode Event	\N	3	PAID	2016-09-27 19:54:30.186-07	2016-09-27 19:55:20.669-07	2016-11-03 12:43:51.901-07	\N	paypal
372	142	48	USD	2200	Website - Domain Name	\N	******	Other	\N	3	PAID	2016-09-26 15:46:40.46-07	2016-09-26 15:48:04.38-07	2016-12-22 14:19:53.18-08	\N	paypal
395	3	15	USD	32000	90/10 split: Hackathon donation	\N	******	Global Development	\N	3	PAID	2016-07-14 17:00:00-07	2016-10-04 15:04:41.846-07	2016-10-04 15:05:23.579-07	\N	manual
389	3	12	USD	100000	90/10 split: AT&T Sponsorship (April 2015)	 	******	Global Development	\N	3	PAID	2016-10-04 08:40:50.076-07	2016-10-04 08:44:06.971-07	2016-10-04 08:44:29.326-07	\N	manual
387	3	12	USD	10000	Google I/O: Alicia Carr	\N	******	Scholarship	\N	3	PAID	2016-05-25 17:00:00-07	2016-10-04 08:31:40.439-07	2016-10-04 08:44:36.611-07	\N	manual
393	3	12	USD	500	90/10 split: Turner matching donation	\N	******	Global Development	\N	3	PAID	2016-10-04 08:52:24.157-07	2016-10-04 08:53:03.718-07	2016-10-04 09:06:02.71-07	\N	manual
391	3	12	USD	500	90/10 split: Beth Laing	\N	******	Global Development	\N	3	PAID	2016-10-04 08:50:56.293-07	2016-10-04 08:51:48.623-07	2016-10-04 09:06:11.584-07	\N	manual
392	3	12	USD	500	90/10 split: Beth Laing	\N	******	Global Development	\N	3	PAID	2016-10-04 08:50:56.293-07	2016-10-04 08:51:59.211-07	2016-10-04 09:06:17.663-07	\N	manual
390	3	12	USD	250	90/10 split: Syema Ailia	\N	******	Global Development	\N	3	PAID	2016-10-04 08:49:30.068-07	2016-10-04 08:50:45.734-07	2016-10-04 09:06:24.611-07	\N	manual
394	3	2	USD	56266	Net budget balance pre-Open Collective	\N	******	Other WWCode Event	\N	3	PAID	2016-01-14 16:00:00-08	2016-10-04 14:41:43.853-07	2016-10-04 14:57:46.063-07	\N	manual
411	3	59	USD	31950	WWCode Portland Stickers	\N	******	Leadership Supplies	\N	3	PAID	2016-10-10 13:10:50.586-07	2016-10-10 13:11:36.293-07	2016-10-10 13:12:34.385-07	\N	manual
412	3	195	USD	1000	Test	\N	******	Fees	\N	3	REJECTED	2016-10-11 09:11:05.021-07	2016-10-11 09:13:18.686-07	2016-10-11 09:17:02.494-07	\N	paypal
413	3	195	USD	1000	Test	\N	******	Fees	\N	3	PAID	2016-10-11 09:17:09.527-07	2016-10-11 09:18:10.423-07	2016-10-11 09:18:39.64-07	\N	manual
401	31	14	USD	3080	Monthly core team meeting. Beverages with dinner for six members 	\N	******	Other WWCode Event	\N	3	PAID	2016-10-04 20:13:51.147-07	2016-10-04 20:14:45.394-07	2016-10-31 10:59:54.551-07	\N	paypal
409	70	12	USD	2838	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	\N	******	Workshop	\N	3	PAID	2016-10-08 08:03:22.819-07	2016-10-08 08:11:18.293-07	2016-11-03 14:13:32.781-07	\N	paypal
400	31	14	USD	3323	Monthly team meeting w core six members. Food/pizza	\N	******	Other WWCode Event	\N	3	PAID	2016-10-04 20:12:18.236-07	2016-10-04 20:13:43.629-07	2016-10-31 14:02:17.181-07	\N	paypal
402	31	14	USD	729	Transportation to get to GeekWire Summit social event 	\N	******	Conference	\N	3	PAID	2016-10-04 20:14:49.674-07	2016-10-04 20:17:22.898-07	2016-11-01 09:16:03.421-07	\N	paypal
396	3	272	USD	25000	DIANA A. SCHOLARSHIP GOOGLE I/O	\N	******	Conference	\N	3	PAID	2016-10-04 15:22:45.384-07	2016-10-04 15:23:45.863-07	2016-11-21 14:59:44.22-08	\N	manual
417	1371	300	USD	48435	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:47:17.894-07	2016-10-12 12:50:24.464-07	2016-10-31 14:08:49.808-07	\N	paypal
416	1371	300	USD	51962	500 gift cards, 19.62 printed awards	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:45:46.133-07	2016-10-12 12:47:13.682-07	2016-10-31 14:09:12.082-07	\N	paypal
415	1371	300	USD	70000	pre payment for dinner catering	\N	******	Hackathon	\N	3	APPROVED	2016-10-12 12:44:25.684-07	2016-10-12 12:45:38.031-07	2016-10-27 14:05:29.785-07	2016-11-02 17:00:00-07	paypal
418	1371	300	USD	64978	lunch ordered at Costco	\N	******	Hackathon	\N	3	PAID	2016-10-12 12:50:37.851-07	2016-10-12 12:52:06.282-07	2016-10-28 14:31:00.087-07	\N	paypal
427	31	14	USD	1305	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	\N	******	Workshop	\N	3	PAID	2016-10-15 15:59:26.409-07	2016-10-15 16:01:05.534-07	2016-10-31 10:52:13.785-07	\N	paypal
420	32	14	USD	2700	WWCode Seattle planning lunch with Sara	\N	******	Other	\N	3	PAID	2016-10-13 10:26:11.421-07	2016-10-13 10:30:27.473-07	2016-10-31 10:52:45.81-07	\N	paypal
419	171	59	USD	1446	Food for JavaScript Study Night - Oct. 11th	\N	******	Study Group	\N	3	PAID	2016-10-12 13:24:40.763-07	2016-10-12 13:48:15.148-07	2016-10-31 11:19:13.146-07	\N	paypal
453	28	2	USD	35000	DJ (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 21:34:19.335-07	2016-10-25 21:34:51.547-07	2016-10-27 14:08:49.13-07	\N	paypal
450	28	2	USD	6497	September Ruby Tuesday	\N	******	Study Group	\N	3	PAID	2016-10-25 20:53:42.508-07	2016-10-25 20:54:47.132-07	2016-10-31 14:11:37.246-07	\N	paypal
452	28	2	USD	26800	May AI Workshop	\N	******	Workshop	\N	3	PAID	2016-10-25 21:06:16.475-07	2016-10-25 21:07:27.314-07	2016-10-31 14:10:54.78-07	\N	paypal
447	28	2	USD	5518	Drinks for Happy Hour (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:40:29.898-07	2016-10-25 17:41:14.743-07	2016-10-31 14:13:40.764-07	\N	paypal
451	28	2	USD	20568	June South Hack Night	\N	******	Hack Night	\N	3	PAID	2016-10-25 20:57:37.783-07	2016-10-25 20:59:03.214-07	2016-10-31 14:11:21.759-07	\N	paypal
449	28	2	USD	75932	Drinks and snacks (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 20:43:46.209-07	2016-10-25 20:50:39.086-07	2016-10-31 14:13:06.494-07	\N	paypal
448	28	2	USD	2108	Markers, pens, sticky notes (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:41:19.411-07	2016-10-25 17:42:15.042-07	2016-10-31 14:13:20.6-07	\N	paypal
446	28	2	USD	1192	Almond milk for coffee (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:39:05.875-07	2016-10-25 17:40:23.911-07	2016-10-31 14:13:54.099-07	\N	paypal
445	28	2	USD	1136	Painters tape for signs  	\N	******	Hackathon	\N	3	PAID	2016-10-25 17:18:03.746-07	2016-10-25 17:39:01.083-07	2016-10-31 14:14:52.301-07	\N	paypal
470	1379	301	EUR	1019	Leadership Event in Sofia	\N	******	Other WWCode Event	\N	3	PAID	2016-11-09 12:01:53.197-08	2016-11-09 12:15:40.819-08	2016-12-07 13:30:48.755-08	\N	paypal
414	1371	300	USD	76800	second half of dinner catering	\N	******	Hackathon	\N	3	APPROVED	2016-10-12 12:28:23.372-07	2016-10-12 12:44:15.333-07	2016-10-27 14:07:24.861-07	2016-11-02 17:00:00-07	paypal
467	28	2	USD	339421	Food (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-11-02 15:10:25.089-07	2016-11-02 15:11:15.724-07	2016-11-21 07:23:08.924-08	\N	manual
464	3	14	USD	60000	Matthews Group - Leadership Development for Seattle team	Paid via PayPal	******	Leadership Development	\N	3	PAID	2016-10-31 15:03:17.783-07	2016-10-31 15:05:08.929-07	2016-11-29 13:46:31.974-08	\N	manual
466	28	2	USD	119954	Food (ATXDivHack)	\N	******	Hackathon	\N	3	PAID	2016-11-02 15:08:55.076-07	2016-11-02 15:10:20.431-07	2016-11-18 13:01:44.79-08	\N	paypal
494	1378	301	EUR	4728	European Leadership Development Workshop -- Transportation, Flight	\N	******	Leadership Development	\N	3	PAID	2016-09-30 17:00:00-07	2016-11-19 05:21:57.651-08	2016-11-22 14:07:58.565-08	\N	manual
498	171	59	USD	4874	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:18:30.305-08	2016-11-20 12:20:36.467-08	2016-11-22 13:55:11.103-08	\N	paypal
493	1378	301	EUR	4400	European Leadership Development Workshop -- Transportation, Taxi	\N	******	Leadership Development	\N	3	PAID	2016-10-26 17:00:00-07	2016-11-19 05:13:48.078-08	2016-11-22 14:07:41.878-08	\N	manual
471	1379	301	EUR	6444	Leadership Event in Sofia	\N	******	Other WWCode Event	\N	3	PAID	2016-11-09 12:15:46.133-08	2016-11-09 12:16:50.117-08	2016-12-07 13:38:07.749-08	\N	paypal
483	1325	273	USD	4351	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	\N	******	Hack Night	\N	3	PAID	2016-08-31 17:00:00-07	2016-11-16 16:12:31.06-08	2016-12-06 09:58:42.358-08	\N	manual
484	1325	273	USD	7773	Food for October Hack Night.	\N	******	Hack Night	\N	3	PAID	2016-10-05 17:00:00-07	2016-11-16 16:29:48.238-08	2016-12-06 09:56:13.801-08	\N	manual
501	171	59	USD	1700	Thank you gift to an amazing sponsor!	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:29:28.692-08	2016-11-20 12:34:51.872-08	2016-11-22 04:31:01.064-08	\N	paypal
499	171	59	USD	8181	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:20:40.018-08	2016-11-20 12:26:02.323-08	2016-11-22 13:54:34.067-08	\N	paypal
506	1333	278	GBP	6000	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	\N	******	Leadership Development	\N	3	PAID	2016-09-10 17:00:00-07	2016-11-22 12:36:49.712-08	2016-11-29 13:17:33.829-08	\N	manual
502	171	59	USD	1082	Marketing for IoT Hackathon	\N	******	Hackathon	\N	3	PAID	2016-11-20 12:36:16.598-08	2016-11-20 12:36:41.928-08	2016-12-06 08:50:57.444-08	\N	paypal
508	171	59	USD	3918	Supplies	\N	******	Hackathon	\N	3	PAID	2016-11-22 16:39:47.569-08	2016-11-22 17:16:59.692-08	2016-12-06 08:51:21.271-08	\N	paypal
509	171	59	USD	2698	T-shirt order - Design Lead	\N	******	Leadership Supplies	\N	3	PAID	2016-11-22 17:17:03.111-08	2016-11-22 17:18:21.842-08	2016-12-06 08:51:55.906-08	\N	paypal
507	1333	278	GBP	4000	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	\N	******	Leadership Development	\N	3	PAID	2016-10-01 17:00:00-07	2016-11-22 12:39:49.327-08	2016-11-29 13:17:22.193-08	\N	manual
474	31	14	USD	227646	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	\N	******	Leadership Development	\N	3	PAID	2016-11-15 07:52:03.936-08	2016-11-15 07:54:05.532-08	2016-11-29 13:46:42.977-08	\N	manual
639	3	273	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:49:03.664-08	2016-12-27 08:49:52.742-08	2016-12-27 08:50:06.731-08	\N	manual
573	171	59	USD	1058	Goodie Bags	\N	******	Hackathon	\N	3	PAID	2016-12-06 19:01:09.941-08	2016-12-06 19:01:33.246-08	2016-12-07 12:49:56.687-08	\N	paypal
485	1325	273	USD	1106	October Hack Night Drinks/Food.	\N	******	Hack Night	\N	3	PAID	2016-10-05 17:00:00-07	2016-11-16 16:45:56.588-08	2016-12-06 09:58:10.939-08	\N	manual
486	1325	273	USD	4444	Food/Drinks for Anniversary Reception with guest WWCode Directors!	\N	******	Other WWCode Event	\N	3	PAID	2016-10-27 17:00:00-07	2016-11-16 17:08:09.48-08	2016-11-22 14:21:43.596-08	\N	manual
492	1325	273	USD	713	Food for Anniversary Reception	\N	******	Other WWCode Event	\N	3	PAID	2016-10-27 17:00:00-07	2016-11-17 12:36:37.444-08	2016-12-06 09:55:40.485-08	\N	manual
591	142	48	USD	30496	3D Printer & Supplies	\N	******	Hack Night	\N	3	PAID	2016-12-13 10:22:16.435-08	2016-12-13 12:33:52.789-08	2016-12-14 05:03:22.881-08	\N	paypal
602	142	48	USD	9240	Leadership - Planning for 2017 - Dinner	\N	******	Leadership Development	\N	3	PAID	2016-12-18 13:03:11.586-08	2016-12-18 13:03:54.509-08	2016-12-19 10:45:09.955-08	\N	paypal
604	142	48	USD	20397	Robotics: Coding with Your Kids HackNight Supplies	\N	******	Hack Night	\N	3	PAID	2016-12-18 13:04:48.665-08	2016-12-18 13:05:52.891-08	2016-12-19 08:20:41.101-08	\N	paypal
601	142	48	USD	1175	Leadership - Planning for 2017 - Afternoon Coffee	\N	******	Leadership Development	\N	3	PAID	2016-12-18 12:54:41.356-08	2016-12-18 13:03:08.099-08	2016-12-19 10:42:59.885-08	\N	paypal
613	3	260	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:32:39.612-08	2016-12-23 08:35:32.89-08	2016-12-23 08:37:59.658-08	\N	manual
603	142	48	USD	875	Leadership - Planning for 2017 - Evening Coffee	\N	******	Leadership Development	\N	3	PAID	2016-12-18 13:03:57.719-08	2016-12-18 13:04:44.175-08	2016-12-19 10:43:54.758-08	\N	paypal
605	1374	300	USD	46419	Mugs for WWCode-SV	\N	******	Global Development	\N	3	PAID	2016-12-19 14:19:05.439-08	2016-12-19 14:20:00.599-08	2016-12-20 10:57:28.737-08	\N	paypal
607	3	2	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-21 10:50:58.117-08	2016-12-21 10:53:15.213-08	2016-12-21 10:53:47.768-08	\N	manual
608	3	3	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-21 10:51:15.967-08	2016-12-21 10:54:08.982-08	2016-12-21 10:54:31.514-08	\N	manual
619	3	265	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:06:10.893-08	2016-12-23 09:09:46.554-08	2016-12-23 09:10:35.083-08	\N	manual
614	3	261	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:45:31.739-08	2016-12-23 08:48:42.88-08	2016-12-23 08:49:17.798-08	\N	manual
617	3	263	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:58:06.292-08	2016-12-23 09:00:11.888-08	2016-12-23 09:00:26.307-08	\N	manual
615	3	12	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:51:12.278-08	2016-12-23 08:52:04.132-08	2016-12-23 08:52:23.784-08	\N	manual
616	3	262	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 08:52:52.588-08	2016-12-23 08:55:02.457-08	2016-12-23 08:56:04.914-08	\N	manual
618	3	264	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:03:12.871-08	2016-12-23 09:05:23.588-08	2016-12-23 09:05:42.262-08	\N	manual
621	3	259	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:20:24.371-08	2016-12-23 09:21:36.713-08	2016-12-23 09:21:53.364-08	\N	manual
620	3	301	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:13:56.172-08	2016-12-23 09:14:45.703-08	2016-12-23 09:15:16.44-08	\N	manual
622	3	195	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:26:09.212-08	2016-12-23 09:32:25.111-08	2016-12-23 09:32:56.293-08	\N	manual
623	3	266	AUD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:41:23.136-08	2016-12-23 09:42:05.736-08	2016-12-23 09:42:19.013-08	\N	manual
624	3	267	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 09:43:55.758-08	2016-12-23 09:58:18.148-08	2016-12-23 10:04:06.163-08	\N	manual
626	3	268	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:36:30.003-08	2016-12-23 11:38:32.584-08	2016-12-23 11:38:47.127-08	\N	manual
644	3	279	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:25:07.236-08	2016-12-27 09:26:20.227-08	2016-12-27 09:27:10.046-08	\N	manual
627	3	269	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:39:34.326-08	2016-12-23 11:41:36.646-08	2016-12-23 11:41:48.635-08	\N	manual
628	3	270	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-23 11:47:22.609-08	2016-12-23 11:49:40.181-08	2016-12-23 11:50:08.905-08	\N	manual
632	3	299	MXN	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:10:47.262-08	2016-12-27 08:12:04.183-08	2016-12-27 08:12:26.594-08	\N	manual
633	3	271	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:13:47.179-08	2016-12-27 08:15:24.708-08	2016-12-27 08:16:27.404-08	\N	manual
640	3	274	USD	6000	Meetup Fee	\N	******	Fees	\N	3	PAID	2016-12-27 08:51:06.223-08	2016-12-27 08:52:25.022-08	2016-12-27 08:52:46.541-08	\N	manual
634	3	13	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:22:16.78-08	2016-12-27 08:23:20.484-08	2016-12-27 08:23:36.529-08	\N	manual
636	3	15	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:30:20.153-08	2016-12-27 08:31:33.602-08	2016-12-27 08:31:59.233-08	\N	manual
637	3	298	EUR	5700	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:35:19.064-08	2016-12-27 08:35:50.321-08	2016-12-27 08:36:05.685-08	\N	manual
641	3	275	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:54:08.966-08	2016-12-27 08:54:50.244-08	2016-12-27 08:55:07.749-08	\N	manual
638	3	272	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:39:04.447-08	2016-12-27 08:41:02.05-08	2016-12-27 08:41:27.62-08	\N	manual
642	3	276	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 08:58:36.204-08	2016-12-27 08:59:15.911-08	2016-12-27 08:59:34.226-08	\N	manual
647	3	278	GBP	4900	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:28:20.017-08	2016-12-27 09:33:16.816-08	2016-12-27 09:34:46.927-08	\N	manual
643	3	277	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-27 09:02:39.037-08	2016-12-27 09:03:12.312-08	2016-12-27 09:03:23.471-08	\N	manual
666	3	293	CAD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:28:38.36-08	2016-12-28 08:30:00.14-08	2016-12-28 08:30:16.798-08	\N	manual
667	3	294	USD	6000	Meetup Fees	\N	******	Fees	\N	3	PAID	2016-12-28 08:30:41.349-08	2016-12-28 08:32:05.407-08	2016-12-28 08:32:19.79-08	\N	manual
62	31	14	USD	1000	Nike Dinner	Ride home after Nike dinner. Shared ride with Sara Adineh. 	******	Conference	\N	31	PAID	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.031-07	\N	paypal
72	32	14	USD	6800	Connect 2016 event setup day dinner	\N	******	Conference	\N	32	PAID	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.044-07	\N	paypal
635	3	47	INR	6000	Meetup Fees	\N	******	Fees	\N	141	APPROVED	2016-12-27 08:24:45.938-08	2016-12-27 08:25:59.379-08	2017-01-11 02:50:47.014-08	\N	manual
724	142	48	USD	2093	Drinks (La Croix water) for Jan HackNight	\N	******	Hack Night	\N	3	PAID	2017-01-15 16:34:19.312-08	2017-01-16 12:30:30.683-08	2017-01-25 10:41:34.763-08	\N	paypal
725	142	48	USD	22137	Amazon Echo Dot devices for HackNight and first book for our book club.	\N	******	Hack Night	\N	3	PAID	2017-01-15 16:34:19.312-08	2017-01-16 12:32:05.491-08	2017-01-25 10:44:34.015-08	\N	paypal
743	70	12	USD	30000	travel to NY for bell ringing at NYSE	\N	******	Other WWCode Event	\N	3	PAID	2017-01-23 13:57:02.837-08	2017-01-23 18:35:07.349-08	2017-01-25 10:20:55.157-08	\N	paypal
167	31	14	USD	2948	Connect Conference video footage review	Date is 4/28/2016	******	Conference	\N	31	PAID	2016-05-16 17:31:54.682-07	2016-05-16 17:31:54.682-07	2016-06-14 11:14:21.103-07	\N	paypal
768	3	278	GBP	40970	Travel Scholarship for WWCode Director	\N	******	Leadership Development	\N	3	PAID	2017-01-26 15:23:43.983-08	2017-01-27 07:34:47.447-08	2017-04-17 15:32:02.795-07	\N	manual
46	68	15	USD	14000	Food for March Boulder, CO event	\N	******	Other WWCode Event	\N	68	PAID	2016-03-17 11:48:54.413-07	2016-03-17 11:48:54.413-07	2016-06-14 11:14:21.021-07	\N	paypal
53	28	2	USD	10284	Feb 4 hack night	\N	******	Hack Night	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.026-07	\N	paypal
55	28	2	USD	4951	Mar 3 hack night	\N	******	Hack Night	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.026-07	\N	paypal
785	3	47	INR	6000	Meetup Fees	\N	******	Leadership Development	\N	3	REJECTED	2017-01-30 15:17:44.823-08	2017-01-31 08:46:45.519-08	2017-02-14 13:17:53.548-08	\N	manual
497	171	59	USD	1798	Domain name for hackathon and study night projects	\N	******	Fees	\N	3	PAID	2016-11-20 12:00:51.642-08	2016-11-20 12:06:26.088-08	2017-02-20 12:53:02.93-08	\N	paypal
56	28	2	USD	22568	Feb 1, Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-03-20 11:06:09.887-07	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.027-07	\N	paypal
137	68	15	USD	14100	WWC Boulder- April event's food	\N	******	Other WWCode Event	\N	3	PAID	2016-04-06 17:00:00-07	2016-04-06 17:00:00-07	2016-06-14 11:14:21.09-07	\N	paypal
138	68	15	USD	7000	WWC Stickers	\N	******	Network supplies	\N	68	REJECTED	2016-03-17 17:00:00-07	2016-03-17 17:00:00-07	2016-06-14 11:14:21.091-07	\N	paypal
184	28	2	USD	8979	May 2 Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.113-07	\N	paypal
183	28	2	USD	13315	April 4 Lightning Talks	\N	******	Lightning Talks	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.113-07	\N	paypal
180	28	2	USD	5037	April 7 South Hack Night	\N	******	Hack Night	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.112-07	\N	paypal
181	28	2	USD	5325	May 5 South Hack Night	\N	******	Hack Night	\N	28	PAID	2016-05-22 16:46:04.647-07	2016-05-22 16:46:04.647-07	2016-06-14 11:14:21.112-07	\N	paypal
147	32	14	USD	14000	Quarterly planning meeting	\N	******	Leadership Development	\N	32	PAID	2016-05-05 17:18:43.265-07	2016-05-05 17:18:43.265-07	2016-06-14 11:14:21.095-07	\N	paypal
211	28	2	USD	20000	6/2/16 Fireside Chat at Orange Coworking	\N	******	Fireside Chat	\N	3	PAID	2016-06-04 14:37:03.991-07	2016-06-04 14:37:03.991-07	2016-06-14 11:14:21.127-07	\N	paypal
186	28	2	USD	30000	05-21-16 AI workshop	\N	******	Workshop	\N	3	PAID	2016-05-22 17:26:36.061-07	2016-05-22 17:26:36.061-07	2016-10-31 14:16:10.268-07	\N	paypal
213	28	2	USD	2400	3/30/16 Python Gameathon prize - Udemy course	\N	******	Hackathon	\N	3	PAID	2016-06-04 14:37:03.991-07	2016-06-04 14:37:03.991-07	2016-06-14 11:14:21.128-07	\N	paypal
48	68	15	USD	7800	Order for stickers of our official WWC Boulder/Denver chapter logo	We'll include these at our booth at the Mile High Agile conference in two weeks.	******	Leadership Supplies	\N	3	PAID	2016-03-17 20:23:34.628-07	2016-03-17 20:23:34.628-07	2016-11-03 12:45:25.209-07	\N	paypal
59	31	14	USD	4656	WwConnect planning meeting	Seattle team ordered in an evening meal to continue planning meeting	******	Conference	\N	31	PAID	2016-03-10 16:00:00-08	2016-03-10 16:00:00-08	2016-06-14 11:14:21.029-07	\N	paypal
60	31	14	USD	2519	WwConnect Planning Meeting	Two bottles of beverage for the Seattle team to have dinner brought in while working	******	Conference	\N	31	PAID	2016-03-10 16:00:00-08	2016-03-10 16:00:00-08	2016-06-14 11:14:21.03-07	\N	paypal
61	31	14	USD	709	WwConnect Conference Set Up Day 1	Cab ride to get on location	******	Conference	\N	31	PAID	2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	2016-06-14 11:14:21.03-07	\N	paypal
64	31	14	USD	1025	WwConnect2016	Coffee for team. Day2	******	Conference	\N	31	PAID	2016-03-19 17:00:00-07	2016-03-19 17:00:00-07	2016-06-14 11:14:21.032-07	\N	paypal
34	7	10	MXN	166080	IVA Libretas Hackathon	Impuesto por la factura para las libretas	******	Hackathon	\N	3	REJECTED	2016-02-16 10:58:04.663-08	2016-02-16 10:58:04.663-08	2016-08-16 08:05:09.996-07	\N	paypal
63	31	14	USD	658	WwConnect Conference	Morning coffee day 2	******	Conference	\N	31	PAID	2016-03-19 17:00:00-07	2016-03-19 17:00:00-07	2016-06-14 11:14:21.032-07	\N	paypal
33	7	10	MXN	1038000	Libretas Hackathon	Pago entero para libretas de Hack for Equality	******	Hackathon	\N	3	REJECTED	2016-02-16 10:56:17.216-08	2016-02-16 10:56:17.216-08	2016-08-16 08:05:15.471-07	\N	paypal
776	31	14	USD	59040	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	\N	******	Other WWCode Event	\N	3	PAID	2017-01-28 06:06:40.223-08	2017-01-28 15:59:18.982-08	2017-02-07 10:32:49.378-08	\N	paypal
820	28	2	USD	10680	February Lightning Talks food	\N	******	Lightning Talks	\N	3	PAID	2017-02-11 19:22:39.341-08	2017-02-12 19:04:37.319-08	2017-03-14 10:17:54.1-07	\N	paypal
899	70	12	USD	20950	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	\N	******	Other WWCode Event	\N	3	PAID	2017-03-08 20:15:52.943-08	2017-03-08 21:17:56.148-08	2017-03-14 10:22:10.775-07	\N	paypal
900	70	12	USD	9732	IWD event -- wine for event	\N	******	Other WWCode Event	\N	3	PAID	2017-03-08 20:15:52.943-08	2017-03-08 21:20:17.878-08	2017-03-14 10:22:31.507-07	\N	paypal
858	171	59	USD	5798	Supplies for Agile workshop (2/26)	\N	******	Workshop	\N	3	PAID	2017-02-25 13:41:40.394-08	2017-02-26 13:29:05.754-08	2017-03-14 11:16:43.254-07	\N	paypal
886	3	511	MXN	14915	Leadership Development	\N	******	Conference	\N	3	PAID	2017-03-06 13:54:10.307-08	2017-03-07 04:57:52.472-08	2017-03-14 11:18:46.39-07	\N	manual
924	1332	277	USD	100000	To redeem travel stipend to Google I/O	\N	******	Conference	\N	3	PAID	2017-03-16 13:16:54.952-07	2017-03-16 18:25:25.526-07	2017-03-20 08:39:23.558-07	\N	paypal
926	1333	278	GBP	85000	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	\N	******	Scholarship	\N	3	PAID	2017-03-16 13:16:54.952-07	2017-03-16 23:43:54.949-07	2017-03-27 09:01:27.361-07	\N	paypal
935	1331	277	USD	100000	To redeem travel stipend to Google I/O	\N	******	Conference	\N	3	PAID	2017-03-20 12:19:06.997-07	2017-03-20 17:17:43.895-07	2017-03-27 10:54:16.852-07	\N	paypal
952	69	12	USD	50000	Google I/O	\N	******	Conference	\N	3	PAID	2017-03-26 09:01:07.917-07	2017-03-27 06:44:34.926-07	2017-03-27 10:11:39.352-07	\N	paypal
949	69	12	USD	37500	Google I/O ticket	\N	******	Conference	\N	3	PAID	2017-03-25 06:46:14.921-07	2017-03-25 08:06:03.662-07	2017-03-27 10:12:00.205-07	\N	paypal
965	1344	286	USD	37500	Google I/O Ticket  2017	\N	******	Leadership Development	\N	1344	APPROVED	2017-03-29 10:01:30.368-07	2017-03-29 13:36:36.032-07	2017-03-31 06:27:39.284-07	\N	paypal
966	171	59	USD	3405	Snacks for Unity 101 workshop.	\N	******	Workshop	\N	171	APPROVED	2017-03-29 10:01:30.368-07	2017-03-29 19:17:35.707-07	2017-03-29 19:19:03.184-07	\N	manual
967	171	59	USD	2085	Small thank you gifts for workshop instructors,	\N	******	Workshop	\N	171	APPROVED	2017-03-29 10:01:30.368-07	2017-03-29 19:21:03.723-07	2017-03-29 19:21:29.532-07	\N	manual
962	1344	286	USD	100000	Travel stipend to attend the Google I/O 2017 Conference.	\N	******	Conference	\N	3	PAID	2017-03-28 09:31:20.932-07	2017-03-29 09:18:26.633-07	2017-03-31 15:33:59.762-07	\N	paypal
974	3	286	USD	20000	Leadership Development: Conference Support: Karina M. 	\N	******	Conference	\N	1344	APPROVED	2017-03-31 10:33:05.687-07	2017-03-31 15:54:08.585-07	2017-03-31 18:11:20.009-07	\N	manual
988	3	295	USD	6000	Meetup Fees	\N	******	Leadership Development	\N	3	PAID	2017-04-05 07:08:17.838-07	2017-04-05 07:18:18.821-07	2017-04-05 07:19:21.382-07	\N	manual
998	3	12	USD	235699	Atlanta IWD Event	\N	******	Other WWCode Event	\N	3	PAID	2017-04-07 07:53:35.266-07	2017-04-07 13:27:41.491-07	2017-04-17 12:17:23.077-07	\N	manual
1001	171	59	USD	2891	Hackathon 2017 planning meeting	\N	******	Hackathon	\N	3	PAID	2017-04-09 08:46:01.525-07	2017-04-09 15:04:51.227-07	2017-04-11 12:15:09.869-07	\N	paypal
1002	171	59	USD	1527	Event supplies	\N	******	Leadership Supplies	\N	3	PAID	2017-04-09 08:46:01.525-07	2017-04-09 15:37:03.724-07	2017-04-11 12:13:28.739-07	\N	paypal
1016	1333	278	GBP	85000	WWCode CONNECT Conference Travel Stipend	\N	******	Conference	\N	3	PAID	2017-04-11 14:35:01.731-07	2017-04-12 07:42:51.103-07	2017-04-17 14:18:35.71-07	\N	paypal
1003	171	59	USD	3306	Event supplies	\N	******	Leadership Supplies	\N	171	APPROVED	2017-04-09 08:33:04.72-07	2017-04-09 15:37:53.717-07	2017-04-09 15:38:34.586-07	\N	manual
1007	142	48	USD	11948	Business cards and stickers	\N	******	Leadership Supplies	\N	3	PAID	2017-04-10 09:14:55.686-07	2017-04-10 14:31:17.015-07	2017-05-16 15:00:30.445-07	\N	manual
1027	3	270	USD	100000	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	\N	******	Other WWCode Event	\N	3	PAID	2017-04-17 12:15:50.71-07	2017-04-17 15:11:05.461-07	2017-04-17 15:12:23.057-07	\N	manual
1028	3	430	USD	100000	Google I/O Travel Grant: Yelyzaveta\tL.	Reimbursed via Western Union	******	Conference	\N	3	APPROVED	2017-04-17 12:15:52.793-07	2017-04-17 15:41:52.852-07	2017-04-17 15:42:06.121-07	2017-05-04 17:00:00-07	manual
1054	171	59	USD	2390	Planning meetings - Unity + VR workshops	\N	******	Workshop	\N	171	APPROVED	2017-04-24 15:33:05.343-07	2017-04-24 19:53:38.096-07	2017-04-24 20:08:41.521-07	\N	manual
1056	171	59	USD	33534	Hotel - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-04-24 15:31:39.131-07	2017-04-24 19:55:35.127-07	2017-04-24 20:08:38.705-07	\N	manual
1055	171	59	USD	13896	Flights for Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-04-24 15:31:39.131-07	2017-04-24 19:54:40.938-07	2017-04-24 20:08:40.259-07	\N	manual
1084	142	48	USD	1554	Snacks and batteries for our robots	\N	******	Hack Night	\N	3	PAID	2017-04-18 17:00:00-07	2017-05-02 11:26:59.045-07	2017-05-16 15:00:04.484-07	\N	manual
1070	171	59	USD	1785	Tech Summit Lunch	\N	******	Conference	\N	171	APPROVED	2017-04-28 16:37:09.548-07	2017-04-29 14:42:39.653-07	2017-04-29 14:42:52.753-07	\N	manual
1093	171	59	USD	6513	Transportation - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-05-02 17:47:33.174-07	2017-05-03 13:05:13.476-07	2017-05-03 13:15:30.301-07	\N	manual
1099	3	430	USD	101200	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	\N	******	Scholarship	\N	3	PAID	2017-05-03 18:36:17.701-07	2017-05-04 12:05:15.03-07	2017-05-04 12:06:09.066-07	\N	manual
1085	142	48	USD	9777	Supplies for decorating our robots	\N	******	Hack Night	\N	3	PAID	2017-04-18 17:00:00-07	2017-05-02 11:28:49.091-07	2017-05-16 15:00:15.589-07	\N	manual
1086	142	48	USD	2989	Leadership meeting	\N	******	Leadership Development	\N	3	PAID	2017-04-21 17:00:00-07	2017-05-02 11:29:43.581-07	2017-05-16 14:59:48.244-07	\N	manual
1088	142	48	USD	100000	Google I/O Travel Stipend	\N	******	Conference	\N	3	PAID	2017-03-14 17:00:00-07	2017-05-02 11:34:08.158-07	2017-05-16 15:00:40.397-07	\N	manual
1092	171	59	USD	1950	Transportation - Connect 2017	\N	******	Conference	\N	171	APPROVED	2017-05-02 18:02:09.827-07	2017-05-03 12:52:47.919-07	2017-05-03 13:15:31.455-07	\N	manual
1137	171	59	USD	2680	Nametags	\N	******	Leadership Supplies	\N	171	APPROVED	2017-05-16 12:37:26.124-07	2017-05-16 15:26:29.898-07	2017-05-16 15:30:08.546-07	\N	paypal
1120	1378	301	EUR	2700	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	1378	PENDING	2017-05-08 17:00:00-07	2017-05-10 13:08:43.707-07	2017-05-10 13:08:43.707-07	\N	paypal
1121	1378	301	EUR	2505	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	1378	PENDING	2017-05-08 17:00:00-07	2017-05-10 13:09:17.149-07	2017-05-10 13:09:17.149-07	\N	paypal
1119	32	14	USD	11500	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	\N	******	Other	\N	3	PAID	2017-05-10 03:03:37.039-07	2017-05-10 10:19:29.682-07	2017-05-16 14:55:26.77-07	\N	manual
1138	171	59	USD	3450	Color printing - flyers and signage for events. 	\N	******	Other	\N	171	APPROVED	2017-05-16 12:37:26.124-07	2017-05-16 15:41:15.044-07	2017-05-16 15:42:18.673-07	\N	paypal
1122	1378	301	EUR	19398	Regional Leadership Event: Barcelona	\N	******	Workshop	\N	3	PAID	2017-05-09 22:18:16.903-07	2017-05-10 13:10:54.588-07	2017-05-16 14:49:07.922-07	\N	manual
1123	3206	12	USD	500000	Deposit- We Rise Conference Hosting Location	\N	******	Conference	\N	3	PAID	2017-05-09 22:18:16.903-07	2017-05-10 18:32:36.838-07	2017-05-16 14:51:10.633-07	\N	manual
1143	32	14	USD	19017	Intro to Docker workshop food for attendees	\N	******	Workshop	\N	32	PENDING	2017-05-18 13:25:06.712-07	2017-05-18 21:24:00.964-07	2017-05-18 21:24:00.964-07	\N	paypal
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                         4087.dat                                                                                            0000600 0004000 0002000 00000000005 13124477142 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4089.dat                                                                                            0000600 0004000 0002000 00000417430 13124477142 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        524	Women Who Code Barcelona	\N	EUR	2017-02-21 12:11:44.714-08	2017-02-21 12:13:31.987-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/barcelona) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfyIV5MJgha1rYTlKdJ9frxSrFW55jGltiYpumAdsqCE8heKQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebarcelona#support) to support WWCode Barcelona\n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	\N	\N	wwcodebarcelona	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
47	WWCode Delhi	WWCode inspires women to excel in technology careers.	USD	2016-03-06 16:00:00-08	2016-12-27 08:24:21.89-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Delhi**](https://www.womenwhocode.com/delhi). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeIWjjfybWImspAgeEVa_K6bnuV-3jqSt951M2x5VTrp1ymZw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedelhi#support) to support WWCode Delhi \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/MFUk1nU_IQ.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodedelhi	https://www.womenwhocode.com/dc	wwcode_delhi	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
292	WWCode Vinnytsia	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:30:08.953-07	2016-12-28 08:27:20.161-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Vinnytsia**](https://www.womenwhocode.com/vinnytsia). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd0I08q3ZAM8fRBchvB1oG9-8I5J3PlUwGcZreDWvtu2uSulg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodevinnytsia#support) to support WWCode Vinnytsia \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/fcac9e50-a51b-11e6-b4fe-6966ef500b6b.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodevinnytsia	\N	WWCodeVinnytsia	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
275	WWCode Hong Kong 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:08:19.455-07	2016-12-27 08:53:38.119-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Hong Kong**](https://www.womenwhocode.com/hk). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdg4XdtRKCzgpTopZtXsshtrXO1XRrUSlWo3ga29vxAAh_AtA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodehongkong#support) to support WWCode Hong Kong \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/adea85b0-9c7a-11e6-a3da-b7d8fa4b13cd.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodehongkong	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
521	Women Who Code Raleigh Durham	\N	USD	2017-02-21 11:39:46.205-08	2017-02-21 11:41:19.26-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/raleigh) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf0bA8m8nAIKsVtnstXcG1fYydPvvu_sHm-zm-FzTngTAQvzg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderaleigh#support) to support WWCode Raleigh Durham \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	\N	\N	wwcoderaleigh	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
525	Women Who Code Pune	\N	USD	2017-02-21 12:16:59.055-08	2017-02-21 12:18:19.484-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/pune) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScJkMSAeQ1r0L6uAFd-QO4-sHwEJ8BuD3tTdHSYzOkRkZGIhQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodepune#support) to support WWCode Pune \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	\N	\N	wwcodepune	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
522	Women Who Code Vancouver	\N	CAD	2017-02-21 11:45:19.101-08	2017-02-21 11:48:46.905-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/vancouver) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd1osMiiyVCoIUO3ZK8qcap7tFhhzGLvJAKO37CuLN0-eGTjg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodevancouver#support) to support WWCode Vancouver \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	\N	\N	wwcodevancouver	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
262	WWCode Bangalore	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:51:29.29-07	2016-12-23 08:55:34.516-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Bangalore**](https://www.womenwhocode.com/bangalore). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeKojMYDN0UYJdAZSfFteESv9WL0i2Jen4zYQpsXYJOorAjIw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebangalore#support) to support WWCode Bangalore\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/fe02eee0-961a-11e6-a6e9-23ce753be86b.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodebangalore	\N	wwcodebangalore	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
510	Women Who Code Richmond	\N	USD	2017-02-21 08:25:28.328-08	2017-02-21 08:25:28.5-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!	\N	\N	\N	wwcoderichmond	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
295	WWCode Tokyo	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:33:36.887-07	2016-12-28 08:00:36.071-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Tokyo**](https://www.womenwhocode.com/tokyo). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScKx7EivU4MO7pQbVNjLObcYqr0lt1W5az41EDV15bbGtJUSg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetokyo#support) to support WWCode Tokyo \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/bf15e4a0-a518-11e6-b4fe-6966ef500b6b.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodetokyo	\N	wwcode_tokyo	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
280	WWCode Medellín 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:13:48.754-07	2016-12-27 09:47:24.671-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Medellin**](https://www.womenwhocode.com/medellin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Medellin \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/85a55000-cc5c-11e6-be07-3dfc36c6d12c.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodemedellin	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
283	WWCode Paris	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:16:17.095-07	2016-12-27 10:09:21.598-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Paris**](https://www.womenwhocode.com/paris). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScDi0VhEDuM3nMheBFIV7F-b0tjG6SIFTXAg7FtkeVJK_P1fw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeparis#support) to support WWCode Paris \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/17525ef0-9d44-11e6-9116-db595ff259df.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodeparis	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
286	WWCode Recife	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:19:11.423-07	2016-12-27 10:40:34.452-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Recife**](https://www.womenwhocode.com/recife). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScE5aeYUYx6Qxflg5CT30PgMk5zqvZl5PkKiJHgcyOmL3VTAg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderecife#support) to support WWCode Recife \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/cc234080-9d47-11e6-9116-db595ff259df.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcoderecife	\N	WWCode_Recife	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
14	WWCode Seattle	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 11:51:31.023-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Seattle**](https://www.womenwhocode.com/seattle). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfRpz1uqBWm1MVnVTTSK1EvAAwBzLFreVS5qyDV1y6Wrxi9HQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcode-seattle#support) to support WWCode Seattle \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/48297200-90a8-11e6-a134-f381d4cd2713.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodeseattle	https://www.womenwhocode.com/seattle	wwcode-seattle	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
515	Women Who Code Philadelphia	\N	USD	2017-02-21 10:49:14.309-08	2017-02-21 10:55:30.087-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/philadelphia) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScOnXC5YWNaq0a4WzrYDTAhTFNmWyFGgpMJaoanAVxIQHoEIQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephiladelphia#support) to support WWCode Philadelphia \n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	\N	\N	wwcodephiladelphia	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
516	Women Who Code Huntsville	\N	USD	2017-02-21 11:02:21.542-08	2017-02-21 11:05:00.852-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform)\n\n[**Attend**](https://www.womenwhocode.com/philadelphia) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScu1IeDDh0ZqcKEMxfMGPgrdr1bnDKsiC94diR7AfR7LQIU6g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephiladelphia#support) to support WWCode Philadelphia\n\nQuestions? Email us at global@womenwhocode.com.\n\n	\N	\N	\N	wwcodehuntsville	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
518	Women Who Code Singapore	\N	USD	2017-02-21 11:13:03.341-08	2017-02-21 11:19:36.571-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform)\n\n[**Attend**](https://www.womenwhocode.com/singapore) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScjlltFEdGKQPEmz-VgLXm-yYaT1K8RqGqbAt-I7ozlLH4D-Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesingapore#support) to support WWCode Singapore\n\nQuestions? Email us at global@womenwhocode.com.\n	\N	\N	\N	wwcodesingapore	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
519	Women Who Code Cleveland	\N	USD	2017-02-21 11:25:28.662-08	2017-02-21 11:28:23.116-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform)\n\n[**Attend**](https://www.womenwhocode.com/cleveland) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdReC87KXP-eOhEI_mk0iPL0ovyADL1gnIGbzUvjt90NGCupw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecleveland#support) to support WWCode Cleveland \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	\N	\N	wwcodecleveland	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
520	Women Who Code San Diego	\N	USD	2017-02-21 11:34:46.927-08	2017-02-21 11:36:23.416-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform)\n\n[**Attend**](https://www.womenwhocode.com/sandiego) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdBi2chRGnaQrBG5-f1g2_aLxwpviZDmqgGluf0rJ3t_Uyi1Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesandiego#support) to support WWCode San Diego\n\nQuestions? Email us at global@womenwhocode.com.\n\n\n\n	\N	\N	\N	wwcodesandiego	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
523	Women Who Code Sofia	\N	EUR	2017-02-21 12:04:48.889-08	2017-02-21 12:06:29.574-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform)\n\n[**Attend**](https://www.womenwhocode.com/sofia) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeqyQYDNUIJRIt8q9SuZdzqOu2c2PV1oxPdtmG0D5r0fEbcwA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesofia#support) to support WWCode Sofia \n\nQuestions? Email us at global@womenwhocode.com	\N	\N	\N	wwcodesofia	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
512	Women Who Code Cincinnati	\N	USD	2017-02-21 10:11:30.741-08	2017-02-21 10:14:42.695-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Attend**](https://www.womenwhocode.com/cincinnati) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScMYZSUklxgo7irAfTbcOrz06jjuibholjPNS-rBoSvWLHGow/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScMYZSUklxgo7irAfTbcOrz06jjuibholjPNS-rBoSvWLHGow/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecincinnati#support) to support WWCode Cincinnati \n\nQuestions? Email us at global@womenwhocode.com.\n\n\n	\N	\N	\N	wwcodecincinnati	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
511	Women Who Code Monterrey	\N	MXN	2017-02-21 08:55:29.596-08	2017-02-21 09:26:29.52-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform)\n\n[**Attend**](https://www.womenwhocode.com/monterrey) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeKBYnRkINdl2_FjUOTp0hd11bK3RQnOdaEJzFDI6tlv5ntkA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemonterrey#support) to support WWCode Boston \n\n\n\n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/d32e97d0-f85a-11e6-aebb-a9d659d01ec2.png	\N	\N	wwcodemonterrey	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3206
513	Women Who Code Fort Collins	\N	USD	2017-02-21 10:35:34.492-08	2017-02-21 10:37:34.054-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform)\n\n[**Attend**](https://www.womenwhocode.com/fortcollins) an event \n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaU7dnlAb9cneVM1fDsuNGhNfYtOTYR0UGwGploHd70ZXaLg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodefortcollins#support) to support WWCode Fort Collins \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	\N	\N	wwcodefortcollins	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
517	Women Who Code Manila	\N	USD	2017-02-21 11:07:25.163-08	2017-02-21 11:09:27.391-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reWWCode is a non-profit organization that inspires women to excel in technology careers.\nach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a member\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform)\n\n[**Attend**](https://www.womenwhocode.com/manila) an event \n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdFBYTGWumG1PbY65unD1atkWRgBhG2bArurTMwpE6xpnHNYQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemanila#support) to support WWCode Manila \n\nQuestions? Email us at global@womenwhocode.com.\n	\N	\N	\N	wwcodemanila	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
584	WWCode Edinburgh	\N	GBP	2017-04-03 09:22:45.923-07	2017-04-03 09:22:46-07	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur programs include hack nights, technical study groups, lightning talks, product demos, and leadership development. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow!\n\n\n# Contribute\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSczqJwa2qByhFFHXavunDYPzXRh1p0lOVa8nfyMSvCCySkd0Q/viewform)\n[**Attend**](https://www.womenwhocode.com/edinburgh) 	\N	\N	\N	wwcodeedinburgh	\N	\N	[{"name":"backer","range":[2,100000],"presets":[2,10,25],"interval":"monthly"},{"name":"sponsor","range":[100,500000],"presets":[100,250,500],"interval":"monthly"}]	\N	WWCode is a non-profit organization that inspires women to excel in technology careers.\n\n\n	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3206
299	WWCode Colima	WWCode is a global non-profit organization that inspires women to excel in technology careers.	MXN	2016-09-29 11:38:52.23-07	2016-12-27 08:09:39.74-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Colima**](https://www.womenwhocode.com/colima). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScHuzUYo7CGFNBBEWJEBEimY4ARGF4rpmyTtJ2K00dy8f-XiQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecolima#support) to support WWCode Colima \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/a02c3dc0-9ba2-11e6-84fe-5d5e57220970.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodecolima	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
430	WWCode Kyiv	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2017-01-03 16:00:00-08	2017-01-04 11:36:29.052-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kyiv**](https://www.womenwhocode.com/kyiv). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdSGUMDGoRoh5mNYBxjxgH8Y4zBpu_BmtIr7fBiaSSGP1l-DA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodekyiv#support) to support WWCode Kyiv \n\nQuestions? Email us at global@womenwhocode.com.  \n	\N	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodekyiv	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
48	WWCode Twin Cities	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-03-06 16:00:00-08	2016-12-28 08:23:57.622-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in the Twin Cities**](https://www.womenwhocode.com/twin-cities). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf9BXBmwX87irE9Xmvf9EntZG8Wb-VbY0xm2EOosPiMMSFP5g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetwincities#support) to support WWCode Twin Cities \n\nQuestions? Email us at global@womenwhocode.com.  \n\n[**Sponsors**](https://drive.google.com/file/d/0ByjnHHy83oCsS3hjMjRNZktkYmM/view?usp=sharing)\n      	https://opencollective-production.s3-us-west-1.amazonaws.com/079974c0-cd1a-11e6-a033-c553d2fe46df.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodetwincities	https://www.womenwhocode.com/twin-cities	wwcodetc	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"},{"name":"sponosr","title":"Sponsors","description":"Become a Sponsor and help us fulfill our mission to inspire women to excel in tech careers. See the description above for more info.","button":"Become a Sponsor","range":[1500,100000],"presets":[1500,3000,5000],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
51	Women Who Code	WWCode is a global non-profit organization dedicated 	USD	2015-10-31 17:00:00-07	2017-05-22 12:33:15.968-07	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. \n\nWe work hard every day to inspire engineers to advance their careers. We strongly believe in the value of diversity, and envision a world where women are representative as technical executives, founders, venture capitalists, board members, and software engineers. \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events**](https://www.womenwhocode.com/events). \n\n[**Get Involved:**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIho8JwdkT05STQ6q_1c_cv3kVBsO1I1udKVgf2XaAU5Tnfw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcode#support) WWCode financially by making a donation below\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\nQuestions? Email us at contact@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/50bd4ad0-769b-11e6-90e1-0dd449fe12b2.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcode	http://womenwhocode.com	wwcode	[{"name":"donor","range":[500,500000],"presets":["other", 1000, 5000, 10000],"interval":"one-time", "description":"Become a donor and help us support all the local Women Who Code collectives"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"HostId": 3, "lang":"wwcode","superCollectiveTag":"wwcode","githubOrg":"wwcode","style":{"hero": {"cover":{"background":"black"}}}}	\N	{"githubContributors":{},"repos":{}}	{wwcode,meetup,"diversity in tech"}	t	3
260	WWCode Accra	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:44:40.394-07	2016-12-23 07:39:43.815-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Accra**](https://www.womenwhocode.com/accra). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScZq_QiHPiSwhxYe74MsWt1OiscXVo41DndphmDOTYR7cEK1w/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeaccra#support) to support WWCode Accra\n\nQuestions? Email us at global@womenwhocode.com.  	https://opencollective-production.s3-us-west-1.amazonaws.com/c4810040-8a89-11e6-9ae7-452ac38279da.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4		wwcodeaccra	\N	wwcodeaccra	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
59	WWCode Portland	We are women who code: in any framework with any level of experience from any size of company for any reason (even just for fun)!	USD	2016-03-18 17:00:00-07	2017-05-22 12:33:20.319-07	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Portland**](https://www.womenwhocode.com/portland). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScxNQfvu1iPbMjG52ufF21MfgnTY9F5f_SAFAR23q1RUIg55g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeportland#support) to support WWCode Portland \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/WoL-XXTWSH.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodeportland	https://www.womenwhocode.com/portland	WWCodePortland	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode","githubOrg":"wwcodeportland"}	\N	{"githubContributors":{"caterinasworld":380,"rk101288":5,"jminnier":1,"sajoy":12,"cynful":12,"aliaward":8,"Tradcliffe":5,"thejensen":1,"morganpdx":8,"Ksan8":2},"repos":{"networking-nights":{"stars":1},"wwc-speaker-series":{"stars":1},"iot-hackathon-2016":{"stars":0},"study-nights":{"stars":32},"wwcodeportland.github.io":{"stars":7},"about-us":{"stars":1},"workshops":{"stars":0}}}	{wwcode,meetup,"diversity in tech"}	f	3
261	WWCode Al-Jazair	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:49:43.012-07	2016-12-23 08:44:45.61-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Al-Jaza'ir**](https://www.womenwhocode.com/al-jaza-ir-algeria). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfOOP_9i3fvCk5qLWvXgQFbCRUSdTaWKt020uhR4XKrVDO8kQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodealjazair#support) to support WWCode Al-Jaza'ir\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/5cc6b9c0-9562-11e6-add0-93faa9a7296f.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodealjazair	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
298	WWCode Dublin	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:37:07.255-07	2016-12-27 08:33:19.532-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Dublin**](https://www.womenwhocode.com/wwcode-dublin). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdwrnolSbTtRkhg26WVios4q-3GxchiTiK1SNA24d-9qtMOjw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedublin#support) to support WWCode Dublin \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/70bbbe00-9ba5-11e6-84fe-5d5e57220970.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodedublin	\N	wwcodedublin	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
272	WWCode East Bay	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:05:19.056-07	2016-12-27 08:38:30.14-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Oakland/East Bay**](https://www.womenwhocode.com/east-bay). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeId0Km3sYr0AEQHjzzKsxoiDfn-HhIFPXBzg0V-t8F440Olg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeeastbay#support) to support WWCode Oakland/East Bay \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/d9a7fc70-9c5f-11e6-84fe-5d5e57220970.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodeeastbay	\N	wwcode_eastbay	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
293	WWCode Waterloo	WWCode is a global non-profit organization that inspires women to excel in technology careers.	CAD	2016-09-29 11:30:54.225-07	2016-12-28 08:29:14.91-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Waterloo**](https://www.womenwhocode.com/waterloo). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfIMqJl5wn5hDsoRQBrehopXdebDkIZBYLjrrOMNIH9M8O47A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodewaterloo#support) to support WWCode Waterloo\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/485e6710-a6d5-11e6-bdef-45bfa9f9c1b0.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodewaterloo	\N	womenwhocodekw	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
273	WWCode Greenville	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:06:00.939-07	2016-12-27 08:48:30.075-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Greenville**](https://www.womenwhocode.com/greenville). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfWyfd359XuZOQpkrxOaCmrHL7KG26wpwC68qplJ6iJNuLtwg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodegreenville#support) to support WWCode Greenville \n\nQuestions? Email us at global@womenwhocode.com. 	https://opencollective-production.s3-us-west-1.amazonaws.com/d1719000-8fd7-11e6-b320-5125b901f984.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodegreenville	\N	wwcodegville	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
294	WWCode Wichita	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:32:00.962-07	2016-12-28 08:31:16.784-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Wichita**](https://www.womenwhocode.com/wichita). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSduY4sClbMfcDUnUl1_ZYK_HwA-ui81pWBcXF40sEuGL8bdTw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodewichita#support) to support WWCode Wichita \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/6cae1920-a6d6-11e6-bdef-45bfa9f9c1b0.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodewichita	\N	wwcodewichita	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
263	WWCode Beijing	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:53:00.452-07	2016-12-23 08:58:56.927-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Beijing**](https://www.womenwhocode.com/beijing). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSd7966PGrpuX1wfVL07PwwpupzTIrIi_T2WhJUe8nB4iK60dQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebeijing#support) to support WWCode Beijing\n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f6793200-961b-11e6-a6e9-23ce753be86b.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodebeijing	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
274	WWCode Gujarat	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:06:44.732-07	2016-12-27 08:50:50.189-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Gujarat**](https://www.womenwhocode.com/gujarat). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfKPlXR-We8gxAKHZUh6eZ2cZDhSUcwDTDepFfquKPHax63mA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodegujarat#support) to support WWCode Gujarat\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/52506d70-9c78-11e6-a3da-b7d8fa4b13cd.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodegujarat	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
276	WWCode Kingston	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:09:42.765-07	2016-12-27 08:58:14.247-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kingston**](https://www.womenwhocode.com/kingston). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Kingston \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/a7236520-cc55-11e6-be07-3dfc36c6d12c.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodekingston	\N	wwcodekingston	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
277	WWCode Kuala Lumpur	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:10:43.356-07	2016-12-27 09:02:13.485-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Kuala Lumpur**](https://www.womenwhocode.com/kl). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodekualalumpur#support) to support WWCode Kuala Lumpur\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/35b70760-cc56-11e6-be07-3dfc36c6d12c.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodekualalumpur	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
301	WWCode Berlin	WWCode is a global non-profit organization that inspires women to excel in technology careers.	EUR	2016-09-29 11:43:48.834-07	2016-12-23 09:11:29.559-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Berlin**](https://www.womenwhocode.com/berlin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdJ94P4XoVzynK8rqZ4O5UaoenMUEtDlgJidbGvq5ed4yHBNg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeberlin#support) to support WWCode Berlin \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/81940c10-8fd8-11e6-b320-5125b901f984.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodeberlin	\N	wwcodeberlin	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
195	WWCode Boston	WWCode is a global non-profit organization that inspires women to excel in technology careers. 	USD	2015-12-12 16:14:54.028-08	2016-12-23 09:29:46.034-08	\N	t	Women Who Code (WWCode) is a global 501(c)(3) non-profit dedicated to inspiring women to excel in technology careers. We connect amazing women with other like-minded women around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 50,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Boston**](https://www.womenwhocode.com/boston). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an upcoming event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeboston#support) to support WWCode Boston \n\nQuestions?  Email global@womenwhocode.com	https://cldup.com/E6Hx_qyE9A.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodeboston	https://www.womenwhocode.com/boston	wwcboston	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
241	WWCode Taipei	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-07 15:13:23.305-07	2016-12-28 07:57:33.798-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Taipei**](https://www.womenwhocode.com/taipei). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSc9XHX8FbeC1w6cKAZ_XjnVzC4cBb0hbvASXJ05soQA0SOlTA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodetaipei#support) to support WWCode Taipei \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/lGiwq5JAPy.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodetaipei	\N	wwcodetaipei	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
265	WWCode Belo Horizonte	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:58:16.617-07	2016-12-23 09:07:51.328-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Belo Horizonte**](https://www.womenwhocode.com/belo-horizonte). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScQkF3yoa0K-EGz_ALcWXlGbWACzliOUG2k19B-kjDnAc9E-A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebelohorizonte#support) to support WWCode Belo Horizonte \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	\N	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodebelohorizonte	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
297	WWCode Sydney	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 11:34:59.472-07	2016-12-28 07:55:06.005-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Sydney**](https://www.womenwhocode.com/sydney-australia). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScZnIDanwBEgvSarNoteC9emDTvctZYwySJBJUKL2fcj9K-8Q/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesydney#support) to support WWCode Sydney \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/405f1180-a514-11e6-b4fe-6966ef500b6b.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodesydney	\N	wwcsyd	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
259	WWCode Birmingham	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 10:43:14.021-07	2016-12-23 09:19:36.878-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Birmingham**](https://www.womenwhocode.com/birmingham). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeOLUr8i4gqKg09Wt9ExEh_m4rnhZHR0BZFDodXc953DZ_NjQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebirmingham#support) to WWCode Birmingham financially by making a donation below\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f9d834f0-c933-11e6-9af0-47fca5e686db.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4		wwcodebirmingham	\N	wwcbirmingham	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
266	WWCode Brisbane	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 10:59:15.405-07	2016-12-23 09:39:30.07-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Brisbane**](https://www.womenwhocode.com/brisbane). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeGniU6iD6vig-CTBWj9EVRLPCxz5ZrdLGoprkDZlGSVHZgOg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebrisbane#support) to support WWCode Brisbane\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/abcc78e0-c936-11e6-9af0-47fca5e686db.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodebrisbane	\N	wwcodebrisbane	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
279	WWCode Los Angeles	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:12:58.808-07	2016-12-27 09:24:20.031-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Los Angeles**](https://www.womenwhocode.com/la). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdc86zv5cSb-LuQlyA4qgmhZXjmN81qn-NAnbwNKidSrEST6g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodelosangeles#support) WWCode Los Angeles \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f55b4680-9097-11e6-a134-f381d4cd2713.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodelosangeles	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
267	WWCode Bristol 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 11:00:01.773-07	2016-12-23 09:54:17.915-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Bristol**](https://www.womenwhocode.com/bristol). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeUCObM0_rq9q-EVLkiiYGCkSXaRVQyiM5bVNGBUHBvQhCeig/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebristol#support) to support WWCode Bristol \n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/bea58950-c938-11e6-9af0-47fca5e686db.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodebristol	\N	wwcbristol	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
278	WWCode London	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 11:11:53.804-07	2016-12-27 09:29:43.796-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in London**](https://www.womenwhocode.com/london). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfksXAlw11lW_lHn5JMK3pLFTWY3f_LQn9zTBajKH4JHGmUEw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodelondon#support) WWCode London \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/8df462c0-9091-11e6-a134-f381d4cd2713.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodelondon	\N	wwclondon	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
12	Women Who Code Atlanta	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-23 08:56:56.09-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Atlanta**](https://www.womenwhocode.com/atl). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdkKQPrNlXYI2XDQcYK8rpW9PwXHzEZPrcyLq074-GmTJtxJg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeatl#support) to support WWCode Atlanta\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/NzLkW4RcED.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodeatl	\N	wwcodeatl	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	25	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
269	WWCode Chennai	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:01:49.683-07	2016-12-23 11:40:22.493-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Chennai**](https://www.womenwhocode.com/chennai). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScl5ZvmRS9Owt5CfCPbGa6Y8WnJvau5v77p-jgsto_UaeAc_A/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodechennai#support) to WWCode Chennai \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/f50c62b0-9b99-11e6-b592-e7f426067276.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodechennai	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
270	WWCode Chicago	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:02:54.513-07	2016-12-23 11:48:12.132-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Chicago**](https://www.womenwhocode.com/chicago). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSe4Vang3taPJd47st_fHZyaQLG7jst0g9fjS7h8FbBpitGUNA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodechicago#support) to support WWCode Chicago \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/aef68840-9b9a-11e6-b592-e7f426067276.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodechicago	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
281	WWCode Melbourne	WWCode is a global non-profit organization that inspires women to excel in technology careers.	AUD	2016-09-29 11:14:46.59-07	2016-12-27 09:51:32.497-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Melbourne**](https://www.womenwhocode.com/melbourne). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemelbourne#support) to support WWCode Melbourne\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/19756e50-cc5d-11e6-be07-3dfc36c6d12c.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodemelbourne	\N	WWCodeMelbourne	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
10	WWCode Mexico City	Nos dedicamos a inspirar inspirar a más mujeres a ser parte y destacar en carreras del mundo tecnológico.	MXN	2016-01-08 16:22:34.216-08	2016-12-27 09:59:26.298-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Mexico City**](https://www.womenwhocode.com/df). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfM35OQcwHB2moghLk3ZC1Vs-chWz_NkDdbEo984Sx1sa3Trg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedf#support) to support WWCode Mexico City \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/XMv1EFIxek.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodedf	http://www.meetup.com/Women-Who-Code-Mexico-City/	wwcodedf	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[50,100000],"presets":[50,100,250,500,1000],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
282	WWCode Merida	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:15:23.91-07	2016-12-27 09:55:44.4-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Merida**](https://www.womenwhocode.com/merida). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodemerida#support) to support WWCode Merida \n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/af808880-cc5d-11e6-be07-3dfc36c6d12c.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodemerida	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
3	WWCode New York	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2015-12-12 16:14:54.028-08	2016-12-27 10:05:42.126-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in New York City**](https://www.womenwhocode.com/nyc). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSc7votVvy_Q06MsZNEjAbjI0c9WmQugN-YxRKOlLW4nu9DKtg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodenyc#support) to support WWCode New York City \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/sjus3sm9uv.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodenyc	http://www.meetup.com/WomenWhoCodeNYC/	wwcodenyc	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
284	WWCode Phoenix	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:16:52.055-07	2016-12-27 10:33:28.693-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Phoenix**](https://www.womenwhocode.com/phoenix). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLScqaw9PNkcI8jaxCbAlvRF-xUQ75PBpHeRoOwI9zz87DRJHsg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodephoenix#support) to support WWCode Phoenix \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/dd27b4d0-9d45-11e6-9116-db595ff259df.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodephoenix	\N	wwcodephoenix	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
264	WWCode Belfast	WWCode is a global non-profit organization that inspires women to excel in technology careers.	GBP	2016-09-29 10:54:53.422-07	2016-12-23 09:01:33.569-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Belfast**](https://www.womenwhocode.com/belfast). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfRGOc9xuV0n4ltXd1p3xvb_TU_VaxEXxOYex6SVZQpJmH6Aw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebelfast#support) to support WWCode Belfast\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/e1bb8200-96e8-11e6-baa3-69f47ab52eed.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodebelfast	\N	WWCBelfast	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
287	WWCode Sacramento 	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:24:17.771-07	2016-12-27 11:44:07.667-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Sacramento**](https://www.womenwhocode.com/sacramento). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeZ9UntJll03ZeVwFkVGMc-JFd4Y1GLXpuJzRpi-JaMa30uYQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesacramento#support) to support WWCode Sacramento \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/dca653c0-a2bf-11e6-b669-1f602f2f2eec.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodesacramento	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
268	WWCode Charleston	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:01:04.477-07	2016-12-23 11:37:13.42-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Charleston**](https://www.womenwhocode.com/charleston). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfJBAX-EQdRtOiWJWxVJhKNKTiA2Hc09jduycgYjfSLH2U7Ig/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodecharleston#support) to support WWCode Charleston\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/a185ed40-9b95-11e6-b592-e7f426067276.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodecharleston	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
4	WWCode San Francisco	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2015-12-12 16:14:54.028-08	2016-12-27 11:54:09.597-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in San Francisco**](https://www.womenwhocode.com/sf). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSebpozJA-r33FvptTT2XFNoV66gxMm0NZn1oVDV64A1VeW0GQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesf#support) to support WWCode San Francisco\n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/6kFcX-6H5l.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodesf	http://www.meetup.com/Women-Who-Code-SF	wwcodesf	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
300	WWCode Silicon Valley	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:41:11.03-07	2016-12-28 07:46:08.715-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Silicon Valley**](https://www.womenwhocode.com/sv). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfGn_wwztPhhOYJ4LqYvswg0y0ZpagWZkXA-a81y3WKLOW0nQ/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesv#support) to support WWCode Silicon Valley \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/cc80e4c0-90ad-11e6-a134-f381d4cd2713.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodesv	\N	wwcodesv	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
289	WWCode Shanghai	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:26:35.114-07	2016-12-28 07:51:25.097-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Shanghai**](https://www.womenwhocode.com/shanghai). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeaXQzj8paXy2_359fBuU2ZeztJLTRGI6coQQ99dI6K1CHiXg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeshanghai#support) to support WWCode Shanghai\n\nQuestions? Email us at global@womenwhocode.com.	https://opencollective-production.s3-us-west-1.amazonaws.com/7be08da0-cd15-11e6-a033-c553d2fe46df.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodeshanghai	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
13	WWCode Washington DC	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 08:21:52.463-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Washington D.C.**](https://www.womenwhocode.com/dc). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSfQTzXxQVzlXSGnqhaMVNhxtfPid3fMiQt5rSISqGy8FbNtIg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedc#support) to support WWCode Washington D.C. \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/rhyrbLvkli.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodedc	https://www.womenwhocode.com/dc	wwcodedc	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
291	WWCode Toronto	WWCode is a global non-profit organization that inspires women to excel in technology careers.	CAD	2016-09-29 11:28:54.255-07	2016-12-28 08:20:52.347-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Toronto**](https://www.womenwhocode.com/toronto). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeEolspLAcmEXAfO8zKWGeTV1AIUXpI5KVKpTEGVwBol8J0bA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Global**](https://opencollective.com/wwcodetoronto#support) to support WWCode Toronto \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/6dbdcea0-a519-11e6-b4fe-6966ef500b6b.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodetoronto	\N	womenwhocodeto	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
285	WWCode Reno/Tahoe	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:17:47.232-07	2016-12-27 11:29:59.63-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Reno/Tahoe**](https://www.womenwhocode.com/reno). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdyKO3Q1OUzIokwJp2D0yb8C_Chkjf66O3WaQAWoiAnRegk_w/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcoderenotahoe#support) to support WWCode Reno/Tahoe\n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/caae3800-a2be-11e6-b669-1f602f2f2eec.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcoderenotahoe	\N	WWCodeRenoTahoe	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
288	WWCode Santiago	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:25:21.912-07	2016-12-27 11:48:06.766-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Santiago**](https://www.womenwhocode.com/santiago). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSdu79lAU0f0kKoLdUHsazwlPaiVRDO9SP5v9swDGHv00Nwqaw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodesantiago#support) to support WWCode Santiago \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/595593e0-a2c0-11e6-b669-1f602f2f2eec.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodesantiago	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
271	WWCode Dallas	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:03:46.779-07	2016-12-27 08:14:29.745-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Dallas/Fort Worth**](https://www.womenwhocode.com/dfw). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSew2j5mt6negxggie47RRMNuerQSFs5T5IXVIFqrcsRyClWCg/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodedallas#support) to support WWCode Dallas/Fort Worth\n\nQuestions? Email us at global@womenwhocode.com.  \n\n	https://opencollective-production.s3-us-west-1.amazonaws.com/f1679990-9a18-11e6-8650-f92e594d5de8.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodedallas	\N	wwcodedfw	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
290	WWCode Tampa	WWCode is a global non-profit organization that inspires women to excel in technology careers.	USD	2016-09-29 11:28:08.446-07	2016-11-07 10:27:01.762-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Tampa**](https://www.womenwhocode.com/tampa). \n\n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform)\n\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeSfKMAT2KWgG0kArwZhSAAYMwtAVyUGGK4l2Yfq3soxxLJnA/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Support**](https://opencollective.com/wwcodetampa#support) WWCode Tampa financially by making a donation below\n\n\nYour donations are critical in supporting this catalytic movement. Donations received here directly support our programs. A small amount also supports global development so that we can bring innovative program to cities around the world, ensuring that more women everywhere have the opportunity to excel in technology careers.\n\n\nQuestions? Email us at contact@womenwhocode.com.  \n	https://opencollective-production.s3-us-west-1.amazonaws.com/638dcdc0-a516-11e6-b4fe-6966ef500b6b.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	\N	wwcodetampa	\N	wwcodetampa	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	{}	{wwcode,meetup,"diversity in tech"}	f	3
15	WWCode Boulder/Denver	WWCode is a non-profit organization that inspires women to excel in technology careers.	USD	2016-01-10 16:00:00-08	2016-12-27 08:29:26.21-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Boulder/Denver**](https://www.womenwhocode.com/boulder). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSf8Ot4bmuje76glYnrfKKepl2EphH2Feojg9_CfbwhgmG5NAw/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodebd#support) to support WWCode Boulder/Denver \n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/OSosQI7_aV.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodebd	\N	wwcodebd	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
2	WWCode Austin	WWCode is a global non-profit organization that inspires women to excel in technology careers. 	USD	2015-12-12 16:14:54.028-08	2016-12-23 07:30:21.805-08	\N	t	WWCode connects amazing women engineers around the globe who unite under one simple notion – the world of technology is better with women in it. We work hard everyday to increase our impact, expand our reach, and continue to push women to the forefront in the technology space.  \n\nOur program avenues include in-person events, leadership, and our weekly publication, the CODE Review. We have garnered a membership of 80,000 tech women across 60 cities and 20 countries, and continue to grow! [**Explore upcoming events in Austin**](https://www.womenwhocode.com/austin). \n\n[**Get Involved**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform)\n\n[**Host**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform) an event at your company's office  \n[**Volunteer**](https://docs.google.com/forms/d/e/1FAIpQLSeAl3dRRR312S1CcQonYE72JDumGhpuh6G9INhyrJxOM1w16g/viewform) to support network leadership  \n[**Share**](https://www.womenwhocode.com/jobs/about) a job opportunity with our community  \n[**Donate**](https://opencollective.com/wwcodeaustin#support) to support WWCode Austin \n\n\nQuestions? Email us at global@womenwhocode.com.  \n	https://cldup.com/mX6wUEonFH.png	https://www.youtube.com/watch?v=k1Pu0_tIgR4	https://pbs.twimg.com/profile_banners/3015975871/1428631764/1500x500	wwcodeaustin	\N	\N	[{"name":"backer","title":"Backers","description":"Support us with a donation and help us continue our activities.","button":"Become a backer","range":[25,100000],"presets":[25,50,100],"interval":"one-time"}]	\N	We are on a mission to inspire women to excel in tech careers.	\N	\N	\N	10	{"lang":"wwcode"}	\N	\N	{wwcode,meetup,"diversity in tech"}	f	3
\.


                                                                                                                                                                                                                                        4091.dat                                                                                            0000600 0004000 0002000 00000157471 13124477142 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        8140	email	group.monthlyreport	t	2017-02-21 12:04:48.984-08	2017-02-21 12:04:48.984-08	3	523	http://****
8141	email	mailinglist.host	t	2017-02-21 12:04:49.157-08	2017-02-21 12:04:49.157-08	3	523	http://****
8142	email	group.transaction.created	t	2017-02-21 12:04:49.157-08	2017-02-21 12:04:49.157-08	3	523	http://****
8144	email	mailinglist.members	t	2017-02-21 12:11:44.768-08	2017-02-21 12:11:44.768-08	3	524	http://****
8145	email	group.expense.created	t	2017-02-21 12:11:44.769-08	2017-02-21 12:11:44.769-08	3	524	http://****
8146	email	group.monthlyreport	t	2017-02-21 12:11:44.769-08	2017-02-21 12:11:44.769-08	3	524	http://****
8147	email	mailinglist.host	t	2017-02-21 12:11:44.894-08	2017-02-21 12:11:44.894-08	3	524	http://****
8148	email	group.transaction.created	t	2017-02-21 12:11:44.895-08	2017-02-21 12:11:44.895-08	3	524	http://****
8150	email	mailinglist.members	t	2017-02-21 12:16:59.093-08	2017-02-21 12:16:59.093-08	3	525	http://****
8151	email	group.expense.created	t	2017-02-21 12:16:59.094-08	2017-02-21 12:16:59.094-08	3	525	http://****
8152	email	group.monthlyreport	t	2017-02-21 12:16:59.094-08	2017-02-21 12:16:59.094-08	3	525	http://****
8153	email	mailinglist.host	t	2017-02-21 12:16:59.184-08	2017-02-21 12:16:59.184-08	3	525	http://****
8154	email	group.transaction.created	t	2017-02-21 12:16:59.185-08	2017-02-21 12:16:59.185-08	3	525	http://****
595	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	286	http://****
596	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	287	http://****
597	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	195	http://****
598	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	288	http://****
599	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	289	http://****
735	email	mailinglist.backers	t	2016-10-10 13:37:16.762-07	2016-10-10 13:37:16.762-07	108	2	http://****
763	email	mailinglist.members	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	70	12	http://****
764	email	mailinglist.members	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	71	3	http://****
769	email	mailinglist.members	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	76	4	http://****
16243	email	mailinglist.backers	t	2017-05-09 11:14:23.366-07	2017-05-09 11:14:23.366-07	4720	2	http://****
1360	email	mailinglist.backers	t	2016-10-10 13:37:16.984-07	2016-10-10 13:37:16.984-07	686	2	http://****
1911	email	mailinglist.backers	t	2016-10-10 13:37:17.146-07	2016-10-10 13:37:17.146-07	1178	2	http://****
2052	email	mailinglist.members	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1307	261	http://****
2059	email	mailinglist.members	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1314	264	http://****
2064	email	mailinglist.members	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1318	268	http://****
2645	email	mailinglist.backers	t	2016-11-22 07:22:40.421-08	2016-11-22 07:22:40.421-08	1846	59	http://****
16437	email	group.donation.created	f	2017-05-11 09:41:40.872-07	2017-05-11 09:41:40.872-07	171	59	http://****
2919	email	group.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	295	http://****
2926	email	group.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	288	http://****
2931	email	group.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	283	http://****
2936	email	group.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	278	http://****
6351	email	mailinglist.backers	t	2017-01-14 09:11:43.288-08	2017-01-14 09:11:43.288-08	2549	270	http://****
6368	email	mailinglist.backers	t	2017-01-16 10:03:56.966-08	2017-01-16 10:03:56.966-08	2561	48	http://****
6433	email	mailinglist.backers	t	2017-01-18 05:54:51.032-08	2017-01-18 05:54:51.032-08	2594	48	http://****
5772	email	group.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1339	282	http://****
5558	email	group.expense.created	f	2016-12-28 16:13:56.268-08	2017-01-17 16:00:00-08	34	15	http://****
5789	email	group.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1371	300	http://****
5769	email	group.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1335	279	http://****
5777	email	group.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1345	287	http://****
5556	email	group.expense.created	f	2016-12-28 16:13:56.266-08	2017-01-17 16:00:00-08	35	12	http://****
5775	email	group.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1342	285	http://****
5596	email	group.expense.created	f	2016-12-28 16:13:56.284-08	2017-01-17 16:00:00-08	170	59	http://****
5753	email	group.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1307	261	http://****
5570	email	group.expense.created	f	2016-12-28 16:13:56.274-08	2017-01-17 16:00:00-08	71	3	http://****
5790	email	group.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1375	301	http://****
5571	email	group.expense.created	f	2016-12-28 16:13:56.275-08	2017-01-17 16:00:00-08	74	4	http://****
5778	email	group.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1347	288	http://****
5773	email	group.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1340	283	http://****
5784	email	group.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1359	295	http://****
5761	email	group.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1320	270	http://****
5752	email	group.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1304	260	http://****
5787	email	group.expense.created	f	2016-12-28 16:13:56.345-08	2017-01-17 16:00:00-08	1368	299	http://****
16640	email	mailinglist.backers	t	2017-05-15 05:07:59.717-07	2017-05-15 05:07:59.717-07	4834	14	http://****
7122	email	mailinglist.backers	t	2017-02-01 09:30:50.441-08	2017-02-01 09:30:50.441-08	2906	271	http://****
7610	email	mailinglist.backers	t	2017-02-10 08:47:34.942-08	2017-02-10 08:47:34.942-08	3053	15	http://****
8037	email	mailinglist.members	t	2017-02-21 08:25:28.458-08	2017-02-21 08:25:28.458-08	3	510	http://****
8038	email	group.expense.created	t	2017-02-21 08:25:28.459-08	2017-02-21 08:25:28.459-08	3	510	http://****
8039	email	group.monthlyreport	t	2017-02-21 08:25:28.459-08	2017-02-21 08:25:28.459-08	3	510	http://****
8040	email	mailinglist.host	t	2017-02-21 08:25:28.556-08	2017-02-21 08:25:28.556-08	3	510	http://****
8041	email	group.transaction.created	t	2017-02-21 08:25:28.556-08	2017-02-21 08:25:28.556-08	3	510	http://****
8045	email	mailinglist.members	t	2017-02-21 08:55:29.657-08	2017-02-21 08:55:29.657-08	3206	511	http://****
8046	email	group.expense.created	t	2017-02-21 08:55:29.658-08	2017-02-21 08:55:29.658-08	3206	511	http://****
8047	email	group.monthlyreport	t	2017-02-21 08:55:29.66-08	2017-02-21 08:55:29.66-08	3206	511	http://****
8048	email	mailinglist.host	t	2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	3	511	http://****
8049	email	group.transaction.created	t	2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	3	511	http://****
8050	email	group.expense.created	t	2017-02-21 08:55:29.766-08	2017-02-21 08:55:29.766-08	3	511	http://****
8061	email	mailinglist.members	t	2017-02-21 10:11:30.774-08	2017-02-21 10:11:30.774-08	3	512	http://****
8062	email	group.expense.created	t	2017-02-21 10:11:30.775-08	2017-02-21 10:11:30.775-08	3	512	http://****
8063	email	group.monthlyreport	t	2017-02-21 10:11:30.775-08	2017-02-21 10:11:30.775-08	3	512	http://****
8064	email	mailinglist.host	t	2017-02-21 10:11:30.856-08	2017-02-21 10:11:30.856-08	3	512	http://****
8065	email	group.transaction.created	t	2017-02-21 10:11:30.856-08	2017-02-21 10:11:30.856-08	3	512	http://****
8071	email	mailinglist.members	t	2017-02-21 10:35:34.525-08	2017-02-21 10:35:34.525-08	3	513	http://****
8072	email	group.expense.created	t	2017-02-21 10:35:34.525-08	2017-02-21 10:35:34.525-08	3	513	http://****
8073	email	group.monthlyreport	t	2017-02-21 10:35:34.526-08	2017-02-21 10:35:34.526-08	3	513	http://****
8074	email	mailinglist.host	t	2017-02-21 10:35:34.614-08	2017-02-21 10:35:34.614-08	3	513	http://****
8085	email	mailinglist.members	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8087	email	group.monthlyreport	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8088	email	mailinglist.host	t	2017-02-21 10:49:14.435-08	2017-02-21 10:49:14.435-08	3	515	http://****
8089	email	group.transaction.created	t	2017-02-21 10:49:14.436-08	2017-02-21 10:49:14.436-08	3	515	http://****
8092	email	mailinglist.members	t	2017-02-21 11:02:21.569-08	2017-02-21 11:02:21.569-08	3	516	http://****
8093	email	group.expense.created	t	2017-02-21 11:02:21.57-08	2017-02-21 11:02:21.57-08	3	516	http://****
8094	email	group.monthlyreport	t	2017-02-21 11:02:21.57-08	2017-02-21 11:02:21.57-08	3	516	http://****
8095	email	mailinglist.host	t	2017-02-21 11:02:21.647-08	2017-02-21 11:02:21.647-08	3	516	http://****
16332	email	mailinglist.backers	t	2017-05-10 16:45:46.805-07	2017-05-10 16:45:46.805-07	4749	522	http://****
8426	email	mailinglist.backers	f	2017-02-27 16:25:20.393-08	2017-02-27 16:25:20.393-08	3301	522	http://****
12034	email	mailinglist.backers	t	2017-03-09 10:29:55.807-08	2017-03-09 10:29:55.807-08	3442	259	http://****
16214	email	mailinglist.backers	t	2017-05-08 22:59:17.564-07	2017-05-08 22:59:17.564-07	4711	517	http://****
13797	email	mailinglist.members	t	2017-04-03 09:22:45.963-07	2017-04-03 09:22:45.963-07	3206	584	http://****
13798	email	group.expense.created	t	2017-04-03 09:22:45.964-07	2017-04-03 09:22:45.964-07	3206	584	http://****
13799	email	group.monthlyreport	t	2017-04-03 09:22:45.964-07	2017-04-03 09:22:45.964-07	3206	584	http://****
13800	email	mailinglist.host	t	2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	3	584	http://****
13801	email	group.transaction.created	t	2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	3	584	http://****
13802	email	group.expense.created	t	2017-04-03 09:22:46.05-07	2017-04-03 09:22:46.05-07	3	584	http://****
13887	email	mailinglist.backers	t	2017-04-04 12:51:04.96-07	2017-04-04 12:51:04.96-07	3999	2	http://****
14398	email	mailinglist.backers	t	2017-04-10 18:09:50.696-07	2017-04-10 18:09:50.696-07	4153	13	http://****
14447	email	mailinglist.backers	t	2017-04-11 19:05:36.091-07	2017-04-11 19:05:36.091-07	4173	13	http://****
15002	email	mailinglist.backers	t	2017-04-20 03:17:23.322-07	2017-04-20 03:17:23.322-07	4348	59	http://****
15657	email	mailinglist.backers	t	2017-04-30 18:40:31.704-07	2017-04-30 18:40:31.704-07	3419	516	http://****
15717	email	mailinglist.backers	t	2017-05-01 10:13:36.324-07	2017-05-01 10:13:36.324-07	4550	516	http://****
70	email	group.transaction.created	t	2016-07-06 17:00:00-07	2016-07-06 17:00:00-07	577	4	http://****
39	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	142	48	http://****
40	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	28	2	http://****
41	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	33	13	http://****
42	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	67	13	http://****
43	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	71	3	http://****
44	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	72	3	http://****
45	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	73	3	http://****
46	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	170	59	http://****
47	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	171	59	http://****
48	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	35	12	http://****
49	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	69	12	http://****
50	email	group.transaction.created	t	2016-06-09 17:00:00-07	2016-06-09 17:00:00-07	70	12	http://****
79	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	2	http://****
80	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	3	http://****
81	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	4	http://****
82	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	10	http://****
83	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	12	http://****
84	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	13	http://****
85	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	14	http://****
86	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	15	http://****
87	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	47	http://****
88	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	48	http://****
89	slack	all	t	2016-07-18 17:00:00-07	2016-07-18 17:00:00-07	\N	59	http://****
99	email	group.monthlyreport	t	2016-08-10 17:22:42.133-07	2016-08-10 17:22:42.133-07	7	10	http://****
100	email	group.monthlyreport	t	2016-08-10 17:22:42.133-07	2016-08-10 17:22:42.133-07	36	10	http://****
101	email	group.monthlyreport	t	2016-08-10 17:22:42.134-07	2016-08-10 17:22:42.134-07	37	10	http://****
102	email	group.monthlyreport	t	2016-08-10 17:22:42.135-07	2016-08-10 17:22:42.135-07	35	12	http://****
103	email	group.monthlyreport	t	2016-08-10 17:22:42.136-07	2016-08-10 17:22:42.136-07	33	13	http://****
104	email	group.monthlyreport	t	2016-08-10 17:22:42.136-07	2016-08-10 17:22:42.136-07	31	14	http://****
105	email	group.monthlyreport	t	2016-08-10 17:22:42.137-07	2016-08-10 17:22:42.137-07	32	14	http://****
106	email	group.monthlyreport	t	2016-08-10 17:22:42.139-07	2016-08-10 17:22:42.139-07	34	15	http://****
115	email	group.monthlyreport	t	2016-08-10 17:22:42.145-07	2016-08-10 17:22:42.145-07	141	47	http://****
116	email	group.monthlyreport	t	2016-08-10 17:22:42.146-07	2016-08-10 17:22:42.146-07	142	48	http://****
124	email	group.monthlyreport	t	2016-08-10 17:22:42.149-07	2016-08-10 17:22:42.149-07	28	2	http://****
148	email	group.monthlyreport	t	2016-08-10 17:22:42.162-07	2016-08-10 17:22:42.162-07	67	13	http://****
149	email	group.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	68	15	http://****
150	email	group.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	69	12	http://****
151	email	group.monthlyreport	t	2016-08-10 17:22:42.164-07	2016-08-10 17:22:42.164-07	70	12	http://****
152	email	group.monthlyreport	t	2016-08-10 17:22:42.165-07	2016-08-10 17:22:42.165-07	71	3	http://****
153	email	group.monthlyreport	t	2016-08-10 17:22:42.165-07	2016-08-10 17:22:42.165-07	72	3	http://****
154	email	group.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	73	3	http://****
155	email	group.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	74	4	http://****
156	email	group.monthlyreport	t	2016-08-10 17:22:42.166-07	2016-08-10 17:22:42.166-07	75	4	http://****
157	email	group.monthlyreport	t	2016-08-10 17:22:42.167-07	2016-08-10 17:22:42.167-07	76	4	http://****
158	email	group.monthlyreport	t	2016-08-10 17:22:42.167-07	2016-08-10 17:22:42.167-07	77	4	http://****
159	email	group.monthlyreport	t	2016-08-10 17:22:42.168-07	2016-08-10 17:22:42.168-07	78	4	http://****
194	email	group.monthlyreport	t	2016-08-10 17:22:42.182-07	2016-08-10 17:22:42.182-07	170	59	http://****
335	email	group.monthlyreport	t	2016-08-10 17:22:42.23-07	2016-08-10 17:22:42.23-07	577	4	http://****
472	email	group.monthlyreport	t	2016-08-10 17:22:42.274-07	2016-08-10 17:22:42.274-07	898	195	http://****
471	email	group.monthlyreport	t	2016-08-10 17:22:42.273-07	2016-08-10 17:22:42.273-07	897	195	http://****
195	email	group.monthlyreport	t	2016-08-10 17:22:42.182-07	2016-08-10 17:22:42.182-07	171	59	http://****
566	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	261	http://****
567	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	10	http://****
568	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	268	http://****
569	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	262	http://****
570	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	269	http://****
571	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	263	http://****
572	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	270	http://****
573	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	264	http://****
574	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	265	http://****
575	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	15	http://****
576	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	259	http://****
577	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	266	http://****
578	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	271	http://****
579	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	260	http://****
580	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	267	http://****
581	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	272	http://****
582	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	273	http://****
583	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	14	http://****
584	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	274	http://****
585	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	275	http://****
586	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	276	http://****
587	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	277	http://****
588	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	279	http://****
589	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	280	http://****
590	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	281	http://****
591	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	282	http://****
592	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	283	http://****
593	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	284	http://****
594	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	285	http://****
600	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	290	http://****
601	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	291	http://****
602	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	292	http://****
603	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	293	http://****
604	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	294	http://****
605	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	295	http://****
606	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	297	http://****
607	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	298	http://****
608	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	299	http://****
609	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	13	http://****
610	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	278	http://****
611	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	59	http://****
612	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	2	http://****
613	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	51	http://****
614	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	241	http://****
615	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	3	http://****
616	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	48	http://****
617	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	47	http://****
618	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	4	http://****
619	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	300	http://****
620	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	301	http://****
621	email	group.transactions.created	t	2016-10-04 13:38:40-07	2016-10-04 13:38:40-07	3	12	http://****
624	email	mailinglist.members	t	2016-10-10 13:37:16.649-07	2016-10-10 13:37:16.649-07	7	10	http://****
625	email	mailinglist.members	t	2016-10-10 13:37:16.65-07	2016-10-10 13:37:16.65-07	36	10	http://****
626	email	mailinglist.members	t	2016-10-10 13:37:16.65-07	2016-10-10 13:37:16.65-07	37	10	http://****
627	email	mailinglist.members	t	2016-10-10 13:37:16.651-07	2016-10-10 13:37:16.651-07	35	12	http://****
628	email	mailinglist.members	t	2016-10-10 13:37:16.652-07	2016-10-10 13:37:16.652-07	33	13	http://****
629	email	mailinglist.members	t	2016-10-10 13:37:16.652-07	2016-10-10 13:37:16.652-07	31	14	http://****
630	email	mailinglist.members	t	2016-10-10 13:37:16.654-07	2016-10-10 13:37:16.654-07	32	14	http://****
633	email	mailinglist.members	t	2016-10-10 13:37:16.654-07	2016-10-10 13:37:16.654-07	34	15	http://****
655	email	mailinglist.backers	t	2016-10-10 13:37:16.676-07	2016-10-10 13:37:16.676-07	126	13	http://****
658	email	mailinglist.backers	t	2016-10-10 13:37:16.677-07	2016-10-10 13:37:16.677-07	2	10	http://****
669	email	mailinglist.members	t	2016-10-10 13:37:16.688-07	2016-10-10 13:37:16.688-07	141	47	http://****
671	email	mailinglist.members	t	2016-10-10 13:37:16.69-07	2016-10-10 13:37:16.69-07	142	48	http://****
698	email	mailinglist.backers	t	2016-10-10 13:37:16.722-07	2016-10-10 13:37:16.722-07	2	13	http://****
765	email	mailinglist.members	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	72	3	http://****
770	email	mailinglist.members	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	77	4	http://****
865	email	mailinglist.backers	t	2016-10-10 13:37:16.826-07	2016-10-10 13:37:16.826-07	192	2	http://****
1003	email	mailinglist.backers	t	2016-10-10 13:37:16.887-07	2016-10-10 13:37:16.887-07	308	2	http://****
680	email	mailinglist.backers	t	2016-10-10 13:37:16.704-07	2016-10-10 13:37:16.704-07	30	12	http://****
705	email	mailinglist.members	t	2016-10-10 13:37:16.725-07	2016-10-10 13:37:16.725-07	28	2	http://****
844	email	mailinglist.members	t	2016-10-10 13:37:16.819-07	2016-10-10 13:37:16.819-07	170	59	http://****
690	email	mailinglist.backers	t	2016-10-10 13:37:16.719-07	2016-10-10 13:37:16.719-07	30	14	http://****
761	email	mailinglist.members	t	2016-10-10 13:37:16.792-07	2016-10-10 13:37:16.792-07	68	15	http://****
768	email	mailinglist.members	t	2016-10-10 13:37:16.795-07	2016-10-10 13:37:16.795-07	75	4	http://****
691	email	mailinglist.backers	t	2016-10-10 13:37:16.72-07	2016-10-10 13:37:16.72-07	80	10	http://****
697	email	mailinglist.backers	t	2016-10-10 13:37:16.722-07	2016-10-10 13:37:16.722-07	8	14	http://****
760	email	mailinglist.members	t	2016-10-10 13:37:16.792-07	2016-10-10 13:37:16.792-07	67	13	http://****
766	email	mailinglist.members	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	73	3	http://****
771	email	mailinglist.members	t	2016-10-10 13:37:16.796-07	2016-10-10 13:37:16.796-07	78	4	http://****
912	email	mailinglist.backers	t	2016-10-10 13:37:16.84-07	2016-10-10 13:37:16.84-07	224	2	http://****
990	email	mailinglist.backers	t	2016-10-10 13:37:16.883-07	2016-10-10 13:37:16.883-07	303	13	http://****
1089	email	mailinglist.backers	t	2016-10-10 13:37:16.922-07	2016-10-10 13:37:16.922-07	392	2	http://****
692	email	mailinglist.backers	t	2016-10-10 13:37:16.72-07	2016-10-10 13:37:16.72-07	30	13	http://****
762	email	mailinglist.members	t	2016-10-10 13:37:16.793-07	2016-10-10 13:37:16.793-07	69	12	http://****
767	email	mailinglist.members	t	2016-10-10 13:37:16.794-07	2016-10-10 13:37:16.794-07	74	4	http://****
799	email	mailinglist.backers	t	2016-10-10 13:37:16.803-07	2016-10-10 13:37:16.803-07	129	2	http://****
845	email	mailinglist.members	t	2016-10-10 13:37:16.819-07	2016-10-10 13:37:16.819-07	171	59	http://****
987	email	mailinglist.backers	t	2016-10-10 13:37:16.883-07	2016-10-10 13:37:16.883-07	283	13	http://****
1244	email	mailinglist.backers	t	2016-10-10 13:37:16.958-07	2016-10-10 13:37:16.958-07	8	3	http://****
1322	email	mailinglist.backers	t	2016-10-10 13:37:16.976-07	2016-10-10 13:37:16.976-07	642	48	http://****
1232	email	mailinglist.backers	t	2016-10-10 13:37:16.955-07	2016-10-10 13:37:16.955-07	551	2	http://****
1237	email	mailinglist.backers	t	2016-10-10 13:37:16.956-07	2016-10-10 13:37:16.956-07	555	13	http://****
1321	email	mailinglist.backers	t	2016-10-10 13:37:16.975-07	2016-10-10 13:37:16.975-07	642	4	http://****
1128	email	mailinglist.backers	t	2016-10-10 13:37:16.931-07	2016-10-10 13:37:16.931-07	426	2	http://****
1261	email	mailinglist.members	t	2016-10-10 13:37:16.962-07	2016-10-10 13:37:16.962-07	577	4	http://****
1320	email	mailinglist.backers	t	2016-10-10 13:37:16.975-07	2016-10-10 13:37:16.975-07	642	12	http://****
1325	email	mailinglist.backers	t	2016-10-10 13:37:16.976-07	2016-10-10 13:37:16.976-07	646	2	http://****
1595	email	mailinglist.backers	t	2016-10-10 13:37:17.04-07	2016-10-10 13:37:17.04-07	884	2	http://****
1613	email	mailinglist.members	t	2016-10-10 13:37:17.063-07	2016-10-10 13:37:17.063-07	898	195	http://****
1609	email	mailinglist.backers	t	2016-10-10 13:37:17.062-07	2016-10-10 13:37:17.062-07	896	4	http://****
1594	email	mailinglist.backers	t	2016-10-10 13:37:17.04-07	2016-10-10 13:37:17.04-07	883	2	http://****
1612	email	mailinglist.members	t	2016-10-10 13:37:17.063-07	2016-10-10 13:37:17.063-07	897	195	http://****
1805	email	mailinglist.backers	t	2016-10-10 13:37:17.119-07	2016-10-10 13:37:17.119-07	1094	2	http://****
1873	email	mailinglist.members	t	2016-10-10 13:37:17.137-07	2016-10-10 13:37:17.137-07	1145	241	http://****
1888	email	mailinglist.backers	t	2016-10-10 13:37:17.141-07	2016-10-10 13:37:17.141-07	1158	241	http://****
1961	email	mailinglist.backers	t	2016-10-10 13:37:17.158-07	2016-10-10 13:37:17.158-07	1244	4	http://****
1985	email	mailinglist.backers	t	2016-10-10 13:37:17.168-07	2016-10-10 13:37:17.168-07	1263	59	http://****
2069	email	mailinglist.members	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1323	272	http://****
2075	email	mailinglist.members	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1329	276	http://****
2080	email	mailinglist.members	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1334	278	http://****
2085	email	mailinglist.members	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1339	282	http://****
2091	email	mailinglist.members	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1345	287	http://****
2096	email	mailinglist.members	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1350	289	http://****
2100	email	mailinglist.members	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1355	292	http://****
2104	email	mailinglist.members	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1358	294	http://****
2109	email	mailinglist.members	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1363	297	http://****
2114	email	mailinglist.members	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1368	299	http://****
2119	email	mailinglist.members	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1374	300	http://****
2124	email	mailinglist.members	t	2016-10-10 13:37:17.212-07	2016-10-10 13:37:17.212-07	1377	301	http://****
2045	email	mailinglist.backers	t	2016-10-10 13:37:17.194-07	2016-10-10 13:37:17.194-07	1299	2	http://****
2049	email	mailinglist.members	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1304	260	http://****
2055	email	mailinglist.members	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1310	262	http://****
2060	email	mailinglist.members	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1315	265	http://****
2065	email	mailinglist.members	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1319	269	http://****
2070	email	mailinglist.members	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1324	272	http://****
2076	email	mailinglist.members	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1330	276	http://****
2081	email	mailinglist.members	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1335	279	http://****
2086	email	mailinglist.members	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1340	283	http://****
2090	email	mailinglist.members	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1344	286	http://****
2093	email	mailinglist.members	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1347	288	http://****
2101	email	mailinglist.members	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1354	292	http://****
2107	email	mailinglist.members	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1360	295	http://****
2112	email	mailinglist.members	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1367	298	http://****
2117	email	mailinglist.members	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1371	300	http://****
2122	email	mailinglist.members	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1379	301	http://****
2050	email	mailinglist.members	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1305	260	http://****
2056	email	mailinglist.members	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1311	263	http://****
2061	email	mailinglist.members	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1316	266	http://****
2066	email	mailinglist.members	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1320	270	http://****
2071	email	mailinglist.members	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1325	273	http://****
2072	email	mailinglist.members	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1326	274	http://****
2077	email	mailinglist.members	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1331	277	http://****
2082	email	mailinglist.members	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1336	279	http://****
2087	email	mailinglist.members	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1341	284	http://****
2094	email	mailinglist.members	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1348	288	http://****
2099	email	mailinglist.members	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1353	291	http://****
2106	email	mailinglist.members	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1361	295	http://****
2111	email	mailinglist.members	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1365	298	http://****
2116	email	mailinglist.members	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1370	299	http://****
2121	email	mailinglist.members	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1375	301	http://****
2125	email	mailinglist.members	t	2016-10-10 13:37:17.212-07	2016-10-10 13:37:17.212-07	1378	301	http://****
2053	email	mailinglist.members	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1308	261	http://****
2057	email	mailinglist.members	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1312	263	http://****
2062	email	mailinglist.members	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1314	267	http://****
2067	email	mailinglist.members	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1321	270	http://****
2074	email	mailinglist.members	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1328	275	http://****
2079	email	mailinglist.members	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1333	278	http://****
2083	email	mailinglist.members	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1337	280	http://****
2088	email	mailinglist.members	t	2016-10-10 13:37:17.203-07	2016-10-10 13:37:17.203-07	1342	285	http://****
2095	email	mailinglist.members	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1349	289	http://****
2098	email	mailinglist.members	t	2016-10-10 13:37:17.206-07	2016-10-10 13:37:17.206-07	1352	290	http://****
2105	email	mailinglist.members	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1359	295	http://****
2110	email	mailinglist.members	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1364	297	http://****
2115	email	mailinglist.members	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1369	299	http://****
2120	email	mailinglist.members	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1373	300	http://****
2233	email	mailinglist.backers	t	2016-10-10 13:37:17.237-07	2016-10-10 13:37:17.237-07	1446	241	http://****
2048	email	mailinglist.members	t	2016-10-10 13:37:17.195-07	2016-10-10 13:37:17.195-07	1303	259	http://****
2054	email	mailinglist.members	t	2016-10-10 13:37:17.196-07	2016-10-10 13:37:17.196-07	1309	262	http://****
2058	email	mailinglist.members	t	2016-10-10 13:37:17.197-07	2016-10-10 13:37:17.197-07	1313	264	http://****
2063	email	mailinglist.members	t	2016-10-10 13:37:17.198-07	2016-10-10 13:37:17.198-07	1317	268	http://****
2068	email	mailinglist.members	t	2016-10-10 13:37:17.199-07	2016-10-10 13:37:17.199-07	1322	271	http://****
2073	email	mailinglist.members	t	2016-10-10 13:37:17.2-07	2016-10-10 13:37:17.2-07	1327	275	http://****
2078	email	mailinglist.members	t	2016-10-10 13:37:17.201-07	2016-10-10 13:37:17.201-07	1332	277	http://****
2084	email	mailinglist.members	t	2016-10-10 13:37:17.202-07	2016-10-10 13:37:17.202-07	1338	281	http://****
2089	email	mailinglist.members	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1343	286	http://****
2092	email	mailinglist.members	t	2016-10-10 13:37:17.204-07	2016-10-10 13:37:17.204-07	1346	287	http://****
2097	email	mailinglist.members	t	2016-10-10 13:37:17.205-07	2016-10-10 13:37:17.205-07	1351	290	http://****
2102	email	mailinglist.members	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1356	293	http://****
2103	email	mailinglist.members	t	2016-10-10 13:37:17.207-07	2016-10-10 13:37:17.207-07	1357	294	http://****
2108	email	mailinglist.members	t	2016-10-10 13:37:17.208-07	2016-10-10 13:37:17.208-07	1362	297	http://****
2113	email	mailinglist.members	t	2016-10-10 13:37:17.209-07	2016-10-10 13:37:17.209-07	1366	298	http://****
2118	email	mailinglist.members	t	2016-10-10 13:37:17.21-07	2016-10-10 13:37:17.21-07	1372	300	http://****
2123	email	mailinglist.members	t	2016-10-10 13:37:17.211-07	2016-10-10 13:37:17.211-07	1376	301	http://****
2226	email	mailinglist.backers	t	2016-10-10 13:37:17.235-07	2016-10-10 13:37:17.235-07	1438	2	http://****
2392	email	group.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1303	259	http://****
2397	email	group.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1309	262	http://****
2401	email	group.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1313	264	http://****
2406	email	group.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1317	268	http://****
2411	email	group.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1322	271	http://****
2416	email	group.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1327	275	http://****
2421	email	group.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1332	277	http://****
2426	email	group.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1337	280	http://****
2431	email	group.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1342	285	http://****
2436	email	group.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1347	288	http://****
2441	email	group.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1352	290	http://****
2446	email	group.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1357	294	http://****
2451	email	group.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1362	297	http://****
2456	email	group.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1366	298	http://****
2461	email	group.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1372	300	http://****
2466	email	group.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1376	301	http://****
2393	email	group.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1304	260	http://****
2398	email	group.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1310	262	http://****
2403	email	group.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1315	265	http://****
2408	email	group.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1319	269	http://****
2413	email	group.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1324	272	http://****
2418	email	group.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1329	276	http://****
2423	email	group.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1334	278	http://****
2428	email	group.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1339	282	http://****
2433	email	group.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1344	286	http://****
2438	email	group.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1349	289	http://****
2442	email	group.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1353	291	http://****
2447	email	group.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1358	294	http://****
2452	email	group.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1363	297	http://****
2457	email	group.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1368	299	http://****
2462	email	group.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1374	300	http://****
2467	email	group.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1377	301	http://****
2394	email	group.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1305	260	http://****
2399	email	group.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1311	263	http://****
2405	email	group.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1314	267	http://****
2409	email	group.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1320	270	http://****
2414	email	group.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1325	273	http://****
2419	email	group.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1330	276	http://****
2424	email	group.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1335	279	http://****
2429	email	group.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1340	283	http://****
2435	email	group.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1346	287	http://****
2440	email	group.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1351	290	http://****
2444	email	group.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1355	292	http://****
2449	email	group.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1361	295	http://****
2455	email	group.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1367	298	http://****
2460	email	group.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1371	300	http://****
2465	email	group.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1379	301	http://****
2395	email	group.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1307	261	http://****
2400	email	group.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1312	263	http://****
2404	email	group.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1316	266	http://****
2410	email	group.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1321	270	http://****
2415	email	group.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1326	274	http://****
2420	email	group.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1331	277	http://****
2425	email	group.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1336	279	http://****
2430	email	group.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1341	284	http://****
2434	email	group.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1345	287	http://****
2439	email	group.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1350	289	http://****
2445	email	group.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1356	293	http://****
2450	email	group.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1360	295	http://****
2454	email	group.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1365	298	http://****
2459	email	group.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1370	299	http://****
2464	email	group.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1375	301	http://****
2348	email	group.monthlyreport	t	2016-11-06 16:37:19.095-08	2016-11-06 16:37:19.095-08	1145	241	http://****
2396	email	group.monthlyreport	t	2016-11-06 16:37:19.104-08	2016-11-06 16:37:19.104-08	1308	261	http://****
2402	email	group.monthlyreport	t	2016-11-06 16:37:19.105-08	2016-11-06 16:37:19.105-08	1314	264	http://****
2407	email	group.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1318	268	http://****
2412	email	group.monthlyreport	t	2016-11-06 16:37:19.106-08	2016-11-06 16:37:19.106-08	1323	272	http://****
2417	email	group.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1328	275	http://****
2422	email	group.monthlyreport	t	2016-11-06 16:37:19.107-08	2016-11-06 16:37:19.107-08	1333	278	http://****
2427	email	group.monthlyreport	t	2016-11-06 16:37:19.108-08	2016-11-06 16:37:19.108-08	1338	281	http://****
2432	email	group.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1343	286	http://****
2437	email	group.monthlyreport	t	2016-11-06 16:37:19.109-08	2016-11-06 16:37:19.109-08	1348	288	http://****
2443	email	group.monthlyreport	t	2016-11-06 16:37:19.11-08	2016-11-06 16:37:19.11-08	1354	292	http://****
2448	email	group.monthlyreport	t	2016-11-06 16:37:19.111-08	2016-11-06 16:37:19.111-08	1359	295	http://****
2453	email	group.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1364	297	http://****
2458	email	group.monthlyreport	t	2016-11-06 16:37:19.112-08	2016-11-06 16:37:19.112-08	1369	299	http://****
2463	email	group.monthlyreport	t	2016-11-06 16:37:19.113-08	2016-11-06 16:37:19.113-08	1373	300	http://****
2468	email	group.monthlyreport	t	2016-11-06 16:37:19.114-08	2016-11-06 16:37:19.114-08	1378	301	http://****
2597	email	mailinglist.backers	t	2016-11-17 09:43:31.222-08	2016-11-17 09:43:31.222-08	1808	59	http://****
2697	email	mailinglist.backers	t	2016-11-28 07:33:15.871-08	2016-11-28 07:33:15.871-08	1890	2	http://****
3000	email	mailinglist.backers	t	2016-11-29 02:03:23.975-08	2016-11-29 02:03:23.975-08	1908	301	http://****
3047	email	mailinglist.backers	t	2016-11-30 08:11:42.607-08	2016-11-30 08:11:42.607-08	1957	2	http://****
3286	email	mailinglist.backers	t	2016-12-18 17:41:29.217-08	2016-12-18 17:41:29.217-08	2220	259	http://****
6045	email	mailinglist.backers	t	2017-01-03 12:59:38.785-08	2017-01-03 12:59:38.785-08	2416	2	http://****
2917	email	group.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	298	http://****
2922	email	group.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	292	http://****
2927	email	group.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	287	http://****
2932	email	group.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	282	http://****
2937	email	group.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	277	http://****
2942	email	group.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	272	http://****
2947	email	group.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	267	http://****
2953	email	group.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	261	http://****
2897	email	group.expense.created	t	2016-11-28 14:28:52.436-08	2017-01-10 16:00:00-08	3	241	http://****
2915	email	group.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	300	http://****
2920	email	group.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	294	http://****
2925	email	group.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	289	http://****
2929	email	group.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	285	http://****
2935	email	group.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	279	http://****
2939	email	group.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	275	http://****
2945	email	group.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	269	http://****
2950	email	group.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	264	http://****
2955	email	group.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	259	http://****
2916	email	group.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	299	http://****
2921	email	group.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	293	http://****
2924	email	group.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	290	http://****
2930	email	group.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	284	http://****
2934	email	group.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	280	http://****
2940	email	group.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	274	http://****
2944	email	group.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	270	http://****
2949	email	group.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	265	http://****
2914	email	group.expense.created	t	2016-11-28 14:28:52.443-08	2017-01-10 16:00:00-08	3	301	http://****
2941	email	group.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	273	http://****
2946	email	group.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	268	http://****
2951	email	group.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	263	http://****
2701	email	group.expense.created	t	2016-11-28 14:28:52.359-08	2017-01-10 16:00:00-08	3	10	http://****
2703	email	group.expense.created	t	2016-11-28 14:28:52.36-08	2017-01-10 16:00:00-08	3	12	http://****
2704	email	group.expense.created	t	2016-11-28 14:28:52.361-08	2017-01-10 16:00:00-08	3	13	http://****
2705	email	group.expense.created	t	2016-11-28 14:28:52.362-08	2017-01-10 16:00:00-08	3	14	http://****
2706	email	group.expense.created	t	2016-11-28 14:28:52.362-08	2017-01-10 16:00:00-08	3	15	http://****
2708	email	group.expense.created	t	2016-11-28 14:28:52.365-08	2017-01-10 16:00:00-08	3	47	http://****
2709	email	group.expense.created	t	2016-11-28 14:28:52.368-08	2017-01-10 16:00:00-08	3	48	http://****
2712	email	group.expense.created	t	2016-11-28 14:28:52.373-08	2017-01-10 16:00:00-08	3	51	http://****
2723	email	group.expense.created	t	2016-11-28 14:28:52.376-08	2017-01-10 16:00:00-08	3	2	http://****
2724	email	group.expense.created	t	2016-11-28 14:28:52.377-08	2017-01-10 16:00:00-08	3	3	http://****
2725	email	group.expense.created	t	2016-11-28 14:28:52.377-08	2017-01-10 16:00:00-08	3	4	http://****
2751	email	group.expense.created	t	2016-11-28 14:28:52.388-08	2017-01-10 16:00:00-08	3	59	http://****
2954	email	group.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	260	http://****
2851	email	group.expense.created	t	2016-11-28 14:28:52.427-08	2017-01-10 16:00:00-08	3	195	http://****
2918	email	group.expense.created	t	2016-11-28 14:28:52.444-08	2017-01-10 16:00:00-08	3	297	http://****
2923	email	group.expense.created	t	2016-11-28 14:28:52.445-08	2017-01-10 16:00:00-08	3	291	http://****
2928	email	group.expense.created	t	2016-11-28 14:28:52.446-08	2017-01-10 16:00:00-08	3	286	http://****
2933	email	group.expense.created	t	2016-11-28 14:28:52.447-08	2017-01-10 16:00:00-08	3	281	http://****
2938	email	group.expense.created	t	2016-11-28 14:28:52.448-08	2017-01-10 16:00:00-08	3	276	http://****
2943	email	group.expense.created	t	2016-11-28 14:28:52.449-08	2017-01-10 16:00:00-08	3	271	http://****
2948	email	group.expense.created	t	2016-11-28 14:28:52.45-08	2017-01-10 16:00:00-08	3	266	http://****
2952	email	group.expense.created	t	2016-11-28 14:28:52.451-08	2017-01-10 16:00:00-08	3	262	http://****
5766	email	group.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1329	276	http://****
5780	email	group.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1351	290	http://****
5770	email	group.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1337	280	http://****
5759	email	group.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1317	268	http://****
5760	email	group.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1319	269	http://****
5788	email	group.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1365	298	http://****
5781	email	group.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1353	291	http://****
5765	email	group.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1325	273	http://****
5782	email	group.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1354	292	http://****
5768	email	group.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1331	277	http://****
5557	email	group.expense.created	f	2016-12-28 16:13:56.267-08	2017-01-17 16:00:00-08	33	13	http://****
5774	email	group.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1341	284	http://****
5751	email	group.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1303	259	http://****
5589	email	group.expense.created	f	2016-12-28 16:13:56.281-08	2017-01-17 16:00:00-08	142	48	http://****
5552	email	group.expense.created	f	2016-12-28 16:13:56.264-08	2017-01-17 16:00:00-08	28	2	http://****
5563	email	group.expense.created	f	2016-12-28 16:13:56.267-08	2017-01-17 16:00:00-08	31	14	http://****
5767	email	group.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1333	278	http://****
5786	email	group.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1357	294	http://****
5776	email	group.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1343	286	http://****
5771	email	group.expense.created	f	2016-12-28 16:13:56.342-08	2017-01-17 16:00:00-08	1338	281	http://****
5588	email	group.expense.created	f	2016-12-28 16:13:56.281-08	2017-01-17 16:00:00-08	141	47	http://****
5555	email	group.expense.created	f	2016-12-28 16:13:56.265-08	2017-01-17 16:00:00-08	7	10	http://****
5757	email	group.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1316	266	http://****
5763	email	group.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1326	274	http://****
5764	email	group.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1327	275	http://****
5779	email	group.expense.created	f	2016-12-28 16:13:56.343-08	2017-01-17 16:00:00-08	1349	289	http://****
5758	email	group.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1314	267	http://****
5689	email	group.expense.created	f	2016-12-28 16:13:56.324-08	2017-01-17 16:00:00-08	897	195	http://****
5733	email	group.expense.created	f	2016-12-28 16:13:56.333-08	2017-01-17 16:00:00-08	1145	241	http://****
5762	email	group.expense.created	f	2016-12-28 16:13:56.341-08	2017-01-17 16:00:00-08	1323	272	http://****
5783	email	group.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1356	293	http://****
5785	email	group.expense.created	f	2016-12-28 16:13:56.344-08	2017-01-17 16:00:00-08	1362	297	http://****
5756	email	group.expense.created	f	2016-12-28 16:13:56.34-08	2017-01-17 16:00:00-08	1315	265	http://****
5754	email	group.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1309	262	http://****
5755	email	group.expense.created	f	2016-12-28 16:13:56.339-08	2017-01-17 16:00:00-08	1313	264	http://****
7114	email	mailinglist.backers	t	2017-02-01 07:16:22.45-08	2017-02-01 07:16:22.45-08	2898	48	http://****
8075	email	group.transaction.created	t	2017-02-21 10:35:34.614-08	2017-02-21 10:35:34.614-08	3	513	http://****
8086	email	group.expense.created	t	2017-02-21 10:49:14.347-08	2017-02-21 10:49:14.347-08	3	515	http://****
8096	email	group.transaction.created	t	2017-02-21 11:02:21.647-08	2017-02-21 11:02:21.647-08	3	516	http://****
8098	email	mailinglist.members	t	2017-02-21 11:07:25.188-08	2017-02-21 11:07:25.188-08	3	517	http://****
8099	email	group.monthlyreport	t	2017-02-21 11:07:25.189-08	2017-02-21 11:07:25.189-08	3	517	http://****
8100	email	group.expense.created	t	2017-02-21 11:07:25.189-08	2017-02-21 11:07:25.189-08	3	517	http://****
8101	email	mailinglist.host	t	2017-02-21 11:07:25.322-08	2017-02-21 11:07:25.322-08	3	517	http://****
8102	email	group.transaction.created	t	2017-02-21 11:07:25.322-08	2017-02-21 11:07:25.322-08	3	517	http://****
8104	email	mailinglist.members	t	2017-02-21 11:13:03.396-08	2017-02-21 11:13:03.396-08	3	518	http://****
8105	email	group.expense.created	t	2017-02-21 11:13:03.396-08	2017-02-21 11:13:03.396-08	3	518	http://****
8106	email	group.monthlyreport	t	2017-02-21 11:13:03.397-08	2017-02-21 11:13:03.397-08	3	518	http://****
8107	email	mailinglist.host	t	2017-02-21 11:13:03.539-08	2017-02-21 11:13:03.539-08	3	518	http://****
8108	email	group.transaction.created	t	2017-02-21 11:13:03.539-08	2017-02-21 11:13:03.539-08	3	518	http://****
8110	email	mailinglist.members	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8111	email	group.expense.created	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8112	email	group.monthlyreport	t	2017-02-21 11:25:28.726-08	2017-02-21 11:25:28.726-08	3	519	http://****
8113	email	mailinglist.host	t	2017-02-21 11:25:28.823-08	2017-02-21 11:25:28.823-08	3	519	http://****
8114	email	group.transaction.created	t	2017-02-21 11:25:28.823-08	2017-02-21 11:25:28.823-08	3	519	http://****
8116	email	mailinglist.members	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8117	email	group.expense.created	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8118	email	group.monthlyreport	t	2017-02-21 11:34:47.023-08	2017-02-21 11:34:47.023-08	3	520	http://****
8119	email	mailinglist.host	t	2017-02-21 11:34:47.428-08	2017-02-21 11:34:47.428-08	3	520	http://****
8120	email	group.transaction.created	t	2017-02-21 11:34:47.428-08	2017-02-21 11:34:47.428-08	3	520	http://****
8122	email	mailinglist.members	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8123	email	group.expense.created	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8124	email	group.monthlyreport	t	2017-02-21 11:39:46.24-08	2017-02-21 11:39:46.24-08	3	521	http://****
8125	email	mailinglist.host	t	2017-02-21 11:39:46.291-08	2017-02-21 11:39:46.291-08	3	521	http://****
8127	email	group.transaction.created	t	2017-02-21 11:39:46.291-08	2017-02-21 11:39:46.291-08	3	521	http://****
8128	email	mailinglist.members	t	2017-02-21 11:45:19.17-08	2017-02-21 11:45:19.17-08	3	522	http://****
8129	email	group.expense.created	t	2017-02-21 11:45:19.17-08	2017-02-21 11:45:19.17-08	3	522	http://****
8130	email	group.monthlyreport	t	2017-02-21 11:45:19.171-08	2017-02-21 11:45:19.171-08	3	522	http://****
8131	email	mailinglist.host	t	2017-02-21 11:45:19.314-08	2017-02-21 11:45:19.314-08	3	522	http://****
8132	email	group.transaction.created	t	2017-02-21 11:45:19.315-08	2017-02-21 11:45:19.315-08	3	522	http://****
8138	email	mailinglist.members	t	2017-02-21 12:04:48.982-08	2017-02-21 12:04:48.982-08	3	523	http://****
8139	email	group.expense.created	t	2017-02-21 12:04:48.983-08	2017-02-21 12:04:48.983-08	3	523	http://****
\.


                                                                                                                                                                                                       4092.dat                                                                                            0000600 0004000 0002000 00000000005 13124477142 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4073.dat                                                                                            0000600 0004000 0002000 00000053054 13124477142 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        219	*****@paypal.com	*****	*****	stripe	\N	2016-04-29 11:46:16.188-07	2016-04-29 11:46:16.688-07	\N	\N	308	\N
19	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 01:42:57.058-08	2015-12-16 10:22:05.853-08	\N	2015-12-16 10:22:05.842-08	2	\N
18	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 01:42:53.531-08	2015-12-16 01:42:57.019-08	\N	2015-12-16 01:42:57.018-08	2	\N
216	*****@paypal.com	*****	*****	stripe	\N	2016-04-29 06:51:16.73-07	2016-04-29 06:51:17.252-07	\N	\N	303	\N
17	*****@paypal.com	*****	*****	paypal	\N	2015-12-15 19:05:01.805-08	2015-12-16 10:22:39.715-08	2015-12-15 19:05:25.467-08	2015-12-16 10:22:39.714-08	2	\N
24	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:28:34.146-08	2015-12-16 10:28:36.228-08	\N	2015-12-16 10:28:36.227-08	2	\N
29	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:51:35.761-08	2016-01-12 09:54:45.421-08	2016-01-12 09:52:16.235-08	2016-01-12 09:54:45.421-08	2	\N
27	*****@paypal.com	*****	*****	stripe	\N	2016-01-06 16:55:36.615-08	2016-01-06 16:55:36.615-08	\N	\N	2	\N
26	*****@paypal.com	*****	*****	paypal	\N	2015-12-18 12:07:43.76-08	2016-05-26 08:38:39.069-07	2015-12-18 13:52:39.247-08	2016-05-26 08:38:39.068-07	3	\N
25	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:28:36.264-08	2016-01-12 09:52:16.325-08	2015-12-16 10:29:24.829-08	2016-01-12 09:52:16.323-08	2	\N
152	*****@paypal.com	*****	*****	stripe	\N	2016-03-25 08:11:03.086-07	2016-03-25 08:11:03.086-07	\N	\N	192	\N
30	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:53:19.259-08	2016-01-12 09:53:20.842-08	\N	2016-01-12 09:53:20.841-08	2	\N
31	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:53:20.88-08	2016-01-12 09:54:22.364-08	\N	2016-01-12 09:54:22.343-08	2	\N
34	*****@paypal.com	*****	*****	stripe	\N	2016-01-18 15:54:03.69-08	2016-01-18 15:54:03.69-08	\N	\N	2	\N
173	*****@paypal.com	*****	*****	stripe	\N	2016-04-13 09:46:07.391-07	2016-04-13 09:46:08.785-07	\N	\N	224	\N
230	*****@paypal.com	*****	*****	stripe	\N	2016-05-03 06:07:25.728-07	2016-05-03 06:07:26.509-07	\N	\N	308	\N
32	*****@paypal.com	*****	*****	paypal	\N	2016-01-12 09:54:22.442-08	2016-01-21 22:25:25.222-08	2016-01-12 09:54:45.399-08	2016-01-21 22:25:25.222-08	2	\N
36	*****@paypal.com	*****	*****	paypal	\N	2016-01-23 10:23:35.682-08	2016-03-10 08:54:14.551-08	2016-01-23 10:23:58.941-08	2016-03-10 08:54:14.542-08	2	\N
43	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 09:04:53.229-08	2016-02-02 09:04:53.229-08	\N	\N	30	\N
64	*****@paypal.com	*****	*****	stripe	\N	2016-02-15 10:46:04.238-08	2016-02-15 10:46:04.238-08	\N	\N	7	\N
119	*****@paypal.com	*****	*****	paypal	\N	2016-03-11 13:34:11.535-08	2016-03-25 21:12:54.174-07	\N	2016-03-25 21:12:54.171-07	2	\N
41	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 08:36:35.761-08	2016-02-02 08:36:35.761-08	\N	\N	30	\N
44	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 09:09:19.757-08	2016-02-02 09:09:19.757-08	\N	\N	30	\N
42	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 08:52:00.333-08	2016-02-02 08:52:00.333-08	\N	\N	80	\N
45	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 13:46:42.678-08	2016-02-02 13:46:42.678-08	\N	\N	8	\N
46	*****@paypal.com	*****	*****	stripe	\N	2016-02-02 15:09:03.515-08	2016-02-02 15:09:03.515-08	\N	\N	2	\N
39	*****@paypal.com	*****	*****	stripe	\N	2016-01-29 14:23:51.784-08	2016-01-29 14:23:51.784-08	\N	\N	30	\N
51	*****@paypal.com	*****	*****	stripe	\N	2016-02-09 20:12:33.556-08	2016-02-09 20:12:33.556-08	\N	\N	30	\N
213	*****@paypal.com	*****	*****	stripe	\N	2016-04-28 08:01:14.747-07	2016-04-28 08:01:15.975-07	\N	\N	283	\N
68	*****@paypal.com	*****	*****	stripe	\N	2016-02-16 16:12:43.167-08	2016-02-16 16:12:43.165-08	\N	\N	2	\N
71	*****@paypal.com	*****	*****	stripe	\N	2016-02-18 11:54:06.513-08	2016-02-18 11:54:06.513-08	\N	\N	108	\N
80	*****@paypal.com	*****	*****	stripe	\N	2016-02-25 15:45:02.363-08	2016-02-25 15:45:02.363-08	\N	\N	30	\N
90	*****@paypal.com	*****	*****	stripe	\N	2016-02-29 17:35:13.096-08	2016-02-29 17:35:13.096-08	\N	\N	8	\N
94	*****@paypal.com	*****	*****	stripe	\N	2016-03-02 13:31:48.638-08	2016-03-02 13:31:48.638-08	\N	\N	129	\N
105	*****@paypal.com	*****	*****	paypal	\N	2016-03-05 10:48:06.494-08	2016-03-10 08:53:49.77-08	\N	2016-03-10 08:53:49.769-08	2	\N
117	*****@paypal.com	*****	*****	paypal	\N	2016-03-10 08:53:49.777-08	2016-03-10 08:54:14.484-08	2016-03-10 08:54:14.479-08	\N	2	\N
124	*****@paypal.com	*****	*****	stripe	\N	2016-03-17 08:29:28.675-07	2016-03-17 08:29:28.674-07	\N	\N	8	\N
35	*****@paypal.com	*****	*****	paypal	\N	2016-01-21 22:24:39.343-08	2016-01-23 10:23:58.964-08	2016-01-21 22:25:25.199-08	2016-01-23 10:23:58.964-08	2	\N
109	*****@paypal.com	*****	*****	stripe	\N	2016-03-07 18:43:27.661-08	2016-03-07 18:43:27.661-08	\N	\N	2	\N
110	*****@paypal.com	*****	*****	stripe	\N	2016-03-07 19:35:50.332-08	2016-03-07 19:35:50.332-08	\N	\N	8	\N
189	*****@paypal.com	*****	*****	paypal	\N	2016-04-20 07:14:38.754-07	2016-04-20 07:15:18.774-07	2016-04-20 07:15:18.772-07	\N	8	\N
203	*****@paypal.com	*****	*****	stripe	\N	2016-04-25 07:42:01.738-07	2016-04-25 07:42:02.272-07	\N	\N	30	\N
252	*****@paypal.com	*****	*****	stripe	\N	2016-05-10 10:19:56.78-07	2016-05-10 10:19:58.837-07	\N	\N	2	\N
306	*****@paypal.com	*****	*****	stripe	\N	2016-05-23 13:27:26.16-07	2016-05-23 13:27:26.962-07	\N	\N	426	\N
320	*****@paypal.com	*****	*****	paypal	\N	2016-05-26 08:37:59.825-07	2016-05-26 08:38:38.996-07	2016-05-26 08:38:38.994-07	2016-08-03 14:40:05.198-07	3	\N
323	*****@paypal.com	*****	*****	stripe	\N	2016-05-26 17:52:12.759-07	2016-05-26 17:52:14.148-07	\N	\N	30	\N
377	*****@paypal.com	*****	*****	stripe	\N	2016-06-06 12:04:34.62-07	2016-06-06 12:04:35.385-07	\N	\N	551	\N
381	*****@paypal.com	*****	*****	stripe	\N	2016-06-06 17:53:45.068-07	2016-06-06 17:53:45.674-07	\N	\N	555	\N
385	*****@paypal.com	*****	*****	stripe	\N	2016-06-09 10:28:10.609-07	2016-06-09 10:28:11.319-07	\N	\N	8	\N
430	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 09:02:53.255-07	2016-06-21 09:02:53.912-07	\N	\N	642	\N
431	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 09:04:57.958-07	2016-06-21 09:04:59.511-07	\N	\N	642	\N
432	*****@paypal.com	*****	*****	stripe	\N	2016-06-21 09:06:02.746-07	2016-06-21 09:06:03.475-07	\N	\N	642	\N
435	*****@paypal.com	*****	*****	stripe	\N	2016-06-22 13:09:44.066-07	2016-06-22 13:09:44.651-07	\N	\N	646	\N
461	*****@paypal.com	*****	*****	stripe	\N	2016-07-01 15:31:42.782-07	2016-07-01 15:31:43.38-07	\N	\N	686	\N
494	*****@paypal.com	*****	*****	stripe	\N	2016-07-08 09:25:56.621-07	2016-07-08 09:25:58.207-07	\N	\N	2	\N
495	*****@paypal.com	*****	*****	stripe	\N	2016-07-08 10:24:14.577-07	2016-07-08 10:24:15.71-07	\N	\N	2	\N
507	*****@paypal.com	*****	*****	stripe	\N	2016-07-12 14:19:35.579-07	2016-07-12 14:19:36.177-07	\N	\N	30	\N
524	*****@paypal.com	*****	*****	stripe	\N	2016-07-18 14:00:51.641-07	2016-07-18 14:00:52.921-07	\N	\N	2	\N
561	*****@paypal.com	*****	*****	stripe	\N	2016-08-01 08:54:11.721-07	2016-08-01 08:54:12.394-07	\N	\N	883	\N
562	*****@paypal.com	*****	*****	stripe	\N	2016-08-01 08:55:23.426-07	2016-08-01 08:55:24.6-07	\N	\N	884	\N
567	*****@paypal.com	*****	*****	stripe	\N	2016-08-02 21:54:45.226-07	2016-08-02 21:54:46.256-07	\N	\N	2	\N
571	*****@paypal.com	*****	*****	stripe	\N	2016-08-03 10:47:13.706-07	2016-08-03 10:47:14.326-07	\N	\N	896	\N
572	*****@paypal.com	*****	*****	stripe	\N	2016-08-03 12:30:20.399-07	2016-08-03 12:30:20.964-07	\N	\N	30	\N
587	*****@paypal.com	*****	*****	stripe	\N	2016-08-04 14:49:06.957-07	2016-08-04 14:49:07.534-07	\N	\N	8	\N
589	*****@paypal.com	*****	*****	stripe	\N	2016-08-05 13:48:05.525-07	2016-08-05 13:48:06.15-07	\N	\N	192	\N
701	*****@paypal.com	*****	*****	stripe	\N	2016-08-31 01:34:48.855-07	2016-08-31 01:34:49.606-07	\N	\N	8	\N
703	*****@paypal.com	*****	*****	stripe	\N	2016-08-31 11:22:18.085-07	2016-08-31 11:22:28.874-07	\N	\N	30	\N
707	*****@paypal.com	*****	*****	stripe	\N	2016-09-01 07:41:33.663-07	2016-09-01 07:41:34.394-07	\N	\N	1094	\N
715	*****@paypal.com	*****	*****	stripe	\N	2016-09-05 09:25:43.529-07	2016-09-05 09:25:44.192-07	\N	\N	30	\N
731	*****@paypal.com	*****	*****	stripe	\N	2016-09-09 20:42:49.13-07	2016-09-09 20:42:49.63-07	\N	\N	1158	\N
737	*****@paypal.com	*****	*****	stripe	\N	2016-09-12 21:15:02.169-07	2016-09-12 21:15:02.814-07	\N	\N	1178	\N
880	*****@paypal.com	*****	*****	stripe	\N	2016-10-06 11:36:35.196-07	2016-10-06 11:36:35.794-07	\N	\N	1438	\N
842	*****@paypal.com	*****	*****	stripe	\N	2016-09-28 14:47:15.094-07	2016-09-28 14:47:16.348-07	\N	\N	1299	\N
773	*****@paypal.com	*****	*****	stripe	\N	2016-09-20 13:58:49.788-07	2016-09-20 13:58:50.526-07	\N	\N	1244	\N
789	*****@paypal.com	*****	*****	stripe	\N	2016-09-22 11:56:45.915-07	2016-09-22 11:56:47.116-07	\N	\N	8	\N
790	*****@paypal.com	*****	*****	stripe	\N	2016-09-22 18:07:06.282-07	2016-09-22 18:07:07.667-07	\N	\N	1263	\N
884	*****@paypal.com	*****	*****	stripe	\N	2016-10-07 09:49:14.672-07	2016-10-07 09:49:15.283-07	\N	\N	1446	\N
885	*****@paypal.com	*****	*****	stripe	\N	2016-10-07 13:46:31.454-07	2016-10-07 13:46:32.168-07	\N	\N	8	\N
911	*****@paypal.com	*****	*****	stripe	\N	2016-10-15 08:47:38.174-07	2016-10-15 08:47:38.802-07	\N	\N	8	\N
971	*****@paypal.com	*****	*****	paypal	\N	2016-10-22 03:52:05.33-07	2016-10-22 03:52:05.881-07	\N	2016-10-27 14:01:07.137-07	3	\N
573	*****@paypal.com	*****	*****	paypal	\N	2016-08-03 14:38:52.082-07	2016-08-03 14:40:05.094-07	2016-08-03 14:40:05.093-07	2016-10-27 14:02:50.674-07	3	\N
1040	*****@paypal.com	*****	*****	stripe	\N	2016-10-31 06:27:24.403-07	2016-10-31 06:27:25.268-07	\N	\N	2	\N
1043	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:12:07.923-07	2016-10-31 14:12:53.002-07	2016-10-31 14:12:53.002-07	2016-10-31 14:34:17.33-07	3	\N
176	*****@paypal.com	*****	*****	stripe	\N	2016-04-14 11:12:55.955-07	2016-04-14 11:12:56.555-07	\N	\N	30	\N
1024	*****@paypal.com	*****	*****	paypal	\N	2016-10-27 14:01:07.153-07	2016-10-27 14:02:50.617-07	2016-10-27 14:02:50.616-07	2016-10-31 14:08:26.464-07	3	\N
1042	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:04:38.968-07	2016-10-31 14:08:26.416-07	2016-10-31 14:08:26.414-07	2016-10-31 14:12:53.305-07	3	\N
1106	*****@paypal.com	*****	*****	stripe	\N	2016-11-02 15:49:22.021-07	2016-11-02 15:49:23.61-07	\N	\N	2	\N
1111	*****@paypal.com	*****	*****	stripe	\N	2016-11-03 08:52:11.942-07	2016-11-03 08:52:12.638-07	\N	\N	8	\N
1114	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:32:01.482-07	2016-11-03 12:32:02.116-07	\N	2016-11-03 12:33:52.634-07	3	\N
1044	*****@paypal.com	*****	*****	paypal	\N	2016-10-31 14:33:13-07	2016-10-31 14:34:17.306-07	2016-10-31 14:34:17.306-07	2016-11-03 12:34:26.577-07	3	\N
1115	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:33:52.773-07	2016-11-03 12:34:26.403-07	2016-11-03 12:34:26.402-07	2016-11-03 12:41:28.484-07	3	\N
1116	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:35:14.952-07	2016-11-03 12:35:15.487-07	\N	2016-11-03 12:39:59.781-07	3	\N
288	*****@paypal.com	*****	*****	stripe	\N	2016-05-19 12:24:40.781-07	2016-05-19 12:24:41.33-07	\N	\N	392	\N
1179	*****@paypal.com	*****	*****	stripe	\N	2016-11-17 09:43:26.371-08	2016-11-17 09:43:27.368-08	\N	\N	1808	\N
1117	*****@paypal.com	*****	*****	paypal	\N	2016-11-03 12:39:59.972-07	2016-11-03 12:41:28.432-07	2016-11-03 12:41:28.432-07	2016-11-18 13:01:23.135-08	3	\N
1189	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:00:56.092-08	2016-11-18 13:01:23.091-08	2016-11-18 13:01:23.091-08	2016-11-18 13:02:50.88-08	3	\N
1190	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:02:28.687-08	2016-11-18 13:02:50.197-08	2016-11-18 13:02:50.193-08	2016-11-18 13:03:32.325-08	3	\N
1211	*****@paypal.com	*****	*****	stripe	\N	2016-11-22 07:22:36.125-08	2016-11-22 07:22:37.512-08	\N	\N	1846	\N
1249	*****@paypal.com	*****	*****	stripe	\N	2016-11-28 07:33:12.012-08	2016-11-28 07:33:12.766-08	\N	\N	1890	\N
1257	*****@paypal.com	*****	*****	stripe	\N	2016-11-29 02:03:21.517-08	2016-11-29 02:03:22.16-08	\N	\N	1908	\N
1262	*****@paypal.com	*****	*****	stripe	\N	2016-11-29 10:35:19.012-08	2016-11-29 10:35:20.055-08	\N	\N	2	\N
1296	*****@paypal.com	*****	*****	stripe	\N	2016-11-30 08:11:39.675-08	2016-11-30 08:11:40.34-08	\N	\N	1957	\N
1348	*****@paypal.com	*****	*****	stripe	\N	2016-12-02 11:17:05.459-08	2016-12-02 11:17:06.168-08	\N	\N	8	\N
1471	*****@paypal.com	*****	*****	stripe	\N	2016-12-18 17:41:26.69-08	2016-12-18 17:41:27.187-08	\N	\N	2220	\N
1472	*****@paypal.com	*****	*****	stripe	\N	2016-12-18 17:41:58.818-08	2016-12-18 17:41:59.328-08	\N	\N	2220	\N
1553	*****@paypal.com	*****	*****	stripe	\N	2017-01-03 12:59:34.532-08	2017-01-03 12:59:35.653-08	\N	\N	2416	\N
1191	*****@paypal.com	*****	*****	paypal	\N	2016-11-18 13:03:06.664-08	2016-11-18 13:03:32.285-08	2016-11-18 13:03:32.285-08	2016-12-20 08:50:13.592-08	3	\N
1616	*****@paypal.com	*****	*****	stripe	\N	2017-01-14 09:11:39.386-08	2017-01-14 09:11:39.965-08	\N	\N	2549	\N
1622	*****@paypal.com	*****	*****	stripe	\N	2017-01-16 10:03:53.804-08	2017-01-16 10:03:54.509-08	\N	\N	2561	\N
1645	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 05:51:43.462-08	2017-01-18 05:51:44.621-08	\N	\N	2594	\N
1646	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 05:53:28.297-08	2017-01-18 05:53:29.29-08	\N	\N	2594	\N
1647	*****@paypal.com	*****	*****	stripe	\N	2017-01-18 05:54:47.775-08	2017-01-18 05:54:48.732-08	\N	\N	2594	\N
1701	*****@paypal.com	*****	*****	stripe	\N	2017-01-24 05:28:17.965-08	2017-01-24 05:28:21.097-08	\N	\N	2	\N
1476	*****@paypal.com	*****	*****	paypal	\N	2016-12-20 08:45:05.334-08	2016-12-20 10:53:04.678-08	2016-12-20 10:53:04.677-08	2017-01-25 10:43:43.363-08	3	\N
1804	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 09:30:44.023-08	2017-02-01 09:30:45.232-08	\N	\N	2906	\N
1742	*****@paypal.com	*****	*****	stripe	\N	2017-01-28 15:51:03.682-08	2017-01-28 15:51:05.032-08	\N	\N	2	\N
1744	*****@paypal.com	*****	*****	stripe	\N	2017-01-28 16:05:21.392-08	2017-01-28 16:05:21.978-08	\N	\N	8	\N
1793	*****@paypal.com	*****	*****	stripe	\N	2017-01-31 07:51:34.575-08	2017-01-31 07:51:36.336-08	\N	\N	1325	\N
1801	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 07:16:17.747-08	2017-02-01 07:16:18.471-08	\N	\N	2898	\N
1811	*****@paypal.com	*****	*****	stripe	\N	2017-02-01 13:53:00.461-08	2017-02-01 13:53:01.901-08	\N	\N	30	\N
1890	*****@paypal.com	*****	*****	stripe	\N	2017-02-10 08:47:30.914-08	2017-02-10 08:47:31.716-08	\N	\N	3053	\N
1718	*****@paypal.com	*****	*****	paypal	\N	2017-01-25 10:42:33.289-08	2017-01-25 10:43:43.316-08	2017-01-25 10:43:43.315-08	2017-02-10 12:19:25.564-08	3	\N
1893	*****@paypal.com	*****	*****	paypal	\N	2017-02-10 12:18:58.618-08	2017-03-14 10:47:25.438-07	2017-03-14 10:47:25.433-07	2017-03-14 10:48:00.117-07	3	\N
2030	*****@paypal.com	*****	*****	stripe	\N	2017-02-27 16:25:15.595-08	2017-02-27 16:25:16.385-08	\N	\N	3301	\N
2091	*****@paypal.com	*****	*****	stripe	\N	2017-03-07 13:36:22.758-08	2017-03-07 13:36:23.955-08	\N	\N	8	\N
1986	*****@paypal.com	*****	*****	stripe	\N	2017-02-22 10:25:00.347-08	2017-02-22 10:25:00.347-08	\N	\N	2	\N
2048	*****@paypal.com	*****	*****	stripe	\N	2017-03-01 14:51:16.983-08	2017-03-01 14:51:18.471-08	\N	\N	1263	\N
2071	*****@paypal.com	*****	*****	stripe	\N	2017-03-04 08:55:18.286-08	2017-03-04 08:55:19.53-08	\N	\N	2	\N
2074	*****@paypal.com	*****	*****	stripe	\N	2017-03-04 21:40:45.496-08	2017-03-04 21:40:48.337-08	\N	\N	2	\N
2104	*****@paypal.com	*****	*****	stripe	\N	2017-03-09 10:29:52.21-08	2017-03-09 10:29:53.195-08	\N	\N	3442	\N
2246	*****@paypal.com	*****	*****	stripe	\N	2017-03-25 07:33:48.263-07	2017-03-25 07:33:51.315-07	\N	\N	2	\N
2149	*****@paypal.com	*****	*****	paypal	\N	2017-03-14 10:47:32.51-07	2017-03-17 08:34:02.314-07	2017-03-17 08:34:02.314-07	2017-03-17 08:34:41.542-07	3	2018-03-14 10:47:32.043-07
2208	*****@paypal.com	*****	*****	stripe	\N	2017-03-21 20:28:09.493-07	2017-03-21 20:28:11.234-07	\N	\N	2	\N
2218	*****@paypal.com	*****	*****	paypal	\N	2017-03-22 13:58:36.077-07	2017-03-27 09:00:11.768-07	2017-03-27 09:00:11.767-07	2017-03-27 09:01:06.921-07	3	2018-03-22 13:58:35.533-07
2247	*****@paypal.com	*****	*****	stripe	\N	2017-03-25 08:36:50.843-07	2017-03-25 08:36:53.712-07	\N	\N	2	\N
2180	*****@paypal.com	*****	*****	paypal	\N	2017-03-17 08:34:13.62-07	2017-03-22 13:58:30.022-07	2017-03-22 13:58:30.021-07	2017-03-22 13:59:49.26-07	3	2018-03-17 08:34:13.106-07
2438	*****@paypal.com	*****	*****	stripe	\N	2017-04-04 12:51:02.77-07	2017-04-04 12:51:03.349-07	\N	\N	3999	\N
2264	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 08:58:40.001-07	2017-03-27 08:58:40.001-07	\N	2017-03-27 09:01:06.923-07	3	2018-03-27 08:58:39.313-07
2265	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 09:00:15.115-07	2017-03-27 10:46:18.273-07	2017-03-27 10:46:18.272-07	2017-03-27 10:46:43.247-07	3	2018-03-27 09:00:14.596-07
2266	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 10:46:21.637-07	2017-03-27 10:54:36.2-07	2017-03-27 10:54:36.199-07	2017-03-27 10:55:03.518-07	3	2018-03-27 10:46:21.041-07
2267	*****@paypal.com	*****	*****	paypal	\N	2017-03-27 10:54:38.499-07	2017-03-31 10:54:59.737-07	2017-03-31 10:54:59.736-07	2017-03-31 10:57:17.587-07	3	2018-03-27 10:54:37.975-07
2318	*****@paypal.com	*****	*****	paypal	\N	2017-03-31 10:55:08.767-07	2017-03-31 15:33:10.929-07	2017-03-31 15:33:10.928-07	2017-03-31 15:33:37.928-07	3	2018-03-31 10:55:08.252-07
2601	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:15:58.306-07	2017-04-17 14:15:58.306-07	\N	2017-04-17 14:17:31.155-07	3	2018-04-17 14:15:57.816-07
2535	*****@paypal.com	*****	*****	stripe	\N	2017-04-10 18:09:47.541-07	2017-04-10 18:09:48.354-07	\N	\N	4153	\N
2560	*****@paypal.com	*****	*****	paypal	\N	2017-04-13 13:50:41.094-07	2017-04-13 13:57:22.555-07	2017-04-13 13:57:22.534-07	2017-04-17 12:34:05.25-07	3	2018-04-13 13:50:40.609-07
2546	*****@paypal.com	*****	*****	stripe	\N	2017-04-11 19:05:32.807-07	2017-04-11 19:05:33.502-07	\N	\N	4173	\N
2561	*****@paypal.com	*****	*****	paypal	\N	2017-04-13 13:52:22.989-07	2017-04-13 13:52:22.989-07	\N	2017-04-13 13:57:22.804-07	3	2018-04-13 13:52:22.424-07
2642	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 02:34:08.282-07	2017-04-20 02:34:09.518-07	\N	\N	4348	\N
2643	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 03:17:20.159-07	2017-04-20 03:17:21.398-07	\N	\N	4348	\N
2321	*****@paypal.com	*****	*****	paypal	\N	2017-03-31 15:33:13.922-07	2017-03-31 15:33:37.801-07	2017-03-31 15:33:37.801-07	2017-04-13 13:57:22.795-07	3	2018-03-31 15:33:13.429-07
2589	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 07:29:51.502-07	2017-04-17 07:29:51.502-07	\N	2017-04-17 12:34:05.252-07	3	2018-04-17 07:29:50.969-07
2592	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:32:22.818-07	2017-04-17 12:32:22.818-07	\N	2017-04-17 12:34:05.253-07	3	2018-04-17 12:32:22.311-07
2593	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:32:25.362-07	2017-04-17 12:32:25.362-07	\N	2017-04-17 12:34:05.254-07	3	2018-04-17 12:32:24.902-07
2595	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:33:26.483-07	2017-04-17 12:33:26.483-07	\N	2017-04-17 12:34:05.255-07	3	2018-04-17 12:33:26.015-07
2602	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:16:50.566-07	2017-04-17 14:17:30.886-07	2017-04-17 14:17:30.886-07	\N	3	2018-04-17 14:16:49.999-07
2596	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:03:48.29-07	2017-04-17 14:03:48.29-07	\N	2017-04-17 14:17:31.145-07	3	2018-04-17 14:03:47.645-07
2597	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:08:47.699-07	2017-04-17 14:08:47.699-07	\N	2017-04-17 14:17:31.148-07	3	2018-04-17 14:08:47.299-07
2599	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:14:29.551-07	2017-04-17 14:14:29.551-07	\N	2017-04-17 14:17:31.151-07	3	2018-04-17 14:14:29.12-07
2600	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 14:15:56.101-07	2017-04-17 14:15:56.101-07	\N	2017-04-17 14:17:31.153-07	3	2018-04-17 14:15:55.67-07
2594	*****@paypal.com	*****	*****	paypal	\N	2017-04-17 12:33:22.594-07	2017-04-17 14:16:44.162-07	2017-04-17 14:16:44.162-07	2017-04-17 14:17:31.156-07	3	2018-04-17 12:33:22.134-07
2659	*****@paypal.com	*****	*****	stripe	\N	2017-04-20 14:31:48-07	2017-04-20 14:31:49.294-07	\N	\N	8	\N
2749	*****@paypal.com	*****	*****	stripe	\N	2017-04-30 18:40:26.919-07	2017-04-30 18:40:28.231-07	\N	\N	3419	\N
2757	*****@paypal.com	*****	*****	stripe	\N	2017-05-01 10:13:32.205-07	2017-05-01 10:13:32.817-07	\N	\N	4550	\N
2846	*****@paypal.com	*****	*****	paypal	\N	2017-05-08 08:30:40.035-07	2017-05-08 08:30:40.035-07	\N	\N	3	2018-05-08 08:30:39.371-07
2847	*****@paypal.com	*****	*****	stripe	\N	2017-05-08 13:06:11.209-07	2017-05-08 13:06:11.921-07	\N	\N	8	\N
2855	*****@paypal.com	*****	*****	stripe	\N	2017-05-08 22:59:11.913-07	2017-05-08 22:59:13.104-07	\N	\N	4711	\N
2860	*****@paypal.com	*****	*****	stripe	\N	2017-05-09 11:14:19.686-07	2017-05-09 11:14:21.05-07	\N	\N	4720	\N
2888	*****@paypal.com	*****	*****	stripe	\N	2017-05-10 16:45:43.414-07	2017-05-10 16:45:44.785-07	\N	\N	4749	\N
2922	*****@paypal.com	*****	*****	stripe	\N	2017-05-15 05:07:56.825-07	2017-05-15 05:07:57.556-07	\N	\N	4834	\N
9	*****@paypal.com	*****	*****	paypal	\N	2015-11-23 10:13:00.576-08	2015-12-15 19:05:25.484-08	2015-11-30 09:00:17.828-08	2015-12-15 19:05:25.484-08	2	\N
160	*****@paypal.com	*****	*****	stripe	\N	2016-04-01 08:09:24.215-07	2016-04-01 08:09:25.585-07	\N	\N	2	\N
11	*****@paypal.com	*****	*****	paypal	\N	2015-11-30 10:25:48.501-08	2015-12-03 15:53:17.763-08	\N	2015-12-03 15:53:17.762-08	7	\N
12	*****@paypal.com	*****	*****	paypal	\N	2015-12-03 15:53:17.772-08	2015-12-03 15:54:56.087-08	2015-12-03 15:54:56.084-08	\N	7	\N
23	*****@paypal.com	*****	*****	paypal	\N	2015-12-16 10:22:06.064-08	2015-12-16 10:29:24.85-08	2015-12-16 10:22:39.681-08	2015-12-16 10:29:24.848-08	2	\N
153	*****@paypal.com	*****	*****	paypal	\N	2016-03-25 21:12:54.185-07	2016-03-25 21:12:54.98-07	\N	\N	2	\N
93	*****@paypal.com	*****	*****	stripe	\N	2016-03-01 20:41:57.377-08	2016-03-01 20:41:57.377-08	\N	\N	126	\N
159	*****@paypal.com	*****	*****	stripe	\N	2016-04-01 07:33:31.759-07	2016-04-01 07:33:32.893-07	\N	\N	8	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    4094.dat                                                                                            0000600 0004000 0002000 00000000005 13124477142 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4096.dat                                                                                            0000600 0004000 0002000 00000007700 13124477142 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        00-stripemanaged-model.js
01-transaction-model.js
02-group-model.js
03-card-model.js
04-application-model.js
05-user-model.js
06-paykey-model.js
07-activity-model.js
08-usergroup-model.js
09-application-group-model.js
10-transaction-model-relations.js
11-activity-model-relation.js
12-card-model-relation.js
20151030150110-addpaypalfield.js
20151208112311-add_group_public_flag.js
20151209114845-add_email_to_stripe_managed_account.js
20151221110406-add_stripesubscriptionid_to_transaction.js
20151230143257-add-longdescription-logo-video-image-expensePolicy-to-Group-migration.js
20151230150937-rename-membership_type-to-membershipType-migration.js
20151230160803-add_group_slug.js
20160105163703-add_transaction_payment_method.js
20160108134935-merge-name-field-and-add-website-and-twitter-handle-migration.js
20160108145839-updating-longDescription-datatype-migration.js
20160109164217-addVAT-migration.js
20160111104412-switch-expensepolicy-to-be-larger-migration.js
20160112093010-reshape_stripe_managed_account.js
20160113172636-add_stripe_accountid_to_user.js
20160113172933-replace-usergroup-role.js
20160115105814-add-website-twitter-to-group.js
20160119121646-add-pending-subscription.js
20160121133658-subscriptions-migration.js
20160128142427-add_reset_token_to_user.js
20160211190935-add-group-tiers.js
20160216121153-add-interval-to-transaction.js
20160218164134-add-new-constraint-to-UserGroups.js
20160219151355-add-usergroup-id.js
201602242300-add-vendor.js
20160225133109-rename-subscriptions-to-notifications.js
20160226153046-subscription-remodel.js
20160226154559-transactions-subscription-reshape.js
20160309143800-notifications-webhook.js
20160311090652-connected-account-migration.js
20160311113816-transaction-paranoid-migration.js
20160321114955-transaction-data.js
20160322231916-rename-card-to-paymentmethod-migration.js
20160323121731-rename-CardId-to-PaymentsMethodId-in-Transactions-migration.js
20160323133617-add-donations-table-migration.js
20160323152724-add-fields-to-transactions-migration.js
20160402120725-add-fee-fields-to-transactions-migration.js
20160405133705-add-burnrate-and-mission-to-group.js
201604150000-add-backgroundImage.js
201604150000-add-referer-to-users.js
20160415194252-add-netAmountInGroupCurrency-to-Transactions-migration.js
20160416141204-add-hostCommissionPercent-migration.js
20160505173300-add-connected-account-group-id.js
20160511222234-group-settings-and-whyjoin.js
20160519162112-make-group.slug-unique-migration.js
20160520153932-remove-user.email-unique-constraint-migration.js
20160602124940-group-data.js
20160608001600-add-expenses-table.js
20160610103923-add-payoutmethod-to-expense-migration.js
20160616161932-group-tags-and-supercollective-field-migration.js
20160610161454-add-users-description-organization.js
20160613174610-temporal-migration.js
20160713221132-user-add-longDescription.js
20160716003148-users-add-mission.js
20160802180635-add-paymentmethod-to-donation.js
20160815115600-add-sessions-table.js
20160822191515-processedAt-in-Donation-migration.js
20160918000000-users-add-firstname.js
20161007172819-lastEditedBy-in-Groups-migration.js
20161007175650-add-grouphistories-migration.js
20161012000000-comments.js
20161117000000-users-add-billingAddress.js
20161204000000-add-index.js
20161205175944-increase-group-mission-length-migration.js
201701040000-group-isActive.js
20170116163901-create-Event-migration.js
20170116170650-create-Tier-migration.js
20170116190354-create-Response-migration.js
20170124210251-New-fields-Event-Tier-Response-migration.js
20170125005855-Add-Lat-Long-in-Event-migration.js
20170127211709-remove-unused-transaction-fields-migration.js
20170127223729-change-amounts-to-ints-migration.js
20170209212119-add-response-to-migration.js
20170220000000-transactions-add-uuid.js
20170228184811-add-fields-to-PaymentMethod-migration.js
201703150000-add-timezone-events.js
20170310165323-add-notes-to-donations-migration.js
201704100000-updateTiers.js
20170525000000-event-addIndex.js
201706030000-add-HostId.js
\.


                                                                4097.dat                                                                                            0000600 0004000 0002000 00000000005 13124477142 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4098.dat                                                                                            0000600 0004000 0002000 00000015005 13124477142 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-01-18 10:10:35.836-08	2017-05-23 11:24:33.319-07	\N
3	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-01-18 10:36:29.151-08	2017-05-23 11:24:33.319-07	\N
5	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-01-27 14:04:28.386-08	2017-05-23 11:24:33.319-07	\N
8	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-02-10 12:36:22.327-08	2017-05-23 11:24:33.32-07	\N
10	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-03-02 08:18:07.069-08	2017-05-23 11:24:33.321-07	\N
11	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-03-12 20:58:40.373-08	2017-05-23 11:24:33.321-07	\N
12	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-03-18 10:17:15.567-07	2017-05-23 11:24:33.322-07	\N
13	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-03-18 18:34:13.819-07	2017-05-23 11:24:33.322-07	\N
16	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-04-18 16:31:51.161-07	2017-05-23 11:24:33.322-07	\N
14	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-03-30 00:26:00.613-07	2017-05-23 11:24:33.322-07	\N
17	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-04-21 18:39:22.397-07	2017-05-23 11:24:33.323-07	\N
18	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-05-17 09:40:52.217-07	2017-05-23 11:24:33.323-07	\N
19	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-06-08 10:39:24.034-07	2017-05-23 11:24:33.323-07	\N
20	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-06-09 10:16:47.754-07	2017-05-23 11:24:33.323-07	\N
21	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-06-09 10:23:07.475-07	2017-05-23 11:24:33.324-07	\N
22	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-06-30 09:08:02.669-07	2017-05-23 11:24:33.324-07	\N
23	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-07-12 12:16:04.867-07	2017-05-23 11:24:33.324-07	\N
24	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-08-03 23:04:40.337-07	2017-05-23 11:24:33.324-07	\N
25	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-08-04 14:37:07.487-07	2017-05-23 11:24:33.324-07	\N
26	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-08-09 05:25:12.058-07	2017-05-23 11:24:33.324-07	\N
27	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-08-09 09:47:14.143-07	2017-05-23 11:24:33.324-07	\N
28	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-09-07 12:14:48.228-07	2017-05-23 11:24:33.324-07	\N
29	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-09-08 00:47:48.445-07	2017-05-23 11:24:33.325-07	\N
30	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-09-13 13:07:04.929-07	2017-05-23 11:24:33.325-07	\N
31	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-09-13 14:08:10.496-07	2017-05-23 11:24:33.325-07	\N
1	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-01-14 23:46:48.547-08	2017-05-23 11:24:33.319-07	\N
6	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-01-31 11:23:27.546-08	2017-05-23 11:24:33.32-07	\N
4	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-01-24 23:20:25.482-08	2017-05-23 11:24:33.319-07	\N
9	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-02-24 16:19:15.877-08	2017-05-23 11:24:33.321-07	\N
7	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-02-10 11:25:55.396-08	2017-05-23 11:24:33.32-07	\N
15	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-04-14 11:09:30.772-07	2017-05-23 11:24:33.322-07	\N
38	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2017-03-13 11:01:02.003-07	2017-05-23 11:24:33.327-07	\N
39	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2017-03-13 12:40:15.721-07	2017-05-23 11:24:33.327-07	\N
40	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2017-03-23 14:31:32.501-07	2017-05-23 11:24:33.327-07	\N
41	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2017-03-24 12:03:42.687-07	2017-05-23 11:24:33.327-07	\N
42	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2017-04-17 08:38:10.658-07	2017-05-23 11:24:33.327-07	\N
43	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2017-04-19 05:15:15.421-07	2017-05-23 11:24:33.327-07	\N
44	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2017-04-20 08:11:46.398-07	2017-05-23 11:24:33.327-07	\N
32	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-09-21 15:36:45.86-07	2017-05-23 11:24:33.325-07	\N
33	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-09-21 16:39:05.33-07	2017-05-23 11:24:33.326-07	\N
34	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-09-28 16:39:38.673-07	2017-05-23 11:24:33.326-07	\N
35	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2016-10-26 07:49:57.413-07	2017-05-23 11:24:33.326-07	\N
36	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2017-02-17 12:25:21.395-08	2017-05-23 11:24:33.327-07	\N
37	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2017-03-01 22:36:23.209-08	2017-05-23 11:24:33.327-07	\N
45	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2017-04-24 08:41:16.175-07	2017-05-23 11:24:33.327-07	\N
46	*****	*****	bearer	pk_test_5aBB887rPuzvWzbdRiSzV3QB	acct_15**************	read_write	2017-05-22 12:47:56.886-07	2017-05-23 11:24:33.327-07	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4100.dat                                                                                            0000600 0004000 0002000 00000004437 13124477142 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        6	100	USD	month	f	\N	*****	2016-02-02 08:36:36-08	2016-06-01 17:00:00-07	2016-02-29 17:07:14.394-08	2016-02-29 17:07:14.394-08	\N
7	100	USD	month	f	\N	*****	2016-02-02 09:04:54-08	2016-06-01 17:00:00-07	2016-02-29 17:07:14.807-08	2016-02-29 17:07:14.807-08	\N
3	100	USD	month	f	\N	*****	2016-02-02 09:09:20-08	2016-06-01 17:00:00-07	2016-02-29 17:07:13.303-08	2016-02-29 17:07:13.303-08	\N
8	100	USD	month	f	\N	*****	2016-02-02 13:46:43-08	2016-06-01 17:00:00-07	2016-02-29 17:07:15.151-08	2016-02-29 17:07:15.151-08	\N
2	100	USD	month	f	\N	*****	2016-02-02 15:09:04-08	2016-06-01 17:00:00-07	2016-02-29 17:07:12.938-08	2016-02-29 17:07:12.938-08	\N
16	100	MXN	month	f	\N	*****	2016-02-15 10:46:05-08	\N	2016-02-29 17:07:18.292-08	2016-02-29 17:07:18.292-08	\N
1	500	USD	month	f	\N	*****	\N	\N	2016-02-29 17:07:12.45-08	2016-02-29 17:07:12.45-08	\N
496	1000	USD	month	t	\N	*****	2016-09-09 20:42:55.758-07	\N	2016-09-09 20:42:49.141-07	2016-09-09 20:42:55.759-07	\N
33	100	USD	month	f	\N	*****	2016-03-01 20:42:15.671-08	2016-06-01 17:00:00-07	2016-03-01 20:41:59.934-08	2016-03-01 20:42:15.673-08	\N
4	500	MXN	month	f	\N	*****	2016-02-02 08:52:01-08	\N	2016-02-29 17:07:13.684-08	2016-02-29 17:07:13.684-08	\N
378	10000	USD	month	f	\N	*****	2016-08-03 10:47:24.609-07	2016-08-03 10:48:03.066-07	2016-08-03 10:47:17.197-07	2016-08-03 10:48:03.067-07	\N
2031	200	USD	month	t	\N	*****	2017-04-30 18:40:31.674-07	\N	2017-04-30 18:40:26.929-07	2017-04-30 18:40:31.674-07	\N
224	100	USD	month	t	\N	*****	2016-06-09 10:28:30.06-07	\N	2016-06-09 10:28:13.943-07	2016-06-09 10:28:30.069-07	\N
1366	2500	USD	month	t	\N	*****	2017-02-01 09:30:50.219-08	\N	2017-02-01 09:30:44.034-08	2017-02-01 09:30:50.219-08	\N
2039	500	USD	month	t	\N	*****	2017-05-01 10:13:36.243-07	\N	2017-05-01 10:13:32.216-07	2017-05-01 10:13:36.243-07	\N
286	1000	USD	month	t	\N	*****	2016-07-01 15:38:36.9-07	\N	2016-07-01 15:31:45.99-07	2016-07-01 15:38:36.9-07	\N
530	0	USD	month	f	\N	*****	2016-09-20 13:59:00.661-07	2017-01-16 07:00:35.909-08	2016-09-20 13:58:49.798-07	2017-01-16 07:00:35.909-08	\N
2103	1000	USD	month	t	\N	*****	2017-05-08 22:59:17.481-07	\N	2017-05-08 22:59:11.936-07	2017-05-08 22:59:17.482-07	\N
1238	1000	USD	month	f	\N	*****	2017-01-14 09:12:00.516-08	2017-02-22 15:10:02.422-08	2017-01-14 09:11:39.397-08	2017-02-22 15:10:02.422-08	\N
\.


                                                                                                                                                                                                                                 4103.dat                                                                                            0000600 0004000 0002000 00000000005 13124477142 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4105.dat                                                                                            0000600 0004000 0002000 00000417570 13124477142 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2840	EXPENSE	Cash for Prizes/Bartender (the extra money, $50, was not used for the hackathon)	-70000	USD	2016-11-01 08:16:29.544-07	2016-11-01 08:16:30.012-07	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	\N	be4916cc-ebfc-4a00-8c1f-6fdec9dad74c	3
2396	EXPENSE	Conference stipend Elizabeth M.	-75000	USD	2016-10-11 09:01:27.317-07	2016-10-11 09:01:28.351-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	6b335f4d-a920-4cfc-90a9-6dfe40dfef58	3
229	EXPENSE	Mar 3 hack night	-4951	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4951	55	3e4baefa-db35-450e-9660-bc4dca4d53fc	3
98	EXPENSE	Libretas Hackathon	-1038000	MXN	2016-02-16 10:56:17.216-08	2016-06-14 11:14:21.738-07	10	7	\N	2016-06-14 11:14:22.435-07	\N	\N	\N	\N	\N	\N	\N	\N	-1038000	33	18ee4a98-66b6-47d6-85a0-0d4ead04f2d7	3
461	EXPENSE	WWC Stickers	-7000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.998-07	15	68	\N	2016-06-14 11:14:22.481-07	\N	\N	\N	\N	\N	\N	\N	\N	-7000	138	61723292-7257-4ab6-94d3-d267da41382b	3
1170	EXPENSE	Global Development	-150	USD	2016-07-08 20:52:40.722-07	2016-07-08 20:52:40.722-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	93	88b9402f-6888-45e1-b572-0f7b29199c39	3
638	EXPENSE	May 5 South Hack Night	-5325	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5325	181	f3cdf43c-6016-4d3f-812c-eedaec5a2fb3	3
670	EXPENSE	FedEx Office	-3418	USD	2016-01-24 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3418	195	2b7ba22c-916e-45dc-842c-8f7137976c4f	3
867	EXPENSE	Global Development	-5000	USD	2016-02-21 16:00:00-08	2016-06-14 11:14:22.186-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5000	227	6b865d7e-c324-4c7a-85cd-1ba0aefb8303	3
1629	EXPENSE	Thank you materials for several events.	-6198	USD	2016-08-19 10:31:26.428-07	2016-08-19 10:31:26.891-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6198	\N	0b7f4317-3b95-47d5-89f9-245314e16769	3
1407	EXPENSE	Leadership team dinner - Sondry interview	-11757	USD	2016-08-02 06:44:04.201-07	2016-08-02 06:44:04.214-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11757	307	ba0bff8a-9a64-499e-8d6d-99cb47c0787b	3
1581	EXPENSE	Minimum fee - June	-1000	USD	2016-08-16 07:53:58.922-07	2016-08-16 07:53:58.936-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	92e56306-3684-425f-b356-b67d306a0ae2	3
1586	EXPENSE	Minimum Fee - June	-1000	USD	2016-08-16 07:55:45.164-07	2016-08-16 07:55:45.179-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	2ed495af-5080-42ac-b381-905d29be571e	3
1584	EXPENSE	Minimum Fee - June	-995	USD	2016-08-16 07:55:14.822-07	2016-08-16 07:55:14.844-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-995	\N	e344373f-1e6d-416d-be2b-9ac1ce4866f4	3
1585	EXPENSE	Minimum Fee - May	-1000	USD	2016-08-16 07:55:31.274-07	2016-08-16 07:55:31.288-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	17d4be5b-521f-499f-8753-2dbc163f2ec4	3
1587	EXPENSE	STEM Toys for Coding with Kids Event	-8496	USD	2016-08-16 07:58:01.764-07	2016-08-16 07:58:01.789-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8496	294	bd8d9663-a174-448f-94f5-5e6707eb538d	3
1588	EXPENSE	STEM Toys for Coding with Kids Event	-10212	USD	2016-08-16 07:58:32.03-07	2016-08-16 07:58:32.041-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10212	293	40c6d6e9-1a20-4f97-b460-2a318d202796	3
1628	EXPENSE	Marketing and communications materials for leadership team. 	-4264	USD	2016-08-19 10:25:04.062-07	2016-08-19 10:25:04.374-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4264	\N	fa3527b7-d566-447a-a671-3b80486e9c18	3
376	EXPENSE	Global Development	-250	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-250	96	ee258704-7659-4305-bd34-807117acf1d4	3
2238	EXPENSE	90/10 split: Turner matching donation	-500	USD	2016-10-04 09:06:02.036-07	2016-10-04 09:06:02.036-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	393	9fcd3132-9867-42dc-85ce-b7435cb35563	3
2239	EXPENSE	90/10 split: Beth Laing	-500	USD	2016-10-04 09:06:09.85-07	2016-10-04 09:06:09.85-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	391	63e96179-a81b-4fba-880f-bc5d5a9f9e51	3
2424	EXPENSE	Career development event w/ Mike Ross	-65000	USD	2016-10-11 17:42:04.584-07	2016-10-11 17:42:04.834-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-65000	\N	e4ad5f18-a923-47eb-a3e1-601e2ba3238f	3
10135	EXPENSE	Google I/O Travel Stipend	-100000	USD	2017-05-16 15:00:40.275-07	2017-05-16 15:00:40.275-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	-100000	1088	d1a78d7e-acb9-4d9b-b6fd-2928ebfe9236	3
2403	EXPENSE	Network Budget pre Open Collective	-11797	USD	2016-10-11 09:52:07.045-07	2016-10-11 09:52:07.303-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11797	\N	60fedebe-23fa-46fa-bf34-3b63869f1e51	3
2821	EXPENSE	Wine	-1647	USD	2016-10-31 14:15:06.269-07	2016-10-31 14:15:06.517-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1647	\N	a1c67931-46a2-4a0a-9012-60f032d6d69e	3
2822	EXPENSE	Sodas for ATXDivHack 	-3871	USD	2016-10-31 14:15:22.809-07	2016-10-31 14:15:22.98-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3871	\N	b31858ae-48a6-4dc9-a6e5-5c86bb6e6988	3
2824	EXPENSE	05-21-16 AI workshop	-30000	USD	2016-10-31 14:16:09.23-07	2016-10-31 14:16:09.38-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30000	186	1bcc20eb-8879-4cb4-834e-a2a7841a6419	3
2537	EXPENSE	Director t-shirt	-3186	USD	2016-10-17 13:58:31.776-07	2016-10-17 13:58:31.789-07	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3186	\N	07e896c6-1747-42c3-ac92-ea9abc902e44	3
3530	EXPENSE	Regional Leadership Director Training	-631	USD	2016-11-29 14:38:46.551-08	2016-11-29 14:38:46.748-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-631	\N	fb0cd838-a20f-4a38-ad81-e738867085b8	3
3829	EXPENSE	Leadership Tshirt Order	-2698	USD	2016-12-07 08:51:43.784-08	2016-12-07 08:51:44.214-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	\N	1e99a559-2e7a-4e3d-be43-7fa857afba90	3
2328	EXPENSE	Conference stipend Olivia F.	-39585	GBP	2016-10-07 06:35:08.613-07	2016-10-07 06:35:08.724-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-39585	\N	46f8b259-603b-459f-a2b6-c72ed0c247b7	3
3838	EXPENSE	Food for monthly hack night from Antonino Bertolo's Pizza & Wine Bar.	-4300	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4351	483	01ad80e1-007c-45b3-8b32-1583b3417b16	3
4377	EXPENSE	Meetup Fee	-6000	USD	2016-12-27 08:52:46.242-08	2016-12-27 08:52:46.242-08	274	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	640	edf1e7f7-4ad5-40bc-a2f2-e83febc89c03	3
2811	EXPENSE	May AI Workshop	-26800	USD	2016-10-31 14:10:54.112-07	2016-10-31 14:10:54.327-07	2	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-26800	452	db3e939f-96e8-4790-bba4-e8a8a33ac1b2	3
2812	EXPENSE	June South Hack Night	-20568	USD	2016-10-31 14:11:20.573-07	2016-10-31 14:11:20.753-07	2	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20568	451	540d3476-03f3-4c01-9191-0b4593c34fd4	3
9747	EXPENSE	Google i/o travel stipend for Yelyzaveta (plus $12 transfer fees)	-101200	USD	2017-05-04 12:06:09.002-07	2017-05-04 12:06:09.002-07	430	3	\N	\N	\N	\N	\N	\N	0	USD	1	-101200	-101200	1099	796b8ada-4bee-4687-a76e-d3f79e5030cb	3
7114	EXPENSE	Plaques for IWD awards ceremony​ 	-54783	USD	2017-03-15 06:57:14.454-07	2017-03-15 06:57:14.471-07	12	69	2149	\N	\N	\N	\N	\N	1619	USD	1	-54783	-56402	888	a2ba1105-8ddd-44fc-ba97-591d7dfc1356	3
329	EXPENSE	Meetup Donation Transaction Fee	-163	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-163	81	6fb44ff1-4646-411e-ac08-543d20851f57	3
369	EXPENSE	Stacey Schipper Reimbursement	-2322	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.873-07	15	3	\N	2016-06-14 11:14:22.471-07	\N	\N	\N	\N	\N	\N	\N	\N	-2322	92	570c1e94-beca-4a11-b728-e574dfead3e1	3
569	EXPENSE	Conference Grant	-50000	MXN	2016-05-16 07:49:37.27-07	2016-06-14 11:14:22.052-07	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	164	0076bcbc-8e3e-4830-87c4-d396f2cdf087	3
668	EXPENSE	Leadership Tools (director tees)	-2698	USD	2015-12-14 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	192	f90b7ceb-7395-4eb6-b70e-aa3b53a18421	3
865	EXPENSE	Reimburse Caterina Paun for supplies and mailing expenses	-5504	USD	2015-12-14 16:00:00-08	2016-06-14 11:14:22.175-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5504	225	391f2946-af6d-4dad-9a31-43496d058bb4	3
1954	EXPENSE	Event food	-2911	USD	2016-09-15 17:09:43.149-07	2016-09-15 17:09:43.531-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2911	345	86b66e81-a6ce-436d-9ea0-161fa976ce9d	3
1402	EXPENSE	Monthly core team lunch with Sandra Saranya Sara CiCi Tori (5 members) ; on boarding new core member Tori!	-10294	USD	2016-08-02 06:38:05.215-07	2016-08-02 06:38:05.831-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10294	255	3a3bfae0-f068-407d-a9ab-031441913c3a	3
1577	EXPENSE	Food for Denver Meetup	-9939	USD	2016-08-16 07:52:04.669-07	2016-08-16 07:52:04.682-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9939	\N	eacc72ec-714e-4065-adde-f3d1cf5e4c95	3
1575	EXPENSE	Minimum Fee - June	-995	USD	2016-08-16 07:51:24.796-07	2016-08-16 07:51:24.811-07	12	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-995	\N	fc97ec24-7b82-4bd3-9b1a-fa6467d7a0b3	3
1578	EXPENSE	Pizza for July monthly event.	-12555	USD	2016-08-16 07:52:47.781-07	2016-08-16 07:52:47.799-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12555	\N	826070d5-3387-42cf-a309-b25b59fd86b1	3
1579	EXPENSE	Minimum fee - May	-990	USD	2016-08-16 07:53:06.001-07	2016-08-16 07:53:06.015-07	13	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-990	\N	934eda05-b122-4c9e-8b1a-097bfb4018d7	3
1631	EXPENSE	Coding books for our study groups (Humble Bundle -- Joy of Coding)	-1500	USD	2016-08-19 13:58:54.527-07	2016-08-19 13:58:54.67-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1500	318	0b0b7cb8-20eb-4ed8-b5eb-d5db91b35e38	3
331	EXPENSE	Global Development	-10000	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	80	4bb6798b-e4d6-46aa-a5c3-2d0644c040c9	3
1921	EXPENSE	Event food	-3224	USD	2016-09-13 07:57:04.698-07	2016-09-13 07:57:05.111-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3224	346	5c624478-95c6-4d37-94e1-3d7ffe3895bd	3
2110	EXPENSE	Two VR headsets for our AR/VR event at Best Buy.	-4898	USD	2016-09-27 12:31:43.164-07	2016-09-27 12:31:43.42-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4898	366	20ddc19e-87b3-4e08-9648-4ae868f40fe9	3
2111	EXPENSE	My coworker donated his evening to giving demos of his personal Oculus Rift for our AR/VR event, so I sent him a gift card to thank him for his help with the event.	-2500	USD	2016-09-27 12:33:54.08-07	2016-09-27 12:33:54.272-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2500	367	4593d1b5-cc34-42f2-9f9a-00a5e0bb8366	3
2261	EXPENSE	Beverage for Denver June meetup	-2279	USD	2016-10-04 15:09:25.159-07	2016-10-04 15:09:26.045-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2279	\N	392b3edc-b418-4e67-81a4-4a3310f969c7	3
2232	EXPENSE	90/10 split: AT&T Sponsorship (April 2015)	-100000	USD	2016-10-04 08:44:28.558-07	2016-10-04 08:44:28.558-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	389	254566c7-f97b-43d5-9910-c414520ad3bf	3
2233	EXPENSE	Google I/O: Alicia Carr	-10000	USD	2016-10-04 08:44:35.988-07	2016-10-04 08:44:35.988-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	387	7ae2b68c-c128-4dbd-a90e-a82fa24579bb	3
2285	EXPENSE	Event Food	-2077	USD	2016-10-05 09:43:28.448-07	2016-10-05 09:43:28.644-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2077	374	cdf1fd80-a036-4c27-8a92-17a09ae5c91b	3
2286	EXPENSE	Event supplies	-2715	USD	2016-10-05 09:44:00.394-07	2016-10-05 09:44:00.521-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2715	375	42291373-8c70-4ccc-b6c1-ec4c36403599	3
2287	EXPENSE	Event Food	-7167	USD	2016-10-05 09:44:47.862-07	2016-10-05 09:44:48.013-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7167	378	0591fc4f-0d49-4e83-ac11-6f4b4e5475ea	3
2288	EXPENSE	Marketing Materials	-2475	USD	2016-10-05 09:45:14.357-07	2016-10-05 09:45:14.485-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2475	376	a346ac76-b04b-4514-be71-84d9bf2c88ce	3
2297	EXPENSE	Stickers	-62984	USD	2016-10-06 08:49:20.942-07	2016-10-06 08:49:20.967-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-62984	\N	fbae4c36-1eef-4816-94f6-f9589f62ef9e	3
2326	EXPENSE	Conference stipend - Gen A.	-102409	GBP	2016-10-07 06:10:14.088-07	2016-10-07 06:10:14.841-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-102409	\N	55b95c98-c784-41c3-be4b-e0f81a9a75dc	3
3532	EXPENSE	Leadership Development - speaking event	-25000	USD	2016-11-29 14:39:25.11-08	2016-11-29 14:39:25.31-08	47	3	\N	2016-11-28 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	-25000	\N	988e7f82-d35f-4c4e-a037-f45bf5115c05	3
3802	EXPENSE	Snacks and dessert	-38874	USD	2016-12-06 09:02:53.61-08	2016-12-06 09:02:54.44-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-38874	\N	938601d7-a5d1-47a7-94b8-11b626ea9014	3
3536	EXPENSE	Banner	-2000	USD	2016-11-29 15:07:29.03-08	2016-11-29 15:07:29.148-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	c09714f1-2fc3-4fb8-a367-95d18db0ab21	3
2738	EXPENSE	Gift Card for Volunteer	-10000	USD	2016-10-27 14:03:46.196-07	2016-10-27 14:03:46.328-07	300	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10000	\N	9783d14c-2659-46ed-948a-7e672ce73c08	3
2763	EXPENSE	lunch ordered at Costco	-64978	USD	2016-10-28 14:30:59.537-07	2016-10-28 14:30:59.772-07	300	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-64978	418	19a3cace-58b7-4661-b4a1-076155bb69aa	3
2839	EXPENSE	Cash for Prizes/Bartender	-50000	USD	2016-11-01 08:15:55.737-07	2016-11-01 08:15:55.892-07	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	5f64b05e-f6fb-4b01-adfd-950c22e3a12e	3
2799	EXPENSE	Google DevFest event that WWC sponsored and attended. Two large banners. Table cloth. Plus my luggage since I went directly from airport. 	-1305	USD	2016-10-31 10:52:11.82-07	2016-10-31 10:52:12.734-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1305	427	70dd8d78-1052-4a85-ac86-eeaed28d2c15	3
2938	EXPENSE	dinner - downpament	-70000	USD	2016-11-03 12:36:06.461-07	2016-11-03 12:36:06.793-07	300	3	1115	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	\N	12330ad4-6281-4e16-afad-353af55d6e65	3
2946	EXPENSE	Conference Travel	-53720	USD	2016-11-03 14:27:22.46-07	2016-11-03 14:27:22.847-07	48	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-53720	333	978ddad8-6f16-4c1c-9d03-58133cf4f3f3	3
3234	EXPENSE	Food (ATXDivHack)	-119954	USD	2016-11-18 13:01:43.887-08	2016-11-18 13:01:44.336-08	2	3	1189	\N	\N	\N	\N	\N	\N	\N	\N	\N	-119954	466	6a6bfacf-cc60-4e92-a2dc-a0d97d985107	3
3515	EXPENSE	Mathews Group 	-60000	USD	2016-11-29 13:45:09.136-08	2016-11-29 13:45:09.136-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-60000	\N	c5efa3b7-8be0-4c0b-bbf0-d03f78aefba8	3
3284	EXPENSE	Food (ATXDivHack)	-339421	USD	2016-11-21 07:23:08.279-08	2016-11-21 07:23:08.279-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-339421	467	4a086d99-828a-4a85-8a6f-608d3bd7d765	3
3294	EXPENSE	DIANA A. SCHOLARSHIP GOOGLE I/O	-25000	USD	2016-11-21 14:59:43.764-08	2016-11-21 14:59:43.764-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-25000	396	0753f9e4-051f-4578-a13f-72dce3b8075d	3
3332	EXPENSE	Thank you cards, Christmas cards, stamps (for hackathon and all 2016 sponsors)	-4874	USD	2016-11-22 13:55:10.575-08	2016-11-22 13:55:10.713-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4874	498	f33703a8-5093-41fa-8cc7-0f246e735325	3
253	EXPENSE	WwConnect Conference	-658	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-658	63	c4d44147-f630-42db-b84f-a28881d5dd21	3
3587	EXPENSE	Postage to send hackathon gifts to sponsors	-1628	USD	2016-11-30 08:09:00.364-08	2016-11-30 08:09:00.529-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1628	\N	f36b82ec-cc72-4b8e-939b-73ea09a61f92	3
3588	EXPENSE	Frames for sponsor gifts	-4054	USD	2016-11-30 08:11:18.637-08	2016-11-30 08:11:18.805-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4054	\N	892315b3-81bc-4bd8-891b-3b167173d2bc	3
3793	EXPENSE	We Code Hackathon 2016	-2374	USD	2016-12-06 08:50:34.842-08	2016-12-06 08:50:35.964-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2374	500	38b70e02-a7b4-40c6-952d-6af6478b8b15	3
3833	EXPENSE	Goodie Bags	-1058	USD	2016-12-07 12:49:55.814-08	2016-12-07 12:49:56.33-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1058	573	6493e4b7-0f63-4534-bf0b-f0ab17750c9e	3
3835	EXPENSE	Leadership Event in Sofia	-1019	EUR	2016-12-07 13:30:48.339-08	2016-12-07 13:30:48.523-08	301	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1019	470	84e835ea-fd72-47a5-8dd8-92a3cee7fe26	3
3836	EXPENSE	Food/Drinks for Leadership Team Meeting - Gen, Claire, Halima - Sept 2016	-6000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	278	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	506	9b7434d9-7779-47eb-b087-5ffd3e765704	3
4379	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 08:55:07.385-08	2016-12-27 08:55:07.385-08	275	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	641	ec06bfa7-3251-4878-aa74-24f43641fa64	3
4381	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 08:59:33.873-08	2016-12-27 08:59:33.873-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	642	b5e62766-527a-4a1a-92e7-0600510d8e57	3
3863	EXPENSE	European Leadership Development Workshop -- Transportation, Taxi	-4400	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	301	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4400	493	cc2b4a36-bd6e-45d8-a05b-36a6c5db6cde	3
3864	EXPENSE	European Leadership Development Workshop -- Transportation, Flight	-4700	EUR	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	301	1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4728	494	e546ea27-19b6-4d72-8b95-6669cc95a981	3
4383	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 09:03:23.101-08	2016-12-27 09:03:23.101-08	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	643	bf299265-3ef1-4480-b14a-3d20c988ef72	3
4385	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 09:27:09.602-08	2016-12-27 09:27:09.602-08	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	644	1113ed6f-035d-4558-a161-f41dbe01295f	3
3972	EXPENSE	3D Printer & Supplies	-30496	USD	2016-12-14 05:03:21.144-08	2016-12-14 05:03:21.949-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30496	591	9e429b4f-81f9-4ff9-bf62-9f292e3e9b1e	3
4137	EXPENSE	Robotics: Coding with Your Kids HackNight Supplies	-20397	USD	2016-12-19 08:20:39.625-08	2016-12-19 08:20:40.499-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20397	604	b7646d69-4189-45a4-8672-7c783ff2f2b7	3
4139	EXPENSE	Leadership - Planning for 2017 - Afternoon Coffee	-1175	USD	2016-12-19 10:42:59.021-08	2016-12-19 10:42:59.545-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1175	601	8d0fb08a-cd76-4efd-acb9-1f5b191f029c	3
4140	EXPENSE	Leadership - Planning for 2017 - Evening Coffee	-875	USD	2016-12-19 10:43:53.809-08	2016-12-19 10:43:54.334-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-875	603	f95b80fd-f1aa-4343-894f-09450d3990a7	3
4161	EXPENSE	Mugs for WWCode-SV	-46419	USD	2016-12-20 10:57:28.399-08	2016-12-20 10:57:28.525-08	300	3	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-46419	605	cecf6f0f-5fc0-40c8-8907-674372e1c419	3
4183	EXPENSE	45 webcam covers + shipping	-9685	USD	2016-12-21 07:39:46.852-08	2016-12-21 07:39:47.49-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9685	\N	d9cdec64-d87d-406a-bd84-c8a0b5a9bcb4	3
4230	EXPENSE	Website - Domain Name	-2200	USD	2016-12-22 14:19:51.088-08	2016-12-22 14:19:52.143-08	48	3	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2200	372	09bf7a91-7939-4a04-80b5-721c536454af	3
4271	EXPENSE	Meetup Fees	-4900	GBP	2016-12-23 10:04:05.755-08	2016-12-23 10:04:05.755-08	267	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	624	429a48b8-77bb-4b7b-9e74-d18e7878caf0	3
4442	EXPENSE	Meetup Fees	-6000	CAD	2016-12-28 08:30:16.279-08	2016-12-28 08:30:16.279-08	293	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	666	00be055b-1e12-4bd4-8e40-99bfd7602141	3
4444	EXPENSE	Meetup Fees	-6000	USD	2016-12-28 08:32:19.412-08	2016-12-28 08:32:19.412-08	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	667	f5ff4621-9e2e-40c3-9b96-849ab7c5f17b	3
5284	EXPENSE	Drinks (La Croix water) for Jan HackNight	-2093	USD	2017-01-25 10:41:33.613-08	2017-01-25 10:41:34.163-08	48	142	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2093	724	d365e630-ae76-45cb-b68c-cf1cf918566c	3
5285	EXPENSE	Amazon Echo Dot devices for HackNight and first book for our book club.	-22137	USD	2017-01-25 10:44:31.311-08	2017-01-25 10:44:33.251-08	48	142	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-22137	725	37f44afb-0604-4a3b-b8a4-62a32c582d49	3
211	EXPENSE	Order for stickers of our official WWC Boulder/Denver chapter logo	-7800	USD	2016-03-17 20:23:34.628-07	2016-06-14 11:14:21.77-07	15	68	\N	2016-06-14 11:14:22.448-07	\N	\N	\N	\N	\N	\N	\N	\N	-7800	48	33473cbd-5d6e-4231-a8f5-eb5453ae7eb1	3
249	EXPENSE	WwConnect planning meeting	-4656	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4656	59	a8e050d7-a0ba-4b7c-8dac-f15e091454e1	3
230	EXPENSE	Feb 1, Lightning Talks	-22568	USD	2016-03-20 11:06:09.887-07	2016-03-29 13:37:47.75-07	2	28	\N	2016-03-28 17:00:00-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1408a5bd-a893-4d39-8deb-eb1214cee9f5	3
228	EXPENSE	Feb 4 hack night	-10284	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.784-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10284	53	2e9e7313-b914-49f1-b17c-14d67569cbf0	3
251	EXPENSE	WwConnect Conference Set Up Day 1	-709	USD	2016-03-18 17:00:00-07	2016-06-14 11:14:21.805-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-709	61	ebea2a47-93be-4832-8bc9-85f559270863	3
232	EXPENSE	Mar 7 Lightning Talks	-15316	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	2	28	\N	2016-06-14 11:14:22.455-07	\N	\N	\N	\N	\N	\N	\N	\N	-15316	57	814475bd-7972-4cc2-a22e-fe3da33bf0bf	3
387	EXPENSE	Global Developement	-100	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	13	3	\N	2016-06-14 11:14:22.48-07	\N	\N	\N	\N	\N	\N	\N	\N	-100	97	a30c4579-0d08-49fa-b863-e379e17e4cc4	3
703	EXPENSE	CONFERENCE GRANT	-80000	USD	2016-05-31 10:47:01.276-07	2016-06-14 11:14:22.123-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-80000	198	b08560a4-b373-40d8-91ef-20b273f83d98	3
5275	EXPENSE	travel to NY for bell ringing at NYSE	-30000	USD	2017-01-25 10:20:51.642-08	2017-01-25 10:20:54.592-08	12	70	1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	-30000	743	db2e9b39-0096-457f-9db4-a5bb6814f55c	3
401	EXPENSE	CONNECT 2016	-2452	USD	2016-04-25 17:00:00-07	2016-06-14 11:14:21.896-07	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2452	99	9a5b52f2-5dcb-4760-8d33-ce2e4a2c24ef	3
305	EXPENSE	test 	-100	USD	2016-04-06 10:39:39.954-07	2016-04-06 10:46:25.532-07	14	3	\N	2016-04-06 10:46:25.531-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5161e6cf-8e5c-43e1-b626-da7e129d3fe6	3
2400	EXPENSE	Test	-1000	USD	2016-10-11 09:18:39.252-07	2016-10-11 09:18:39.252-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	413	8d592b72-b737-4fca-995c-a0cee11c26fe	3
571	EXPENSE	Connect Conference video footage review	-2948	USD	2016-05-16 17:31:54.682-07	2016-06-14 11:14:22.053-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2948	167	79e8eb4f-159b-4d98-8bae-afc1989a3e44	3
408	EXPENSE	Global Development	-100	USD	2016-04-26 20:56:08.086-07	2016-06-14 11:14:21.897-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100	101	bad5555b-64cf-4f72-85c7-124b7809ade5	3
350	EXPENSE	Global Development	-100	USD	2016-04-15 10:29:50.291-07	2016-06-14 11:14:21.861-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100	86	5d9c2c63-1706-434b-976f-38c44f019e58	3
99	EXPENSE	IVA Libretas Hackathon	-166080	MXN	2016-02-16 10:58:04.663-08	2016-06-14 11:14:21.738-07	10	7	\N	2016-06-14 11:14:22.436-07	\N	\N	\N	\N	\N	\N	\N	\N	-166080	34	3c8bacb7-d7c6-4ce3-a801-55ecdd103839	3
2266	EXPENSE	 Network budget balance pre Open Collective	-4356	USD	2016-10-04 15:37:57.159-07	2016-10-04 15:37:57.359-07	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4356	\N	657fb992-7d1d-43b7-be03-5f9d23ccb189	3
413	EXPENSE	Global Development	-150	USD	2016-04-27 09:21:00.228-07	2016-06-14 11:14:21.907-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	103	1a7a975b-c002-4d56-abfb-627346e0f303	3
370	EXPENSE	Global Development	-150	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	4	3	\N	2016-06-14 11:14:22.479-07	\N	\N	\N	\N	\N	\N	\N	\N	-150	93	df345561-08a9-4963-8863-c675b0fb1006	3
231	EXPENSE	Feb 1, Lightning Talks	-22568	USD	2016-03-20 11:06:09.887-07	2016-06-14 11:14:21.794-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-22568	56	dd78e12f-6874-43c4-aa5e-5b54aff99c4f	3
2417	EXPENSE	Network support - Regional Leadership (thanks VMWare)	-370000	USD	2016-10-11 12:51:28.361-07	2016-10-11 12:51:28.677-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-370000	\N	a8202103-9dc5-4f86-a2f1-1dbf770906a7	3
326	EXPENSE	Global Developement	-150	USD	2016-04-12 11:46:49.263-07	2016-06-14 11:14:21.849-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	79	c284e464-38a5-4f87-9f50-a1c589f7dc1b	3
335	EXPENSE	Global Development	-150	USD	2016-04-12 11:52:16.188-07	2016-04-12 14:19:43.124-07	4	3	\N	2016-04-12 14:19:43.124-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f5dffc9c-009d-4d80-9983-23b2bc1c0815	3
252	EXPENSE	Nike Dinner	-1000	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.805-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	62	6ee48c71-0f0b-4cd8-b3c1-ad7860c9cdf5	3
273	EXPENSE	Connect 2016 event setup day dinner	-6800	USD	2016-03-17 17:00:00-07	2016-06-14 11:14:21.838-07	14	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6800	72	97597693-ae20-489a-bc22-54b2b468147f	3
2815	EXPENSE	Markers, pens, sticky notes (ATXDivHack)	-2108	USD	2016-10-31 14:13:19.592-07	2016-10-31 14:13:19.745-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2108	448	812a47a9-0b51-4948-9963-c610c2bbea43	3
2818	EXPENSE	Gifts for Organizers	-2399	USD	2016-10-31 14:14:19.644-07	2016-10-31 14:14:19.81-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2399	\N	f495583c-df24-4617-8cc5-d12616a0c36e	3
2819	EXPENSE	Gift for organizer	-3499	USD	2016-10-31 14:14:38.997-07	2016-10-31 14:14:39.22-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3499	\N	865b1387-7552-4c8d-9d1c-34ebf653db44	3
2816	EXPENSE	Drinks for Happy Hour (ATXDivHack)	-5518	USD	2016-10-31 14:13:39.794-07	2016-10-31 14:13:40.146-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5518	447	635f6580-ccbc-4232-bf25-eded2b10fdd7	3
2817	EXPENSE	Almond milk for coffee (ATXDivHack)	-1192	USD	2016-10-31 14:13:53.591-07	2016-10-31 14:13:53.747-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1192	446	4d9e5244-f21b-43cd-a486-409f2b41487c	3
2820	EXPENSE	Painters tape for signs  	-1136	USD	2016-10-31 14:14:51.746-07	2016-10-31 14:14:51.945-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1136	445	e40c1dfc-1af6-4b4d-9f6a-ec62ee2b7f8d	3
1564	EXPENSE	Minimum Fee - May	-1000	MXN	2016-08-15 12:22:45.367-07	2016-08-15 12:22:45.38-07	10	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	31262fe9-ba55-442a-b76b-b2e456cad550	3
640	EXPENSE	May 2 Lightning Talks	-8979	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.092-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8979	184	761dc700-eac2-44ef-8aa7-a3dc7268e489	3
639	EXPENSE	April 4 Lightning Talks	-13315	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.091-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13315	183	8cd8612d-8c56-45a4-af58-054b1251d213	3
654	EXPENSE	Conference Grant	-15000	USD	2016-05-24 12:42:50.307-07	2016-06-14 11:14:22.103-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15000	188	712f3b65-3cfa-48ae-a939-483739ed9bd7	3
637	EXPENSE	April 7 South Hack Night	-5037	USD	2016-05-22 16:46:04.647-07	2016-06-14 11:14:22.083-07	2	28	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5037	180	c136a783-1ea9-48e1-aa36-325bc67a6c44	3
507	EXPENSE	Quarterly planning meeting	-14000	USD	2016-05-05 17:18:43.265-07	2016-06-14 11:14:22.011-07	14	32	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14000	147	fbf72440-5d58-4805-afb9-5d67606dfa8c	3
660	EXPENSE	Conference Grant - Sarah Olson	-20000	USD	2016-05-25 09:39:09.882-07	2016-06-14 11:14:22.103-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	190	668072a8-b0b2-4538-8842-6ffb18f74196	3
669	EXPENSE	Photographer: Mike Ross	-65000	USD	2016-01-05 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-65000	193	7bd8653b-9f4c-4f09-8ec0-99a8a1cdd2c4	3
821	EXPENSE	6/2/16 Fireside Chat at Orange Coworking	-20000	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.145-07	2	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-20000	211	ba544502-40c0-46d0-83d2-419108dfee18	3
2257	EXPENSE	Net budget balance pre-Open Collective	-56266	USD	2016-10-04 14:57:44.218-07	2016-10-04 14:57:44.218-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-56266	394	0d80aa7c-4679-499a-abbb-bf69232f55f0	3
2258	EXPENSE	90/10 split: Hackathon donation	-32000	USD	2016-10-04 15:05:22.85-07	2016-10-04 15:05:22.85-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-32000	395	0425a551-a9c9-4428-813a-aa4b4a139a49	3
2259	EXPENSE	Drinks at Sept monthly event	-2192	USD	2016-10-04 15:06:33.802-07	2016-10-04 15:06:34.357-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2192	\N	7bc0fd8c-3371-4ffc-ab48-dc1d1478f023	3
2304	EXPENSE	Conference stipend Udisha S.	-75000	USD	2016-10-06 10:21:09.865-07	2016-10-06 10:21:09.933-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	a07591fb-4e19-4cf3-8f08-da3c9ccff93b	3
10132	EXPENSE	Snacks and batteries for our robots	-1554	USD	2017-05-16 15:00:04.449-07	2017-05-16 15:00:04.449-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-1554	-1554	1084	51159051-f7cc-4e7d-b285-4d94027c3ab4	3
10134	EXPENSE	Business cards and stickers	-11948	USD	2017-05-16 15:00:30.412-07	2017-05-16 15:00:30.412-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-11948	-11948	1007	3747993e-5291-4be4-be3f-043e95561284	3
10133	EXPENSE	Supplies for decorating our robots	-9777	USD	2017-05-16 15:00:15.557-07	2017-05-16 15:00:15.557-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-9777	-9777	1085	00f439f0-30e3-49f5-bc30-40d828f34f7e	3
10125	EXPENSE	Farewell lunch for Clarissa + Welcome lunch for Pranoti 	-11500	USD	2017-05-16 14:55:26.725-07	2017-05-16 14:55:26.725-07	14	32	\N	\N	\N	\N	\N	\N	0	USD	1	-11500	-11500	1119	200f5721-452d-4ec0-bb90-0970b254c841	3
2380	EXPENSE	WWCode Portland Stickers	-31950	USD	2016-10-10 13:12:33.813-07	2016-10-10 13:12:33.813-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-31950	411	dab27bf8-4cd0-46ef-93fe-c99e9c4b74fe	3
2395	EXPENSE	Google I/O stipend	-50000	USD	2016-10-11 09:00:21.246-07	2016-10-11 09:00:22.203-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	8916c363-dc64-40c0-9b37-596a418b9c45	3
2531	EXPENSE	WWCode Director t-shirt	-3649	USD	2016-10-17 13:50:53.853-07	2016-10-17 13:50:53.855-07	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	a66cf7d0-ac6e-42ce-ab24-b0f9f6f0c28e	3
2533	EXPENSE	Director t-shirt	-2860	USD	2016-10-17 13:56:00.744-07	2016-10-17 13:56:00.777-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2860	\N	5356537c-b269-45d7-ac4c-e54da8c0c6c3	3
2823	EXPENSE	Stickers for ATXDivHack 	-15300	USD	2016-10-31 14:15:38.727-07	2016-10-31 14:15:38.89-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-15300	\N	547db055-4599-4a8d-8828-96bb66aec39e	3
2535	EXPENSE	Director t-shirt	-2898	USD	2016-10-17 13:57:20.051-07	2016-10-17 13:57:20.056-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2898	\N	451a4c15-b647-4eab-82e9-640a825c808b	3
2529	EXPENSE	WWCode Director shirt	-3649	USD	2016-10-17 13:49:16.114-07	2016-10-17 13:49:16.113-07	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3649	\N	cf15a5bb-2cb3-41bd-8ece-7dbf2dbdda36	3
2339	EXPENSE	Network budget pre Open Collective	-230712	USD	2016-10-07 13:01:03.429-07	2016-10-07 13:01:03.535-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-230712	\N	fc099f38-490d-45b7-b117-fadb4863aa22	3
3828	EXPENSE	Supplies / Gift Bags	-4147	USD	2016-12-07 08:50:40.889-08	2016-12-07 08:50:41.383-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4147	\N	67b87648-5991-4d8b-9734-cd9b6a439a04	3
2808	EXPENSE	Monthly team meeting w core six members. Food/pizza	-3323	USD	2016-10-31 14:02:15.762-07	2016-10-31 14:02:16.402-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3323	400	18e79267-4423-4db3-9fde-a81a0f812e43	3
4375	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 08:50:06.414-08	2016-12-27 08:50:06.414-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	639	e25e6f3b-8f97-491c-80a9-88bab6d96c78	3
3801	EXPENSE	Office Supplies for Hackathon.	-10585	USD	2016-12-06 09:00:58.382-08	2016-12-06 09:00:58.806-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-10585	\N	f298dc78-f218-4213-b29c-2c9a130cb0c8	3
2739	EXPENSE	DJ (ATXDivHack)	-35000	USD	2016-10-27 14:08:48.506-07	2016-10-27 14:08:48.71-07	2	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-35000	453	4bfee0a6-77d3-4608-92bb-fb59f6d1f3f2	3
3946	EXPENSE	Installfest	-558	USD	2016-12-13 09:30:28.678-08	2016-12-13 09:30:30.347-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-558	\N	b2fc8ba1-8436-493a-a163-96064999c897	3
7070	EXPENSE	February Lightning Talks food	-10680	USD	2017-03-14 10:17:53.891-07	2017-03-14 10:17:53.957-07	2	28	1893	\N	\N	\N	\N	\N	340	USD	1	-10680	-11020	820	0b174ca7-35b7-4eb0-b540-345b64730630	3
7071	EXPENSE	Mar 7 Lightning Talks	-15316	USD	2017-03-14 10:21:29.296-07	2017-03-14 10:21:29.332-07	2	28	1893	\N	\N	\N	\N	\N	474	USD	1	-15316	-15790	57	f0262195-2244-40eb-b442-02995b885caa	3
7072	EXPENSE	meetup with speaker, Heather VanCura, in conjunction with DevNexus conference	-20950	USD	2017-03-14 10:22:10.666-07	2017-03-14 10:22:10.681-07	12	70	1893	\N	\N	\N	\N	\N	638	USD	1	-20950	-21588	899	bef0ae4e-365f-4158-a0e0-ee82ba3b21e6	3
7073	EXPENSE	IWD event -- wine for event	-9732	USD	2017-03-14 10:22:31.446-07	2017-03-14 10:22:31.46-07	12	70	1893	\N	\N	\N	\N	\N	312	USD	1	-9732	-10044	900	22a98043-eb9c-4d56-b246-f3529b741284	3
208	EXPENSE	Food for March Boulder, CO event	-14000	USD	2016-03-17 11:48:54.413-07	2016-06-14 11:14:21.77-07	15	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14000	46	614a8194-5d1d-483a-b0ac-231a1f17a036	3
2800	EXPENSE	WWCode Seattle planning lunch with Sara	-2700	USD	2016-10-31 10:52:44.962-07	2016-10-31 10:52:45.274-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2700	420	de0990ce-e767-47a3-8594-d6d7dc3f62c7	3
2802	EXPENSE	Pizza for our monthly October event	-9276	USD	2016-10-31 11:07:11.805-07	2016-10-31 11:07:12.736-07	15	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9276	\N	91ddc1e2-b108-4f6a-b156-e7b4f593af89	3
2801	EXPENSE	Monthly core team meeting. Beverages with dinner for six members 	-3080	USD	2016-10-31 10:59:53.602-07	2016-10-31 10:59:53.96-07	14	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3080	401	6071a2e5-9c4e-4724-98ef-faa4c9b34169	3
2805	EXPENSE	Food for JavaScript Study Night - Oct. 11th	-1446	USD	2016-10-31 11:19:11.822-07	2016-10-31 11:19:12.067-07	59	3	1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1446	419	e2c41034-2610-460e-814d-b143dc9280fe	3
2826	EXPENSE	Fedex - certificate print expense	-1962	USD	2016-10-31 14:32:07.365-07	2016-10-31 14:32:07.497-07	300	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1962	\N	3d40ddc4-003a-4559-bb76-0dd988cbb2ac	3
2813	EXPENSE	September Ruby Tuesday	-6497	USD	2016-10-31 14:11:36.488-07	2016-10-31 14:11:36.731-07	2	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6497	450	82a4bfeb-95ef-4a2a-9d9d-5ca157938b53	3
2814	EXPENSE	Drinks and snacks (ATXDivHack)	-75932	USD	2016-10-31 14:13:05.943-07	2016-10-31 14:13:06.106-07	2	3	1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75932	449	2e748309-ca69-4812-83e1-506c5649d783	3
498	EXPENSE	Conference Grant	-50000	USD	2016-05-04 14:14:39.136-07	2016-06-14 11:14:22.01-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	145	61219d5b-692d-4cba-9583-f8a7b033b990	3
3516	EXPENSE	Matthews Group - Leadership Development for Seattle team	-60000	USD	2016-11-29 13:46:31.384-08	2016-11-29 13:46:31.384-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-60000	464	fd0c2bc8-e692-4989-a626-db0df4d74291	3
3517	EXPENSE	Lodging and meals for our WWC Seattle 7 team members leadership development retreat. Under approved budget!	-227646	USD	2016-11-29 13:46:42.259-08	2016-11-29 13:46:42.259-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-227646	474	41da1426-3c94-4dfc-9beb-712e3ecf65d5	3
3526	EXPENSE	Banner	-2000	USD	2016-11-29 14:34:04.252-08	2016-11-29 14:34:04.435-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	f2092196-e65f-4d9c-9981-37518272c36e	3
3545	EXPENSE	Network budget pre open collective	-55923	USD	2016-11-29 16:18:08.154-08	2016-11-29 16:18:07.832-08	285	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-55923	\N	69d0ee19-1d91-42fe-8afa-7f974771bd04	3
3625	EXPENSE	Conference Travel Stipend - Google I/O Elese	-75000	USD	2016-11-30 13:25:56.197-08	2016-11-30 13:25:56.423-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-75000	\N	8654d25a-1d31-4bb8-8a42-09794cf62430	3
3628	EXPENSE	Banner	-2000	USD	2016-11-30 13:33:38.691-08	2016-11-30 13:33:38.827-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	026b493f-edc5-4529-b348-1cdb4dfddc9a	3
2330	EXPENSE	Network Budget pre Open Collective	-77659	GBP	2016-10-07 07:03:00.623-07	2016-10-07 07:03:00.89-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-77659	\N	5f8dd4cc-75b1-4aa2-89a6-cb125c6597ef	3
4369	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 08:31:58.557-08	2016-12-27 08:31:58.557-08	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	636	7baa1f62-c9bc-4df0-9a12-18a4dda6c0ce	3
3794	EXPENSE	Marketing for IoT Hackathon	-1082	USD	2016-12-06 08:50:56.549-08	2016-12-06 08:50:57.046-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1082	502	e923e566-7e1f-4e3d-aa4d-3b2926add382	3
3795	EXPENSE	Supplies	-3918	USD	2016-12-06 08:51:20.162-08	2016-12-06 08:51:20.661-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3918	508	e74be4f9-1c06-4a7a-ae85-656ef5ecf2e9	3
3796	EXPENSE	T-shirt order - Design Lead	-2698	USD	2016-12-06 08:51:54.984-08	2016-12-06 08:51:55.379-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2698	509	c884d630-10d6-4279-b84b-7383937f1478	3
3798	EXPENSE	WWCode Seattle network retreat	-6207	USD	2016-12-06 08:57:26.568-08	2016-12-06 08:57:26.935-08	14	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6207	\N	116ff80c-993e-4c5a-83d3-d24df17d5253	3
3799	EXPENSE	Hackathon - prizes for winners + goodies for thank you bags for sponsors/speakers/mentors/judges/volunteers	-7750	USD	2016-12-06 08:57:59.164-08	2016-12-06 08:57:59.708-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7750	\N	b09fb537-00cb-4928-9a19-5551090d370a	3
3800	EXPENSE	WWC T-shirt	-2798	USD	2016-12-06 08:59:36.33-08	2016-12-06 08:59:36.741-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2798	\N	4a126373-6cb3-4e7a-9a94-178466bcefb3	3
3839	EXPENSE	Food for October Hack Night.	-7700	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7773	484	a55eb032-a0ab-4534-bd7b-86126196aa48	3
3840	EXPENSE	October Hack Night Drinks/Food.	-1100	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1106	485	88d96482-a87c-418a-b53b-a3c895b3d4ae	3
3841	EXPENSE	Food/Drinks for Anniversary Reception with guest WWCode Directors!	-4400	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4444	486	534b6b59-e66e-4781-9a64-b546b15e08b6	3
3842	EXPENSE	Food for Anniversary Reception	-700	USD	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	273	1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-713	492	5ea9a1f3-af86-44ce-a16f-5c2b3fd2a5e3	3
3843	EXPENSE	Leadership Event in Sofia	-6444	EUR	2016-12-07 13:38:07.287-08	2016-12-07 13:38:07.429-08	301	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6444	471	4ca35a75-88d7-4546-b608-ce07199942fb	3
3950	EXPENSE	Decorations / Supplies	-1379	USD	2016-12-13 10:42:06.408-08	2016-12-13 10:42:07.17-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1379	\N	4a743da3-3e6f-482f-8ac3-dd26c8ed51ae	3
3951	EXPENSE	Event suplies	-2198	USD	2016-12-13 10:43:16.329-08	2016-12-13 10:43:17.27-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2198	\N	5228b4f5-f0ed-4a43-b5f8-4f2e8cfd7185	3
3952	EXPENSE	Speaker and sponsor meetings (11/18 + 11/28) and event logistics (12/2)	-2870	USD	2016-12-13 10:44:23.973-08	2016-12-13 10:44:24.945-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2870	\N	2a19b928-ba82-4a49-a329-5c79e51b48e3	3
4410	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 11:53:07.2-08	2016-12-27 11:53:07.2-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	657	74cde2f7-e7c6-4e97-8c13-0bbaefa37e71	3
4141	EXPENSE	Leadership - Planning for 2017 - Dinner	-9240	USD	2016-12-19 10:45:09.113-08	2016-12-19 10:45:09.64-08	48	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9240	602	03814f58-ecac-4145-b6bc-f448075970e0	3
8306	EXPENSE	Stickers	-14630	USD	2017-04-07 05:58:45.517-07	2017-04-07 05:58:45.531-07	516	3419	2321	\N	\N	\N	\N	\N	454	USD	1	-14630	-15084	889	fcf1e41b-dd9f-4534-ade5-5f6fa906d10e	3
4190	EXPENSE	Meetup Fees	-6000	USD	2016-12-21 10:53:46.984-08	2016-12-21 10:53:46.984-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	607	d6799057-59a0-4562-8b3e-c2e3e9adf29b	3
4191	EXPENSE	Meetup Fees	-6000	USD	2016-12-21 10:54:30.839-08	2016-12-21 10:54:30.839-08	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	608	53d83a5f-166b-455f-b73f-827fcdcc3a5d	3
4247	EXPENSE	Meetup Fees	-6000	USD	2016-12-23 08:37:59.322-08	2016-12-23 08:37:59.322-08	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	613	1f6591ab-8565-4278-a8ee-906fd65c5e69	3
4249	EXPENSE	Meetup Fees	-6000	USD	2016-12-23 08:49:17.444-08	2016-12-23 08:49:17.444-08	261	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	614	6efb3ac7-7d2a-4724-8a1a-ef64d45fe970	3
4251	EXPENSE	Meetup Fees	-6000	USD	2016-12-23 08:52:20.827-08	2016-12-23 08:52:20.827-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	615	85f323a7-d2f8-447c-8420-1ad74cdd8d67	3
4254	EXPENSE	Meetup Fees	-6000	USD	2016-12-23 08:56:04.579-08	2016-12-23 08:56:04.579-08	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	616	f6ab951c-bed5-4749-b0e5-db1a3a7a8ad6	3
7296	EXPENSE	To redeem travel stipend to Google I/O	-100000	USD	2017-03-20 08:39:23.328-07	2017-03-20 08:39:23.364-07	277	1332	2180	\N	\N	\N	\N	\N	4430	USD	1	-100000	-104430	924	1fdc2835-4858-4cd0-bada-76c19f0f9f0b	3
4281	EXPENSE	Meetup Fees	-6000	USD	2016-12-23 11:38:46.818-08	2016-12-23 11:38:46.818-08	268	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	626	d4bdb19b-d165-4c0a-b84d-6bc03f6ed962	3
4283	EXPENSE	Meetup Fees	-6000	USD	2016-12-23 11:41:48.315-08	2016-12-23 11:41:48.315-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	627	1008cc1e-b9d2-43f0-95c2-8ee9e464a929	3
4285	EXPENSE	Meetup Fees	-6000	USD	2016-12-23 11:50:08.539-08	2016-12-23 11:50:08.539-08	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	628	51faf49d-6a19-43ae-857d-bd10ba1f66e4	3
4398	EXPENSE	Meetup Fees	-5700	EUR	2016-12-27 10:11:51.873-08	2016-12-27 10:11:51.873-08	283	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	652	28af55a2-3111-4783-ba8d-35cf4d105776	3
4433	EXPENSE	Meetup Fees	-6000	USD	2016-12-28 07:58:50.078-08	2016-12-28 07:58:50.078-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	662	74036058-01c1-4f98-a83f-fc82f6510521	3
4436	EXPENSE	Meetup Fees	-6000	CAD	2016-12-28 08:21:52.469-08	2016-12-28 08:21:52.469-08	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	663	84be2b67-931d-405c-99a7-1724a5788a24	3
4438	EXPENSE	Meetup Fees	-6000	USD	2016-12-28 08:25:48.743-08	2016-12-28 08:25:48.743-08	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	664	571bafd6-9a7d-417d-be32-be27d3f4bee4	3
4440	EXPENSE	Meetup Fees	-6000	USD	2016-12-28 08:28:15.901-08	2016-12-28 08:28:15.901-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	665	6ad3295b-2aa8-4bfd-a39e-659ab99c98a1	3
4361	EXPENSE	Meetup Fees	-6000	MXN	2016-12-27 08:12:26.224-08	2016-12-27 08:12:26.224-08	299	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	632	1475d9f0-a70a-479b-a7a5-0f944217dd0c	3
4364	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 08:16:27.082-08	2016-12-27 08:16:27.082-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	633	f733707f-81b8-4b1a-8fb4-5d36f7398e4d	3
4366	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 08:23:35.936-08	2016-12-27 08:23:35.936-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	634	19aac764-7f1c-4545-964c-aa419cddcadf	3
4388	EXPENSE	Meetup Fees	-4900	GBP	2016-12-27 09:34:46.469-08	2016-12-27 09:34:46.469-08	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	647	63c1fa30-5905-47e2-9922-3e50406c41e5	3
4390	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 09:49:39.83-08	2016-12-27 09:49:39.83-08	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	648	d59f9559-52ea-4838-86ac-9a89171e4edb	3
4392	EXPENSE	Meetup Fees	-6000	AUD	2016-12-27 09:54:00.843-08	2016-12-27 09:54:00.843-08	281	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	649	4041ac58-5270-4993-8579-372862540f19	3
4394	EXPENSE	Meetup Fees	-6000	MXN	2016-12-27 09:57:54.314-08	2016-12-27 09:57:54.314-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	650	3d47c24e-fc5a-4254-80eb-cc221aae8a7e	3
4396	EXPENSE	Meetup Fees	-6000	MXN	2016-12-27 10:01:07.417-08	2016-12-27 10:01:07.417-08	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	651	c45178a3-9a29-4d14-b424-414faa770220	3
4401	EXPENSE	Meetup Fee	-6000	USD	2016-12-27 10:35:08.624-08	2016-12-27 10:35:08.624-08	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	653	21af77e9-057a-48e4-bc42-cf6de40a4d0b	3
4403	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 10:38:46.887-08	2016-12-27 10:38:46.887-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	654	46876e47-95e8-4b16-ad0e-63703c1710c6	3
4425	EXPENSE	Meetup Fees	-6000	USD	2016-12-28 07:44:44.222-08	2016-12-28 07:44:44.222-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	658	70f09e97-2754-4f16-9e9f-007e253cc35b	3
4427	EXPENSE	Meetup Fees	-6000	USD	2016-12-28 07:49:16.255-08	2016-12-28 07:49:16.255-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	659	52806f02-8b52-4053-97ad-eb7b0f5c2c2a	3
4429	EXPENSE	Meetup Fees	-6000	USD	2016-12-28 07:53:05.613-08	2016-12-28 07:53:05.613-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	660	90fccb78-97b2-4e6b-951d-b476f4a7148f	3
4431	EXPENSE	Meetup Fees	-6000	AUD	2016-12-28 07:56:28.934-08	2016-12-28 07:56:28.934-08	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	661	6b303a9b-a30c-4cd3-99ca-80c33b0b9197	3
8421	EXPENSE	Event supplies	-1527	USD	2017-04-11 12:13:28.544-07	2017-04-11 12:13:28.599-07	59	171	2321	\N	\N	\N	\N	\N	74	USD	1	-1527	-1601	1002	94f2347a-1fdc-472e-b084-606647265be1	3
8422	EXPENSE	Hackathon 2017 planning meeting	-2891	USD	2017-04-11 12:15:09.813-07	2017-04-11 12:15:09.826-07	59	171	2321	\N	\N	\N	\N	\N	114	USD	1	-2891	-3005	1001	3ba366f9-e99f-4629-95c3-35280b503ba9	3
5781	EXPENSE	Last minute (less than 7 day advance purchase) airline price purchase from SFO to JFK. Emailed Joey to alert of higher fare. 	-59040	USD	2017-02-07 10:32:48.784-08	2017-02-07 10:32:49.072-08	14	31	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-59040	776	52ec1ede-9280-4e75-b076-1d75225a9773	3
5785	EXPENSE	Event supplies for Leads	-2439	USD	2017-02-07 10:38:14.3-08	2017-02-07 10:38:15.58-08	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2439	737	f07b1e2f-1ddb-43ba-8873-49e911fa25d3	3
5786	EXPENSE	Printing WWCODE pamphlets for Camas STEM Fair for middle-school girls (organized by OHSU).	-4431	USD	2017-02-07 10:40:27.475-08	2017-02-07 10:40:27.96-08	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4431	736	2bbc0783-4b84-4636-a6aa-9b9336c1550e	3
5787	EXPENSE	Food for 2017 Planning Meeting w/ leadership team (Jan. 22)	-9050	USD	2017-02-07 10:40:49.494-08	2017-02-07 10:40:49.852-08	59	171	1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9050	790	e25d3885-580e-477b-ac27-6dfaa2ab8466	3
6199	EXPENSE	Domain name for hackathon and study night projects	-1798	USD	2017-02-20 12:53:02.864-08	2017-02-20 12:53:02.879-08	59	171	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1798	497	3aae7b32-dbf9-4383-94eb-9c339211043a	3
6270	EXPENSE	Travel to attend internal leads meeting to finalize plans for upcoming 2017 events	-6100	USD	2017-02-22 07:27:02.607-08	2017-02-22 07:27:02.62-08	14	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6100	774	534ed69b-fc23-4c7d-8acc-b1efd554f7b9	3
6271	EXPENSE	Lunch w Saranya during leads meeting. I lost the paper copy of the receipt so including the credit card statement 	-5458	USD	2017-02-22 07:27:45.429-08	2017-02-22 07:27:45.466-08	14	31	1893	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5458	775	3cbee278-6d55-4ec8-b437-04378120a652	3
7510	EXPENSE	payment to artists (spoken word) for performance at IWD event	-20000	USD	2017-03-27 05:47:25.654-07	2017-03-27 05:47:25.894-07	12	70	2218	\N	\N	\N	\N	\N	610	USD	1	-20000	-20610	907	ac007c6a-85a6-404e-9ed8-8c1cb9e9e7e5	3
7517	EXPENSE	Travel Stipend for Google I/O, now that I have secured my I/O Ticket via Google - see enclosed I/O Ticket Receipt)	-85000	GBP	2017-03-27 09:01:27.19-07	2017-03-27 09:01:27.295-07	278	1333	2265	\N	\N	\N	\N	\N	3760	GBP	1	-85000	-88760	926	a26b7d78-3ba3-487c-99ab-fea20d22a67e	3
7519	EXPENSE	Google I/O	-50000	USD	2017-03-27 10:11:39.25-07	2017-03-27 10:11:39.275-07	12	69	2265	\N	\N	\N	\N	\N	1480	USD	1	-50000	-51480	952	d319eebc-1e7a-4500-a519-705bdc9facf2	3
7520	EXPENSE	Google I/O ticket	-37500	USD	2017-03-27 10:12:00.118-07	2017-03-27 10:12:00.138-07	12	69	2265	\N	\N	\N	\N	\N	1118	USD	1	-37500	-38618	949	98f9ec9a-496c-44d1-b27d-35dc1359a639	3
300	EXPENSE	Reimburse Caterina for program materials	-3798	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.838-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3798	76	42cf26b1-f1f3-4a07-8725-0090dd713617	3
298	EXPENSE	Reimbursement to Kamila for coffee purchased for volunteers at CONNECT 2016	-11815	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.839-07	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11815	74	8b3bc1cf-1598-4af5-9511-2dea9fcb267a	3
414	EXPENSE	WePay Fee	-400	USD	2016-04-10 17:00:00-07	2016-06-14 11:14:21.907-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-400	104	87c00eef-d1a6-4f09-8e9c-b288d4bb1d87	3
676	EXPENSE	CONFERENCE GRANT	-34750	USD	2016-05-26 12:05:53.771-07	2016-06-14 11:14:22.123-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-34750	197	d88487be-3043-4198-810a-d989c2c30afb	3
7527	EXPENSE	To redeem travel stipend to Google I/O	-100000	USD	2017-03-27 10:54:16.729-07	2017-03-27 10:54:16.758-07	277	1331	2266	\N	\N	\N	\N	\N	4430	USD	1	-100000	-104430	935	8fcc5228-26e5-41ca-8db6-80fd5ffe1d51	3
615	EXPENSE	Conference Grant	-70000	USD	2016-05-19 12:07:13.723-07	2016-06-14 11:14:22.082-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-70000	178	074c5df4-902c-4af8-b06e-9a222d4899dc	3
8601	EXPENSE	Atlanta IWD Event	-235699	USD	2017-04-17 12:17:23.032-07	2017-04-17 12:17:23.032-07	12	3	\N	\N	\N	\N	\N	\N	0	USD	1	-235699	-235699	998	ed3b2ff8-e7bc-4ffd-a178-056c3ca7ec4c	3
8614	EXPENSE	WWCode CONNECT Conference Travel Stipend	-85000	GBP	2017-04-17 14:18:35.523-07	2017-04-17 14:18:35.581-07	278	1333	2602	\N	\N	\N	\N	\N	3760	GBP	1	-85000	-88760	1016	90b0bf3c-bd5e-4224-902c-8989cebcdf81	3
8616	EXPENSE	Network Development: Attend CapOne WIT 2017 Kickoff to announce partnership for re-launch	-100000	USD	2017-04-17 15:12:22.995-07	2017-04-17 15:12:22.995-07	270	3	\N	\N	\N	\N	\N	\N	0	USD	1	-100000	-100000	1027	4ec74672-5586-4acc-b9be-bddf2e0a464c	3
8618	EXPENSE	Travel Scholarship for WWCode Director	-40970	GBP	2017-04-17 15:32:02.724-07	2017-04-17 15:32:02.724-07	278	3	\N	\N	\N	\N	\N	\N	0	GBP	1	-40970	-40970	768	ac366b27-1c91-4846-b9cb-9fb911edd792	3
1582	EXPENSE	Minimum fee - May	-1000	USD	2016-08-16 07:54:12.931-07	2016-08-16 07:54:12.95-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	6dd5e28c-157e-4552-ba9e-f37e75ec0ec4	3
1576	EXPENSE	Monthly Minimum Fee - May	-1000	USD	2016-08-16 07:51:38.913-07	2016-08-16 07:51:38.924-07	12	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	1e21e117-2659-49f0-b3c4-0f71be1dafea	3
2425	EXPENSE	Fedex 	-3418	USD	2016-10-11 17:43:40.215-07	2016-10-11 17:43:40.344-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3418	\N	720b2952-d5b6-4f7f-81ba-a36f52576f1f	3
3529	EXPENSE	Regional Leadership Director Training	-13031	USD	2016-11-29 14:35:21.354-08	2016-11-29 14:35:21.522-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13031	\N	bc8e0feb-b038-484d-b77e-9671a32f65be	3
7684	EXPENSE	Travel stipend to attend the Google I/O 2017 Conference.	-100000	USD	2017-03-31 15:33:59.707-07	2017-03-31 15:33:59.731-07	286	1344	2321	\N	\N	\N	\N	\N	7430	USD	1	-100000	-107430	962	a275cb86-6060-4e20-987b-c9d777f576df	3
10118	EXPENSE	Regional Leadership Event: Barcelona	-19398	EUR	2017-05-16 14:49:07.885-07	2017-05-16 14:49:07.885-07	301	1378	\N	\N	\N	\N	\N	\N	0	EUR	1	-19398	-19398	1122	3fca3a38-ed21-4b50-903c-7ad1304b11af	3
10119	EXPENSE	Deposit- We Rise Conference Hosting Location	-500000	USD	2017-05-16 14:51:10.574-07	2017-05-16 14:51:10.574-07	12	3206	\N	\N	\N	\N	\N	\N	0	USD	1	-500000	-500000	1123	6f7e4a95-e8f5-408b-b4a6-c32168791436	3
613	EXPENSE	Conference Grant	-120000	USD	2016-05-19 12:07:13.723-07	2016-06-14 11:14:22.074-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-120000	175	0ec09d11-719f-49c7-8785-cdf9a6660274	3
841	EXPENSE	May expense: Travel and expense costs for mentoring at StartUp Weekend, Meeting w Northeeastern University for future WWC events 	-5161	USD	2016-06-06 17:21:31.531-07	2016-06-14 11:14:22.165-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5161	218	003cb730-5a3d-4db1-a7b2-32bd980c6452	3
10131	EXPENSE	Leadership meeting	-2989	USD	2017-05-16 14:59:48.206-07	2017-05-16 14:59:48.206-07	48	142	\N	\N	\N	\N	\N	\N	0	USD	1	-2989	-2989	1086	f3f420fc-da24-41e2-ac54-8d18166e5162	3
1583	EXPENSE	Minimum Fee - May	-1000	USD	2016-08-16 07:54:57.595-07	2016-08-16 07:54:57.609-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1000	\N	cbb3070b-f325-45ad-a323-1210bd2b0499	3
459	EXPENSE	WWC Boulder- April event's food	-14100	USD	2016-04-06 17:00:00-07	2016-06-14 11:14:21.989-07	15	68	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-14100	137	d79ac9f7-4158-4fea-be4d-6c95b1858509	3
460	EXPENSE	Mile High Agile outreach- supplies	-1115	USD	2016-04-02 17:00:00-07	2016-06-14 11:14:21.989-07	15	68	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1115	136	4423d89d-fb84-4db4-acee-0adf95f0492e	3
299	EXPENSE	Reimburse Caterina for travel expenses to CONNECT 2016	-6500	USD	2016-04-05 12:44:01.338-07	2016-06-14 11:14:21.839-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6500	75	995b5cdf-7f5d-495b-8937-021414ea6d22	3
336	EXPENSE	Meetup Transaction Fee	-163	USD	2016-04-12 11:52:16.188-07	2016-06-14 11:14:21.849-07	4	3	\N	2016-06-14 11:14:22.458-07	\N	\N	\N	\N	\N	\N	\N	\N	-163	82	d8012b7a-930b-4c21-a97d-60e676c4c08d	3
2810	EXPENSE	500 gift cards, 19.62 printed awards	-51962	USD	2016-10-31 14:09:11.281-07	2016-10-31 14:09:11.484-07	300	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-51962	416	34e49664-e27e-4576-9895-33d5e0ddf2f8	3
612	DONATION	Women Techmaker WWCode Partnership Grant	120000	USD	2016-05-19 12:10:52.797-07	2016-05-19 12:10:54.053-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	120000	\N	9615350f-4370-4c3b-bfab-2f2c48fe511c	3
466	DONATION	Recurring subscription	100	USD	2016-05-01 22:44:10.046-07	2016-05-01 22:44:10.072-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	21f38ce7-f977-4526-92c4-f488bc43b39d	3
469	DONATION	Recurring subscription	100	USD	2016-05-02 10:46:41.832-07	2016-05-02 10:46:41.894-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	eb45eaa9-743d-437f-a0df-986c0842d91d	3
866	DONATION	Nike Donation	50000	USD	2016-06-09 21:08:56.525-07	2016-06-09 21:08:56.991-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	6187d107-e599-47d8-8ca5-8ad365ac9df8	3
726	DONATION	Recurring subscription	100	USD	2016-06-01 22:48:36.714-07	2016-06-01 22:48:36.745-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	23ced910-fe09-4e51-b681-2c4a67ec8eac	3
9658	DONATION	\N	300000	USD	2017-05-02 11:43:43.157-07	2017-05-02 11:43:43.157-07	12	3	\N	\N	\N	2676	0	0	0	USD	1	300000	300000	\N	5e069863-b163-4534-a856-d24c10ad1c67	3
985	DONATION	Donation to WWCode San Francisco	100	USD	2016-06-21 09:05:01.251-07	2016-06-21 09:05:01.296-07	4	642	431	\N	\N	360	5	10	32	USD	1	100	53	\N	2db86e58-3d86-4dc5-80ff-58f5fc7984a7	3
995	DONATION	Donation to WWCode Austin	75000	USD	2016-06-22 13:09:46.403-07	2016-06-22 13:09:46.432-07	2	646	435	\N	\N	364	3750	7500	2625	USD	1	75000	61125	\N	1dd2bb42-e7c2-4e79-8fc7-8949fa3a1e33	3
2230	DONATION	Conference Grant: Google/IO Alicia Carr	10000	USD	2016-10-04 08:25:59.981-07	2016-10-04 08:26:00.186-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	382ee140-1ddc-4000-b079-00cd1f595da2	3
2307	DONATION	Donation Pamela V.	4500	USD	2016-10-06 11:09:54.319-07	2016-10-06 11:09:54.357-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4500	\N	20459f3e-47a2-42c8-8f77-9bdc17072479	3
2243	DONATION	Donation via Meetup	2036	USD	2016-10-04 09:42:35.996-07	2016-10-04 09:42:36.119-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2036	\N	ed01102f-16a4-4587-97a7-eb6ba81c5728	3
2244	DONATION	Donation via Meetup	1203	USD	2016-10-04 09:46:07.882-07	2016-10-04 09:46:07.993-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1203	\N	bbbc1082-58db-4cc2-b14d-7cadc2caabe8	3
2245	DONATION	Donation received via Meetup, less fees	788	USD	2016-10-04 09:46:13.302-07	2016-10-04 09:46:13.487-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	788	\N	c144fa0c-6234-4fa9-ad5e-e1e1137cdb08	3
2254	DONATION	Network budget balance pre Open Collective	34240	USD	2016-10-04 14:49:31.268-07	2016-10-04 14:49:31.543-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34240	\N	ea63f818-0bf1-4576-acd3-559644fa6d35	3
2301	DONATION	Blurb donation	54000	USD	2016-10-06 09:06:35.799-07	2016-10-06 09:06:36.235-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	54000	\N	634f797f-873a-43f3-9ce9-3df9e5244c4d	3
2255	DONATION	Network Development	10000	USD	2016-10-04 14:50:13.582-07	2016-10-04 14:50:13.787-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	42761f67-0665-4e8b-bf08-83f8d2d853dc	3
2256	DONATION	Network Development: Three Year Bonus:)	50000	USD	2016-10-04 14:52:32.839-07	2016-10-04 14:52:32.962-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	e2c9207b-a9aa-48e5-9d97-78fd589d86c9	3
1423	DONATION	Recurring subscription	10000	USD	2016-08-03 10:47:25.319-07	2016-08-03 10:47:25.429-07	4	896	571	\N	\N	498	500	1000	250	USD	1	10000	8250	\N	8ce2b0bd-aefa-4369-9ce9-0e1e469b5d64	3
6930	DONATION	monthly recurring subscription	100	USD	2017-03-09 10:29:18.778-08	2017-03-09 10:29:18.778-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	97fbe8b4-4c66-46ec-bc2f-3432ad3db065	3
6931	DONATION	\N	6000	USD	2017-03-09 10:29:55.496-08	2017-03-09 10:29:55.496-08	259	3442	2104	\N	\N	2003	300	600	162	USD	1	6000	4938	\N	16affe26-a286-4782-8426-d75e1806aef8	3
6944	DONATION	monthly recurring subscription	1000	USD	2017-03-09 20:43:47.943-08	2017-03-09 20:43:47.943-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	9b332c05-04c1-4be6-8df7-bd7246af38c4	3
1918	DONATION	\N	50000	USD	2016-09-12 21:15:04.709-07	2016-09-12 21:15:04.709-07	2	1178	737	\N	\N	653	2500	5000	1130	USD	1	50000	41370	\N	578ab4ce-f187-4636-ad60-c3b5760ac10c	3
9696	DONATION	\N	30000	USD	2017-05-03 10:33:13.688-07	2017-05-03 10:33:13.688-07	51	3	\N	\N	\N	2694	0	0	0	USD	1	30000	30000	\N	bb0ff0a8-b5fd-44c9-ab0b-bf65a00eabbe	3
9698	DONATION	\N	75000	USD	2017-05-03 10:44:10.84-07	2017-05-03 10:44:10.84-07	12	3	\N	\N	\N	2696	0	0	0	USD	1	75000	75000	\N	0d740b6b-249c-4c33-97ec-a5767b5a5799	3
9699	DONATION	\N	15000	USD	2017-05-03 10:44:48.715-07	2017-05-03 10:44:48.715-07	51	3	\N	\N	\N	2697	0	0	0	USD	1	15000	15000	\N	0bbb8fb9-a8dc-4ee6-8a86-2bee0302b879	3
2298	DONATION	Network Development (Stickers)	62984	USD	2016-10-06 08:49:44.329-07	2016-10-06 08:49:44.472-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	62984	\N	6f7df12e-1d15-40b9-8987-ae637eede1ee	3
2309	DONATION	Network budget pre Open Collective 	406519	USD	2016-10-06 11:36:30.275-07	2016-10-06 11:36:30.298-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	406519	\N	6404bfb0-eb77-4649-a55a-6fbb57c82691	3
2311	DONATION	Donations via Meetup	3937	USD	2016-10-06 11:41:35.464-07	2016-10-06 11:41:35.487-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3937	\N	5b67f243-796f-46e5-b77c-c13405674c39	3
9714	DONATION	\N	2175	USD	2017-05-03 17:12:19.814-07	2017-05-03 17:12:19.814-07	259	3	\N	\N	\N	2702	0	0	0	USD	1	2175	2175	\N	e7f2e24e-6899-46c4-919d-dd1cb2d3838c	3
2342	DONATION	Network Development +	50000	USD	2016-10-07 13:24:13.595-07	2016-10-07 13:24:13.706-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	b12c8806-5c99-46cf-8ae9-9f338888f266	3
2430	DONATION	Network budget pre Open Collective 	162598	USD	2016-10-11 22:01:43.648-07	2016-10-11 22:01:43.828-07	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	162598	\N	4ec8f1b9-f12f-4ec8-962e-29aa026ead03	3
2404	DONATION	Network Development	10000	USD	2016-10-11 09:52:38.277-07	2016-10-11 09:52:38.455-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	9c530187-e104-440b-ab25-54418876db12	3
8038	DONATION	monthly recurring subscription	1000	USD	2017-04-01 16:32:24.254-07	2017-04-01 16:32:24.254-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	b1060810-1e00-4118-b7b9-6cc529fca54a	3
2530	DONATION	WWCode Director t-shirt	3649	USD	2016-10-17 13:50:42.245-07	2016-10-17 13:50:42.273-07	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	b8eabdbe-fc85-4747-a409-0b5a0c49f817	3
2532	DONATION	Director t-shirt	2860	USD	2016-10-17 13:55:47.647-07	2016-10-17 13:55:47.671-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2860	\N	e973ee0b-ec29-44b5-b658-5e1585b44f89	3
2536	DONATION	Director t-shirt	3186	USD	2016-10-17 13:58:21.952-07	2016-10-17 13:58:22.083-07	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3186	\N	ab3a189e-8523-443a-bd54-f8824c3498dc	3
2538	DONATION	Director t-shirt	3325	USD	2016-10-17 14:00:51.295-07	2016-10-17 14:00:51.425-07	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3325	\N	7b58a48c-ec76-4fd4-b285-daf541fdd4c4	3
3207	DONATION	$500 OpenGov hackathon support - transaction and global development	43500	USD	2016-11-17 10:36:48.896-08	2016-11-17 10:36:49.046-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43500	\N	3726c26f-142a-4030-9306-3dbaad9081f0	3
3208	DONATION	WWCode DC t-shirts sales	9524	USD	2016-11-17 10:37:58.038-08	2016-11-17 10:37:58.232-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9524	\N	36e90498-a765-4be3-b2d7-490d8776e07c	3
2522	DONATION	from Code2040	90000	USD	2016-10-17 08:43:12.71-07	2016-10-17 08:43:13.113-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	d37c6e91-1aa2-45bd-b13d-a4d3a6e32102	3
2528	DONATION	WWCode shirt Grisel	3649	USD	2016-10-17 13:48:59.282-07	2016-10-17 13:48:59.313-07	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3649	\N	cdb75283-fd2d-49da-81ca-b7887f3bb44b	3
7042	DONATION	Women Who Code Atlanta &amp; DevNexus Soirée - fees + global	10875	USD	2017-03-13 10:05:28.744-07	2017-03-13 10:05:31.582-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10875	\N	c188572e-6d9c-4795-8540-7fd3bcea20bf	3
7043	DONATION	Women Who Code Atlanta &amp; DevNexus Soirée global networks support	1450	USD	2017-03-13 10:06:48.459-07	2017-03-13 10:06:51.099-07	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1450	\N	e2b2b401-0472-40e8-8d1c-84e5ad37b555	3
4259	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-23 09:08:24.515-08	2016-12-23 09:08:24.709-08	265	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	8106fc14-9b21-49e9-bd3c-a25e7e6d64ea	3
9738	DONATION	\N	2175	USD	2017-05-04 09:21:53.684-07	2017-05-04 09:21:53.684-07	276	3	\N	\N	\N	2710	0	0	0	USD	1	2175	2175	\N	5b429ca7-afd8-4d37-a3ad-51ca7ae6bd82	3
9746	DONATION	\N	1200	USD	2017-05-04 11:58:24.9-07	2017-05-04 11:58:24.9-07	430	3	\N	\N	\N	2713	0	0	0	USD	1	1200	1200	\N	48c218d5-3e53-4a1f-88b4-485b930a9a99	3
3047	DONATION	Recurring subscription	100	USD	2016-11-09 10:29:23.967-08	2016-11-09 10:29:23.967-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	c416f18a-645f-4ba1-bc60-7f6ef6291cf5	3
9042	DONATION	\N	200	USD	2017-04-30 18:40:30.232-07	2017-04-30 18:40:30.232-07	516	3419	2749	\N	\N	2636	10	20	34	USD	1	200	136	\N	8c5b057c-7596-4791-a13a-fc2a64303098	3
8175	DONATION	Travel Stipend for CONNECT	50000	USD	2017-04-03 13:24:58.616-07	2017-04-03 13:24:58.879-07	511	3	\N	2017-04-02 17:00:00-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	d8baca94-1547-4dd9-ae1b-b3bdddeac823	3
537	DONATION	WOMEN TECHMAKER/WWCODE PARTNERSHIP GRANT	110000	USD	2016-05-10 14:15:06.327-07	2016-05-10 14:15:06.677-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	110000	\N	84415409-2268-45c1-a28e-42bbe8a9dedf	3
568	DONATION	Women Techmaker/WWCode Partnership Grant	50000	USD	2016-05-16 13:01:14.238-07	2016-05-16 13:01:14.49-07	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	fcdb2afd-4ee1-44a6-95fb-9e1619286c8d	3
2253	DONATION	Network Development	10000	USD	2016-10-04 14:44:54.4-07	2016-10-04 14:44:54.58-07	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	c7d7a0f0-4ac1-4169-9368-4b6d19c4680b	3
132	DONATION	Recurring subscription	100	USD	2016-03-02 16:24:57.083-08	2016-04-16 13:40:58.834-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	3a77dd06-45f7-43cd-94e3-dffec6785c2b	3
202	DONATION	Recurring subscription	100	MXN	2016-03-15 13:05:22.15-07	2016-04-01 07:32:17.381-07	10	7	64	2016-04-07 07:32:17.381-07	\N	83	5	\N	\N	\N	\N	\N	\N	\N	d1d87139-4731-4474-a1a3-965cce286ed3	3
96	DONATION	Donation to WWCode Mexico City	100	MXN	2016-02-15 10:46:05.92-08	2016-04-01 07:32:17.223-07	10	7	64	2016-04-07 07:32:17.381-07	\N	83	\N	\N	\N	\N	\N	\N	\N	\N	eb1ff5a0-1e75-4d49-8c64-69e64f1b9d6f	3
129	DONATION	Recurring subscription	100	USD	2016-03-02 10:26:05.731-08	2016-04-16 13:40:58.833-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	73f453a9-ae3a-4ca9-82e9-cc61d3644969	3
407	DONATION	Mary Griffus	1000	USD	2016-04-26 21:41:38.126-07	2016-04-26 21:41:38.474-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	980ba0b0-ae38-48a2-9488-013c6634622b	3
349	DONATION	Jasna Rodulfa	1000	USD	2016-04-15 07:17:21.126-07	2016-04-16 13:40:58.829-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	\N	4cb4c4ab-f5d6-4d63-a937-8af026b8759d	3
2235	DONATION	Turner Matching Donation	5000	USD	2016-10-04 08:46:59.013-07	2016-10-04 08:46:59.134-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000	\N	f900d59d-399a-4087-8a99-d5dc330e4483	3
2231	DONATION	Sponsorship: AT&T Hackathon Prize	1000000	USD	2016-10-04 08:40:37.72-07	2016-10-04 08:40:37.853-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000000	\N	4b8d36db-e5cf-4fd1-8128-a699de20993f	3
2262	DONATION	Donation via meetup	2363	USD	2016-10-04 15:14:59.695-07	2016-10-04 15:14:59.884-07	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2363	\N	dfb49d74-e609-4cc8-8c3e-46ff770309f3	3
2263	DONATION	Network Development	17375	USD	2016-10-04 15:15:45.133-07	2016-10-04 15:15:45.269-07	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17375	\N	43365b78-5277-49da-b188-6a517a926473	3
2306	DONATION	I am an active member and WWC has taken my career in tech to the next level. All the support and lessons from the WWC DC chapter are instrumental in me remaining in this field.	2250	USD	2016-10-06 10:23:39.409-07	2016-10-06 10:23:39.459-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	efb89f26-5e2c-42bf-b173-27d7bf0406f9	3
2264	DONATION	Diana A. Scholarship Google I/O	25000	USD	2016-10-04 15:19:06.989-07	2016-10-04 15:19:07.108-07	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25000	\N	8932d7a2-35b5-4d30-b78b-729a53066393	3
2422	DONATION	Donation from Marie W.	900	USD	2016-10-11 17:26:47.2-07	2016-10-11 17:26:47.59-07	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	900	\N	39996606-f7e9-40ee-a5e1-aa68deae24b2	3
2332	DONATION	Course Hero Hackathon Support	315000	USD	2016-10-07 07:39:15.069-07	2016-10-07 07:39:15.23-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	315000	\N	5c187624-870d-4c32-b10c-d952bc638fa5	3
2333	DONATION	Hackathon Support Open Gov	45000	USD	2016-10-07 07:41:08.315-07	2016-10-07 07:41:08.391-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45000	\N	08afa6d7-318d-47a2-8443-f19c6d9fe1a5	3
2423	DONATION	Network Development	19100	USD	2016-10-11 17:28:02.718-07	2016-10-11 17:28:03.121-07	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19100	\N	74d06361-67e4-4923-840d-82fb946093ec	3
2327	DONATION	Google I/O conference stipend	102409	GBP	2016-10-07 06:10:42.97-07	2016-10-07 06:10:43.753-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	102409	\N	7daeaf49-013c-42de-83da-86526afaea32	3
2341	DONATION	Network Development (100%)	10000	USD	2016-10-07 13:05:13.011-07	2016-10-07 13:05:13.112-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	65d47c4a-b755-49c7-b2d6-dbddfdfd421e	3
2340	DONATION	Hackbright support for hackathon	45000	USD	2016-10-07 13:04:15.299-07	2016-10-07 13:04:15.435-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45000	\N	f861afb4-acee-4677-8343-79a42a833d0f	3
2428	DONATION	Donation from Shugo	450	USD	2016-10-11 21:30:15.825-07	2016-10-11 21:30:15.896-07	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	0f702272-a446-4280-a96b-9bc994874280	3
2429	DONATION	Network Development	19550	USD	2016-10-11 21:30:34.678-07	2016-10-11 21:30:34.772-07	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19550	\N	9ddbfb06-db7c-4fa2-a325-6e69943c17fe	3
2431	DONATION	Network Development (Thanks Atlassian) 	20000	USD	2016-10-11 22:06:05.058-07	2016-10-11 22:06:05.202-07	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	9549e2a9-b907-4801-8b47-6407c300e439	3
3531	DONATION	Regional Leadership Director Training	631	USD	2016-11-29 14:38:57.006-08	2016-11-29 14:38:57.13-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	631	\N	aeca0ae5-c39b-46b5-a46a-5a964ab43335	3
3533	DONATION	Network Development	20000	USD	2016-11-29 14:43:53.719-08	2016-11-29 14:43:53.971-08	286	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	7a9cb9ef-afdd-4d85-b4b5-fa52e346eb92	3
3535	DONATION	Banner	2000	USD	2016-11-29 15:07:15.153-08	2016-11-29 15:07:15.39-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	3dc39835-0671-450e-bd85-9d5622676954	3
3537	DONATION	Global Development - thanks VMWare	50000	USD	2016-11-29 15:07:50.964-08	2016-11-29 15:07:51.154-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	17513123-d08c-4153-96a9-85c8bf346bb8	3
3514	DONATION	CONNECT 2016	4536939	USD	2016-11-29 13:44:20.041-08	2016-11-29 13:44:20.185-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4536939	\N	184f4788-f08f-4b14-9226-aaca61c2ebb3	3
3540	DONATION	Donation from PB - fees 	1187	USD	2016-11-29 15:33:50.04-08	2016-11-29 15:33:50.206-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	b1569a2e-654e-4108-9c97-de12187ef171	3
3598	DONATION	Network Development	20000	USD	2016-11-30 10:40:15.233-08	2016-11-30 10:40:15.446-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	1d3a6593-877b-4da0-a966-c2a286127140	3
3600	DONATION	Banner	2000	USD	2016-11-30 10:40:32.021-08	2016-11-30 10:40:32.139-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	a1457d27-e61b-45de-aadd-378b29544550	3
3612	DONATION	Network Development	20000	USD	2016-11-30 12:59:29.087-08	2016-11-30 12:59:29.921-08	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	c26e172a-b880-40ae-96e1-245f9122cd42	3
3614	DONATION	Leadership development - conference stipend Google I/O	130000	USD	2016-11-30 13:07:12.142-08	2016-11-30 13:07:12.419-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	130000	\N	e8834ded-c290-4ab8-b367-c3356b2c9eb3	3
3617	DONATION	Global Development	20000	USD	2016-11-30 13:11:00.067-08	2016-11-30 13:11:00.307-08	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	eb089b39-6f9d-41c8-9c70-ca094bacbc0a	3
3618	DONATION	Banner	2000	USD	2016-11-30 13:19:37.017-08	2016-11-30 13:19:37.251-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	d33503e6-bb6e-4b24-b7ed-01842d266e8e	3
3620	DONATION	Regional Leadership Director Meeting 	7500	USD	2016-11-30 13:20:06.733-08	2016-11-30 13:20:15.577-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500	\N	5cd12a4a-4670-41f8-a215-222175234e3e	3
3621	DONATION	Regional Leadership Director Meeting 	7500	USD	2016-11-30 13:20:12.669-08	2016-11-30 13:20:16.148-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7500	\N	33dd6edd-aafe-4257-a57c-a3dd886e6c9a	3
4255	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-23 08:59:24.039-08	2016-12-23 08:59:24.291-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6157d8ed-903e-40f6-b5d8-087f4793a4c2	3
4257	DONATION	Global Development for Meetup Fee	4900	GBP	2016-12-23 09:02:53.836-08	2016-12-23 09:02:53.991-08	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	3f46c5c9-4147-486e-b8ab-7a7a89a88f9f	3
4261	DONATION	Global Development for Meetup Fee	5700	EUR	2016-12-23 09:13:39.369-08	2016-12-23 09:13:39.507-08	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	6f1c4879-9600-446e-b8b1-7c4ca6b64662	3
4263	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-23 09:20:13.429-08	2016-12-23 09:20:13.545-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6d9dd70c-2b98-4094-8a7f-d8d14ebdfe64	3
4265	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-23 09:31:16.26-08	2016-12-23 09:31:16.392-08	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	be353290-3a79-4837-b322-8bcf820cf681	3
4267	DONATION	Global Development for Meetup Fee	6000	AUD	2016-12-23 09:41:14.029-08	2016-12-23 09:41:14.193-08	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	034ce920-1702-43ca-b969-c609763c116b	3
2329	DONATION	Google I/O stipend	39585	GBP	2016-10-07 06:35:45.945-07	2016-10-07 06:35:46.151-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39585	\N	31edf1ab-fe0e-470a-b022-11a2727cd41f	3
4372	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 08:38:50.944-08	2016-12-27 08:38:51.039-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	61be0f13-1f0e-4430-a69b-de48f097255d	3
4374	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 08:48:52.922-08	2016-12-27 08:48:53-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	f81b72fd-ff9d-453c-85aa-83f26b75e23f	3
4380	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 08:58:32.613-08	2016-12-27 08:58:32.719-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	52c10ec3-fc17-4bb0-80dd-b97ef1359708	3
4382	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 09:02:32.71-08	2016-12-27 09:02:32.843-08	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	cb83b4cd-aedb-4485-a545-c318b78ca0fe	3
4384	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 09:24:55.371-08	2016-12-27 09:24:55.632-08	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	ad4cf65e-ffab-438f-9b08-a536185a5af3	3
4386	DONATION	Global Development for Meetup Fee	4900	GBP	2016-12-27 09:32:02.798-08	2016-12-27 09:32:02.918-08	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	f57723cd-0a3e-4bf8-b686-8a60ae3e7e78	3
3955	DONATION	Priyanka - IOT Hackathon donation - fees and global development 	2175	USD	2016-12-13 12:08:29.218-08	2016-12-13 12:08:29.464-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2175	\N	3b4c5740-bddf-407f-a147-56b43886907c	3
3956	DONATION	Donation via Meetup - fees + Global Development	1187	USD	2016-12-13 12:17:57.936-08	2016-12-13 12:17:58.19-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	940cd510-b8a8-460d-b494-d2e4a216ad9e	3
3957	DONATION	Donation via meetup - fees and global development	775	USD	2016-12-13 12:20:15.375-08	2016-12-13 12:20:15.714-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	2c90bf2f-4941-48ed-828c-db67f8249cc1	3
4270	DONATION	Global Development for Meetup Fee	4900	GBP	2016-12-23 09:55:42.091-08	2016-12-23 09:55:42.249-08	267	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4900	\N	2acba33f-e56b-49f2-886b-86388493777d	3
4441	DONATION	Global Development for Meetup Fee	6000	CAD	2016-12-28 08:29:31.983-08	2016-12-28 08:29:28.409-08	293	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	3c2a09b0-ab81-4e66-8ec6-a6946e367763	3
4443	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-28 08:31:33.43-08	2016-12-28 08:31:29.837-08	294	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	c257c047-567a-47fb-b8b7-02b7f7a90b12	3
74	DONATION	Donation to WWCode Washington DC	100	USD	2016-02-02 09:09:22.069-08	2016-04-16 13:40:58.697-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	86ca72b0-3163-400d-83e1-e17d7f182d7e	3
77	DONATION	Donation to WWCode Seattle	100	USD	2016-02-02 13:46:44.866-08	2016-04-16 13:40:58.7-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	ac7d9c6f-0090-4ff5-bd71-01aaef4f5b99	3
66	DONATION	Donation to WWCode Atlanta	1000	USD	2016-01-29 14:23:53.315-08	2016-04-16 13:40:58.701-07	12	30	39	\N	\N	13	0	50	59	USD	1	1000	891	\N	03ad4ae8-f8d6-4d38-88d8-d6ebf43650b9	3
78	DONATION	Donation to WWCode Washington DC	100	USD	2016-02-02 15:09:05.702-08	2016-04-16 13:40:58.699-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	24dc1b5d-5ff4-456c-9765-3306cc4ce7bc	3
104	DONATION	Recurring subscription	500	USD	2016-02-18 17:11:10.784-08	2016-04-16 13:40:58.716-07	10	2	34	\N	\N	65	25	50	45	USD	1	500	380	\N	c7a4ed19-aed5-411a-a5a9-72a1296ba3d3	3
103	DONATION	Donation to WWCode Austin	30000	USD	2016-02-18 11:54:08.531-08	2016-04-16 13:40:58.717-07	2	108	71	\N	\N	15	0	3000	900	USD	1	30000	26100	\N	a2af1057-4522-4c6a-b5ec-9f3e41da88e7	3
131	DONATION	Recurring subscription	100	USD	2016-03-02 15:01:26.771-08	2016-04-16 13:40:58.719-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	8abd55fb-f09a-4c77-862a-144f73ebdd0d	3
124	DONATION	Donation to WWCode Washington DC	100	USD	2016-03-01 20:41:59.916-08	2016-04-16 13:40:58.728-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	2cd7b544-2cdd-4060-9426-eeb4bed04fb5	3
127	DONATION	Recurring subscription	500	MXN	2016-03-02 10:06:23.743-08	2016-04-16 13:40:58.731-07	10	80	42	\N	\N	68	2	3	16	USD	17.8570999999999991	28	125	\N	2b05e30a-ef47-4a1e-b090-382b227c3b5b	3
128	DONATION	Recurring subscription	100	USD	2016-03-02 10:19:33.362-08	2016-04-16 13:40:58.737-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	9b592cfc-6e21-487e-9471-b7491af84c89	3
5016	DONATION	WWCode Boston t-shirt sales	1964	USD	2017-01-17 19:19:47.816-08	2017-01-17 19:19:48.024-08	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1964	\N	06f8f818-4527-4882-a50c-40de00ed8711	3
5017	DONATION	WWCode t-shirt sales	4397	USD	2017-01-17 19:20:52.226-08	2017-01-17 19:20:52.436-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4397	\N	232dcd17-1057-4c79-ade5-b368a259f68f	3
5018	DONATION	WWCode t-shirt sales	1599	USD	2017-01-17 19:21:50.791-08	2017-01-17 19:21:50.964-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1599	\N	d2873b77-1ea2-48e6-894b-a460b9462b1f	3
499	DONATION	Women Techmaker/WWCode partnership grant	50000	USD	2016-05-04 14:17:27.653-07	2016-05-04 14:17:27.886-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	c81e5698-25db-421e-80ce-4c04a817e59c	3
2397	DONATION	Google I/O stipend	75000	USD	2016-10-11 09:01:42.326-07	2016-10-11 09:01:43.286-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	85005ce6-d4f3-4b07-98d0-ef524443de8a	3
277	DONATION	Recurring subscription	100	USD	2016-04-02 08:43:33.706-07	2016-04-16 13:40:58.808-07	13	126	93	\N	\N	95	5	10	33	USD	1	100	52	\N	6572dba9-3912-444c-96f4-5ddbec5c098c	3
281	DONATION	Recurring subscription	100	USD	2016-04-02 12:27:54.641-07	2016-04-16 13:40:58.809-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	09102f53-5640-469e-8568-f546e4636908	3
282	DONATION	Recurring subscription	500	MXN	2016-04-02 13:10:38.206-07	2016-04-02 13:10:38.242-07	10	80	42	2016-04-07 13:10:38.206-07	\N	68	\N	\N	\N	\N	\N	\N	\N	\N	8cc3139c-729d-497c-9aa9-1c6aba7f53bb	3
278	DONATION	Recurring subscription	100	USD	2016-04-02 11:13:51.122-07	2016-04-16 13:40:58.81-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	f2a2c11a-e7c9-4578-8401-fb4e1d15e22a	3
280	DONATION	Recurring subscription	100	USD	2016-04-02 12:09:44.502-07	2016-04-16 13:40:58.811-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	de316074-f0f1-41f4-bd2d-502dbfeceeae	3
261	DONATION	Donation to WWCode Austin	30000	USD	2016-03-25 08:11:04.684-07	2016-04-16 13:40:58.812-07	2	192	152	\N	\N	64	0	3000	900	USD	1	30000	26100	\N	112c59b0-b10d-43fc-9d6f-a33b38dfde31	3
325	DONATION	From:\tThao Le	1500	USD	2016-04-12 11:49:06.645-07	2016-04-16 13:40:58.815-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	1a6b4663-7869-49ba-9691-9b3bec6843c4	3
306	DONATION	Leslie Mollner: Thank you very much for all the help I've received from WWCode -TC so far. -Leslie	2250	USD	2016-04-06 11:17:07.204-07	2016-04-16 13:40:58.818-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	d96508af-a33c-42bc-9446-bc438652e8a8	3
289	DONATION	Recurring subscription	100	USD	2016-04-02 18:49:19.352-07	2016-04-16 13:40:58.819-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	8ba471ba-ec4f-4181-a1d0-f1c2b029194d	3
130	DONATION	Donation to WWCode Austin	30000	USD	2016-03-02 13:31:50.516-08	2016-04-16 13:40:58.67-07	2	129	94	\N	\N	25	0	3000	900	USD	1	30000	26100	\N	00dfdd70-caa9-4d07-9a89-7157a9464d5c	3
43	DONATION	Donation to WWCode Mexico City	500	USD	2016-01-18 15:54:06.439-08	2016-04-16 13:40:58.672-07	10	2	34	\N	\N	65	25	50	45	USD	1	500	380	\N	c9a65b3a-a9bd-40b3-a806-ec5d4a273187	3
333	DONATION	From Deepa	1500	USD	2016-04-12 14:18:56.547-07	2016-04-16 13:40:58.847-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	886f2733-7967-4b61-93c1-f8242037a5a4	3
858	DONATION	Dalia donated to WWCode SF	1500	USD	2016-06-09 11:40:21.124-07	2016-06-09 11:40:21.833-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	ebf2964d-38ed-47f4-93dc-59fbb394dc73	3
2410	DONATION	From Lucas in honor of Rachel M. She learned Python and HTML/CSS	2250	USD	2016-10-11 12:13:57.013-07	2016-10-11 12:13:57.265-07	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2250	\N	9a09da05-1e08-4b56-b452-1236e02b2a92	3
2411	DONATION	Network Development	17750	USD	2016-10-11 12:17:21.991-07	2016-10-11 12:17:22.199-07	279	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17750	\N	f87d62ba-99de-42b8-9039-9165dfc2022b	3
2412	DONATION	Network development - thanks Atlassian	50000	USD	2016-10-11 12:30:14.934-07	2016-10-11 12:30:15.155-07	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	b3fcd677-f2e2-4f24-b35b-b81ab513f215	3
2413	DONATION	Donation from Biotti	403	USD	2016-10-11 12:32:58.956-07	2016-10-11 12:32:59.265-07	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	403	\N	b07d171f-6a06-4bf1-b5ab-44b28a4d2fe6	3
412	DONATION	Andrea S	1500	USD	2016-04-27 13:05:44.711-07	2016-04-27 13:05:44.974-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	\N	1f5994ab-e490-47ec-af2a-97af7960004f	3
2414	DONATION	Network Development	17500	USD	2016-10-11 12:35:59.115-07	2016-10-11 12:35:59.305-07	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17500	\N	bd1df48d-4123-4817-b44a-698351ad76c5	3
2415	DONATION	Donation Ailia S.	9000	USD	2016-10-11 12:44:42.807-07	2016-10-11 12:44:43.161-07	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	37933bd0-775c-4ff6-914b-9be5c19aec41	3
2265	DONATION	Donation Hannah B.	9000	USD	2016-10-04 15:35:46.967-07	2016-10-04 15:35:47.153-07	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	41b245bb-086f-4199-81b9-d6900db24611	3
2267	DONATION	Network Development	15400	USD	2016-10-04 15:39:26.796-07	2016-10-04 15:39:26.9-07	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15400	\N	d40d88e7-8e48-43d2-b629-62c123b275bf	3
2416	DONATION	Network support - thanks VMWare	200000	USD	2016-10-11 12:50:00.045-07	2016-10-11 12:50:00.312-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	200000	\N	a4e80a28-1270-4c9e-870c-de3011dd78c7	3
2418	DONATION	Network support - Regional Leadership (thanks VMWare)	370000	USD	2016-10-11 12:51:45.723-07	2016-10-11 12:51:45.897-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	370000	\N	90107c21-9ee4-41e1-b930-b991cd649629	3
2419	DONATION	Network Development	20000	USD	2016-10-11 13:03:19.884-07	2016-10-11 13:03:20.084-07	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	b5dcca3b-559b-4c43-83ff-a31cd387d1f2	3
2420	DONATION	Network Development (Thanks Zendesk)	16129	USD	2016-10-11 13:26:22.964-07	2016-10-11 13:26:23.172-07	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16129	\N	2b973f59-80ae-4046-996e-35e967509adc	3
2421	DONATION	Donation Elizabeth B.	9000	USD	2016-10-11 17:22:08.455-07	2016-10-11 17:22:08.557-07	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9000	\N	d6590406-0ffc-489f-ab6a-3436c8be0d3a	3
451	DONATION	Donation to WWCode Washington DC	50000	USD	2016-04-29 06:51:19.1-07	2016-04-29 06:51:19.15-07	13	303	216	\N	\N	183	2500	5000	1480	USD	1	50000	41020	\N	12d109fa-91c8-4a65-8547-f954d2767714	3
475	DONATION	Recurring subscription	100	USD	2016-05-02 17:15:49.65-07	2016-05-02 17:15:49.711-07	13	2	46	\N	\N	72	5	10	33	USD	1	100	52	\N	5ed9ac7d-2cbb-49b4-8eb0-35a8a50396b5	3
474	DONATION	Recurring subscription	100	USD	2016-05-02 15:49:03.545-07	2016-05-02 15:49:03.612-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	625d1196-61d0-48d5-8a84-0cfd6a50c750	3
4188	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-21 10:49:47.667-08	2016-12-21 10:49:47.892-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	74434b16-1798-42d0-92da-547acdf24d48	3
666	DONATION	Generous donation from Target to support WWCode Twin Cities	500000	USD	2016-05-26 11:37:24.922-07	2016-05-26 11:37:23.286-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500000	\N	345acef4-87b2-455f-beef-b23517d7a460	3
667	DONATION	Proceeds from teespring	10022	USD	2016-05-26 11:38:50.077-07	2016-05-26 11:38:48.41-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10022	\N	dce42eaa-b86f-4baa-ac29-a12e270cd434	3
4360	DONATION	Global Development for Meetup Fee	6000	MXN	2016-12-27 08:10:30.416-08	2016-12-27 08:10:30.529-08	299	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	271d48b8-2cba-40e7-bafa-e632e30dbbce	3
9659	DONATION	\N	60000	USD	2017-05-02 11:45:44.253-07	2017-05-02 11:45:44.253-07	51	3	\N	\N	\N	2677	0	0	0	USD	1	60000	60000	\N	3c6bb7c3-caff-4599-b462-6a53ea05cb0b	3
842	DONATION	Donation to WWCode Washington DC	100000	USD	2016-06-06 17:53:47.603-07	2016-06-06 17:53:47.649-07	13	555	381	\N	\N	316	5000	10000	2930	USD	1	100000	82070	\N	9921b890-042c-4506-b8c0-2a77793a0783	3
1042	DONATION	Donation from MondoRobot & Avery Brewing Company: Hackathon Proceeds	320247	USD	2016-06-29 11:42:31.848-07	2016-06-29 11:42:32.517-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	320247	\N	3f5141a2-01ec-4026-8ebd-f1d232237947	3
2236	DONATION	Donation: Beth Laing	5000	USD	2016-10-04 08:47:24.058-07	2016-10-04 08:47:24.175-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5000	\N	a4d7f6ff-8014-48b0-aef8-c0d0d62ef7af	3
2237	DONATION	Donation: Syema Ailia	2500	USD	2016-10-04 08:47:46.468-07	2016-10-04 08:47:46.624-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500	\N	445859c1-2d38-4be2-8d47-7b91e62aad55	3
2242	DONATION	Reverse duplicate transaction	500	USD	2016-10-04 09:12:26.671-07	2016-10-04 09:12:26.903-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	\N	bfa51ebc-0ab7-4ed8-9f4e-e4862bf271ba	3
837	DONATION	Donation to WWCode Austin	150000	USD	2016-06-06 12:04:37.186-07	2016-06-06 12:04:37.308-07	2	551	377	\N	\N	312	7500	15000	4380	USD	1	150000	123120	\N	7b775e3a-0634-4723-9638-3b8d28089e89	3
2234	DONATION	Donations made via Meetup as of Jan 2016, less transaction fees	9212	USD	2016-10-04 08:46:17.845-07	2016-10-04 08:46:18.02-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9212	\N	5af62e78-2976-4c04-aaab-f3c34f1297e7	3
2299	DONATION	Donations via Meetup	2823	USD	2016-10-06 08:53:38.156-07	2016-10-06 08:53:38.231-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2823	\N	35ce43d6-2009-48a3-bc10-e7c08155cd01	3
2300	DONATION	Network development	6000	USD	2016-10-06 09:01:48.321-07	2016-10-06 09:01:48.667-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	34694258-edf0-4473-b471-555bdcfddea7	3
2398	DONATION	Network Development	20000	USD	2016-10-11 09:02:18.108-07	2016-10-11 09:02:19.138-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	9ed15360-3e2f-4801-ac5a-2b41471bc68a	3
2305	DONATION	Google I/O scholarship	75000	USD	2016-10-06 10:21:27.384-07	2016-10-06 10:21:27.396-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	eb17e756-ee3f-434d-9493-8f6fbc94ea78	3
6882	DONATION	Leadership Development 	14915	MXN	2017-03-07 04:55:53.128-08	2017-03-07 04:55:53.3-08	511	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	14915	\N	58f1389a-1aa3-43b7-8283-5a0d75c4e827	3
6883	DONATION	Leadership Development	50616	MXN	2017-03-07 05:01:15.044-08	2017-03-07 05:01:15.192-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50616	\N	aaecc386-1923-482a-835a-4662c8858bc3	3
7913	DONATION	monthly recurring subscription	2500	USD	2017-04-01 11:31:19.231-07	2017-04-01 11:31:19.231-07	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	50d19e33-e65e-4c4f-b3bc-851253fdfda5	3
9695	DONATION	\N	150000	USD	2017-05-03 10:32:39.653-07	2017-05-03 10:32:39.653-07	12	3	\N	\N	\N	2693	0	0	0	USD	1	150000	150000	\N	839c847a-30e8-463a-912f-a6845435eca0	3
5021	DONATION	WWCode t-shirt sales	3563	USD	2017-01-17 19:28:29.874-08	2017-01-17 19:28:30.096-08	290	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3563	\N	2dde7e29-f8fa-4b52-86c1-3cfeb0c374e3	3
2189	DONATION	Recurring subscription	1000	USD	2016-10-01 16:35:17.911-07	2016-10-01 16:35:17.911-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	07c91ea8-acd4-4942-9cfd-c48cebb9daef	3
2268	DONATION	Network budget pre Open Collective	6264	USD	2016-10-04 15:51:25.324-07	2016-10-04 15:51:26.129-07	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6264	\N	2bd3e74c-84e0-43e2-a21d-b9443200eedc	3
2269	DONATION	Donation from Adane	450	USD	2016-10-04 15:56:11.881-07	2016-10-04 15:56:13.02-07	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	ea31005b-cb3b-42d7-9b8c-1c812558ee14	3
2270	DONATION	Network Development	13286	USD	2016-10-04 15:57:17.136-07	2016-10-04 15:57:17.293-07	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13286	\N	7382b702-3956-405b-b6af-b9d1b04e89ba	3
2310	DONATION	\N	12500	USD	2016-10-06 11:36:38.382-07	2016-10-06 11:36:38.382-07	2	1438	880	\N	\N	808	625	1250	305	USD	1	12500	10320	\N	21b39b65-f892-4961-bed4-4648745d3d23	3
2312	DONATION	Network Development (100%)	10000	USD	2016-10-06 11:42:47.682-07	2016-10-06 11:42:47.71-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	655af063-49c8-4b0b-9288-086d5e290e34	3
2394	DONATION	Conference stipend Heidi H.	50000	USD	2016-10-11 08:59:30.363-07	2016-10-11 08:59:31.524-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	0db54f37-f224-4eaa-ae93-e4a02bc97eef	3
2405	DONATION	Donation Scott Z. in honor of his sister	1800	USD	2016-10-11 10:01:23.313-07	2016-10-11 10:01:23.731-07	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1800	\N	99b8d53c-6e5b-40ee-a937-5d414c12adc6	3
2406	DONATION	Network Development	18200	USD	2016-10-11 10:02:51.621-07	2016-10-11 10:02:51.839-07	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18200	\N	8bc77fb9-7ed7-4099-91aa-18899658861b	3
2534	DONATION	Director t-shirt	2898	USD	2016-10-17 13:57:08.514-07	2016-10-17 13:57:08.533-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2898	\N	bbf57164-512a-42db-baa3-b91df0b4080c	3
3534	DONATION	Stephen	450	USD	2016-11-29 14:55:31.534-08	2016-11-29 14:55:31.727-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	bc8ea724-7089-4d7e-80dc-6ed375a7bc76	3
3200	DONATION	Portland t-shirt proceeds	6915	USD	2016-11-17 10:01:32.1-08	2016-11-17 10:01:32.49-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6915	\N	c96721bd-c150-4300-b6b9-144a4019cefb	3
4378	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 08:53:55.856-08	2016-12-27 08:53:55.969-08	275	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	aa3d7224-7382-4f6f-a0f5-2949228f2339	3
659	DONATION	Women Techmaker WWCode Partnership Grant	20000	USD	2016-05-25 09:45:53.797-07	2016-05-25 09:45:54.045-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	b0965077-da41-4ea3-9ff4-a25d7be1a3b6	3
4370	DONATION	Global Development for Meetup Fee	5700	EUR	2016-12-27 08:34:45.59-08	2016-12-27 08:34:45.771-08	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	7c5dc3dd-2211-4c62-bdf3-1d1bff4db06a	3
70	DONATION	Donation to WWCode Washington DC	100	USD	2016-02-02 09:04:56.247-08	2016-04-16 13:40:58.698-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	bedf3c7c-2d98-43a2-b73b-761b68cd2b0c	3
653	DONATION	Women Techmaker WWCode Partnership Grant	15000	USD	2016-05-24 13:12:34.913-07	2016-05-24 13:12:35.226-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15000	\N	4ec3f9b1-a7c7-4887-b029-6a3f17ada0c4	3
126	DONATION	Recurring subscription	100	USD	2016-03-02 09:53:54.346-08	2016-04-16 13:40:58.736-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	f7a13ef8-2a57-4e4b-99f1-3a016d405ebf	3
702	DONATION	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	80000	USD	2016-05-31 11:01:08.532-07	2016-05-31 11:01:07.064-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80000	\N	8c1d5f60-5e9f-4262-966c-0b0006e7d309	3
68	DONATION	Donation to WWCode Seattle	100	USD	2016-02-02 08:36:38.327-08	2016-04-16 13:40:58.702-07	14	30	41	\N	\N	67	5	10	33	USD	1	100	52	\N	74fb2375-fab0-436c-8f56-5051ee3c26ad	3
69	DONATION	Donation to WWCode Mexico City	500	MXN	2016-02-02 08:52:02.237-08	2016-04-16 13:40:58.703-07	10	80	42	\N	\N	68	1	2	16	USD	18.5100000000000016	27	148	\N	26a163a5-8959-4ab4-bef5-3d07360183e6	3
4702	DONATION	Donation - fees + global development	1187	USD	2017-01-05 06:58:39.771-08	2017-01-05 06:58:42.205-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	\N	9eb3b1c1-578e-4b80-be38-c28a2c634474	3
4701	DONATION	donation - fees and global development	798	USD	2017-01-05 06:48:24.355-08	2017-01-05 06:48:26.734-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	798	\N	42c8ea1c-5292-4ee1-8768-97d910be5fe2	3
4677	DONATION	Donation from Cameron - fees and global development	4350	USD	2017-01-04 12:33:36.359-08	2017-01-04 12:33:37.475-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4350	\N	79fb7110-6a80-49d9-9d52-eca9ba262867	3
3201	DONATION	T-shirt payout	1092	USD	2016-11-17 10:03:13.726-08	2016-11-17 10:03:13.862-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1092	\N	c83bd839-4222-4e75-b71b-afe58b183300	3
3203	DONATION	$1000 CDK Global event support - transaction and global development	87000	USD	2016-11-17 10:18:40.107-08	2016-11-17 10:18:40.436-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	87000	\N	cda2e9ae-7568-4ca0-a5a6-b6e8b99fdfb4	3
3204	DONATION	$1000 Mozilla hackathon support - Global Development	90000	USD	2016-11-17 10:21:06.154-08	2016-11-17 10:21:07.268-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	646702d0-fba2-4ee2-8e90-8c8871732cac	3
3205	DONATION	$5000 Intel Hackathon support - global development	450000	USD	2016-11-17 10:23:08.268-08	2016-11-17 10:23:08.461-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450000	\N	6b086a9f-6727-4f05-85cd-8f84aa7c79dd	3
3206	DONATION	$3500 Course Hero Hackathon support - transaction & global development	304500	USD	2016-11-17 10:27:12.528-08	2016-11-17 10:27:12.742-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	304500	\N	05d80488-2759-4454-abe3-0a379836df31	3
7556	DONATION	International Women's Day Atlanta	10350	USD	2017-03-28 11:28:28.77-07	2017-03-28 11:28:28.938-07	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6c8e7d6b-bcd8-44bc-a3c8-ab4f3fb6b3b5	3
3518	DONATION	Global Development	20000	USD	2016-11-29 13:56:45.442-08	2016-11-29 13:56:45.713-08	290	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	6323fec2-eb32-4b9b-9134-9d658f2efe40	3
3519	DONATION	Network Development - 10k member bonus	100000	USD	2016-11-29 13:58:23.625-08	2016-11-29 13:58:23.799-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	2266fe36-fda5-4fbb-bca6-7cda7e67318b	3
3520	DONATION	Global Development	15600	USD	2016-11-29 14:08:18.065-08	2016-11-29 14:08:18.213-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15600	\N	adf0f06c-e558-411f-8551-6c08eaf62de1	3
3521	DONATION	Erica S. donation - fees	450	USD	2016-11-29 14:11:37.922-08	2016-11-29 14:11:38.131-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	21b0481e-bb75-445b-b121-6964171ec740	3
3522	DONATION	Erica S. donation - fees	450	USD	2016-11-29 14:12:36.336-08	2016-11-29 14:12:36.503-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	\N	e671d019-152e-4857-b2d0-2d1a5545e33d	3
3523	DONATION	Global Development	19100	USD	2016-11-29 14:17:18.389-08	2016-11-29 14:17:18.558-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19100	\N	93342e23-5a6d-4557-8988-d48bda18046b	3
3524	DONATION	Network Budget Balance Pre Open Collective	17475	USD	2016-11-29 14:28:03.065-08	2016-11-29 14:28:03.231-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17475	\N	3ca715da-37c9-48d6-8b41-15a1dd421d81	3
3525	DONATION	Network Development	2500	USD	2016-11-29 14:29:22.958-08	2016-11-29 14:29:23.167-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2500	\N	a973cade-bced-498a-aaf3-f6a4f60ca02e	3
3527	DONATION	Banner	2000	USD	2016-11-29 14:34:22.96-08	2016-11-29 14:34:23.085-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	3097b9bd-e10a-4598-bd6d-b035d0f33f73	3
3528	DONATION	Regional Leadership Director Training 	13031	USD	2016-11-29 14:35:05.252-08	2016-11-29 14:35:05.379-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13031	\N	ce5bf007-5b83-46b2-b82b-17ef62e16627	3
3541	DONATION	Global Development	20000	USD	2016-11-29 15:34:32.59-08	2016-11-29 15:34:32.817-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	3930af5b-22e9-43a5-b3b5-4c28e21c4a3b	3
3542	DONATION	Donation from Margaret - fees	2012	USD	2016-11-29 15:37:14.82-08	2016-11-29 15:37:15.082-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2012	\N	3e72e75f-912e-4507-8a12-e73a2a2baecb	3
3543	DONATION	Donation via Meetup	775	USD	2016-11-29 15:39:08.069-08	2016-11-29 15:39:08.263-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	d13f4546-ddb3-4403-8ffa-3e94709cd39e	3
3544	DONATION	Donation via meetup	775	USD	2016-11-29 15:39:42.382-08	2016-11-29 15:39:42.512-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	00e31b6f-e424-4f4b-b51e-73cc1c290081	3
3547	DONATION	Network Development	20000	USD	2016-11-29 16:23:24.87-08	2016-11-29 16:23:24.511-08	285	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20000	\N	c97c359c-7c4d-491a-9489-1423fc900fd1	3
8210	DONATION	\N	20000	USD	2017-04-04 12:51:04.916-07	2017-04-04 12:51:04.916-07	2	3999	2438	\N	\N	2332	1000	2000	700	USD	1	20000	16300	\N	2d1d8ff1-e35e-417d-b676-75bc6130e73a	3
3624	DONATION	Conference Travel Stipend - Google I/O Elese	75000	USD	2016-11-30 13:25:31.161-08	2016-11-30 13:25:41.165-08	276	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75000	\N	09bd1cc4-9ecf-4dd9-a3a6-2bfe654015da	3
3627	DONATION	Banner	2000	USD	2016-11-30 13:33:30.25-08	2016-11-30 13:33:30.386-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2000	\N	d7f0bea9-9ed6-4ec6-aada-f8d3fe14c421	3
3629	DONATION	Global Development - Thanks VMWare	50000	USD	2016-11-30 13:34:00.324-08	2016-11-30 13:34:01.658-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	a8125046-2c82-43f8-bf5a-3930226ad6d9	3
7198	DONATION	WTM Google I/O Travel Stipend	50000	USD	2017-03-17 07:09:18.868-07	2017-03-17 07:09:18.344-07	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	9972b655-8830-4ac6-b9c7-2e373feebc03	3
2331	DONATION	Network Development	15755	GBP	2016-10-07 07:03:54.031-07	2016-10-07 07:03:54.119-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15755	\N	61afdaf6-bfb9-4948-bca0-bd656fbc2d6f	3
3510	DONATION	Global Development	80000	GBP	2016-11-29 13:14:00.118-08	2016-11-29 13:14:01.107-08	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80000	\N	1a0ffc67-8650-41fd-b3ff-7af4d6f81cbc	3
4376	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 08:52:05.93-08	2016-12-27 08:52:06.061-08	274	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	59f7ddd7-ade8-4ebf-977e-cb823b5ab4cd	3
4405	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 11:44:22.123-08	2016-12-27 11:44:22.207-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	3407cb90-d12e-4698-ae45-68a7626be287	3
4407	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 11:48:41.246-08	2016-12-27 11:48:41.318-08	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0764379a-89bf-4a0b-b3cf-02ced834e7c3	3
4409	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 11:51:47.92-08	2016-12-27 11:51:48.117-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	9f8c45b8-537c-4f0f-bb8a-928b528feab2	3
4411	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 11:54:51.439-08	2016-12-27 11:54:51.679-08	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0c8ffef8-b8d3-43b7-ad21-4d41571029cd	3
8305	DONATION	\N	20000	USD	2017-04-07 05:25:51.09-07	2017-04-07 05:25:51.09-07	516	3	\N	\N	\N	2393	0	0	0	USD	1	20000	20000	\N	01371a79-bfe1-455d-9fae-8901be6f2dbe	3
4189	DONATION	Global Development for Meetup fee	6000	USD	2016-12-21 10:49:53.054-08	2016-12-21 10:49:53.302-08	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	54daaaa7-92d1-4072-9e26-e3664a7eddda	3
8308	DONATION	VMWare foundation Donation - global development (Ramya V., Swathi U. and Anonymous) 	24750	USD	2017-04-07 09:43:42.261-07	2017-04-07 09:43:42.673-07	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27a1347b-f50e-4eb5-af41-d06f4b4bc654	3
7294	DONATION	Travel Stipend for Google I/O	100000	USD	2017-03-20 08:17:43.622-07	2017-03-20 08:17:42.994-07	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	e9057982-2758-4b71-96a7-7e852f7d4a0e	3
4246	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-23 08:32:00.456-08	2016-12-23 08:32:00.622-08	260	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	713fdfe3-6cf7-4520-aee5-e18c6cf12071	3
4248	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-23 08:45:15.022-08	2016-12-23 08:45:15.147-08	261	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	34260b9e-5cfa-458e-9861-4b037755571a	3
4250	DONATION	Global Development for Meetup Fees	6000	USD	2016-12-23 08:50:35.869-08	2016-12-23 08:50:36.131-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	7adbc52c-6996-4d28-899c-835e1561a1b0	3
4252	DONATION	Global Development for Meetup Fees	6000	USD	2016-12-23 08:54:04.928-08	2016-12-23 08:54:05.055-08	262	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	084b10da-1bc1-4f57-84d2-3f7089d7c993	3
7295	DONATION	Paypal Fees for Travel Stipend	3000	USD	2017-03-20 08:38:54.453-07	2017-03-20 08:38:53.749-07	277	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3000	\N	fea87b26-175e-46ed-b94c-5d7bcec1778f	3
4280	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-23 11:37:32.49-08	2016-12-23 11:37:32.668-08	268	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	4e27357d-7c4c-43e4-b29e-773872e443e8	3
4282	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-23 11:40:51.309-08	2016-12-23 11:40:51.479-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	bf5087f3-ca93-402e-8c80-5383c23112a4	3
4284	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-23 11:48:39.526-08	2016-12-23 11:48:39.685-08	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	cc5c76d9-46e6-4435-8ec6-f0328e93c66c	3
4434	DONATION	Global Development for Meetup Fee	6000	JPY	2016-12-28 08:00:53.27-08	2016-12-28 08:00:49.939-08	295	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0dfc10e6-6037-41d3-a5cd-6ba9f5471978	3
4435	DONATION	Global Development for Meetup Fee	6000	CAD	2016-12-28 08:21:14.024-08	2016-12-28 08:21:10.449-08	291	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	06fa2587-6ff6-4229-ab30-031b2088aa97	3
4437	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-28 08:24:49.292-08	2016-12-28 08:24:45.838-08	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	1f4c7218-151d-4502-a979-3271e65d57da	3
4439	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-28 08:27:36.9-08	2016-12-28 08:27:33.309-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	23d6372f-2d2d-4cbb-afee-5a05e2ef89ce	3
4404	DONATION	Global Development for Meetup Fees	6000	USD	2016-12-27 10:40:49.86-08	2016-12-27 10:40:49.921-08	286	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	84192755-dac6-4b18-996a-89fe17acc8d1	3
4363	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 08:14:47.836-08	2016-12-27 08:14:47.951-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	e496c717-ce4a-41a6-b861-8eae2c81db9c	3
4365	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 08:22:09.234-08	2016-12-27 08:22:09.351-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	88c4ac88-4f6e-40d9-8cdb-5eee6e9a9dee	3
4367	DONATION	Global Development for Meetup Fee	6000	INR	2016-12-27 08:24:37.915-08	2016-12-27 08:24:38.038-08	47	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	c54c243c-29a5-4006-b821-adc4d3a389ee	3
4368	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 08:30:02.12-08	2016-12-27 08:30:02.272-08	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	69ec7f71-fdf4-4fc1-a013-bcdf6353b94c	3
4389	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 09:48:49.207-08	2016-12-27 09:48:49.297-08	280	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	076d787a-dbfb-4781-b854-e3cd9da444ec	3
4391	DONATION	Global Development for Meetup Fee	6000	AUD	2016-12-27 09:52:16.09-08	2016-12-27 09:52:16.167-08	281	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6f001acd-c75e-4d02-a339-faede0477c42	3
4393	DONATION	Global Development for Meetup Fee	6000	MXN	2016-12-27 09:56:03.911-08	2016-12-27 09:56:03.985-08	282	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	910351cc-fb5f-43ea-bccb-fa3a211093a7	3
4395	DONATION	Global Development for Meetup Fee	6000	MXN	2016-12-27 09:59:52.939-08	2016-12-27 09:59:53.047-08	10	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	52f1331f-b669-4782-b63a-984ccb097928	3
4397	DONATION	Global Development for Meetup Fee	5700	EUR	2016-12-27 10:10:14.864-08	2016-12-27 10:10:14.928-08	283	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5700	\N	f09463dc-da20-4c6a-95fc-b96c106b3d00	3
4400	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 10:33:56.275-08	2016-12-27 10:33:56.372-08	284	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	2f11fdfd-c8b2-4a58-8669-76610d85ac20	3
4402	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-27 10:37:31.611-08	2016-12-27 10:37:31.721-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	4d7adb92-d878-4a73-9f39-2c1f66559ba7	3
4426	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-28 07:46:26.348-08	2016-12-28 07:46:22.824-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	549184b8-9951-44b3-804f-5306177e8ec1	3
4428	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-28 07:51:42.465-08	2016-12-28 07:51:38.84-08	289	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	6ed65fc3-0248-4071-bdbd-1a43018a5a2e	3
4430	DONATION	Global Development for Meetup Fee	6000	AUD	2016-12-28 07:55:25.022-08	2016-12-28 07:55:21.475-08	297	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	1fa71cb1-e48d-4b0c-b102-30d66d120a1e	3
4432	DONATION	Global Development for Meetup Fee	6000	USD	2016-12-28 07:57:55.359-08	2016-12-28 07:57:51.831-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6000	\N	0deb855b-d632-43c8-a2e3-f90f0db86bb4	3
857	DONATION	Recurring subscription	100	USD	2016-06-09 10:28:30.802-07	2016-06-09 10:28:30.841-07	3	8	385	\N	\N	320	5	10	33	USD	1	100	52	\N	78157dc7-3c5e-4ff2-a9ce-819906bd27fc	3
8350	DONATION	monthly recurring subscription	100	USD	2017-04-09 11:28:49.104-07	2017-04-09 11:28:49.104-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	1ecffc14-65af-42e5-933f-1520f76d4685	3
673	DONATION	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	50000	USD	2016-05-26 13:48:43.015-07	2016-05-26 13:48:43.336-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50000	\N	93c08587-c4fb-4077-9f65-00b8920ce72e	3
4586	DONATION	Recurring subscription	1000	USD	2017-01-01 15:32:21.416-08	2017-01-01 15:32:21.416-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	630da817-bfc6-4c3e-8ef4-45d11c81e37e	3
8365	DONATION	monthly recurring subscription	1000	USD	2017-04-09 21:43:06.965-07	2017-04-09 21:43:06.965-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	a25de37e-df40-4317-90a5-36e217a8ba46	3
9848	DONATION	\N	16563	EUR	2017-05-08 08:30:18.585-07	2017-05-08 08:30:18.585-07	301	3	\N	\N	\N	2741	0	0	0	EUR	1	16563	16563	\N	04ec7dd9-0032-4318-99fa-52e21ff493ee	3
9863	DONATION	\N	1000	USD	2017-05-08 22:59:15.573-07	2017-05-08 22:59:15.573-07	517	4711	2855	\N	\N	2750	50	100	52	USD	1	1000	798	\N	e3494f7e-351e-478a-937b-32ca9c60513f	3
7374	DONATION	Leadership Development: Google I/O grant for Luisa M.	100000	USD	2017-03-22 10:56:10.528-07	2017-03-22 10:56:10.804-07	3	3	\N	\N	\N	\N	\N	\N	\N	USD	1	\N	100000	\N	3144121e-26df-4745-84f9-51b0af25530c	3
4793	DONATION	Recurring subscription	1000	USD	2017-01-09 20:43:19.956-08	2017-01-09 20:43:19.956-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	2c128b7c-932b-47b7-af1a-311fa87351de	3
8398	DONATION	\N	25000	USD	2017-04-10 18:09:50.621-07	2017-04-10 18:09:50.621-07	13	4153	2535	\N	\N	2421	1250	2500	580	USD	1	25000	20670	\N	d4c8f44d-4c88-4533-87da-1bd5b6f1f16b	3
9879	DONATION	\N	84000	USD	2017-05-09 11:14:23.283-07	2017-05-09 11:14:23.283-07	2	4720	2860	\N	\N	2755	4200	8400	1878	USD	1	84000	69522	\N	254136b6-233d-4361-9aa2-ceddc7305fe8	3
8427	DONATION	\N	2500	USD	2017-04-11 19:05:36.032-07	2017-04-11 19:05:36.032-07	13	4173	2546	\N	\N	2430	125	250	85	USD	1	2500	2040	\N	b9bf7bb6-c80e-4b7f-8729-f2e26f39f5e9	3
5022	DONATION	WWCode t-shirt sales	1106	USD	2017-01-17 19:29:09.407-08	2017-01-17 19:29:09.561-08	14	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1106	\N	ee1df537-bb8d-44e0-ada4-42c56888c466	3
5023	DONATION	WWCode t-shirt sales	1964	USD	2017-01-17 19:29:40.155-08	2017-01-17 19:29:40.284-08	273	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1964	\N	6dc8501e-0ceb-40ab-b920-9dc4d4de6ce3	3
5024	DONATION	WWCode t-shirt sales	982	USD	2017-01-17 19:30:10.748-08	2017-01-17 19:30:10.906-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	982	\N	35f3b1a6-7368-418d-9a03-f1da4b5de91f	3
5025	DONATION	WWCode t-shirt sales	2778	USD	2017-01-17 19:30:54.132-08	2017-01-17 19:30:54.465-08	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2778	\N	bf1209ff-a6ec-4161-8120-65342983d214	3
5026	DONATION	WWCode t-shirt sales	4742	USD	2017-01-17 19:31:50.631-08	2017-01-17 19:31:50.774-08	2	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4742	\N	971f4ef3-3672-4497-8b8e-863c2c187206	3
5027	DONATION	WWCode t-shirt sales	1389	USD	2017-01-17 19:32:30.654-08	2017-01-17 19:32:30.825-08	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1389	\N	166cbb4b-156f-4b77-84d3-a7b2bba53d7f	3
5028	DONATION	WWCode t-shirt sales	2371	USD	2017-01-17 19:33:30.061-08	2017-01-17 19:33:30.587-08	271	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2371	\N	480c104e-d92f-4c75-8e48-a396ffb0172a	3
5029	DONATION	WWCode t-shirt sales	7570	USD	2017-01-17 19:34:31.424-08	2017-01-17 19:34:31.75-08	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7570	\N	98fcd6a4-bf53-4bc0-8277-7935794a138b	3
5031	DONATION	Donation via meetup	775	USD	2017-01-17 19:48:10.558-08	2017-01-17 19:48:10.699-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	\N	060c2bcb-850a-442e-96a3-907124fbb5e6	3
9898	DONATION	monthly recurring subscription	1000	USD	2017-05-09 21:43:13.462-07	2017-05-09 21:43:13.462-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	96fff2b3-0c71-4009-8d16-285415e17f66	3
5750	DONATION	Donations - Fees 	17328	USD	2017-02-06 12:06:15.502-08	2017-02-06 12:06:15.622-08	2	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	173	\N	3bda2f71-4a09-4f4d-9ba9-4d52bdcd10a5	3
5751	DONATION	Taipei Donation - fees and global development	800	USD	2017-02-06 12:11:26.406-08	2017-02-06 12:11:26.522-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	7de04ec6-4f91-4e9f-a7e1-f3ccc020cacc	3
5277	DONATION	Global Network Development	500000	USD	2017-01-25 10:27:46.907-08	2017-01-25 10:27:47.421-08	51	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500000	\N	54b79a9d-1205-4d4c-aa91-534fa732fefb	3
5754	DONATION	Donation - fees	800	USD	2017-02-06 14:10:44.604-08	2017-02-06 14:10:44.763-08	270	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	\N	2628a845-d10d-4426-8c12-14dba874aae2	3
5755	DONATION	Gitlab - transaction and global development	41400	USD	2017-02-06 14:12:42.534-08	2017-02-06 14:12:42.684-08	48	3	\N	2017-02-05 16:00:00-08	\N	\N	\N	\N	\N	\N	\N	\N	414	\N	ef68d68b-3fdf-4a96-951d-ac953118ce75	3
5763	DONATION	Donations via meetup - fees/global development	2000	USD	2017-02-06 14:56:24.306-08	2017-02-06 14:56:24.52-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	\N	96e04578-a558-4d24-a5d5-14d1b469f341	3
5764	DONATION	Donations via meetup - fees	1200	USD	2017-02-06 14:58:38.922-08	2017-02-06 14:58:39.29-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	\N	2b8aeffe-03c4-493a-a5aa-a8733db5860d	3
5948	DONATION	Macy's donation - fees and global development	435000	USD	2017-02-13 16:21:10.361-08	2017-02-13 16:21:10.558-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	435000	\N	31a781ff-5d17-4026-96c3-a5134a2aff92	3
9357	DONATION	\N	500	USD	2017-05-01 10:13:34.851-07	2017-05-01 10:13:34.851-07	516	4550	2757	\N	\N	2644	25	50	41	USD	1	500	384	\N	9470e412-b1bd-46f6-a497-907e6d8c9a4d	3
9926	DONATION	\N	1000	CAD	2017-05-10 16:45:46.737-07	2017-05-10 16:45:46.737-07	522	4749	2888	\N	\N	2783	36	71	46	USD	1.39860139860139854	715	786	\N	52d35c0c-9b28-47ca-973a-07470814a70b	3
5533	DONATION	\N	22500	USD	2017-02-01 07:16:20.999-08	2017-02-01 07:16:20.999-08	48	2898	1801	\N	\N	1709	1125	2250	525	USD	1	22500	18600	\N	6d643f90-fadf-4d61-bdcf-784eba7d76d1	3
9385	DONATION	\N	154800	USD	2017-05-01 11:02:20.511-07	2017-05-01 11:02:20.511-07	13	3	\N	\N	\N	2649	0	0	0	USD	1	154800	154800	\N	557379b2-4691-47ed-b4bc-30b67a70bcf1	3
7511	DONATION	Leadership Development: Google I/O travel grant for Gen A. 	85000	USD	2017-03-27 06:25:14.008-07	2017-03-27 06:25:14.169-07	278	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	85000	\N	7092cdf1-407a-4c49-bddd-4729693bb136	3
9943	DONATION	\N	90000	USD	2017-05-11 09:41:16.759-07	2017-05-11 09:41:16.759-07	59	3	\N	\N	\N	2794	0	0	0	USD	1	90000	90000	\N	97b3a399-75b9-4ed4-b244-db56f1e2cac0	3
7518	DONATION	\N	50000	USD	2017-03-27 10:10:04.622-07	2017-03-27 10:10:04.622-07	12	3	\N	\N	\N	2151	0	0	0	USD	1	50000	50000	\N	9c3381f8-416c-44f2-8e0a-a9d37855a5fe	3
6733	DONATION	Event sponsorship - transaction fees and global development 	856500	USD	2017-03-01 22:00:43.46-08	2017-03-01 22:00:44.182-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	856500	\N	7fef39d1-1059-4a44-94f9-5da063341c94	3
7523	DONATION	\N	20000	USD	2017-03-27 10:45:17.58-07	2017-03-27 10:45:17.58-07	59	3	\N	\N	\N	2152	0	0	0	USD	1	20000	20000	\N	21139f0a-dcfa-4a47-90cd-bdf239e2cbcb	3
7525	DONATION	\N	100000	USD	2017-03-27 10:52:38.123-07	2017-03-27 10:52:38.123-07	277	3	\N	\N	\N	2153	0	0	0	USD	1	100000	100000	\N	5fd1044d-b479-447e-bfb5-e6f578c69921	3
2337	DONATION	Quotient Hackathon support	90000	USD	2016-10-07 12:52:59.206-07	2016-10-07 12:52:59.391-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90000	\N	9790ad68-05b0-4f76-a64a-0bfb9ffb7686	3
7526	DONATION	\N	100000	USD	2017-03-27 10:53:48.539-07	2017-03-27 10:53:48.539-07	277	3	\N	\N	\N	2154	0	0	0	USD	1	100000	100000	\N	79f34f13-1a21-48bc-8119-ab5cf030a034	3
9408	DONATION	monthly recurring subscription	2500	USD	2017-05-01 11:32:00.085-07	2017-05-01 11:32:00.085-07	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	2fcb187e-35f4-4735-9101-698ea41ab1aa	3
614	DONATION	Women Techmaker WWCode Partnership Grant	70000	USD	2016-05-19 12:17:47.24-07	2016-05-19 12:17:48.401-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	70000	\N	ddd97a2d-71eb-4643-aae4-af9a7e7fad4e	3
675	DONATION	WOMEN TECHMAKER WWCODE PARTNERSHIP GRANT	34750	USD	2016-05-26 13:50:28.413-07	2016-05-26 13:50:28.721-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34750	\N	5dc5651e-3b65-4b03-aa66-30990d7efb15	3
655	DONATION	Women Techmaker WWcode Partnership Grant	100000	USD	2016-05-24 13:23:16.28-07	2016-05-24 13:23:16.552-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	1afc5e7f-3794-4830-8b96-08ce05be814a	3
7554	DONATION	International Women's Day Celebrations - Global	51750	USD	2017-03-28 11:27:16.525-07	2017-03-28 11:27:16.748-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	51750	\N	f2ef8d98-6ac6-4954-bbbe-3cedd9ac7522	3
8605	DONATION	\N	4000	GBP	2017-04-17 12:31:52.919-07	2017-04-17 12:31:52.919-07	267	3	\N	\N	\N	2470	0	0	0	GBP	1	4000	4000	\N	c32af448-af25-450f-9fe0-4b3c5f8345a5	3
8606	DONATION	\N	9000	USD	2017-04-17 12:41:07.659-07	2017-04-17 12:41:07.659-07	277	3	\N	\N	\N	2471	0	0	0	USD	1	9000	9000	\N	58e25bdf-36bf-4707-bb32-eabd40e0558f	3
8608	DONATION	\N	100000	USD	2017-04-17 13:41:37.627-07	2017-04-17 13:41:37.627-07	517	3	\N	\N	\N	2472	0	0	0	USD	1	100000	100000	\N	58ac0411-2d75-4b99-b49f-853c0659a78e	3
8609	DONATION	\N	5000	USD	2017-04-17 13:41:53.602-07	2017-04-17 13:41:53.602-07	517	3	\N	\N	\N	2473	0	0	0	USD	1	5000	5000	\N	434d7fb0-0b13-4100-bcc9-38a711f799ad	3
8611	DONATION	\N	85000	GBP	2017-04-17 14:05:15.067-07	2017-04-17 14:05:15.067-07	278	3	\N	\N	\N	2474	0	0	0	GBP	1	85000	85000	\N	afc6310f-79f8-4fa7-9010-33c13c3dfeec	3
8612	DONATION	\N	4250	GBP	2017-04-17 14:06:54.803-07	2017-04-17 14:06:54.803-07	278	3	\N	\N	\N	2475	0	0	0	GBP	1	4250	4250	\N	cda5fd1c-4285-4631-aff6-7a4a1fb62bcb	3
8615	DONATION	\N	100000	USD	2017-04-17 15:09:42.57-07	2017-04-17 15:09:42.57-07	270	3	\N	\N	\N	2477	0	0	0	USD	1	100000	100000	\N	d6795ff7-d1a1-4a77-a77b-a0731062a244	3
8617	DONATION	\N	41000	GBP	2017-04-17 15:31:52.729-07	2017-04-17 15:31:52.729-07	278	3	\N	\N	\N	2486	0	0	0	GBP	1	41000	41000	\N	463ec0d3-ae29-42e5-97ee-277cca8ceca9	3
8619	DONATION	\N	25000	MXN	2017-04-17 15:34:32.259-07	2017-04-17 15:34:32.259-07	511	3	\N	\N	\N	2487	0	0	0	MXN	1	25000	25000	\N	3b170ab8-edef-4461-983d-efd3689fda2c	3
8620	DONATION	\N	18800	MXN	2017-04-17 15:35:06.093-07	2017-04-17 15:35:06.093-07	511	3	\N	\N	\N	2488	0	0	0	MXN	1	18800	18800	\N	72c1775e-82bb-418c-8112-0953e2c003a2	3
8621	DONATION	\N	2200	MXN	2017-04-17 15:35:55.014-07	2017-04-17 15:35:55.014-07	511	3	\N	\N	\N	2489	0	0	0	MXN	1	2200	2200	\N	a30d7b67-9e28-40c1-a02c-9fd585600114	3
8624	DONATION	\N	100000	USD	2017-04-17 15:40:40.357-07	2017-04-17 15:40:40.357-07	430	3	\N	\N	\N	2490	0	0	0	USD	1	100000	100000	\N	37a49008-00ca-489c-876a-6d26c25a46bb	3
10051	DONATION	\N	20000	USD	2017-05-15 05:07:59.63-07	2017-05-15 05:07:59.63-07	14	4834	2922	\N	\N	2817	1000	2000	470	USD	1	20000	16530	\N	2f09aa94-9b15-47bc-8e9c-b8ab6d67d426	3
2338	DONATION	VMWare Network Support	195000	USD	2016-10-07 12:55:50.273-07	2016-10-07 12:55:50.509-07	300	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	195000	\N	e0aedba4-c471-4406-bc4c-480b6388a75d	3
8664	DONATION	\N	3562	GBP	2017-04-18 12:41:30.286-07	2017-04-18 12:41:30.286-07	278	3	\N	\N	\N	2503	0	0	0	GBP	1	3562	3562	\N	0557cec2-bc9a-43c5-a702-38116a1ab389	3
8671	DONATION	\N	1198	USD	2017-04-18 17:19:14.321-07	2017-04-18 17:19:14.321-07	12	3	\N	\N	\N	2505	0	0	0	USD	1	1198	1198	\N	ff39b4d0-ec21-448e-a987-b2cf172c5bdc	3
8672	DONATION	\N	1480	USD	2017-04-18 17:20:11.527-07	2017-04-18 17:20:11.527-07	12	3	\N	\N	\N	2506	0	0	0	USD	1	1480	1480	\N	41154072-0424-4ec6-9f81-9ca8cce5420a	3
8673	DONATION	\N	1400	USD	2017-04-18 17:31:31.942-07	2017-04-18 17:31:31.942-07	195	3	\N	\N	\N	2507	0	0	0	USD	1	1400	1400	\N	36ea5d6f-9e03-4116-8db7-201d91018475	3
7661	DONATION	\N	50000	USD	2017-03-31 10:17:51.695-07	2017-03-31 10:17:51.695-07	2	3	\N	\N	\N	2204	0	0	0	USD	1	50000	50000	\N	fbf7dada-78ae-4886-9094-aed19838ed67	3
7662	DONATION	\N	79600	GBP	2017-03-31 10:20:23.917-07	2017-03-31 10:20:23.917-07	267	3	\N	\N	\N	2206	0	0	0	GBP	1	79600	79600	\N	bd840d8c-6019-4588-bc03-94a0ae07b331	3
8675	DONATION	\N	1480	USD	2017-04-18 17:39:23.15-07	2017-04-18 17:39:23.15-07	14	3	\N	\N	\N	2508	0	0	0	USD	1	1480	1480	\N	85822cfc-ab85-4318-b357-4cbff6b96682	3
7665	DONATION	\N	80500	GBP	2017-03-31 10:54:33.461-07	2017-03-31 10:54:33.461-07	278	3	\N	\N	\N	2208	0	0	0	GBP	1	80500	80500	\N	d7f6d62d-4f73-400b-ac9e-57bcfac50780	3
7667	DONATION	\N	39800	GBP	2017-03-31 11:01:48.418-07	2017-03-31 11:01:48.418-07	278	3	\N	\N	\N	2209	0	0	0	GBP	1	39800	39800	\N	f38d81a7-0640-43e1-adaa-eae03b43254a	3
6421	DONATION	\N	30000	CAD	2017-02-27 16:25:20.325-08	2017-02-27 16:25:20.325-08	522	3301	2030	\N	\N	1935	1121	1120	523	USD	1.33832976445396135	22416	26301	\N	e838bae8-af91-48a1-8619-e42c8aab84c7	3
7683	DONATION	\N	100000	USD	2017-03-31 15:32:34.123-07	2017-03-31 15:32:34.123-07	286	3	\N	\N	\N	2212	0	0	0	USD	1	100000	100000	\N	ed1324c1-c55c-47b7-ac88-afc3f3ba3a7d	3
7686	DONATION	\N	20000	USD	2017-03-31 15:50:23.915-07	2017-03-31 15:50:23.915-07	286	3	\N	\N	\N	2214	0	0	0	USD	1	20000	20000	\N	93ca4243-7895-4061-b20e-8d0aaaa2a3f9	3
7687	DONATION	\N	7500	USD	2017-03-31 15:52:45.079-07	2017-03-31 15:52:45.079-07	286	3	\N	\N	\N	2215	0	0	0	USD	1	7500	7500	\N	a8c774d9-c22c-4df9-a8a2-7b7fb56da05c	3
7688	DONATION	\N	50000	CAD	2017-03-31 16:37:30.819-07	2017-03-31 16:37:30.819-07	291	3	\N	\N	\N	2217	0	0	0	CAD	1	50000	50000	\N	5c191b8e-cc26-4f14-9ad4-bc6c7f3e1f05	3
9595	DONATION	monthly recurring subscription	1000	USD	2017-05-01 16:34:11.708-07	2017-05-01 16:34:11.708-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	c70f2fd8-da04-4f99-97a1-72c05a99dfa1	3
8705	DONATION	\N	1480	USD	2017-04-19 11:18:19.043-07	2017-04-19 11:18:19.043-07	2	3	\N	\N	\N	2519	0	0	0	USD	1	1480	1480	\N	48409b35-4280-4659-971c-3ec3178252f0	3
8706	DONATION	\N	40000	USD	2017-04-19 11:26:01.228-07	2017-04-19 11:26:01.228-07	3	3	\N	\N	\N	2520	0	0	0	USD	1	40000	40000	\N	5272792e-d8c4-4354-8dff-c2e24a66999a	3
8707	DONATION	\N	1190	USD	2017-04-19 11:26:58.997-07	2017-04-19 11:26:58.997-07	3	3	\N	\N	\N	2521	0	0	0	USD	1	1190	1190	\N	6189157f-8088-48c0-9964-a66fe4fcfee1	3
8708	DONATION	\N	610	USD	2017-04-19 11:35:03.04-07	2017-04-19 11:35:03.04-07	59	3	\N	\N	\N	2522	0	0	0	USD	1	610	610	\N	477a5aef-b895-4774-8b86-b1f5156fd8b6	3
8728	DONATION	\N	10000	USD	2017-04-20 03:17:23.286-07	2017-04-20 03:17:23.286-07	59	4348	2643	\N	\N	2532	500	1000	350	USD	1	10000	8150	\N	04384e27-0f6b-407a-a8d1-e8353f9a4c98	3
9621	DONATION	\N	2930	USD	2017-05-01 17:33:45.73-07	2017-05-01 17:33:45.73-07	3	3	\N	\N	\N	2662	0	0	0	USD	1	2930	2930	\N	08015eaa-ad1d-4dd5-9704-3de345b88094	3
290	DONATION	Recurring subscription	100	USD	2016-04-02 19:02:46.616-07	2016-04-16 13:40:58.82-07	14	8	45	\N	\N	71	5	10	33	USD	1	100	52	\N	3464d1b8-8be5-451a-bee5-fd4129ac6455	3
5540	DONATION	\N	2500	USD	2017-02-01 09:30:48.467-08	2017-02-01 09:30:48.467-08	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	a88cbaf9-3c16-494f-9fb9-1ff207e24d4a	3
449	DONATION	Donation to WWCode Washington DC	50000	USD	2016-04-28 08:01:17.801-07	2016-04-28 08:01:17.846-07	13	283	213	\N	\N	181	2500	5000	1480	USD	1	50000	41020	\N	d7208bd6-4f00-4c5d-b85e-3792419450d5	3
470	DONATION	Recurring subscription	100	USD	2016-05-02 11:10:42.774-07	2016-05-02 11:10:42.847-07	13	30	43	\N	\N	69	5	10	33	USD	1	100	52	\N	f99307f9-7e49-4414-a2cf-c69326ceb1c4	3
472	DONATION	Recurring subscription	100	USD	2016-05-02 11:15:35.25-07	2016-05-02 11:15:35.307-07	13	30	44	\N	\N	70	5	10	33	USD	1	100	52	\N	89fe586a-cc2d-4bbe-9781-196390e19e37	3
478	DONATION	Donation to WWCode Austin	150000	USD	2016-05-03 06:07:28.39-07	2016-05-03 06:07:28.452-07	2	308	230	\N	\N	191	7500	15000	4380	USD	1	150000	123120	\N	31bd69fa-cc92-405a-a116-d31a2a40d4d1	3
616	DONATION	Donation to WWCode Austin	50000	USD	2016-05-19 12:24:43.134-07	2016-05-19 12:24:43.182-07	2	392	288	\N	\N	246	2500	5000	1480	USD	1	50000	41020	\N	4590ecf9-25b0-4935-9570-12af202cc187	3
645	DONATION	Donation to WWCode Austin	50000	USD	2016-05-23 13:27:28.524-07	2016-05-23 13:27:28.599-07	2	426	306	\N	\N	258	2500	5000	1480	USD	1	50000	41020	\N	f63c7344-8631-43e0-8d56-70bf3f01998c	3
337	DONATION	Donation to WWCode Austin	20000	USD	2016-04-13 09:46:10.463-07	2016-04-16 13:40:58.845-07	2	224	173	\N	\N	153	1000	2000	610	USD	1	20000	16390	\N	07e21011-0879-4523-b624-073fdfd704c3	3
986	DONATION	Donation to WWCode Twin Cities	100	USD	2016-06-21 09:06:05.517-07	2016-06-21 09:06:05.626-07	48	642	432	\N	\N	361	5	10	32	USD	1	100	53	\N	44e3ee1d-5777-4ea7-9dfb-e651db755946	3
984	DONATION	Donation to WWCode Atlanta	100	USD	2016-06-21 09:02:56.072-07	2016-06-21 09:02:56.13-07	12	642	430	\N	\N	359	5	10	32	USD	1	100	53	\N	fdf511fc-d0e4-4322-aa0a-49ebacbb1e08	3
1080	DONATION	Recurring subscription	1000	USD	2016-07-01 15:38:37.594-07	2016-07-01 15:38:37.617-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	d414ca78-a0ca-4706-8533-c9f54acba200	3
1174	DONATION	Recurring subscription	100	USD	2016-07-09 11:31:14.547-07	2016-07-09 11:31:14.585-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	321662c1-bd0e-45c1-a83b-15734580a904	3
2303	DONATION	Network development (stickers)	58590	USD	2016-10-06 09:08:20.916-07	2016-10-06 09:08:21.09-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	58590	\N	3169934f-3f78-4faa-959d-7141ff24163b	3
1392	DONATION	Donation to WWCode Austin	20000	USD	2016-08-01 08:55:27.083-07	2016-08-01 08:55:27.184-07	2	884	562	\N	\N	489	1000	2000	470	USD	1	20000	16530	\N	c0b172e7-1ce8-45a7-a51d-5c1098baeeb8	3
1391	DONATION	Donation to WWCode Austin	150000	USD	2016-08-01 08:54:14.382-07	2016-08-01 08:54:14.468-07	2	883	561	\N	\N	488	7500	15000	3330	USD	1	150000	124170	\N	0577aa52-6ea8-4268-9559-de120c9fd743	3
1395	DONATION	Recurring subscription	1000	USD	2016-08-01 16:35:39.219-07	2016-08-01 16:35:39.244-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	9056ebd9-568b-47c4-ba61-a4830e554a1c	3
1461	DONATION	Donation to WWCode Austin	150000	USD	2016-08-05 13:48:08.414-07	2016-08-05 13:48:08.458-07	2	192	589	\N	\N	513	7500	15000	5250	USD	1	150000	122250	\N	3cd012ba-7cbf-4008-b0db-7a4b51a0d7df	3
1498	DONATION	Recurring subscription	100	USD	2016-08-09 11:30:50.866-07	2016-08-09 11:30:50.915-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	8a688e20-988b-4f55-b69d-bb6632da3ece	3
1787	DONATION	\N	200000	USD	2016-09-01 07:41:36.24-07	2016-09-01 07:41:36.24-07	2	1094	707	\N	\N	622	10000	20000	4430	USD	1	200000	165570	\N	b7a1007d-6e00-4764-b983-c9d27abc2296	3
2539	EXPENSE	Director t-shirt	-3325	USD	2016-10-17 14:01:02.872-07	2016-10-17 14:01:02.925-07	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3325	\N	73b25042-c1cc-45c6-9089-ec29736609fb	3
1792	DONATION	Recurring subscription	1000	USD	2016-09-01 16:32:42.475-07	2016-09-01 16:32:42.475-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	f8a6849c-0a33-4c9a-b04f-a5f96d063bfc	3
1876	DONATION	Recurring subscription	100	USD	2016-09-09 11:29:12.276-07	2016-09-09 11:29:12.276-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	0883360f-716b-4be8-a920-9ab0f71e399b	3
1884	DONATION	Recurring subscription	1000	USD	2016-09-09 20:42:56.392-07	2016-09-09 20:42:56.392-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	a73ee6ae-c18d-406f-a24b-4c04f218c3e3	3
2055	DONATION	\N	25000	USD	2016-09-22 18:07:09.492-07	2016-09-22 18:07:09.492-07	59	1263	790	\N	\N	700	1250	2500	580	USD	1	25000	20670	\N	c037d2a1-7fa4-4875-b084-2c8d7605d567	3
2143	DONATION	\N	19000	USD	2016-09-28 14:47:18.302-07	2016-09-28 14:47:18.302-07	2	1299	842	\N	\N	768	950	1900	665	USD	1	19000	15485	\N	c4585b37-a213-4c1c-ba1f-8b9a0a9e3793	3
2360	DONATION	Recurring subscription	100	USD	2016-10-09 11:36:17.958-07	2016-10-09 11:36:17.958-07	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	53835d40-3ec2-48e7-8d85-8f9381ef368c	3
2336	DONATION	\N	2500	USD	2016-10-07 09:49:19.978-07	2016-10-07 09:49:19.978-07	241	1446	884	\N	\N	812	125	250	85	USD	1	2500	2040	\N	2ac309ea-89ad-4880-b72a-67054d83865d	3
2370	DONATION	Recurring subscription	1000	USD	2016-10-09 21:49:33.558-07	2016-10-09 21:49:33.558-07	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	270aedde-c9b9-4d4d-b0b2-c79795f17316	3
8756	DONATION	AJUG - Global and fees	26250	USD	2017-04-20 14:39:17.741-07	2017-04-20 14:39:18.323-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	a365b026-a438-43c2-9628-8abfa5258787	3
330	DONATION	Intel Donation	100000	USD	2016-04-12 13:32:35.997-07	2016-04-16 13:40:58.826-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100000	\N	925c1460-bda7-448f-8dd9-83291db33330	3
334	DONATION	From Deepa	1500	USD	2016-04-12 14:19:00.212-07	2016-04-12 14:19:00.529-07	4	3	\N	2016-04-14 14:19:00.529-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3be9f7b2-c97b-41ac-b2bf-2e8dbd11ca27	3
2887	DONATION	Recurring subscription	1000	USD	2016-11-01 16:32:30.439-07	2016-11-01 16:32:30.439-07	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	103586f6-637d-4a72-87bc-a5f247e540e6	3
3056	DONATION	Recurring subscription	1000	USD	2016-11-09 20:43:57.271-08	2016-11-09 20:43:57.271-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	00ceec95-2161-4179-acba-658bcc889e16	3
3199	DONATION	\N	50000	USD	2016-11-17 09:43:29.797-08	2016-11-17 09:43:29.797-08	59	1808	1179	\N	\N	1098	2500	5000	1130	USD	1	50000	41370	\N	2d80d646-083c-4910-a320-cda0edc1cb3b	3
3320	DONATION	\N	30000	USD	2016-11-22 07:22:39.097-08	2016-11-22 07:22:39.097-08	59	1846	1211	\N	\N	1129	1500	3000	1050	USD	1	30000	24450	\N	3413acd7-804a-4bc1-9689-e91da23b2bdc	3
3471	DONATION	\N	4000	USD	2016-11-28 07:33:14.428-08	2016-11-28 07:33:14.428-08	2	1890	1249	\N	\N	1167	200	400	118	USD	1	4000	3282	\N	52c746a4-eba7-4a0f-963c-e6e2e3f22f53	3
3490	DONATION	\N	25000	EUR	2016-11-29 02:03:23.71-08	2016-11-29 02:03:23.71-08	301	1908	1257	\N	\N	1175	1301	2601	910	USD	0.961057932572175422	26013	20375	\N	49c565db-0a28-4269-8164-4c0ac9a96fe3	3
3590	DONATION	\N	20000	USD	2016-11-30 08:11:42.049-08	2016-11-30 08:11:42.049-08	2	1957	1296	\N	\N	1215	1000	2000	470	USD	1	20000	16530	\N	a7479297-dc89-46e1-bbdb-c34a5e6bd385	3
3669	DONATION	Recurring subscription	1000	USD	2016-12-01 15:32:26.764-08	2016-12-01 15:32:26.764-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	d7a57bda-4dda-46e1-badb-2dc573225d85	3
3876	DONATION	Recurring subscription	100	USD	2016-12-09 10:29:17.341-08	2016-12-09 10:29:17.341-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	77717eed-fb45-4bf8-a43d-45391bee0f68	3
3886	DONATION	Recurring subscription	1000	USD	2016-12-09 20:43:00.244-08	2016-12-09 20:43:00.244-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	3a1a2d26-2613-4c61-bb5f-a9fc2f3beffb	3
4123	DONATION	\N	2500	USD	2016-12-18 17:41:29.006-08	2016-12-18 17:41:29.006-08	259	2220	1471	\N	\N	1388	125	250	85	USD	1	2500	2040	\N	c13eb052-de5b-4e23-b45b-e405f937cfd7	3
4124	DONATION	\N	2500	USD	2016-12-18 17:42:01.104-08	2016-12-18 17:42:01.104-08	259	2220	1472	2016-12-27 16:00:00-08	\N	1389	125	250	85	USD	1	2500	2040	\N	3290a890-4996-4581-a0b7-6db14e41f5a8	3
4655	DONATION	\N	20000	USD	2017-01-03 12:59:37.749-08	2017-01-03 12:59:37.749-08	2	2416	1553	\N	\N	1466	1000	2000	470	USD	1	20000	16530	\N	9d9ae433-8160-4ad4-abba-284759515132	3
4779	DONATION	Recurring subscription	100	USD	2017-01-09 10:28:29.701-08	2017-01-09 10:28:29.701-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	410d7ba2-bc7c-4acf-9ad8-182b43caacd4	3
4899	DONATION	Recurring subscription	1000	USD	2017-01-14 09:12:01.244-08	2017-01-14 09:12:01.244-08	270	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	798	\N	63e320d2-5114-4fc3-8daa-8c636b663d98	3
4957	DONATION	\N	50000	USD	2017-01-16 10:03:56.108-08	2017-01-16 10:03:56.108-08	48	2561	1622	\N	\N	1537	2500	5000	1130	USD	1	50000	41370	\N	b7c440d2-8682-4b57-93b6-3d3dd3cfed88	3
5019	DONATION	WWCode t-shirt sales	1229	USD	2017-01-17 19:23:59.112-08	2017-01-17 19:23:59.247-08	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1229	\N	a43c6a3d-406e-43de-98bb-0e151a1b8fea	3
5020	DONATION	WWCode t-shirt sales	982	USD	2017-01-17 19:24:31.362-08	2017-01-17 19:24:31.504-08	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	982	\N	e22d04c4-f74f-4484-a0b3-9007b55c94a8	3
5044	DONATION	\N	10000	USD	2017-01-18 05:54:50.597-08	2017-01-18 05:54:50.597-08	48	2594	1647	\N	\N	1557	500	1000	250	USD	1	10000	8250	\N	629c628a-29cb-4690-b71e-ad06f390ea21	3
5578	DONATION	monthly recurring subscription	1000	USD	2017-02-01 15:34:44.326-08	2017-02-01 15:34:44.326-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	5a54016f-f69c-49ef-8d2f-f03740ca539c	3
5838	DONATION	monthly recurring subscription	100	USD	2017-02-09 10:29:30.017-08	2017-02-09 10:29:30.017-08	3	8	385	\N	\N	320	5	10	32	USD	1	100	53	\N	5c8b0763-ddec-4adc-a069-ad809703c9dd	3
5852	DONATION	monthly recurring subscription	1000	USD	2017-02-09 20:43:49.515-08	2017-02-09 20:43:49.515-08	241	1158	731	\N	\N	647	50	100	52	USD	1	1000	798	\N	86ad6819-a20f-4543-a31c-0e1a121bb79f	3
5861	DONATION	\N	84241	USD	2017-02-10 08:47:34.349-08	2017-02-10 08:47:34.349-08	15	3053	1890	\N	\N	1801	4212	8424	1883	USD	1	84241	69722	\N	fc5a47be-5fc1-4a9a-bc52-978334aa0481	3
5969	DONATION	monthly recurring subscription	1000	USD	2017-02-14 10:13:04.109-08	2017-02-14 10:13:04.109-08	270	2549	1616	\N	\N	1531	50	100	52	USD	1	1000	798	\N	41a806dd-fae3-47ec-8291-293cc822ae9b	3
6649	DONATION	monthly recurring subscription	2500	USD	2017-03-01 10:37:53.591-08	2017-03-01 10:37:53.591-08	271	2906	1804	\N	\N	1712	125	250	85	USD	1	2500	2040	\N	ec153d42-d2ae-4d56-a4aa-f223962a4ca2	3
6709	DONATION	monthly recurring subscription	1000	USD	2017-03-01 15:40:00.024-08	2017-03-01 15:40:00.024-08	2	686	461	\N	\N	386	50	100	52	USD	1	1000	798	\N	71e7d3cd-cd4b-465b-a6d1-a0242bb22558	3
6700	DONATION	\N	25000	USD	2017-03-01 14:51:20.759-08	2017-03-01 14:51:20.759-08	59	1263	2048	\N	\N	1953	1250	2500	580	USD	1	25000	20670	\N	bd4cecda-d52c-4c14-9ffa-5831f212eb3f	3
2240	EXPENSE	90/10 split: Beth Laing	-500	USD	2016-10-04 09:06:16.796-07	2016-10-04 09:06:16.796-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-500	392	0c5e3510-cf16-42de-bde2-147e6ab9a46d	3
2241	EXPENSE	90/10 split: Syema Ailia	-250	USD	2016-10-04 09:06:23.454-07	2016-10-04 09:06:23.454-07	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-250	390	3e7d1081-0039-41e3-b36f-4b37b44b3e0c	3
2302	EXPENSE	Network Stickers	-58590	USD	2016-10-06 09:08:07.615-07	2016-10-06 09:08:07.66-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-58590	\N	b48ad8e6-3729-4d25-be11-03328df1f7b8	3
2260	EXPENSE	Food at our Sept. monthly event	-11478	USD	2016-10-04 15:07:11.046-07	2016-10-04 15:07:11.615-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-11478	\N	bbb5901e-3328-4653-a858-b80c40422cd0	3
671	EXPENSE	A Small Orange	-12700	USD	2016-02-01 16:00:00-08	2016-06-14 11:14:22.114-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12700	194	d40ca73f-6c26-4d43-9c22-6e36ab38f02c	3
656	EXPENSE	Conference Grant	-100000	USD	2016-05-24 12:42:50.307-07	2016-06-14 11:14:22.103-07	3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-100000	189	e8d5c717-1fca-4334-96d2-b8fa8d899ca1	3
2426	EXPENSE	Engineering (Web) - A Small Orange	-12700	USD	2016-10-11 17:44:30.933-07	2016-10-11 17:44:31.081-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-12700	\N	0f9b2d4b-60a1-4cd9-b233-5569b822348d	3
3589	EXPENSE	Photos for sponsor gifts	-2104	USD	2016-11-30 08:11:36.238-08	2016-11-30 08:11:36.377-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2104	\N	5c8b4fc6-fa71-4ca6-ac8b-984c0d5fa454	3
3591	EXPENSE	Envelopes for hackathon sponsor prizes	-907	USD	2016-11-30 08:12:35.291-08	2016-11-30 08:12:35.54-08	2	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-907	\N	eeee1a04-ad18-42e4-8252-db32a174e369	3
3599	EXPENSE	Banner	-2000	USD	2016-11-30 10:40:24.258-08	2016-11-30 10:40:24.443-08	292	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	dddd092c-b5a8-475a-a35e-d4f12bc724d6	3
3613	EXPENSE	Leadership Development - Conference Travel Stipend Google I/O	-130000	USD	2016-11-30 13:06:48.939-08	2016-11-30 13:06:49.116-08	241	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-130000	\N	6a1fa977-065a-47a6-bf3e-ae8934921597	3
3619	EXPENSE	Banner	-2000	USD	2016-11-30 13:19:46.014-08	2016-11-30 13:19:46.128-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2000	\N	549a4d38-14e9-451f-af59-00b70014bc58	3
3622	EXPENSE	Regional Leadership Director Meeting 	-7500	USD	2016-11-30 13:20:31.263-08	2016-11-30 13:20:31.464-08	269	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7500	\N	7e10ae09-c940-4b3e-a151-459585138199	3
4256	EXPENSE	Meetup Fees	-6000	USD	2016-12-23 09:00:25.987-08	2016-12-23 09:00:25.987-08	263	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	617	57853d10-9d39-4960-9921-b48c4b182e12	3
4258	EXPENSE	Meetup Fees	-4900	GBP	2016-12-23 09:05:41.927-08	2016-12-23 09:05:41.927-08	264	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4900	618	9a33a7df-c65b-40f9-9207-191220694bc5	3
4260	EXPENSE	Meetup Fees	-6000	USD	2016-12-23 09:10:34.733-08	2016-12-23 09:10:34.733-08	265	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	619	eb811f1b-7c0b-4d61-9105-9366e6aa84d8	3
4262	EXPENSE	Meetup Fees	-5700	EUR	2016-12-23 09:15:16.054-08	2016-12-23 09:15:16.054-08	301	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	620	274351b9-2cc0-438e-8c7d-4a8e7771bb0c	3
4264	EXPENSE	Meetup Fees	-6000	USD	2016-12-23 09:21:53.018-08	2016-12-23 09:21:53.018-08	259	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	621	0446afb9-0ce6-4148-a588-e6ac299a3997	3
4268	EXPENSE	Meetup Fees	-6000	AUD	2016-12-23 09:42:18.688-08	2016-12-23 09:42:18.688-08	266	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	623	f36420c0-4283-44cb-a9c5-d91eb735988f	3
4371	EXPENSE	Meetup Fees	-5700	EUR	2016-12-27 08:36:05.296-08	2016-12-27 08:36:05.296-08	298	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-5700	637	33760db0-25e7-4b85-89df-040f38e22adb	3
4373	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 08:41:27.235-08	2016-12-27 08:41:27.235-08	272	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	638	c036838f-9cbc-45c5-935f-9d9b57ea2836	3
8237	EXPENSE	Meetup Fees	-6000	USD	2017-04-05 07:19:21.293-07	2017-04-05 07:19:21.293-07	295	3	\N	\N	\N	\N	\N	\N	0	USD	1	-6000	-6000	988	87b9bea2-2195-4ea2-b065-d18bc0c3368c	3
539	EXPENSE	Conference Expense	-8320	USD	2016-05-10 12:19:21.785-07	2016-06-14 11:14:22.042-07	48	3	\N	2016-06-14 11:14:22.515-07	\N	\N	\N	\N	\N	\N	\N	\N	-8320	158	158dcb8d-7226-4bd0-a0c6-601340d5ab84	3
377	EXPENSE	WePay fee	-125	USD	2016-04-17 15:19:12.094-07	2016-06-14 11:14:21.883-07	13	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-125	95	535a716d-edbd-4914-9b57-78bd671fd49a	3
254	EXPENSE	WwConnect2016	-1025	USD	2016-03-19 17:00:00-07	2016-06-14 11:14:21.806-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1025	64	f42fde8c-31a0-49b2-ae8e-8a12eca9f4f5	3
641	EXPENSE	05-21-16 AI workshop	-30000	USD	2016-05-22 17:26:36.061-07	2016-06-14 11:14:22.092-07	2	28	\N	2016-06-14 11:14:22.535-07	\N	\N	\N	\N	\N	\N	\N	\N	-30000	186	b1caa950-29a7-4b01-b194-5ad97dade460	3
859	EXPENSE	Global Development 	-150	USD	2016-06-09 11:38:16.857-07	2016-06-14 11:14:22.175-07	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-150	222	33ddf644-201a-470f-b745-de2dece2159b	3
674	EXPENSE	CONFERENCE GRANT	-50000	USD	2016-05-10 17:00:00-07	2016-06-14 11:14:22.114-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	196	7916b5ad-1d71-481f-b774-1a9d79d2c8e0	3
822	EXPENSE	3/30/16 Python Gameathon prize - Udemy course	-2400	USD	2016-06-04 14:37:03.991-07	2016-06-14 11:14:22.155-07	2	28	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2400	213	0870d634-022a-48de-ac16-c6f668cbea2f	3
864	EXPENSE	Reimburse Caterina Paun for Program Expenses	-9995	USD	2016-02-24 16:00:00-08	2016-06-14 11:14:22.175-07	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-9995	224	9f16d9b5-e350-4ca4-8b8f-59334d6ef9f3	3
1580	EXPENSE	Drinks for July monthly event	-3316	USD	2016-08-16 07:53:42.013-07	2016-08-16 07:53:42.04-07	15	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3316	\N	bc1e4ea6-63a9-41a3-bd5a-a25ff1b41c37	3
1403	EXPENSE	Transportation for Sandra and Cici to get to meeting location with core team members	-749	USD	2016-08-02 06:39:15.789-07	2016-08-02 06:39:15.797-07	14	31	320	\N	\N	\N	\N	\N	\N	\N	\N	\N	-749	256	c50bb623-b773-41c6-b71f-c815f6a3394c	3
1627	EXPENSE	Event supplies	-1797	USD	2016-08-19 10:24:23.638-07	2016-08-19 10:24:24.362-07	59	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1797	\N	aaa90df5-783d-4af5-aadb-848d7da27db0	3
1630	EXPENSE	Dinner for last night's HackNight	-13526	USD	2016-08-19 13:58:34.342-07	2016-08-19 13:58:34.554-07	48	3	573	\N	\N	\N	\N	\N	\N	\N	\N	\N	-13526	319	e4f6cb02-9565-4e90-8156-b4b6f7190889	3
538	EXPENSE	Conference Grant - Sarah Olson	-110000	USD	2016-05-10 12:19:21.785-07	2016-06-14 11:14:22.032-07	48	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-110000	156	5b6a81e3-f2e8-4385-b39e-135cb7b5bb85	3
2809	EXPENSE	Costco breakfast, lunch, drinks, plates, cups, utensils, snacks, deserts ...	-48435	USD	2016-10-31 14:08:49.332-07	2016-10-31 14:08:49.517-07	300	3	1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	-48435	417	7bfc67b7-3dd7-4f2c-a42e-1fd52bf01230	3
3313	EXPENSE	Thank you gift to an amazing sponsor!	-1700	USD	2016-11-22 04:31:00.49-08	2016-11-22 04:31:00.691-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-1700	501	125a7d4b-8e1c-43c0-af9a-e948de08c5a3	3
3949	EXPENSE	Post-hackathon shipping supplies + supplies for Women + Tech Holiday Party	-3776	USD	2016-12-13 10:41:20.962-08	2016-12-13 10:41:21.652-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3776	\N	962a1612-7780-4b02-809c-bba5e34b9bf9	3
4266	EXPENSE	Meetup Fees	-6000	USD	2016-12-23 09:32:55.31-08	2016-12-23 09:32:55.31-08	195	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	622	f3c80fd2-e51b-4124-a687-69f0abae37d6	3
3837	EXPENSE	Food/Drinks for Leadership Team Meeting - Gen, Claire - Oct 2016	-4000	GBP	2016-12-06 21:00:00.86-08	2016-12-06 21:00:00.86-08	278	1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-4000	507	57ffa5d8-ca36-46bc-8a78-8bf44617167e	3
2842	EXPENSE	Transportation to get to GeekWire Summit social event 	-729	USD	2016-11-01 09:16:02.625-07	2016-11-01 09:16:02.953-07	14	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-729	402	f0415f03-23e6-4e11-8083-aac5401f4c17	3
7079	EXPENSE	Movie screening for "She Started It"	-25700	USD	2017-03-14 10:59:53.142-07	2017-03-14 10:59:53.153-07	48	142	2149	\N	\N	\N	\N	\N	775	USD	1	-25700	-26475	814	af730af1-7a84-42eb-8443-96f03e6c8347	3
7080	EXPENSE	Wearable Clothing Workshop	-33412	USD	2017-03-14 11:00:11.436-07	2017-03-14 11:00:11.448-07	48	142	2149	\N	\N	\N	\N	\N	999	USD	1	-33412	-34411	815	cc901377-56a8-4787-a296-673763a20a9e	3
250	EXPENSE	WwConnect Planning Meeting	-2519	USD	2016-03-10 16:00:00-08	2016-06-14 11:14:21.794-07	14	31	26	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2519	60	007274b9-395d-410d-837a-e4c2863db761	3
7082	EXPENSE	Supplies for Agile workshop (2/26)	-5798	USD	2017-03-14 11:16:43.183-07	2017-03-14 11:16:43.22-07	59	171	2149	\N	\N	\N	\N	\N	198	USD	1	-5798	-5996	858	0f6dbfcd-8b66-44e1-8bfa-82b47855e172	3
7083	EXPENSE	Leadership Development	-50616	MXN	2017-03-14 11:17:51.969-07	2017-03-14 11:17:51.969-07	282	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-50616	-50616	887	f70817df-a428-4020-8076-87771fd39b1d	3
7087	EXPENSE	Leadership Development	-14915	MXN	2017-03-14 11:18:46.358-07	2017-03-14 11:18:46.358-07	511	3	\N	\N	\N	\N	\N	\N	0	MXN	1	-14915	-14915	886	1f55f0d6-8cb7-4e26-bbce-64660bfdf8ad	3
2934	EXPENSE	Cash for Prizes/Bartender	-50000	USD	2016-11-03 12:12:34.941-07	2016-11-03 12:12:35.306-07	2	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-50000	\N	fb9d785b-41ef-4c26-965c-98709813dd5f	3
2935	EXPENSE	More stickers to give away at events	-18800	USD	2016-11-03 12:14:58.094-07	2016-11-03 12:14:58.245-07	13	3	1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	-18800	\N	31e6e55f-79bc-4a6a-800e-81bc4f5aa825	3
2940	EXPENSE	Stacey Schipper	-2322	USD	2016-11-03 12:45:04.691-07	2016-11-03 12:45:04.691-07	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2322	\N	29073502-ed37-49ed-a06e-428e9b043bf8	3
2939	EXPENSE	Event Food	-6471	USD	2016-11-03 12:43:50.827-07	2016-11-03 12:43:51.096-07	59	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6471	377	cf42497b-d717-4d8e-99cc-d12ab8b99170	3
2941	EXPENSE	Order for stickers of our official WWC Boulder/Denver chapter logo	-7800	USD	2016-11-03 12:45:23.582-07	2016-11-03 12:45:24.25-07	15	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-7800	48	920fcb4b-a53d-48d7-8294-2914e6c5df81	3
2942	EXPENSE	food/drink for organizers of NODE workshop (had to buy from on-site snack bar)	-2838	USD	2016-11-03 14:13:31.956-07	2016-11-03 14:13:32.241-07	12	3	1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	-2838	409	edf0f89b-9f88-4050-a39b-a1c03329fd49	3
3291	EXPENSE	TShirts	-145786	USD	2016-11-21 13:26:37.469-08	2016-11-21 13:26:37.469-08	59	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-145786	\N	c9204456-a67b-4951-a271-157ab6819d8b	3
3292	EXPENSE	Leadership Development Lodging	-64600	USD	2016-11-21 13:26:46.916-08	2016-11-21 13:26:46.916-08	12	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-64600	\N	96bf91be-3e65-4ccc-932d-61631b570de0	3
3331	EXPENSE	Thank you bags (16) for hackathon speakers and judges, and for pre-hackathon events volunteers and sponsors.  Each bag contains a WWCode Portland coffee mug, a chocolate bar, ghirardellis squares, and a thank you card.	-8181	USD	2016-11-22 13:54:33.366-08	2016-11-22 13:54:33.644-08	59	3	1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	-8181	499	bf974271-bd1f-43fd-b113-f1c26a528e73	3
4406	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 11:46:50.958-08	2016-12-27 11:46:50.958-08	287	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	655	b66b4d98-0d80-41e7-8f34-1092f16b136c	3
4408	EXPENSE	Meetup Fees	-6000	USD	2016-12-27 11:50:16.992-08	2016-12-27 11:50:16.992-08	288	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-6000	656	70608aa8-79be-468e-a263-d28237b8531a	3
\.


                                                                                                                                        4107.dat                                                                                            0000600 0004000 0002000 00000043516 13124477142 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2016-01-10 16:00:00-08	\N	\N	7	10	MEMBER	8
2016-01-10 16:00:00-08	\N	\N	36	10	MEMBER	9
2016-01-10 16:00:00-08	\N	\N	37	10	MEMBER	10
2016-01-10 16:00:00-08	\N	\N	35	12	MEMBER	11
2016-01-10 16:00:00-08	\N	\N	33	13	MEMBER	12
2016-01-10 16:00:00-08	\N	\N	31	14	MEMBER	13
2016-01-10 16:00:00-08	\N	\N	32	14	MEMBER	14
2016-01-10 16:00:00-08	\N	\N	34	15	MEMBER	15
2016-01-08 16:22:34.641-08	2016-01-08 16:22:34.64-08	\N	3	10	HOST	27
2016-01-12 16:00:00-08	\N	\N	3	12	HOST	29
2016-01-12 16:00:00-08	\N	\N	3	13	HOST	30
2016-01-12 16:00:00-08	\N	\N	3	14	HOST	31
2016-01-12 16:00:00-08	\N	\N	3	15	HOST	32
2016-03-01 20:42:00.064-08	2016-03-01 20:42:00.064-08	\N	126	13	BACKER	169
2016-01-18 15:54:06.501-08	2016-01-18 15:54:06.501-08	\N	2	10	BACKER	61
2016-03-06 16:00:00-08	\N	\N	141	47	MEMBER	202
2016-03-06 16:00:00-08	\N	\N	3	47	HOST	203
2016-03-06 16:00:00-08	\N	\N	142	48	MEMBER	204
2016-03-06 16:00:00-08	\N	\N	3	48	HOST	205
2015-10-31 17:00:00-07	2015-10-31 17:00:00-07	\N	3	51	HOST	213
2016-01-29 14:23:53.527-08	2016-01-29 14:23:53.527-08	\N	30	12	BACKER	87
2016-02-02 08:36:39.043-08	2016-02-02 08:36:39.043-08	\N	30	14	BACKER	101
2016-02-02 08:52:02.312-08	2016-02-02 08:52:02.312-08	\N	80	10	BACKER	102
2016-02-02 09:04:56.333-08	2016-02-02 09:04:56.333-08	\N	30	13	BACKER	103
2016-02-02 13:46:44.979-08	2016-02-02 13:46:44.979-08	\N	8	14	BACKER	108
2016-02-02 15:09:06.035-08	2016-02-02 15:09:06.035-08	\N	2	13	BACKER	109
2015-05-02 17:00:00-07	\N	\N	28	2	MEMBER	5
2016-01-31 16:00:00-08	\N	\N	3	2	HOST	18
2016-01-31 16:00:00-08	\N	\N	3	3	HOST	19
2016-01-31 16:00:00-08	\N	\N	3	4	HOST	20
2016-02-18 11:54:08.738-08	2016-02-18 11:54:08.738-08	\N	108	2	BACKER	138
2016-01-31 16:00:00-08	\N	\N	67	13	MEMBER	88
2016-01-31 16:00:00-08	\N	\N	68	15	MEMBER	89
2016-01-31 16:00:00-08	\N	\N	69	12	MEMBER	90
2016-01-31 16:00:00-08	\N	\N	70	12	MEMBER	91
2016-01-31 16:00:00-08	\N	\N	71	3	MEMBER	92
2016-01-31 16:00:00-08	\N	\N	72	3	MEMBER	93
2016-01-31 16:00:00-08	\N	\N	73	3	MEMBER	94
2016-01-31 16:00:00-08	\N	\N	74	4	MEMBER	95
2016-01-31 16:00:00-08	\N	\N	75	4	MEMBER	96
2016-01-31 16:00:00-08	\N	\N	76	4	MEMBER	97
2016-01-31 16:00:00-08	\N	\N	77	4	MEMBER	98
2016-01-31 16:00:00-08	\N	\N	78	4	MEMBER	99
2016-03-02 13:31:50.622-08	2016-03-02 13:31:50.622-08	\N	129	2	BACKER	178
2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	\N	3	59	HOST	246
2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	\N	170	59	MEMBER	247
2016-03-18 17:00:00-07	2016-03-18 17:00:00-07	\N	171	59	MEMBER	248
2016-03-25 08:11:05.1-07	2016-03-25 08:11:05.1-07	\N	192	2	BACKER	268
2016-04-13 09:46:10.223-07	2016-04-13 09:46:10.223-07	\N	224	2	BACKER	330
2016-04-28 08:01:17.535-07	2016-04-28 08:01:17.535-07	\N	283	13	BACKER	407
2016-04-29 06:51:18.812-07	2016-04-29 06:51:18.812-07	\N	303	13	BACKER	425
2016-05-03 06:07:28-07	2016-05-03 06:07:28-07	\N	308	2	BACKER	437
2016-05-19 12:24:42.921-07	2016-05-19 12:24:42.921-07	\N	392	2	BACKER	533
2016-05-23 13:27:28.294-07	2016-05-23 13:27:28.294-07	\N	426	2	BACKER	573
2016-06-06 12:04:36.955-07	2016-06-06 12:04:36.955-07	\N	551	2	BACKER	702
2016-06-06 17:53:47.104-07	2016-06-06 17:53:47.104-07	\N	555	13	BACKER	708
2016-06-09 10:28:14.08-07	2016-06-09 10:28:14.08-07	\N	8	3	BACKER	717
2016-06-09 17:00:00-07	\N	\N	577	4	MEMBER	738
2016-06-21 09:02:55.799-07	2016-06-21 09:02:55.799-07	\N	642	12	BACKER	841
2016-06-21 09:05:00.99-07	2016-06-21 09:05:00.99-07	\N	642	4	BACKER	842
2016-06-21 09:06:05.21-07	2016-06-21 09:06:05.21-07	\N	642	48	BACKER	843
2016-06-22 13:09:46.034-07	2016-06-22 13:09:46.034-07	\N	646	2	BACKER	846
2016-07-01 15:31:46.068-07	2016-07-01 15:31:46.068-07	\N	686	2	BACKER	894
2016-08-01 08:54:14.068-07	2016-08-01 08:54:14.068-07	\N	883	2	BACKER	1130
2016-08-01 08:55:26.732-07	2016-08-01 08:55:26.732-07	\N	884	2	BACKER	1131
2016-08-03 10:47:17.3-07	2016-08-03 10:47:17.3-07	\N	896	4	BACKER	1147
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	\N	3	195	HOST	1149
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	\N	897	195	MEMBER	1150
2016-08-01 17:00:00-07	2016-08-01 17:00:00-07	\N	898	195	MEMBER	1151
2016-09-01 07:41:37.755-07	2016-09-01 07:41:37.755-07	\N	1094	2	BACKER	1388
2016-09-07 15:13:23.641-07	2016-09-07 15:13:23.641-07	\N	1145	241	MEMBER	1457
2016-09-07 15:13:23.811-07	2016-09-07 15:13:23.811-07	\N	3	241	HOST	1458
2016-09-09 20:42:51.435-07	2016-09-09 20:42:51.435-07	\N	1158	241	BACKER	1471
2016-09-12 21:15:05.534-07	2016-09-12 21:15:05.534-07	\N	1178	2	BACKER	1494
2016-09-20 13:58:51.903-07	2016-09-20 13:58:51.903-07	\N	1244	4	BACKER	1544
2016-09-22 18:07:10.698-07	2016-09-22 18:07:10.698-07	\N	1263	59	BACKER	1568
2016-09-28 14:47:19.401-07	2016-09-28 14:47:19.401-07	\N	1299	2	BACKER	1634
2016-09-29 10:43:14.112-07	2016-09-29 10:43:14.112-07	\N	1303	259	MEMBER	1637
2016-09-29 10:44:40.454-07	2016-09-29 10:44:40.454-07	\N	1304	260	MEMBER	1638
2016-09-29 10:44:40.461-07	2016-09-29 10:44:40.461-07	\N	1305	260	MEMBER	1639
2016-09-29 10:49:43.081-07	2016-09-29 10:49:43.081-07	\N	1307	261	MEMBER	1641
2016-09-29 10:49:43.088-07	2016-09-29 10:49:43.088-07	\N	1308	261	MEMBER	1642
2016-09-29 10:51:29.377-07	2016-09-29 10:51:29.377-07	\N	1309	262	MEMBER	1643
2016-09-29 10:51:29.396-07	2016-09-29 10:51:29.396-07	\N	1310	262	MEMBER	1644
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	1311	263	MEMBER	1645
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	1312	263	MEMBER	1646
2016-09-29 10:54:53.485-07	2016-09-29 10:54:53.485-07	\N	1313	264	MEMBER	1647
2016-09-29 10:54:53.501-07	2016-09-29 10:54:53.501-07	\N	1314	264	MEMBER	1648
2016-09-29 10:58:16.643-07	2016-09-29 10:58:16.643-07	\N	1315	265	MEMBER	1649
2016-09-29 10:59:15.446-07	2016-09-29 10:59:15.446-07	\N	1316	266	MEMBER	1650
2016-09-29 11:00:01.891-07	2016-09-29 11:00:01.891-07	\N	1314	267	MEMBER	1651
2016-09-29 11:01:04.72-07	2016-09-29 11:01:04.72-07	\N	1317	268	MEMBER	1652
2016-09-29 11:01:04.753-07	2016-09-29 11:01:04.753-07	\N	1318	268	MEMBER	1653
2016-09-29 11:01:49.724-07	2016-09-29 11:01:49.724-07	\N	1319	269	MEMBER	1654
2016-09-29 11:02:54.576-07	2016-09-29 11:02:54.576-07	\N	1320	270	MEMBER	1655
2016-09-29 11:02:54.581-07	2016-09-29 11:02:54.581-07	\N	1321	270	MEMBER	1656
2016-09-29 11:03:46.814-07	2016-09-29 11:03:46.814-07	\N	1322	271	MEMBER	1657
2016-09-29 11:05:19.093-07	2016-09-29 11:05:19.093-07	\N	1323	272	MEMBER	1658
2016-09-29 11:05:19.101-07	2016-09-29 11:05:19.101-07	\N	1324	272	MEMBER	1659
2016-09-29 11:06:00.979-07	2016-09-29 11:06:00.979-07	\N	1325	273	MEMBER	1660
2016-09-29 11:06:44.758-07	2016-09-29 11:06:44.758-07	\N	1326	274	MEMBER	1661
2016-09-29 11:08:19.514-07	2016-09-29 11:08:19.514-07	\N	1327	275	MEMBER	1662
2016-09-29 11:08:19.528-07	2016-09-29 11:08:19.528-07	\N	1328	275	MEMBER	1663
2016-09-29 11:09:42.806-07	2016-09-29 11:09:42.806-07	\N	1329	276	MEMBER	1664
2016-09-29 11:09:42.812-07	2016-09-29 11:09:42.812-07	\N	1330	276	MEMBER	1665
2016-09-29 11:10:43.419-07	2016-09-29 11:10:43.419-07	\N	1331	277	MEMBER	1666
2016-09-29 11:10:43.445-07	2016-09-29 11:10:43.445-07	\N	1332	277	MEMBER	1667
2016-09-29 11:11:53.863-07	2016-09-29 11:11:53.863-07	\N	1333	278	MEMBER	1668
2016-09-29 11:11:53.87-07	2016-09-29 11:11:53.87-07	\N	1334	278	MEMBER	1669
2016-09-29 11:12:58.877-07	2016-09-29 11:12:58.877-07	\N	1335	279	MEMBER	1670
2016-09-29 11:12:58.888-07	2016-09-29 11:12:58.888-07	\N	1336	279	MEMBER	1671
2016-09-29 11:13:48.784-07	2016-09-29 11:13:48.784-07	\N	1337	280	MEMBER	1672
2016-09-29 11:14:46.62-07	2016-09-29 11:14:46.62-07	\N	1338	281	MEMBER	1673
2016-09-29 11:15:23.948-07	2016-09-29 11:15:23.948-07	\N	1339	282	MEMBER	1674
2016-09-29 11:16:17.13-07	2016-09-29 11:16:17.13-07	\N	1340	283	MEMBER	1675
2016-09-29 11:16:52.145-07	2016-09-29 11:16:52.145-07	\N	1341	284	MEMBER	1676
2016-09-29 11:17:47.337-07	2016-09-29 11:17:47.337-07	\N	1342	285	MEMBER	1677
2016-09-29 11:19:11.462-07	2016-09-29 11:19:11.462-07	\N	1343	286	MEMBER	1678
2016-09-29 11:19:11.467-07	2016-09-29 11:19:11.467-07	\N	1344	286	MEMBER	1679
2016-09-29 11:24:17.825-07	2016-09-29 11:24:17.825-07	\N	1345	287	MEMBER	1680
2016-09-29 11:24:17.83-07	2016-09-29 11:24:17.83-07	\N	1346	287	MEMBER	1681
2016-09-29 11:25:22-07	2016-09-29 11:25:22-07	\N	1347	288	MEMBER	1682
2016-09-29 11:25:22.012-07	2016-09-29 11:25:22.012-07	\N	1348	288	MEMBER	1683
2016-09-29 11:26:35.151-07	2016-09-29 11:26:35.151-07	\N	1349	289	MEMBER	1684
2016-09-29 11:26:35.16-07	2016-09-29 11:26:35.16-07	\N	1350	289	MEMBER	1685
2016-09-29 11:28:08.489-07	2016-09-29 11:28:08.489-07	\N	1351	290	MEMBER	1686
2016-09-29 11:28:08.494-07	2016-09-29 11:28:08.494-07	\N	1352	290	MEMBER	1687
2016-09-29 11:28:54.298-07	2016-09-29 11:28:54.298-07	\N	1353	291	MEMBER	1688
2016-09-29 11:30:08.992-07	2016-09-29 11:30:08.992-07	\N	1354	292	MEMBER	1689
2016-09-29 11:30:08.999-07	2016-09-29 11:30:08.999-07	\N	1355	292	MEMBER	1690
2016-09-29 11:30:54.26-07	2016-09-29 11:30:54.26-07	\N	1356	293	MEMBER	1691
2016-09-29 11:32:00.998-07	2016-09-29 11:32:00.998-07	\N	1357	294	MEMBER	1692
2016-09-29 11:32:01.003-07	2016-09-29 11:32:01.003-07	\N	1358	294	MEMBER	1693
2016-09-29 11:33:37.213-07	2016-09-29 11:33:37.213-07	\N	1359	295	MEMBER	1694
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	1361	295	MEMBER	1695
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	1360	295	MEMBER	1696
2016-09-29 11:34:59.522-07	2016-09-29 11:34:59.522-07	\N	1362	297	MEMBER	1697
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	1363	297	MEMBER	1698
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	1364	297	MEMBER	1699
2016-09-29 11:37:07.37-07	2016-09-29 11:37:07.37-07	\N	1365	298	MEMBER	1700
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	1367	298	MEMBER	1701
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	1366	298	MEMBER	1702
2016-09-29 11:38:54.974-07	2016-09-29 11:38:54.974-07	\N	1368	299	MEMBER	1703
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	1369	299	MEMBER	1704
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	1370	299	MEMBER	1705
2016-09-29 11:41:11.077-07	2016-09-29 11:41:11.077-07	\N	1371	300	MEMBER	1706
2016-09-29 11:41:11.089-07	2016-09-29 11:41:11.089-07	\N	1372	300	MEMBER	1707
2016-09-29 11:41:11.097-07	2016-09-29 11:41:11.097-07	\N	1374	300	MEMBER	1708
2016-09-29 11:41:11.097-07	2016-09-29 11:41:11.097-07	\N	1373	300	MEMBER	1709
2016-09-29 11:43:49.24-07	2016-09-29 11:43:49.24-07	\N	1375	301	MEMBER	1710
2016-09-29 11:43:49.258-07	2016-09-29 11:43:49.258-07	\N	1379	301	MEMBER	1711
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1376	301	MEMBER	1712
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1377	301	MEMBER	1713
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	1378	301	MEMBER	1714
2016-09-29 11:43:49.259-07	2016-09-29 11:43:49.259-07	\N	3	301	HOST	1715
2016-09-29 11:41:11.097-07	2016-09-29 11:41:11.097-07	\N	3	300	HOST	1716
2016-09-29 11:38:54.983-07	2016-09-29 11:38:54.983-07	\N	3	299	HOST	1717
2016-09-29 11:37:07.378-07	2016-09-29 11:37:07.378-07	\N	3	298	HOST	1718
2016-09-29 11:34:59.53-07	2016-09-29 11:34:59.53-07	\N	3	297	HOST	1719
2016-09-29 11:33:37.221-07	2016-09-29 11:33:37.221-07	\N	3	295	HOST	1720
2016-09-29 11:32:01.003-07	2016-09-29 11:32:01.003-07	\N	3	294	HOST	1721
2016-09-29 11:30:54.26-07	2016-09-29 11:30:54.26-07	\N	3	293	HOST	1722
2016-09-29 11:30:08.999-07	2016-09-29 11:30:08.999-07	\N	3	292	HOST	1723
2016-09-29 11:28:54.298-07	2016-09-29 11:28:54.298-07	\N	3	291	HOST	1724
2016-09-29 11:28:08.494-07	2016-09-29 11:28:08.494-07	\N	3	290	HOST	1725
2016-09-29 11:26:35.16-07	2016-09-29 11:26:35.16-07	\N	3	289	HOST	1726
2016-09-29 11:25:22.012-07	2016-09-29 11:25:22.012-07	\N	3	288	HOST	1727
2016-09-29 11:24:17.83-07	2016-09-29 11:24:17.83-07	\N	3	287	HOST	1728
2016-09-29 11:19:11.467-07	2016-09-29 11:19:11.467-07	\N	3	286	HOST	1729
2016-09-29 11:17:47.337-07	2016-09-29 11:17:47.337-07	\N	3	285	HOST	1730
2016-09-29 11:16:52.145-07	2016-09-29 11:16:52.145-07	\N	3	284	HOST	1732
2016-09-29 11:16:17.13-07	2016-09-29 11:16:17.13-07	\N	3	283	HOST	1733
2016-09-29 11:15:23.948-07	2016-09-29 11:15:23.948-07	\N	3	282	HOST	1734
2016-09-29 11:14:46.62-07	2016-09-29 11:14:46.62-07	\N	3	281	HOST	1735
2016-09-29 11:13:48.784-07	2016-09-29 11:13:48.784-07	\N	3	280	HOST	1736
2016-09-29 11:12:58.888-07	2016-09-29 11:12:58.888-07	\N	3	279	HOST	1737
2016-09-29 11:11:53.87-07	2016-09-29 11:11:53.87-07	\N	3	278	HOST	1738
2016-09-29 11:10:43.445-07	2016-09-29 11:10:43.445-07	\N	3	277	HOST	1739
2016-09-29 11:09:42.812-07	2016-09-29 11:09:42.812-07	\N	3	276	HOST	1740
2016-09-29 11:08:19.528-07	2016-09-29 11:08:19.528-07	\N	3	275	HOST	1741
2016-09-29 11:06:44.758-07	2016-09-29 11:06:44.758-07	\N	3	274	HOST	1742
2016-09-29 11:06:00.979-07	2016-09-29 11:06:00.979-07	\N	3	273	HOST	1743
2016-09-29 11:05:19.101-07	2016-09-29 11:05:19.101-07	\N	3	272	HOST	1744
2016-09-29 11:03:46.814-07	2016-09-29 11:03:46.814-07	\N	3	271	HOST	1745
2016-09-29 11:02:54.581-07	2016-09-29 11:02:54.581-07	\N	3	270	HOST	1746
2016-09-29 11:01:49.724-07	2016-09-29 11:01:49.724-07	\N	3	269	HOST	1747
2016-09-29 11:01:04.753-07	2016-09-29 11:01:04.753-07	\N	3	268	HOST	1748
2016-09-29 11:00:01.891-07	2016-09-29 11:00:01.891-07	\N	3	267	HOST	1749
2016-09-29 10:59:15.446-07	2016-09-29 10:59:15.446-07	\N	3	266	HOST	1750
2016-09-29 10:58:16.643-07	2016-09-29 10:58:16.643-07	\N	3	265	HOST	1751
2016-09-29 10:54:53.501-07	2016-09-29 10:54:53.501-07	\N	3	264	HOST	1752
2016-09-29 10:53:00.559-07	2016-09-29 10:53:00.559-07	\N	3	263	HOST	1753
2016-09-29 10:51:29.396-07	2016-09-29 10:51:29.396-07	\N	3	262	HOST	1754
2016-09-29 10:49:43.088-07	2016-09-29 10:49:43.088-07	\N	3	261	HOST	1755
2016-09-29 10:44:40.461-07	2016-09-29 10:44:40.461-07	\N	3	260	HOST	1756
2016-09-29 10:43:14.112-07	2016-09-29 10:43:14.112-07	\N	3	259	HOST	1757
2016-10-06 11:36:39.082-07	2016-10-06 11:36:39.082-07	\N	1438	2	BACKER	1815
2016-10-07 09:49:20.388-07	2016-10-07 09:49:20.388-07	\N	1446	241	BACKER	1822
2016-11-17 09:43:31.221-08	2016-11-17 09:43:31.221-08	\N	1808	59	BACKER	2202
2016-11-22 07:22:40.419-08	2016-11-22 07:22:40.419-08	\N	1846	59	BACKER	2246
2016-11-28 07:33:15.87-08	2016-11-28 07:33:15.87-08	\N	1890	2	BACKER	2289
2016-11-29 02:03:23.974-08	2016-11-29 02:03:23.974-08	\N	1908	301	BACKER	2296
2016-11-30 08:11:42.605-08	2016-11-30 08:11:42.605-08	\N	1957	2	BACKER	2339
2016-12-18 17:41:29.216-08	2016-12-18 17:41:29.216-08	\N	2220	259	BACKER	2545
2017-01-03 12:59:38.784-08	2017-01-03 12:59:38.784-08	\N	2416	2	BACKER	2665
2017-01-03 16:00:00-08	2017-01-03 16:00:00-08	\N	2431	430	MEMBER	2681
2017-01-03 16:00:00-08	2017-01-03 16:00:00-08	\N	3	430	HOST	2682
2017-01-14 09:11:43.287-08	2017-01-14 09:11:43.287-08	\N	2549	270	BACKER	2767
2017-01-16 10:03:56.965-08	2017-01-16 10:03:56.965-08	\N	2561	48	BACKER	2772
2017-01-18 05:54:51.032-08	2017-01-18 05:54:51.032-08	\N	2594	48	BACKER	2794
2017-02-01 07:16:22.449-08	2017-02-01 07:16:22.449-08	\N	2898	48	BACKER	3042
2017-02-01 09:30:50.44-08	2017-02-01 09:30:50.44-08	\N	2906	271	BACKER	3045
2017-02-10 08:47:34.941-08	2017-02-10 08:47:34.941-08	\N	3053	15	BACKER	3214
2017-02-21 08:25:28.457-08	2017-02-21 08:25:28.457-08	\N	3	510	MEMBER	3325
2017-02-21 08:25:28.555-08	2017-02-21 08:25:28.555-08	\N	3	510	HOST	3326
2017-02-21 08:55:29.765-08	2017-02-21 08:55:29.765-08	\N	3	511	HOST	3328
2017-02-21 10:11:30.773-08	2017-02-21 10:11:30.773-08	\N	3	512	MEMBER	3331
2017-02-21 10:11:30.855-08	2017-02-21 10:11:30.855-08	\N	3	512	HOST	3332
2017-02-21 08:55:29.655-08	2017-02-21 08:55:29.655-08	\N	3	511	MEMBER	3327
2017-02-21 10:35:34.524-08	2017-02-21 10:35:34.524-08	\N	3	513	MEMBER	3333
2017-02-21 10:35:34.613-08	2017-02-21 10:35:34.613-08	\N	3	513	HOST	3334
2017-02-21 10:49:14.345-08	2017-02-21 10:49:14.345-08	\N	3	515	MEMBER	3337
2017-02-21 10:49:14.435-08	2017-02-21 10:49:14.435-08	\N	3	515	HOST	3338
2017-02-21 11:02:21.568-08	2017-02-21 11:02:21.568-08	\N	3	516	MEMBER	3340
2017-02-21 11:02:21.646-08	2017-02-21 11:02:21.646-08	\N	3	516	HOST	3341
2017-02-21 11:07:25.188-08	2017-02-21 11:07:25.188-08	\N	3	517	MEMBER	3342
2017-02-21 11:07:25.321-08	2017-02-21 11:07:25.321-08	\N	3	517	HOST	3343
2017-02-21 11:13:03.394-08	2017-02-21 11:13:03.394-08	\N	3	518	MEMBER	3344
2017-02-21 11:13:03.538-08	2017-02-21 11:13:03.538-08	\N	3	518	HOST	3345
2017-02-21 11:25:28.725-08	2017-02-21 11:25:28.725-08	\N	3	519	MEMBER	3346
2017-02-21 11:25:28.822-08	2017-02-21 11:25:28.822-08	\N	3	519	HOST	3347
2017-02-21 11:34:47.02-08	2017-02-21 11:34:47.02-08	\N	3	520	MEMBER	3348
2017-02-21 11:34:47.427-08	2017-02-21 11:34:47.427-08	\N	3	520	HOST	3349
2017-02-21 11:39:46.239-08	2017-02-21 11:39:46.239-08	\N	3	521	MEMBER	3350
2017-02-21 11:39:46.29-08	2017-02-21 11:39:46.29-08	\N	3	521	HOST	3351
2017-02-21 11:45:19.169-08	2017-02-21 11:45:19.169-08	\N	3	522	MEMBER	3352
2017-02-21 11:45:19.309-08	2017-02-21 11:45:19.309-08	\N	3	522	HOST	3353
2017-02-21 12:04:48.979-08	2017-02-21 12:04:48.979-08	\N	3	523	MEMBER	3354
2017-02-21 12:04:49.156-08	2017-02-21 12:04:49.156-08	\N	3	523	HOST	3355
2017-02-21 12:11:44.767-08	2017-02-21 12:11:44.767-08	\N	3	524	MEMBER	3356
2017-02-21 12:11:44.893-08	2017-02-21 12:11:44.893-08	\N	3	524	HOST	3357
2017-02-21 12:16:59.092-08	2017-02-21 12:16:59.092-08	\N	3	525	MEMBER	3358
2017-02-21 12:16:59.184-08	2017-02-21 12:16:59.184-08	\N	3	525	HOST	3359
2017-02-27 16:25:20.392-08	2017-02-27 16:25:20.392-08	\N	3301	522	BACKER	3424
2017-03-09 10:29:55.806-08	2017-03-09 10:29:55.806-08	\N	3442	259	BACKER	3521
2017-04-03 09:22:45.962-07	2017-04-03 09:22:45.962-07	\N	3206	584	MEMBER	3950
2017-04-03 09:22:46.049-07	2017-04-03 09:22:46.049-07	\N	3	584	HOST	3951
2017-04-04 12:51:04.96-07	2017-04-04 12:51:04.96-07	\N	3999	2	BACKER	3972
2017-04-10 18:09:50.695-07	2017-04-10 18:09:50.695-07	\N	4153	13	BACKER	4088
2017-04-11 19:05:36.09-07	2017-04-11 19:05:36.09-07	\N	4173	13	BACKER	4093
2017-04-20 03:17:23.321-07	2017-04-20 03:17:23.321-07	\N	4348	59	BACKER	4200
2017-04-30 18:40:31.703-07	2017-04-30 18:40:31.703-07	\N	3419	516	BACKER	4353
2017-05-01 10:13:36.311-07	2017-05-01 10:13:36.311-07	\N	4550	516	BACKER	4371
2017-05-08 22:59:17.562-07	2017-05-08 22:59:17.562-07	\N	4711	517	BACKER	4493
2017-05-09 11:14:23.365-07	2017-05-09 11:14:23.365-07	\N	4720	2	BACKER	4500
2017-05-10 16:45:46.804-07	2017-05-10 16:45:46.804-07	\N	4749	522	BACKER	4528
2017-05-15 05:07:59.716-07	2017-05-15 05:07:59.716-07	\N	4834	14	BACKER	4597
\.


                                                                                                                                                                                  4109.dat                                                                                            0000600 0004000 0002000 00000122002 13124477142 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1328	0	michellesun	\N	8808873dd5e6a229bca3641b8890d754@gmail.com	*****	*****	*****	2016-09-29 11:08:19.492-07	2016-09-29 11:08:19.492-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Michelle	Sun	\N	\N	f
1329	0	danadalling	\N	fedfabd0763d3993683de654cc8e68b7@gmail.com	*****	*****	*****	2016-09-29 11:09:42.785-07	2016-09-29 11:09:42.785-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Dana	Dalling	\N	\N	f
2	0	xdamman	https://opencollective-production.s3-us-west-1.amazonaws.com/5c825534ad62223ae6a539f6a5076d3cjpeg_1699f6e0-917c-11e6-a567-3f53b7b5f95c.jpeg	b0021cf62c2ef3dc137cf0a87e2af92b@gmail.com	*****	*****	*****	2015-11-05 05:44:30.93-08	2017-05-25 11:22:59.819-07	\N	\N	\N	*****	http://xdamman.com	xdamman	1	*****	2016-03-03 16:07:14.176-08	\N	f	Entrepreneur sharing ideas in copyleft	Tell us more about you, why you are on OpenCollective, what types of collectives you would love to contribute to, etc.\n\nProtip: you can use [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet);	\N	Xavier	Damman	\N	\N	f
129	0	makersquare	https://course_report_production.s3.amazonaws.com/rich/rich_files/rich_files/268/s300/makersquare-logo.png	f93705c9774686499d4f9efbcaa81e07@gmail.com	*****	*****	*****	2016-03-02 13:31:50.497-08	2016-03-02 13:32:53.053-08	\N	\N	\N	*****	http://www.makersquare.com	MakerSquareATX	\N	*****	\N	\N	t	\N	\N	\N	MakerSquare		\N	\N	f
3206	0	global	\N	9c1a8a4fc15ce332c7c5624952bceeff@gmail.com	*****	*****	*****	2017-02-21 08:55:29.631-08	2017-05-16 09:49:19.822-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	WWCode		\N	\N	f
30	0	piamancini	https://opencollective-production.s3-us-west-1.amazonaws.com/9EflVQqM_400x400jpg_2aee92e0-858d-11e6-9fd7-73dd31eb7c0c.jpeg	df61fcd898d629d05fe8ae08fd66ec4d@gmail.com	*****	*****	*****	2016-01-09 13:31:01.954-08	2017-04-03 05:58:04.717-07	\N	\N	\N	*****	\N	piamancini	\N	*****	\N	\N	f	\N	\N	\N	Pia	Mancini	\N	\N	f
2906	0	androidchick88	\N	3b3d000425befc5172a5208310218fc2@gmail.com	*****	*****	*****	2017-02-01 09:30:43.176-08	2017-02-01 10:35:36.827-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	f
4173	0	abrown1411	https://opencollective-production.s3-us-west-1.amazonaws.com/92dd7480-1f24-11e7-9a73-15e29bd9381e.png	3be24eacaf70dddd5f990afac0574189@gmail.com	*****	*****	*****	2017-04-11 19:05:32.736-07	2017-04-11 19:06:03.772-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Anne	Brown	\N	\N	f
577	0	georgia	\N	8c4471bffc28c261aa4ef2a5d7004de4@gmail.com	*****	*****	*****	\N	2016-12-28 14:36:35.346-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Georgia	Andrews	\N	\N	f
1331	0	cheeyimgoh	https://opencollective-production.s3-us-west-1.amazonaws.com/b06d105a90d849daae3cee823078ffbc_4c27ac00-0dcb-11e7-92a0-730911003b33.jpeg	60767513ea7e3d82d4a50d8241faea30@gmail.com	*****	*****	*****	2016-09-29 11:10:43.391-07	2017-03-27 22:13:36.913-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	 I am generalist who are curious about a lot of things and often find myself dabble in both technical and management.	\N	\N	Chee	Yim Goh	\N	\N	f
28	0	ogibson	https://media.licdn.com/media/AAEAAQAAAAAAAAUUAAAAJDVjMTAxNGYxLWZhZmUtNDQ4Yi1hMzFjLWIzYmU3MTZjNGYxNA.jpg	332cb39ce5e614d5fcad01ae28c6e9d5@gmail.com	*****	*****	*****	2015-12-21 08:34:26.053-08	2017-02-01 11:55:11.641-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Holly		\N	\N	f
4720	0	nicole1	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/5bd8eb7d-65e2-482e-b9dd-ff7f33bf804b	2248e9f4451791491178e6ad6e8b395f@gmail.com	*****	*****	*****	2017-05-09 11:14:19.572-07	2017-05-09 11:14:20.294-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Nicole	Giannone	\N	\N	f
74	0	chantal	\N	26888a78bd38eaf94af924a9675ae705@gmail.com	*****	*****	*****	2016-01-29 15:19:36.407-08	2016-09-28 03:15:16.735-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Chantal		\N	\N	f
141	0	jigyasagrover	https://res.cloudinary.com/opencollective/image/upload/v1483042743/ext_a8caeh.jpg	688f744a10db3334b59d756689fa8250@gmail.com	*****	*****	*****	2016-03-07 01:50:58.721-08	2017-05-20 04:50:46.742-07	\N	\N	\N	*****	https://www.linkedin.com/in/jigyasagrover	\N	\N	*****	\N	\N	f	\N	\N	\N	Jigyasa	Grover	\N	\N	f
1325	0	pamelawoode-browne	https://opencollective-production.s3-us-west-1.amazonaws.com/f08e3667929b4091bb398793543c458b_3c79dff0-89a8-11e6-b81f-a9802cdb670c.jpeg	5c0594710825406596a99025a319d635@gmail.com	*****	*****	*****	2016-09-29 11:06:00.962-07	2017-02-03 15:06:45.932-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Pamela	Wood Browne	\N	\N	f
4153	0	nikko	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/2e150bf7-d054-400f-8f23-35dab9acf9c9	adb8ed8f9a018d919a1dca1d502d6b3b@gmail.com	*****	*****	*****	2017-04-10 18:09:47.41-07	2017-04-10 18:09:51.31-07	\N	\N	\N	*****	https://twitter.com/NikkoPatten	NikkoPatten	\N	*****	\N	\N	f	\N	\N	\N	Nikko	Patten	\N	\N	f
3419	0	erin	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/4dedad77-5def-4d84-8e72-47bf0051649c	c4d4a0ed522a5106c5aa8b3e4c077071@gmail.com	*****	*****	*****	2017-03-07 11:01:52.704-08	2017-03-07 11:02:04.53-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Erin	Spiceland	\N	\N	f
4348	0	craftcms	https://opencollective-production.s3-us-west-1.amazonaws.com/8e9cfe00-25ae-11e7-8c00-677620cd0201.png	4e25fd969973d6fd55614b86c0c74dc5@gmail.com	*****	*****	*****	2017-04-20 02:34:08.219-07	2017-05-04 15:58:47.619-07	\N	\N	\N	*****	https://craftcms.com	craftcms	\N	*****	\N	\N	f	Content-first. Faceless like Jaqen.	Craft is a content-first CMS that aims to make life enjoyable for developers and content managers alike. It’s the tool of choice for thousands of [remarkably attractive](https://craftcms.com/community) web professionals around the world.	\N	Craft	CMS	\N	\N	f
883	0	rackspace	https://opencollective-production.s3-us-west-1.amazonaws.com/rackspacecom_a7d669f0-5800-11e6-a2a8-bb3ee7158535.png	8cdf243bb6d94e727c22e74f7f73780b@gmail.com	*****	*****	*****	2016-08-01 08:54:10.844-07	2016-08-01 08:57:32.536-07	\N	\N	\N	*****	https://www.rackspace.com/	rackspace	\N	*****	\N	\N	t	\N	\N	\N	Rackspace		\N	\N	f
3053	0	kate	https://opencollective-production.s3-us-west-1.amazonaws.com/findmyflockcom_b7503b70-efb0-11e6-bcba-ed56440ee54a.png	2bbfedaf9e616d5c252c38e6019481ec@gmail.com	*****	*****	*****	2017-02-09 12:42:02.01-08	2017-02-10 08:48:15.699-08	\N	\N	\N	*****	http://www.findmyflock.com	FindMyFlock	\N	*****	\N	\N	f	\N	\N	\N	Flock:	Accelerating Women In Tech	\N	\N	f
3301	0	sue	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/c50d2350-ae0b-4347-9e9b-3b51d55fd22d	e6aa8986385415192e05127010441ae4@gmail.com	*****	*****	*****	2017-02-27 16:25:15.503-08	2017-02-27 16:25:19.402-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Sue	Sinclair	\N	\N	f
3999	0	lwinkelman	\N	15daf29f3c0fcdf9a94e700ce94f90f6@gmail.com	*****	*****	*****	2017-04-04 12:51:02.718-07	2017-04-04 12:51:03.29-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Allie	Winkelman	\N	\N	f
1327	0	karenfarzam	\N	ebd16aa661c34f4cfdca849165c47ecb@gmail.com	*****	*****	*****	2016-09-29 11:08:19.487-07	2016-09-29 11:08:19.487-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Karen	Farzam	\N	\N	f
69	0	alicia	\N	75e923f20ab3d84a3ac4b36a4109d13c@gmail.com	*****	*****	*****	2016-01-29 15:18:47.287-08	2017-05-21 06:24:37.706-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Alicia		\N	\N	f
1358	0	laurascholl	\N	b78218b19cc91ab0dfb943c6c253ca85@gmail.com	*****	*****	*****	2016-09-29 11:32:00.983-07	2016-09-29 11:32:00.983-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Laura	Scholl	\N	\N	f
1361	0	mamienomoto	\N	9220296eae97265c78dd6ae0722eb573@gmail.com	*****	*****	*****	2016-09-29 11:33:37.095-07	2016-09-29 11:33:37.095-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Mami	Enomoto	\N	\N	f
1332	0	jecelynyeen	https://opencollective-production.s3-us-west-1.amazonaws.com/8146ec1d435a48c9a5f9d45600963c05_98566490-0ab0-11e7-85e3-cf8c26b6ca26.jpeg	4d4dfee45f10b2b8affd87ee5a82b7a1@gmail.com	*****	*****	*****	2016-09-29 11:10:43.392-07	2017-03-20 09:33:13.852-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Jecelyn		\N	\N	f
1333	0	genashley	https://opencollective-production.s3-us-west-1.amazonaws.com/f739ff80-86fd-11e6-9561-f9be8e5da60b.jpeg	c39681f94c378e9adbbbca79b24dd9ff@gmail.com	*****	*****	*****	2016-09-29 11:11:53.842-07	2017-04-12 07:42:51.09-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	Director, Women Who Code London<br>	\N	\N	Gen	Ashley	\N	\N	f
1375	0	anoukruhaak	\N	2e951f7b3ce79f4faad5da347e302b27@gmail.com	*****	*****	*****	2016-09-29 11:43:49.04-07	2016-09-29 11:43:49.04-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Anouk	Ruhaak	\N	\N	f
1359	0	himisato	\N	d6b1ce23201e994cee24a7971a79d810@gmail.com	*****	*****	*****	2016-09-29 11:33:37.087-07	2016-09-29 11:33:37.087-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Himi	Sato	\N	\N	f
171	0	cpaun	https://opencollective-production.s3-us-west-1.amazonaws.com/7446276v3s466_4d6a9940-90b9-11e6-a134-f381d4cd2713.png	475c85fcbd1984c9e5e19cea267c4f33@gmail.com	*****	*****	*****	2016-03-19 15:11:53.101-07	2017-05-18 10:47:24.123-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	Director, WWCode Portland	\N	\N	Caterina	Paun	\N	\N	f
36	0	dchiu	https://media.licdn.com/media/p/6/005/04f/283/2b9ae46.jpg	a3f15edbecbe7da5265fba790e9feeb9@gmail.com	*****	*****	*****	2016-01-11 11:01:43.411-08	2016-02-15 14:33:12.306-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Dayra		\N	\N	f
1370	0	vivdelrio	\N	7efecdcdea73d6875db52b91f68c0603@gmail.com	*****	*****	*****	2016-09-29 11:38:54.951-07	2016-09-29 11:38:54.951-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Viv	Del Rio	\N	\N	f
283	0	devbootcamp	https://logo.clearbit.com/devbootcamp.com	c07b3781151a9c9fb2991128a4675d06@gmail.com	*****	*****	*****	2016-04-28 08:01:14.69-07	2016-04-28 08:02:00.631-07	\N	\N	\N	*****	http://www.devbootcamp.com	devbootcamp 	\N	*****	\N	\N	t	\N	\N	\N	Dev	Bootcamp 	\N	\N	f
34	0	kshuster	https://pbs.twimg.com/profile_images/523157919999602688/00l1ZQIf.jpeg	6f62bd61a70f4848e632242e885cc9ed@gmail.com	*****	*****	*****	2016-01-11 10:58:47.796-08	2016-01-11 10:58:47.796-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Kelly		\N	\N	f
37	0	fsantander	https://media.licdn.com/media/AAEAAQAAAAAAAAJzAAAAJGZiYzM3MzEyLTVkYzgtNDg2Mi04Yzg3LWI1NDM0NDhhZjRhNQ.jpg	4c06d3aa9533a2d242b1fa57930c6603@gmail.com	*****	*****	*****	2016-01-11 11:02:41.058-08	2016-02-15 14:33:29.118-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Fernanda		\N	\N	f
7	0	maru	https://pbs.twimg.com/profile_images/445400536569749504/8vJ-Prbe.png	163233711ccd4a6968191c8fbd549d8a@gmail.com	*****	*****	*****	2015-11-19 02:09:51.192-08	2017-04-12 13:22:46.946-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Marcela	Lango	\N	\N	f
224	0	bonsai	https://img.stackshare.io/service/228/c0daef6c2bf692d268e53a799111789c.png	a32663428ce0d29c94f0f78666e7c06e@gmail.com	*****	*****	*****	2016-04-13 09:46:07.217-07	2016-04-13 11:44:12.626-07	\N	\N	\N	*****	https://bonsai.io/	bonsaisearch	\N	*****	\N	\N	t	\N	\N	\N	Bonsai.io		\N	\N	f
8	0	aseem	https://opencollective-production.s3-us-west-1.amazonaws.com/jMoeGBOJjpg_d83f6890-a13d-11e6-a8af-411ab4a2c609.jpeg	9f23b14304ccc62b927759bbf7ca73c8@gmail.com	*****	*****	*****	2015-11-30 12:20:11.257-08	2017-05-09 13:20:42.144-07	\N	\N	\N	*****	\N	AseemSood_	16	*****	\N	\N	f	Cofounder, Open Collective.	Tell us more about you, why you are on OpenCollective, what types of collectives you would love to contribute to, etc.\n\nProtip: you can use [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)	\N	Aseem	Sood	\N	\N	f
1360	0	ayanakagawa	\N	58564fc814b9e582dc1dcfb9242ca2ac@gmail.com	*****	*****	*****	2016-09-29 11:33:37.088-07	2016-09-29 11:33:37.088-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Aya	Nakagawa	\N	\N	f
33	0	kgibilterra	https://res.cloudinary.com/opencollective/image/upload/v1483039249/i8n9dw-4_vxdyyi.jpg	c31f8fee92777f265a2c4215007f35a2@gmail.com	*****	*****	*****	2016-01-11 10:57:18.467-08	2016-01-11 10:57:18.467-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Kaylyn		\N	\N	f
71	0	brenda	\N	f74d1d9b9d4e727c9f1634da2669cd85@gmail.com	*****	*****	*****	2016-01-29 15:19:12.899-08	2016-09-28 03:15:16.707-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Brenda		\N	\N	f
1362	0	daphnechong	\N	12a217393125c49fba8faf93dadafcd8@gmail.com	*****	*****	*****	2016-09-29 11:34:59.499-07	2016-09-29 11:34:59.499-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Daphne	Chong	\N	\N	f
1363	0	lucybain	\N	97e510a21c89bac3e0111d73f5737b05@gmail.com	*****	*****	*****	2016-09-29 11:34:59.504-07	2016-09-29 11:34:59.504-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Lucy	Bain	\N	\N	f
108	0	emilyheistmoss	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/18b8dbe9-bc4b-4e82-b6db-b41eff9ca2e5	13ce3747cb13689865309d537ea4842f@gmail.com	*****	*****	*****	2016-02-18 11:54:08.5-08	2016-09-28 03:15:16.811-07	\N	\N	\N	*****	\N	EmilyHeistMoss	\N	*****	\N	\N	f	\N	\N	\N	Emily	Heist Moss	\N	\N	f
1364	0	peggykuo	\N	20e1ef7ed0e42f913b1b0fb8bc15b50d@gmail.com	*****	*****	*****	2016-09-29 11:34:59.505-07	2016-09-29 11:34:59.505-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Peggy	Kuo	\N	\N	f
1365	0	laurauzcátegui	\N	8e6ff81f47ed88c6f6588511e5a3202e@gmail.com	*****	*****	*****	2016-09-29 11:37:07.337-07	2016-09-29 11:37:07.337-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Laura	Uzcátegui	\N	\N	f
1890	0	jamielu	https://logo.clearbit.com/narrativescience.com	29831b25c00785980ab934f70d4813b1@gmail.com	*****	*****	*****	2016-11-28 07:33:11.726-08	2016-11-28 07:33:31.466-08	\N	\N	\N	*****	http://www.narrativescience.com	\N	\N	*****	\N	\N	f	\N	\N	\N	Jamie	Lu	\N	\N	f
170	0	phubbell	\N	bd2fd32d181880d2fc0c95d7ba8ce17d@gmail.com	*****	*****	*****	2016-03-19 15:11:44.881-07	2016-03-19 15:11:44.881-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Paige	Hubbell	\N	\N	f
303	0	thehumangeo	https://logo.clearbit.com/thehumangeo.com	357489ee6e6984e56d512c2bbf4f5b18@gmail.com	*****	*****	*****	2016-04-29 06:51:16.619-07	2016-04-29 06:51:42.705-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	t	\N	\N	\N	The	Human Geo Group	\N	\N	f
1366	0	vickytwomey-lee	\N	548f55e7c60e649394294a500b7435f5@gmail.com	*****	*****	*****	2016-09-29 11:37:07.344-07	2016-09-29 11:37:07.344-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Vicky	Twomey-Lee	\N	\N	f
35	0	estanley	https://pbs.twimg.com/profile_images/672467424273395712/m0VtgmYQ.jpg	26547a83f9ce5ae0839349325b1e7343@gmail.com	*****	*****	*****	2016-01-11 10:59:41.948-08	2017-05-11 21:19:54.192-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Erica		\N	\N	f
192	0	rigup	https://a2.mzstatic.com/us/r30/Purple7/v4/23/90/cc/2390cca9-c82f-6700-4f13-f1cb4ca15991/icon350x350.jpeg	5effb40d83347a559b155bf5762a3985@gmail.com	*****	*****	*****	2016-03-25 08:11:02.011-07	2016-03-25 08:11:20.398-07	\N	\N	\N	*****	https://www.rigup.com	deepinsand	\N	*****	\N	\N	t	\N	\N	\N	RigUp		\N	\N	f
1368	0	anacastro	\N	bc2d687d77a9548c85d4d5cd2f9be8a4@gmail.com	*****	*****	*****	2016-09-29 11:38:54.934-07	2016-09-29 11:38:54.934-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Ana	Castro	\N	\N	f
686	0	pkmass	\N	411be685dd05fee05f62ca6e48aef8a3@gmail.com	*****	*****	*****	2016-07-01 15:31:42.541-07	2016-09-28 03:15:17.556-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	f
1369	0	erikaaguayo	\N	a67e0bdc09dd2ba28385c89f334828f5@gmail.com	*****	*****	*****	2016-09-29 11:38:54.935-07	2016-09-29 11:38:54.935-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Erika	Aguayo	\N	\N	f
2898	0	ericalucaterochapman	\N	e3073fd059876de0de39852d83a06783@gmail.com	*****	*****	*****	2017-02-01 07:16:17.461-08	2017-02-01 07:16:17.461-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	\N	\N	\N	\N	f
1379	0	aleksandragavriloska	\N	26ac149a5ae8d0a09a8eadac9b2153d8@gmail.com	*****	*****	*****	2016-09-29 11:43:49.211-07	2016-09-29 11:43:49.211-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Aleksandra	Gavriloska	\N	\N	f
4834	0	brian1	https://opencollective-production.s3-us-west-1.amazonaws.com/4fc0a750-3967-11e7-955e-43d656f05f49.jpg	0174cfb68bc98317384ae65d2bb4b6a5@gmail.com	*****	*****	*****	2017-05-15 05:07:56.682-07	2017-05-15 05:09:17.931-07	\N	\N	\N	*****	http://expeditionhacks.com/seattle	expeditionhacks	\N	*****	\N	\N	f	\N	\N	\N	Brian	Vinci	\N	\N	f
308	0	cisco	https://opencollective-production.s3-us-west-1.amazonaws.com/dAmHQYgjpg_6d4cc930-1130-11e6-9815-b7ee6884387f.jpg	6bdf7bcd29fbb8a428b7a2ccf20c38d2@gmail.com	*****	*****	*****	2016-04-29 11:46:16.143-07	2016-05-03 06:10:49.728-07	\N	\N	\N	*****	http://cisco.com	cisco	\N	*****	\N	\N	t	\N	\N	\N	Cisco		\N	\N	f
32	0	saranyawwc	https://opencollective-production.s3-us-west-1.amazonaws.com/35f74ebjpg_d2d1c140-35a4-11e7-8caa-3b6f8e012814.jpeg	e0d3d2a0a00a30ae6368aa47ab545566@gmail.com	*****	*****	*****	2016-01-11 10:54:33.296-08	2017-05-10 10:19:29.673-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Saranya	Karuppusamy	\N	\N	f
1371	0	guitinabavi	\N	20ef75e5bb432fb540423c3b6fd60a1a@gmail.com	*****	*****	*****	2016-09-29 11:41:11.052-07	2016-09-29 11:41:11.052-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Guiti	Nabavi	\N	\N	f
1299	0	gabrielaswider	https://opencollective-production.s3-us-west-1.amazonaws.com/dataworld_6f037d50-85c5-11e6-9fd7-73dd31eb7c0c.png	ca840ad4fb9f966b78a7608f23916ce3@gmail.com	*****	*****	*****	2016-09-28 14:47:14.881-07	2016-09-28 14:49:30.346-07	\N	\N	\N	*****	http://data.world	datadotworld	\N	*****	\N	\N	f	\N	\N	\N	data.world	Swider	\N	\N	f
1372	0	radhikarayadu	\N	6a3a6e3cc3f4bb5cb7ef241e3ed3167a@gmail.com	*****	*****	*****	2016-09-29 11:41:11.058-07	2016-09-29 11:41:11.058-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Radhika	Rayadu	\N	\N	f
1378	0	glennabuford	https://opencollective-production.s3-us-west-1.amazonaws.com/8a3d40b0-8fed-11e6-b320-5125b901f984.jpg	303f22fe5fcfb3542479af3c0d7ffb51@gmail.com	*****	*****	*****	2016-09-29 11:43:49.205-07	2017-05-10 14:26:04.82-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Glenna	Buford	\N	\N	f
1263	0	tozny	https://opencollective-production.s3-us-west-1.amazonaws.com/466bd3a0-812a-11e6-8430-9f6ee94192cb.png	6dc155c0ad37d1bea19426f9c9f5c882@gmail.com	*****	*****	*****	2016-09-22 18:07:06.058-07	2016-09-28 03:15:17.268-07	\N	\N	\N	*****	https://tozny.com	Tozny	\N	*****	\N	\N	f	\N	\N	\N	Isaac	Potoczny-Jones	\N	\N	f
1373	0	soniaprabhu	\N	4b43d6eaedbb506b76bf9f73351958f4@gmail.com	*****	*****	*****	2016-09-29 11:41:11.058-07	2016-09-29 11:41:11.058-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Sonia	Prabhu	\N	\N	f
1335	0	irinamuchnik	\N	11dfac5cbe9c44dd072f6d704c64f19b@gmail.com	*****	*****	*****	2016-09-29 11:12:58.838-07	2016-09-29 11:12:58.838-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Irina	Muchnik	\N	\N	f
1311	0	lucyshang	\N	4bdb3020da3f8070227aa9cd1662f481@gmail.com	*****	*****	*****	2016-09-29 10:53:00.502-07	2016-09-29 10:53:00.502-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Lucy	Shang	\N	\N	f
1178	0	googlefiber	\N	d49f580dd3b9b503a43175705afc72ff@gmail.com	*****	*****	*****	2016-09-12 21:15:01.959-07	2016-09-28 03:15:18.213-07	\N	\N	\N	*****	http://fiber.google.com	googlefiber	\N	*****	\N	\N	f	\N	\N	\N	Google	Fiber	\N	\N	f
67	0	kapoornupur	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/572a82f0-a28a-4e61-ba19-a0f09f1e812b	61b08842f8750a6bc18d274dc954fa02@gmail.com	*****	*****	*****	2016-01-29 15:16:09.038-08	2016-09-28 03:15:16.707-07	\N	\N	\N	*****	\N	kapoornupur	\N	*****	\N	\N	f	\N	\N	\N	Nupur	Kapoor	\N	\N	f
1376	0	carolanitz	\N	c11e740d05e136e14f4588e08a01f460@gmail.com	*****	*****	*****	2016-09-29 11:43:49.157-07	2016-09-29 11:43:49.157-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Carola	Nitz	\N	\N	f
4550	0	laceyreinoehl	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/8207c9a5-55ed-41a7-a238-4ef4d22a6059	35cf86710c6d930ee7610bf1bb5dbe11@gmail.com	*****	*****	*****	2017-05-01 10:13:32.139-07	2017-05-01 10:13:35.793-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Lacey	Reinoehl	\N	\N	f
76	0	rosetheresa	\N	d13f331afaae109d7c30e231be465401@gmail.com	*****	*****	*****	2016-01-29 15:19:47.116-08	2016-09-28 03:15:16.734-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Rose	THERESA	\N	\N	f
1305	0	judithagbotse	\N	aba7551e89f249da0fae69d2be8f5128@gmail.com	*****	*****	*****	2016-09-29 10:44:40.429-07	2016-09-29 10:44:40.429-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Judith	Agbotse	\N	\N	f
1377	0	silviapina	\N	e59b939ecc4c77c350f966165188ad7e@gmail.com	*****	*****	*****	2016-09-29 11:43:49.189-07	2016-09-29 11:43:49.189-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Silvia	Pina	\N	\N	f
551	0	allisoncanestaro	\N	a4f59257d033d8eb46bbb19bcf290430@gmail.com	*****	*****	*****	2016-06-06 12:04:33.418-07	2016-09-28 03:15:17.39-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Allison	Canestaro	\N	\N	f
1307	0	fatmadjoudjou	\N	35523780be14ccacd1194641ba0bde57@gmail.com	*****	*****	*****	2016-09-29 10:49:43.051-07	2016-09-29 10:49:43.051-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Fatma	Djoudjou	\N	\N	f
75	0	gabrielaadamova	\N	ef131790a7c920cf2e1603358efc1449@gmail.com	*****	*****	*****	2016-01-29 15:19:43.713-08	2016-09-28 03:15:16.708-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Gabriela	Adamova	\N	\N	f
78	0	fanya	\N	4983e60f20be60f3cd44948b1c1c0087@gmail.com	*****	*****	*****	2016-01-29 15:20:00.061-08	2016-09-28 03:15:16.735-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Fanya		\N	\N	f
1308	0	rachabella	\N	ae5eeb5acc070587de95739c5f58d0a1@gmail.com	*****	*****	*****	2016-09-29 10:49:43.061-07	2016-09-29 10:49:43.061-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Racha	Bella	\N	\N	f
1367	0	christinalynch	\N	a95d13b713d4ac6181570e7e9b909b05@gmail.com	*****	*****	*****	2016-09-29 11:37:07.344-07	2016-09-29 11:37:07.344-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Christina	Lynch	\N	\N	f
642	0	joeycrose	https://opencollective-production.s3-us-west-1.amazonaws.com/IndianVisa_RosenbergJPG_17d93090-37ca-11e6-90ee-0555971b7ddd.JPG	c798ff50a86d1b17424f940a93fe10d8@gmail.com	*****	*****	*****	2016-06-21 09:02:52.874-07	2016-09-28 03:15:17.476-07	\N	\N	\N	*****	\N	joeycrose	\N	*****	\N	\N	f	\N	\N	\N	Joey	Rosenberg	\N	\N	f
72	0	musingmurmurs	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/0addaf63-25c3-4f61-85bd-9ddec639dbaa	9d5e8daeff013b0f404f87206eed86f9@gmail.com	*****	*****	*****	2016-01-29 15:19:22.243-08	2016-09-28 03:15:16.708-07	\N	\N	\N	*****	\N	MusingMurmurs	\N	*****	\N	\N	f	\N	\N	\N	Elizabeth	Ferrao	\N	\N	f
77	0	zoemadden-wood	\N	7ac57722768c7d3749d19e06e8ba389d@gmail.com	*****	*****	*****	2016-01-29 15:19:53.922-08	2016-09-28 03:15:16.734-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Zoe	Madden-Wood	\N	\N	f
1309	0	shwethalakshmanrao	\N	24b7f50b91ac3f9b0fbf879e9039aa0a@gmail.com	*****	*****	*****	2016-09-29 10:51:29.333-07	2016-09-29 10:51:29.333-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Shwetha	Lakshman Rao	\N	\N	f
646	0	lindseybarrett	\N	e717495c9186295c79d02397add07124@gmail.com	*****	*****	*****	2016-06-22 13:09:43.896-07	2016-09-28 03:15:17.513-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Lindsey	Barrett	\N	\N	f
1310	0	smitharadhakrishnan	\N	31d3a19861b19e3c5d1eb2b483370ee1@gmail.com	*****	*****	*****	2016-09-29 10:51:29.334-07	2016-09-29 10:51:29.334-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Smitha	Radhakrishnan	\N	\N	f
1355	0	oksanadenesiuk	\N	4365a1d13eca1c78bd460ec7d17b2544@gmail.com	*****	*****	*****	2016-09-29 11:30:08.978-07	2016-09-29 11:30:08.978-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Oksana	Denesiuk	\N	\N	f
80	0	marulango	https://res.cloudinary.com/opencollective/image/upload/v1483038929/8vJ-Prbe_imotym.png	447bd08d1ff86983e66a70858775669d@gmail.com	*****	*****	*****	2016-02-02 08:52:02.222-08	2016-09-28 03:15:16.766-07	\N	\N	\N	*****	http://maruma.ru	Marulango	\N	*****	\N	\N	f	\N	\N	\N	Maru	Lango	\N	\N	f
1312	0	xinhuili	\N	71eb923685350087d1aa38bed7843ac3@gmail.com	*****	*****	*****	2016-09-29 10:53:00.503-07	2016-09-29 10:53:00.503-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Xinhui	Li	\N	\N	f
31	0	sandrawwc	https://media.licdn.com/media/p/1/000/056/1e1/1c4c4e1.jpg	27e19add9323d39d0b3f60dde40fee33@gmail.com	*****	*****	*****	2016-01-11 10:53:43.73-08	2016-07-04 13:12:12.413-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Sandra		\N	\N	f
1313	0	gilliancolan-o'leary	\N	cf9301117f3684b125ddc70a811c9ff9@gmail.com	*****	*****	*****	2016-09-29 10:54:53.45-07	2016-09-29 10:54:53.45-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Gillian	Colan-O'Leary	\N	\N	f
1314	0	shereeatcheson	\N	d8775d54111aaf3d47957c5c4f539049@gmail.com	*****	*****	*****	2016-09-29 10:54:53.462-07	2016-09-29 10:54:53.462-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Sheree	Atcheson	\N	\N	f
70	0	beth	\N	5c7fa359b4ee800bae4b5e919a433171@gmail.com	*****	*****	*****	2016-01-29 15:18:53.83-08	2017-03-12 11:10:38.549-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	beth	laing	\N	\N	f
2549	0	eileenc	https://opencollective-production.s3-us-west-1.amazonaws.com/7be57fdf74ce40868c36ec561b515b9d_8a6a4900-da7c-11e6-af11-676b2b71a93b.jpeg	80afcb383424a739a793e105bdb617f9@gmail.com	*****	*****	*****	2017-01-14 09:11:39.224-08	2017-02-22 16:10:36.94-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Eileen	C	\N	\N	f
1315	0	isabellaoliveira	\N	f23b8ce26e6121a5e9dc38462e2776fa@gmail.com	*****	*****	*****	2016-09-29 10:58:16.63-07	2016-09-29 10:58:16.63-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Isabella	Oliveira	\N	\N	f
1316	0	miazhu	\N	2d3396ed13ba45c0c471b3af1aabdf2a@gmail.com	*****	*****	*****	2016-09-29 10:59:15.428-07	2016-09-29 10:59:15.428-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Mia	Zhu	\N	\N	f
896	0	geoffdomoracki	\N	898029d0f8816a246e0c7a7c65341485@gmail.com	*****	*****	*****	2016-08-03 10:47:13.173-07	2016-09-28 03:15:17.897-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Geoff	Domoracki	\N	\N	f
1317	0	amberjoyner	\N	7c54f08b683464eac663bd982037283a@gmail.com	*****	*****	*****	2016-09-29 11:01:04.636-07	2016-09-29 11:01:04.636-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Amber	Joyner	\N	\N	f
1318	0	sallykingston	\N	96950200d2eca5a63244a97b75f536b7@gmail.com	*****	*****	*****	2016-09-29 11:01:04.636-07	2016-09-29 11:01:04.636-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Sally	Kingston	\N	\N	f
1347	0	marisolacuna	\N	8f78c6c692cd973103ba9c647a361577@gmail.com	*****	*****	*****	2016-09-29 11:25:21.95-07	2016-09-29 11:25:21.95-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Marisol	Acuna	\N	\N	f
68	0	rylee	\N	7ddc7e8e6d4fdfa9d934e55a2b005d87@gmail.com	*****	*****	*****	2016-01-29 15:18:13.688-08	2016-09-28 03:15:17.148-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Rylee		\N	\N	f
3442	0	nalini	https://opencollective-production.s3-us-west-1.amazonaws.com/9R0XXM9_normalpng_75889240-04f6-11e7-8ab4-9b0a3890c09e.png	b6e18803305e056856ccb858af7e6d86@gmail.com	*****	*****	*****	2017-03-09 10:29:51.939-08	2017-03-09 10:30:24.238-08	\N	\N	\N	*****	http://www.polsonlawfirm.com/	\N	\N	*****	\N	\N	f	\N	\N	\N	Polson	& Polson, P.C.	\N	\N	f
1319	0	nehakaura	\N	6bfab1190102baca886112ebc885f691@gmail.com	*****	*****	*****	2016-09-29 11:01:49.703-07	2016-09-29 11:01:49.703-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Neha	Kaura	\N	\N	f
1321	0	candicehaddad	\N	309a70eda3c7ffe404a6ca6569c939bf@gmail.com	*****	*****	*****	2016-09-29 11:02:54.555-07	2016-09-29 11:02:54.555-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Candice	Haddad	\N	\N	f
1320	0	amberhoule	\N	843f89b3975c3b7fc84068f95fc796cc@gmail.com	*****	*****	*****	2016-09-29 11:02:54.546-07	2016-09-29 11:02:54.546-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Amber	Houle	\N	\N	f
884	0	nycda	https://opencollective-production.s3-us-west-1.amazonaws.com/rlc8ysokffcsnalr5jav_normalgif_7ff2c640-5800-11e6-a2a8-bb3ee7158535.gif	ee80bff7c018dc2ecb0468b05451d03c@gmail.com	*****	*****	*****	2016-08-01 08:55:23.132-07	2016-08-01 08:56:25.628-07	\N	\N	\N	*****	http://nycda.com/austin	atxcodedesign	\N	*****	\N	\N	t	\N	\N	\N	New	York Code + Design Academy (Austin)	\N	\N	f
1322	0	carolebennett	\N	bc72c4b9fd99b99cfd7cc6decbd58008@gmail.com	*****	*****	*****	2016-09-29 11:03:46.798-07	2017-02-15 10:12:58.843-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Carole	Bennett	\N	\N	f
897	0	radhikam	\N	a48b149e339d16ec672b8abea68be0e3@gmail.com	*****	*****	*****	2016-08-02 17:00:00-07	2017-04-17 09:41:26.051-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Radhika	Malik	\N	\N	f
4749	0	eli	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/d7d17c0e-20b0-40ae-a128-eaf85a311f0c	42cdf9a221d1dbffc6da14cd53207b4c@gmail.com	*****	*****	*****	2017-05-10 16:45:43.307-07	2017-05-10 16:45:44.074-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Elijah	Van Der Giessen	\N	\N	f
898	0	casey	\N	ad38fa1d5fec65ace946d4b5a1da5e78@gmail.com	*****	*****	*****	2016-08-02 17:00:00-07	2016-08-02 17:00:00-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Casey	Gruppioni	\N	\N	f
1323	0	mairabejamin	\N	d4caf7062fecc15e4fa181bf8632bbdf@gmail.com	*****	*****	*****	2016-09-29 11:05:19.073-07	2016-09-29 11:05:19.073-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Maira	Bejamin	\N	\N	f
1324	0	candacelazarou	\N	8fd43f5cd0be03abdf7f57c45559f394@gmail.com	*****	*****	*****	2016-09-29 11:05:19.079-07	2016-09-29 11:05:19.079-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Candace	Lazarou	\N	\N	f
1326	0	keshashah	\N	64b6e8606a0a0dcdd531b7f51f0dfe24@gmail.com	*****	*****	*****	2016-09-29 11:06:44.745-07	2016-09-29 11:06:44.745-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	KeSha	Shah	\N	\N	f
555	0	dcacm	https://opencollective-production.s3-us-west-1.amazonaws.com/dcacmorg_5f260cb0-2c4a-11e6-80e4-310475aa5f5c.png	3379a40c501c7f24d233be62ce9a94c5@gmail.com	*****	*****	*****	2016-06-06 17:53:44.829-07	2016-09-28 03:15:17.29-07	\N	\N	\N	*****	http://dcacm.org	dcacm	\N	*****	\N	\N	f	\N	\N	\N	Shahnaz	Kamberi	\N	\N	f
426	0	ellevest	https://opencollective-production.s3-us-west-1.amazonaws.com/ellevestcom_0882df80-2125-11e6-9a76-e98f5a4a50b6.png	c989f4c11bd20a6754a75c38303a4767@gmail.com	*****	*****	*****	2016-05-23 13:27:26.092-07	2016-09-28 03:15:17.365-07	\N	\N	\N	*****	http://www.ellevest.com	Ellevest	\N	*****	\N	\N	f	\N	\N	\N	Ellevest		\N	\N	f
1330	0	fjgenus	\N	51d33c46424eb3f4647ded569bda1da3@gmail.com	*****	*****	*****	2016-09-29 11:09:42.794-07	2016-09-29 11:09:42.794-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	FJ	Genus	\N	\N	f
1145	0	janeshih	\N	0d11c83dcf3d75bc133ab5010187b7b6@gmail.com	*****	*****	*****	2016-09-07 15:13:23.624-07	2016-09-28 03:15:18.184-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Jane	Shih	\N	\N	f
1094	0	thirteen23	https://opencollective-production.s3-us-west-1.amazonaws.com/thirteen23com_805f0980-7052-11e6-8e5a-492f532f3a40.png	acb49a7f9ec2454380130c56c32ebbec@gmail.com	*****	*****	*****	2016-09-01 07:41:33.243-07	2016-09-01 07:43:52.954-07	\N	\N	\N	*****	http://www.thirteen23.com	thirteen23	\N	*****	\N	\N	t	\N	\N	\N	thirteen23		\N	\N	f
1158	0	pieceofr	https://opencollective-production.s3-us-west-1.amazonaws.com/2c8df290-7709-11e6-a96a-b97f0af14723.jpg	3a0a65e6b6e105f4835f188459a7b979@gmail.com	*****	*****	*****	2016-09-09 20:42:48.933-07	2016-09-28 03:15:18.225-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Pieceofr		\N	\N	f
1334	0	vinitakhandelwalrathi	\N	416e8cd289733c0bb5ed83f3ede37276@gmail.com	*****	*****	*****	2016-09-29 11:11:53.843-07	2016-09-29 11:11:53.843-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Vinita	Khandelwal Rathi	\N	\N	f
1336	0	tiffanyandrews	\N	0830431cc80ea3b8d7b9dc5eed3fde68@gmail.com	*****	*****	*****	2016-09-29 11:12:58.852-07	2016-09-29 11:12:58.852-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Tiffany	Andrews	\N	\N	f
1337	0	isabelyepes	\N	d32d64b3fc1390780651de634d212e50@gmail.com	*****	*****	*****	2016-09-29 11:13:48.772-07	2016-09-29 11:13:48.772-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Isabel	Yepes	\N	\N	f
1339	0	griselancona	\N	99b642de95827a0d4bba0315ddd40723@gmail.com	*****	*****	*****	2016-09-29 11:15:23.931-07	2016-09-29 11:15:23.931-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Grisel	Ancona	\N	\N	f
1338	0	princyjames	\N	27196e10ddabe6055a003b98d791a15b@gmail.com	*****	*****	*****	2016-09-29 11:14:46.606-07	2016-09-29 11:14:46.606-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Princy	James	\N	\N	f
1340	0	emilyreese	\N	8abf71093dbd2bfc653a5bc12a5a7b89@gmail.com	*****	*****	*****	2016-09-29 11:16:17.115-07	2016-09-29 11:16:17.115-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Emily	Reese	\N	\N	f
1342	0	veronicacannon	\N	530e82f7e0744b9b860f9811257e0b13@gmail.com	*****	*****	*****	2016-09-29 11:17:47.289-07	2016-09-29 11:17:47.289-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Veronica	Cannon	\N	\N	f
1341	0	jenniferhoover	\N	0cd39d443715253ede1c195f212fa858@gmail.com	*****	*****	*****	2016-09-29 11:16:52.099-07	2016-09-29 11:16:52.099-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Jennifer	Hoover	\N	\N	f
1343	0	andrezaleite	\N	8832824eb21ff845244a89b2aeb53972@gmail.com	*****	*****	*****	2016-09-29 11:19:11.446-07	2016-09-29 11:19:11.446-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Andreza	Leite	\N	\N	f
1345	0	ashmasethi	\N	32d477008ca7ce468c8b6894d3527377@gmail.com	*****	*****	*****	2016-09-29 11:24:17.802-07	2016-09-29 11:24:17.802-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Ashma	Sethi	\N	\N	f
1346	0	shrutisethi	\N	c9606a2459e0fef1e21cdc86c3eb2683@gmail.com	*****	*****	*****	2016-09-29 11:24:17.81-07	2016-09-29 11:24:17.81-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Shruti	Sethi	\N	\N	f
73	0	barbara	\N	9cc8932f53ca5322fab8553db692e6a7@gmail.com	*****	*****	*****	2016-01-29 15:19:28.648-08	2016-09-28 03:15:18.347-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Barbara		\N	\N	f
1348	0	roxanecastelein	\N	feb1e25523fe209c41071badd848f502@gmail.com	*****	*****	*****	2016-09-29 11:25:21.969-07	2016-09-29 11:25:21.969-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Roxane	Castelein	\N	\N	f
1349	0	qianyizheng	\N	784d1666f6262338f095884b8b2ab1d8@gmail.com	*****	*****	*****	2016-09-29 11:26:35.133-07	2016-09-29 11:26:35.133-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Qianyi	Zheng	\N	\N	f
1350	0	yokaliu	\N	275a7843d04d598eb4949a8f3b98f170@gmail.com	*****	*****	*****	2016-09-29 11:26:35.139-07	2016-09-29 11:26:35.139-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Yoka	Liu	\N	\N	f
1351	0	kathytrammell	\N	2112fabeedef785fff13999b12f6e057@gmail.com	*****	*****	*****	2016-09-29 11:28:08.47-07	2016-09-29 11:28:08.47-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Kathy	Trammell	\N	\N	f
1353	0	riariaz	\N	672ed3d7420c37155d2978ef9bb4bddd@gmail.com	*****	*****	*****	2016-09-29 11:28:54.276-07	2016-09-29 11:28:54.276-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Ria	Riaz	\N	\N	f
1356	0	dinahshi	\N	d182a2ddbeeb69d5629028cfaeda4356@gmail.com	*****	*****	*****	2016-09-29 11:30:54.244-07	2016-09-29 11:30:54.244-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Dinah	Shi	\N	\N	f
392	0	tswicegood	https://opencollective-production.s3-us-west-1.amazonaws.com/03134eb6a2764594808716e5c3f0dc6c_690fce70-1df7-11e6-b09a-bd4f4a904ffe.jpeg	914df0c8ab1f8b15a8ab1a7e77a3bcc0@gmail.com	*****	*****	*****	2016-05-19 12:24:40.738-07	2016-09-28 03:15:18.36-07	\N	\N	\N	*****	http://www.travisswicegood.com	tswicegood	\N	*****	\N	\N	f	\N	\N	\N	Travis	Swicegood	\N	\N	f
1244	0	grain_app	https://opencollective-production.s3-us-west-1.amazonaws.com/grainappio_20c2d740-7f75-11e6-998a-b5046561186d.png	e953c9a4e2c5bb69552f3c92acb936ed@gmail.com	*****	*****	*****	2016-09-20 13:58:49.633-07	2016-09-28 03:15:18.662-07	\N	\N	\N	*****	https://grainapp.io	grain_app	\N	*****	\N	\N	f	\N	\N	\N	Grain		\N	\N	f
1352	0	sarrahvesselov	\N	6b0788c1db2895a00b16e51bbda21ee5@gmail.com	*****	*****	*****	2016-09-29 11:28:08.475-07	2016-12-20 11:09:35.349-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Sarrah	Vesselov	\N	\N	f
1354	0	kseniabarshchyk	\N	a77dcae86c4a98f96f10de27166b1212@gmail.com	*****	*****	*****	2016-09-29 11:30:08.971-07	2016-09-29 11:30:08.971-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Ksenia	Barshchyk	\N	\N	f
1357	0	brittenkuckelman	\N	923bd4c7e11e7c7afc4c51e31374a7f5@gmail.com	*****	*****	*****	2016-09-29 11:32:00.979-07	2016-09-29 11:32:00.979-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Britten	Kuckelman	\N	\N	f
1438	0	hectortorres	https://opencollective-production.s3-us-west-1.amazonaws.com/7aOKGnA1_normaljpg_f6ea41c0-8bf3-11e6-8916-b3b1b8ac2e00.jpeg	ca459f986fe2770c3231788ec004352a@gmail.com	*****	*****	*****	2016-10-06 11:36:34.986-07	2016-10-06 11:37:42.185-07	\N	\N	\N	*****	http://summit.ulahealth.me	ulahealth	\N	*****	\N	\N	f	\N	\N	\N	Hector	Torres	\N	\N	f
1446	0	wei-juinlin	\N	17ab59318e1a638274d84ee4f4617cd4@gmail.com	*****	*****	*****	2016-10-07 09:49:14.297-07	2016-10-07 09:49:50.24-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Wei-Juin	Lin	\N	\N	f
4711	0	kjcpaas	\N	32714f8fbf59186a1fe4eb47e2d1d40e@gmail.com	*****	*****	*****	2017-05-08 22:59:11.628-07	2017-05-08 22:59:13.896-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Kristine	Paas	\N	\N	f
1957	0	maddylau	https://logo.clearbit.com/nycda.com	d9ca31bcfecac96ff71cf6036d192503@gmail.com	*****	*****	*****	2016-11-30 08:11:38.749-08	2016-11-30 08:12:01.534-08	\N	\N	\N	*****	http://nycda.com	nycodedesign	\N	*****	\N	\N	f	\N	\N	\N	Maddy	Lau	\N	\N	f
2416	0	kellyerickson	\N	c909e10b24422a34ea20a79b9a906cf5@gmail.com	*****	*****	*****	2017-01-03 12:59:33.995-08	2017-01-03 12:59:33.995-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Kelly	Erickson	\N	\N	f
1808	0	christinepechette	https://logo.clearbit.com/rigado.com	ca0ddd5acb195ee0e3884842e8656755@gmail.com	*****	*****	*****	2016-11-17 09:43:26.15-08	2016-11-17 09:44:20.864-08	\N	\N	\N	*****	https://www.rigado.com/	RigadoLLC	\N	*****	\N	\N	f	\N	\N	\N	Rigado		\N	\N	f
1908	0	maikesteinweller	https://opencollective-production.s3-us-west-1.amazonaws.com/24be6ad0-b61b-11e6-9f3b-115a2450f71e.jpg	8a3f905ee55db87a19779a214587e529@gmail.com	*****	*****	*****	2016-11-29 02:03:21.301-08	2016-11-29 02:04:01.298-08	\N	\N	\N	*****	http://www.wooga.com	wooga	\N	*****	\N	\N	f	\N	\N	\N	Wooga		\N	\N	f
1374	0	snehalpatil	https://opencollective-production.s3-us-west-1.amazonaws.com/eea1cd90-adc6-11e6-97ba-67ed1cda3697.png	4d9f4287fe4e2a93b73c1cb08be76148@gmail.com	*****	*****	*****	2016-09-29 11:41:11.059-07	2016-12-19 14:20:00.592-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Snehal	Patil	\N	\N	f
1304	0	afiaowusu-forfie	\N	e1b16aaaf8961ee0acdbd9d306561b03@gmail.com	*****	*****	*****	2016-09-29 10:44:40.419-07	2016-12-29 10:39:36.018-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Afia	Owusu-Forfie	\N	\N	f
126	0	alaina	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/fb1f0fd9-4da7-4c66-847b-0eaaf5fe88e9	89144a979199c98e09581ea3cdcd89f5@gmail.com	*****	*****	*****	2016-03-01 20:41:59.905-08	2016-12-01 12:04:48.511-08	\N	\N	\N	*****	http://womenwhocode.com	alaina	\N	*****	\N	\N	f	\N	\N	\N	Alaina	Percival	\N	\N	f
2431	0	nataliia	/public/images/users/avatar-04.svg	f4da08d72d1a2dfe1f47db5f46a62a5b@gmail.com	*****	*****	*****	2017-01-03 16:00:00-08	2017-04-28 13:39:58.316-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	WWCode Kyiv Director	\N	\N	Nataliia	Ilchenko	\N	\N	f
1303	0	shirleyhicks	https://opencollective-production.s3-us-west-1.amazonaws.com/7d7b2ba6c0a24e269f7853f4eb9fdced_72776110-b138-11e6-afe2-6129fbf4c498.png	da23087dbcb3966f332eb0d22ebbdde1@gmail.com	*****	*****	*****	2016-09-29 10:43:14.052-07	2016-11-22 23:21:46.01-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	Network director, Women Who Code Birmingham<div><br></div>	\N	\N	Shirley	Hicks	\N	\N	f
1846	0	mrlnmarce	https://opencollective-production.s3-us-west-1.amazonaws.com/8cb68090-b0c7-11e6-8d75-191d15208aa9.png	f57e8a5f4bb72290e312a6c29b1407a3@gmail.com	*****	*****	*****	2016-11-22 07:22:35.912-08	2016-11-22 07:23:28.441-08	\N	\N	\N	*****	http://www.uncorkedstudios.com	mrlnmarce	\N	*****	\N	\N	f	\N	\N	\N	Portland	Modern Manufacturing Collective	\N	\N	f
2561	0	ambassadorawsum	https://d1ts43dypk8bqh.cloudfront.net/v1/avatars/2150894e-87e2-4dab-8ffa-894342f0336b	0dbc97aceea70683f46b266f2c0e559a@gmail.com	*****	*****	*****	2017-01-16 10:03:53.479-08	2017-01-16 10:03:53.479-08	\N	\N	\N	*****	http://amandafolson.net/about/#twitter	AmbassadorAwsum	\N	*****	\N	\N	f	\N	\N	\N	Amanda	Folson	\N	\N	f
2220	0	cameron1	\N	73e73afea6c744a00d6963fbf8a4ef16@gmail.com	*****	*****	*****	2016-12-18 17:41:26.473-08	2017-01-06 23:47:05.144-08	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	\N	\N	\N	Cameron	🐳✨	\N	\N	f
1344	0	karinamachado	https://opencollective-production.s3-us-west-1.amazonaws.com/a6711e2eef3c42dbaa7b9e658670e44e_65470050-13c0-11e7-8edd-59205a885cb5.jpeg	d6dd386d45dd48d56872b57c7502ba72@gmail.com	*****	*****	*****	2016-09-29 11:19:11.45-07	2017-04-30 15:09:37.177-07	\N	\N	\N	*****	\N	\N	\N	*****	\N	\N	f	I am web developer, Director WWcode Recife - Brazil	\N	\N	Karina		\N	\N	f
2594	0	tamouse1	https://opencollective-production.s3-us-west-1.amazonaws.com/8e79f1498f3e4a4ab53bec89d5dfc1e5_43f16060-dd85-11e6-bf52-5b99c6274a65.jpeg	ad47316cbe8c10d21978ee1dc5746792@gmail.com	*****	*****	*****	2017-01-18 05:49:53.082-08	2017-01-18 05:55:44.616-08	\N	\N	\N	*****	http://www.tamouse.org	tamouse	\N	*****	\N	\N	f	\N	\N	\N	Tamouse	Temple	\N	\N	f
142	0	saraholson	https://opencollective-production.s3-us-west-1.amazonaws.com/306b9860-dd87-11e6-aabd-af731cff2f24.jpeg	3723537c491f597e9c203bad685dd9d7@gmail.com	*****	*****	*****	2016-03-07 01:51:08.328-08	2017-02-10 16:24:03.134-08	\N	\N	\N	*****	https://www.linkedin.com/in/saraheolson	\N	\N	*****	\N	\N	f	Director of Women Who Code Twin Cities	I'm a Senior Software Engineer, currently working on the iOS app at Trello. I'm the Director of Women Who Code Twin Cities.	\N	Sarah	Olson	\N	\N	f
3	0	adminwwc	https://opencollective-production.s3-us-west-1.amazonaws.com/wwcode_Final20Logojpg_abb42770-0335-11e7-9b56-cb401d104ebf.jpeg	a1c73eb4917522c4cdcebe8736395eb3@gmail.com	*****	*****	*****	2015-11-19 02:07:53.479-08	2017-05-22 09:22:41.796-07	\N	\N	\N	*****	https://www.womenwhocode.com/	\N	20	*****	2017-03-01 21:58:23.993-08	\N	t	\N	\N	\N	Women	Who Code	\N	MXN	t
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              3797.dat                                                                                            0000600 0004000 0002000 00000000005 13124477143 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000201116 13124477143 0015373 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_referrerId_fkey";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_StripeAccountId_fkey";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_ApplicationId_fkey";
ALTER TABLE ONLY public."UserGroups" DROP CONSTRAINT "UserGroups_UserId_fkey";
ALTER TABLE ONLY public."UserGroups" DROP CONSTRAINT "UserGroups_GroupId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_UserId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_HostId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_GroupId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_ExpenseId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_DonationId_fkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_CardId_fkey";
ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_EventId_fkey";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_UserId_fkey";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_GroupId_fkey";
ALTER TABLE ONLY public."Responses" DROP CONSTRAINT "Responses_UserId_fkey";
ALTER TABLE ONLY public."Responses" DROP CONSTRAINT "Responses_TierId_fkey";
ALTER TABLE ONLY public."Responses" DROP CONSTRAINT "Responses_GroupId_fkey";
ALTER TABLE ONLY public."Responses" DROP CONSTRAINT "Responses_EventId_fkey";
ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_TransactionId_fkey";
ALTER TABLE ONLY public."Groups" DROP CONSTRAINT "Groups_lastEditedByUserId_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_lastEditedById_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_UserId_fkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_GroupId_fkey";
ALTER TABLE ONLY public."Events" DROP CONSTRAINT "Events_createdByUserId_fkey";
ALTER TABLE ONLY public."Events" DROP CONSTRAINT "Events_GroupId_fkey";
ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "EventId_foreign_idx";
ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_UserId_fkey";
ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_SubscriptionId_fkey";
ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_ResponseId_fkey";
ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_PaymentMethodId_fkey";
ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_GroupId_fkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_UserId_fkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_GroupId_fkey";
ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_UserId_fkey";
ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_GroupId_fkey";
ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_ExpenseId_fkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_UserId_fkey";
ALTER TABLE ONLY public."ApplicationGroup" DROP CONSTRAINT "ApplicationGroup_GroupId_fkey";
ALTER TABLE ONLY public."ApplicationGroup" DROP CONSTRAINT "ApplicationGroup_ApplicationId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_UserId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_TransactionId_fkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_GroupId_fkey";
DROP INDEX public.transactions_uuid;
DROP INDEX public.subscriptions_type__group_id__user_id;
DROP INDEX public."UserGroups_3way";
DROP INDEX public."UniqueSlugIndex";
DROP INDEX public."UniqueGroupIdSlugIndex";
DROP INDEX public."Transactions_GroupId";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT email_unique_idx;
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_username_key";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
ALTER TABLE ONLY public."UserGroups" DROP CONSTRAINT "UserGroups_pkey";
ALTER TABLE ONLY public."Transactions" DROP CONSTRAINT "Transactions_pkey";
ALTER TABLE ONLY public."Tiers" DROP CONSTRAINT "Tiers_pkey";
ALTER TABLE ONLY public."Subscriptions" DROP CONSTRAINT "Subscriptions_pkey1";
ALTER TABLE ONLY public."Notifications" DROP CONSTRAINT "Subscriptions_pkey";
ALTER TABLE ONLY public."StripeAccounts" DROP CONSTRAINT "StripeAccounts_pkey";
ALTER TABLE ONLY public."Sessions" DROP CONSTRAINT "Sessions_pkey";
ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
ALTER TABLE ONLY public."Responses" DROP CONSTRAINT "Responses_pkey";
ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_pkey";
ALTER TABLE ONLY public."Paykeys" DROP CONSTRAINT "Paykeys_paykey_key";
ALTER TABLE ONLY public."Groups" DROP CONSTRAINT "Groups_pkey";
ALTER TABLE ONLY public."GroupHistories" DROP CONSTRAINT "GroupHistories_pkey";
ALTER TABLE ONLY public."Expenses" DROP CONSTRAINT "Expenses_pkey";
ALTER TABLE ONLY public."ExpenseHistories" DROP CONSTRAINT "ExpenseHistories_pkey";
ALTER TABLE ONLY public."Events" DROP CONSTRAINT "Events_pkey";
ALTER TABLE ONLY public."Donations" DROP CONSTRAINT "Donations_pkey";
ALTER TABLE ONLY public."ConnectedAccounts" DROP CONSTRAINT "ConnectedAccounts_pkey";
ALTER TABLE ONLY public."Comments" DROP CONSTRAINT "Comments_pkey";
ALTER TABLE ONLY public."PaymentMethods" DROP CONSTRAINT "Cards_pkey";
ALTER TABLE ONLY public."Applications" DROP CONSTRAINT "Applications_pkey";
ALTER TABLE ONLY public."ApplicationGroup" DROP CONSTRAINT "ApplicationGroup_pkey";
ALTER TABLE ONLY public."Activities" DROP CONSTRAINT "Activities_pkey";
ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."UserGroups" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Transactions" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Tiers" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Subscriptions" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."StripeAccounts" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Responses" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."PaymentMethods" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Paykeys" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Notifications" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Groups" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."GroupHistories" ALTER COLUMN hid DROP DEFAULT;
ALTER TABLE public."Expenses" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."ExpenseHistories" ALTER COLUMN hid DROP DEFAULT;
ALTER TABLE public."Events" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Donations" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."ConnectedAccounts" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Comments" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Applications" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Activities" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public."Users_id_seq";
DROP TABLE public."Users";
DROP SEQUENCE public."UserGroups_id_seq";
DROP TABLE public."UserGroups";
DROP SEQUENCE public."Transactions_id_seq";
DROP TABLE public."Transactions";
DROP SEQUENCE public."Tiers_id_seq";
DROP TABLE public."Tiers";
DROP SEQUENCE public."Subscriptions_id_seq1";
DROP SEQUENCE public."Subscriptions_id_seq";
DROP TABLE public."Subscriptions";
DROP SEQUENCE public."StripeAccounts_id_seq";
DROP TABLE public."StripeAccounts";
DROP TABLE public."Sessions";
DROP TABLE public."SequelizeMeta";
DROP SEQUENCE public."Responses_id_seq";
DROP TABLE public."Responses";
DROP SEQUENCE public."Paykeys_id_seq";
DROP TABLE public."Paykeys";
DROP TABLE public."Notifications";
DROP SEQUENCE public."Groups_id_seq";
DROP TABLE public."Groups";
DROP SEQUENCE public."GroupHistories_hid_seq";
DROP TABLE public."GroupHistories";
DROP SEQUENCE public."Expenses_id_seq";
DROP TABLE public."Expenses";
DROP SEQUENCE public."ExpenseHistories_hid_seq";
DROP TABLE public."ExpenseHistories";
DROP SEQUENCE public."Events_id_seq";
DROP TABLE public."Events";
DROP SEQUENCE public."Donations_id_seq";
DROP TABLE public."Donations";
DROP SEQUENCE public."ConnectedAccounts_id_seq";
DROP TABLE public."ConnectedAccounts";
DROP SEQUENCE public."Comments_id_seq";
DROP TABLE public."Comments";
DROP SEQUENCE public."Cards_id_seq";
DROP TABLE public."PaymentMethods";
DROP SEQUENCE public."Applications_id_seq";
DROP TABLE public."Applications";
DROP TABLE public."ApplicationGroup";
DROP SEQUENCE public."Activities_id_seq";
DROP TABLE public."Activities";
DROP TYPE public."enum_UserGroups_role";
DROP TYPE public."enum_Groups_membership_type";
DROP EXTENSION postgis;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

--
-- Name: enum_Groups_membership_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_Groups_membership_type" AS ENUM (
    'donation',
    'monthlyfee',
    'yearlyfee'
);


--
-- Name: enum_UserGroups_role; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE "enum_UserGroups_role" AS ENUM (
    'admin',
    'writer',
    'viewer'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Activities" (
    id integer NOT NULL,
    type character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "GroupId" integer,
    "UserId" integer,
    "TransactionId" integer
);


--
-- Name: Activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Activities_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Activities_id_seq" OWNED BY "Activities".id;


--
-- Name: ApplicationGroup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ApplicationGroup" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "GroupId" integer NOT NULL,
    "ApplicationId" integer NOT NULL
);


--
-- Name: Applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Applications" (
    id integer NOT NULL,
    api_key character varying(255),
    name character varying(255),
    href character varying(255),
    description character varying(255),
    disabled boolean DEFAULT false,
    _access double precision DEFAULT 0,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


--
-- Name: Applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Applications_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Applications_id_seq" OWNED BY "Applications".id;


--
-- Name: PaymentMethods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "PaymentMethods" (
    id integer NOT NULL,
    number character varying(255),
    token character varying(255),
    "customerId" character varying(255),
    service character varying(255) DEFAULT 'stripe'::character varying,
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "confirmedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "UserId" integer,
    "expiryDate" timestamp with time zone
);


--
-- Name: Cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Cards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Cards_id_seq" OWNED BY "PaymentMethods".id;


--
-- Name: Comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Comments" (
    id integer NOT NULL,
    text text,
    "createdAt" timestamp with time zone,
    "approvedAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "UserId" integer NOT NULL,
    "GroupId" integer NOT NULL,
    "ExpenseId" integer NOT NULL
);


--
-- Name: Comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Comments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Comments_id_seq" OWNED BY "Comments".id;


--
-- Name: ConnectedAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ConnectedAccounts" (
    id integer NOT NULL,
    provider character varying(255),
    username character varying(255),
    "clientId" character varying(255),
    secret character varying(255),
    data json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "UserId" integer,
    "GroupId" integer
);


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ConnectedAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ConnectedAccounts_id_seq" OWNED BY "ConnectedAccounts".id;


--
-- Name: Donations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Donations" (
    id integer NOT NULL,
    "UserId" integer,
    "GroupId" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    amount integer,
    title character varying(255),
    "SubscriptionId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "PaymentMethodId" integer,
    "isProcessed" boolean DEFAULT false,
    "processedAt" timestamp with time zone,
    "ResponseId" integer,
    notes text
);


--
-- Name: Donations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Donations_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Donations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Donations_id_seq" OWNED BY "Donations".id;


--
-- Name: Events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Events" (
    id integer NOT NULL,
    name character varying(255),
    description text,
    "createdByUserId" integer,
    "GroupId" integer,
    slug character varying(255),
    "locationName" character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "maxAmount" integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    address character varying(255),
    "backgroundImage" character varying(255),
    "geoLocationLatLong" geometry(Point),
    timezone text
);


--
-- Name: Events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Events_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Events_id_seq" OWNED BY "Events".id;


--
-- Name: ExpenseHistories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ExpenseHistories" (
    id integer,
    "UserId" integer,
    "GroupId" integer,
    currency character varying(255),
    amount integer,
    title character varying(255),
    "payoutMethod" character varying(255),
    notes text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer,
    status character varying(255),
    "incurredAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "ExpenseHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "ExpenseHistories_hid_seq" OWNED BY "ExpenseHistories".hid;


--
-- Name: Expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Expenses" (
    id integer NOT NULL,
    "UserId" integer NOT NULL,
    "GroupId" integer NOT NULL,
    currency character varying(255) NOT NULL,
    amount integer NOT NULL,
    title character varying(255) NOT NULL,
    notes text,
    attachment character varying(255),
    category character varying(255),
    vat integer,
    "lastEditedById" integer NOT NULL,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    "incurredAt" timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deletedAt" timestamp with time zone,
    "payoutMethod" character varying(255) NOT NULL
);


--
-- Name: Expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Expenses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Expenses_id_seq" OWNED BY "Expenses".id;


--
-- Name: GroupHistories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "GroupHistories" (
    id integer,
    name character varying(255),
    description character varying(255),
    currency character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean,
    "longDescription" text,
    logo character varying(255),
    video character varying(255),
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    tiers json,
    burnrate integer,
    mission character varying(255),
    budget integer,
    "expensePolicy" text,
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    "whyJoin" text,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean,
    "lastEditedByUserId" integer,
    hid bigint NOT NULL,
    "archivedAt" timestamp with time zone NOT NULL
);


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "GroupHistories_hid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "GroupHistories_hid_seq" OWNED BY "GroupHistories".hid;


--
-- Name: Groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Groups" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "isActive" boolean DEFAULT false,
    "longDescription" text,
    logo character varying(255),
    video character varying(255),
    image character varying(255),
    slug character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    tiers json,
    burnrate integer,
    mission character varying(128),
    budget integer,
    "expensePolicy" text,
    "backgroundImage" character varying(255),
    "hostFeePercent" double precision,
    settings json,
    "whyJoin" text,
    data json,
    tags character varying(255)[],
    "isSupercollective" boolean DEFAULT false,
    "lastEditedByUserId" integer
);


--
-- Name: Groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Groups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Groups_id_seq" OWNED BY "Groups".id;


--
-- Name: Notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Notifications" (
    id integer NOT NULL,
    channel character varying(255) DEFAULT 'email'::character varying,
    type character varying(255),
    active boolean DEFAULT true,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "UserId" integer,
    "GroupId" integer,
    "webhookUrl" character varying(255)
);


--
-- Name: Paykeys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Paykeys" (
    id integer NOT NULL,
    "trackingId" character varying(255),
    paykey character varying(255),
    status character varying(255),
    payload json,
    data json,
    error json,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "TransactionId" integer
);


--
-- Name: Paykeys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Paykeys_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Paykeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Paykeys_id_seq" OWNED BY "Paykeys".id;


--
-- Name: Responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Responses" (
    id integer NOT NULL,
    "UserId" integer,
    "GroupId" integer,
    "TierId" integer,
    "EventId" integer,
    "confirmedAt" timestamp with time zone,
    status character varying(255) DEFAULT 'PENDING'::character varying NOT NULL,
    quantity integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    description character varying(255)
);


--
-- Name: Responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Responses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Responses_id_seq" OWNED BY "Responses".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);


--
-- Name: Sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: StripeAccounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "StripeAccounts" (
    id integer NOT NULL,
    "accessToken" character varying(255),
    "refreshToken" character varying(255),
    "tokenType" character varying(255),
    "stripePublishableKey" character varying(255),
    "stripeUserId" character varying(255),
    scope character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


--
-- Name: StripeAccounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "StripeAccounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: StripeAccounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "StripeAccounts_id_seq" OWNED BY "StripeAccounts".id;


--
-- Name: Subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Subscriptions" (
    id integer NOT NULL,
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "interval" character varying(255),
    "isActive" boolean DEFAULT false,
    data json,
    "stripeSubscriptionId" character varying(255),
    "activatedAt" timestamp with time zone,
    "deactivatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone
);


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Subscriptions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Subscriptions_id_seq" OWNED BY "Notifications".id;


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Subscriptions_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Subscriptions_id_seq1" OWNED BY "Subscriptions".id;


--
-- Name: Tiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Tiers" (
    id integer NOT NULL,
    "EventId" integer,
    name character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "maxQuantity" integer,
    password character varying(255),
    "startsAt" timestamp with time zone,
    "endsAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    slug character varying(255)
);


--
-- Name: Tiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Tiers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Tiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Tiers_id_seq" OWNED BY "Tiers".id;


--
-- Name: Transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Transactions" (
    id integer NOT NULL,
    type character varying(255),
    description character varying(255),
    amount integer,
    currency character varying(255) DEFAULT 'USD'::character varying,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone NOT NULL,
    "GroupId" integer,
    "UserId" integer,
    "PaymentMethodId" integer,
    "deletedAt" timestamp with time zone,
    data json,
    "DonationId" integer,
    "platformFeeInTxnCurrency" integer,
    "hostFeeInTxnCurrency" integer,
    "paymentProcessorFeeInTxnCurrency" integer,
    "txnCurrency" character varying(255),
    "txnCurrencyFxRate" double precision,
    "amountInTxnCurrency" integer,
    "netAmountInGroupCurrency" integer,
    "ExpenseId" integer,
    uuid character varying(36),
    "HostId" integer
);


--
-- Name: Transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Transactions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Transactions_id_seq" OWNED BY "Transactions".id;


--
-- Name: UserGroups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "UserGroups" (
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "UserId" integer NOT NULL,
    "GroupId" integer NOT NULL,
    role character varying(255) DEFAULT 'MEMBER'::character varying NOT NULL,
    id integer NOT NULL
);


--
-- Name: UserGroups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "UserGroups_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserGroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "UserGroups_id_seq" OWNED BY "UserGroups".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    _access integer DEFAULT 0,
    username character varying(255),
    avatar character varying(255),
    email character varying(255),
    _salt character varying(255) DEFAULT '$2a$10$JqAcT6sBbBs5pO9FkwqLEu'::character varying,
    refresh_token character varying(255) DEFAULT '$2a$10$IHs8e8FdK1.bqjvZxr4Zvu'::character varying,
    password_hash character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    "seenAt" timestamp with time zone,
    "deletedAt" timestamp with time zone,
    "ApplicationId" integer,
    "paypalEmail" character varying(255),
    website character varying(255),
    "twitterHandle" character varying(255),
    "StripeAccountId" integer,
    "resetPasswordTokenHash" character varying(255),
    "resetPasswordSentAt" timestamp with time zone,
    "referrerId" integer,
    "isOrganization" boolean DEFAULT false,
    description character varying(256),
    "longDescription" text,
    mission character varying(128),
    "firstName" character varying(128),
    "lastName" character varying(128),
    "billingAddress" character varying(255),
    currency character varying(255),
    "isHost" boolean DEFAULT false
);


--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- Name: Activities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities" ALTER COLUMN id SET DEFAULT nextval('"Activities_id_seq"'::regclass);


--
-- Name: Applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Applications" ALTER COLUMN id SET DEFAULT nextval('"Applications_id_seq"'::regclass);


--
-- Name: Comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Comments" ALTER COLUMN id SET DEFAULT nextval('"Comments_id_seq"'::regclass);


--
-- Name: ConnectedAccounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts" ALTER COLUMN id SET DEFAULT nextval('"ConnectedAccounts_id_seq"'::regclass);


--
-- Name: Donations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Donations" ALTER COLUMN id SET DEFAULT nextval('"Donations_id_seq"'::regclass);


--
-- Name: Events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Events" ALTER COLUMN id SET DEFAULT nextval('"Events_id_seq"'::regclass);


--
-- Name: ExpenseHistories hid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ExpenseHistories" ALTER COLUMN hid SET DEFAULT nextval('"ExpenseHistories_hid_seq"'::regclass);


--
-- Name: Expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses" ALTER COLUMN id SET DEFAULT nextval('"Expenses_id_seq"'::regclass);


--
-- Name: GroupHistories hid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupHistories" ALTER COLUMN hid SET DEFAULT nextval('"GroupHistories_hid_seq"'::regclass);


--
-- Name: Groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Groups" ALTER COLUMN id SET DEFAULT nextval('"Groups_id_seq"'::regclass);


--
-- Name: Notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq"'::regclass);


--
-- Name: Paykeys id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys" ALTER COLUMN id SET DEFAULT nextval('"Paykeys_id_seq"'::regclass);


--
-- Name: PaymentMethods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods" ALTER COLUMN id SET DEFAULT nextval('"Cards_id_seq"'::regclass);


--
-- Name: Responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Responses" ALTER COLUMN id SET DEFAULT nextval('"Responses_id_seq"'::regclass);


--
-- Name: StripeAccounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "StripeAccounts" ALTER COLUMN id SET DEFAULT nextval('"StripeAccounts_id_seq"'::regclass);


--
-- Name: Subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Subscriptions" ALTER COLUMN id SET DEFAULT nextval('"Subscriptions_id_seq1"'::regclass);


--
-- Name: Tiers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers" ALTER COLUMN id SET DEFAULT nextval('"Tiers_id_seq"'::regclass);


--
-- Name: Transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions" ALTER COLUMN id SET DEFAULT nextval('"Transactions_id_seq"'::regclass);


--
-- Name: UserGroups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserGroups" ALTER COLUMN id SET DEFAULT nextval('"UserGroups_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Data for Name: Activities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Activities" (id, type, data, "createdAt", "GroupId", "UserId", "TransactionId") FROM stdin;
\.
COPY "Activities" (id, type, data, "createdAt", "GroupId", "UserId", "TransactionId") FROM '$$PATH$$/4068.dat';

--
-- Name: Activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Activities_id_seq"', 27901, true);


--
-- Data for Name: ApplicationGroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "ApplicationGroup" ("createdAt", "updatedAt", "GroupId", "ApplicationId") FROM stdin;
\.
COPY "ApplicationGroup" ("createdAt", "updatedAt", "GroupId", "ApplicationId") FROM '$$PATH$$/4070.dat';

--
-- Data for Name: Applications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Applications" (id, api_key, name, href, description, disabled, _access, "createdAt", "updatedAt") FROM stdin;
\.
COPY "Applications" (id, api_key, name, href, description, disabled, _access, "createdAt", "updatedAt") FROM '$$PATH$$/4071.dat';

--
-- Name: Applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Applications_id_seq"', 4, true);


--
-- Name: Cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Cards_id_seq"', 3023, true);


--
-- Data for Name: Comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Comments" (id, text, "createdAt", "approvedAt", "updatedAt", "deletedAt", "UserId", "GroupId", "ExpenseId") FROM stdin;
\.
COPY "Comments" (id, text, "createdAt", "approvedAt", "updatedAt", "deletedAt", "UserId", "GroupId", "ExpenseId") FROM '$$PATH$$/4075.dat';

--
-- Name: Comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Comments_id_seq"', 1, false);


--
-- Data for Name: ConnectedAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "ConnectedAccounts" (id, provider, username, "clientId", secret, data, "createdAt", "updatedAt", "deletedAt", "UserId", "GroupId") FROM stdin;
\.
COPY "ConnectedAccounts" (id, provider, username, "clientId", secret, data, "createdAt", "updatedAt", "deletedAt", "UserId", "GroupId") FROM '$$PATH$$/4077.dat';

--
-- Name: ConnectedAccounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"ConnectedAccounts_id_seq"', 977, true);


--
-- Data for Name: Donations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Donations" (id, "UserId", "GroupId", currency, amount, title, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "isProcessed", "processedAt", "ResponseId", notes) FROM stdin;
\.
COPY "Donations" (id, "UserId", "GroupId", currency, amount, title, "SubscriptionId", "createdAt", "updatedAt", "deletedAt", "PaymentMethodId", "isProcessed", "processedAt", "ResponseId", notes) FROM '$$PATH$$/4079.dat';

--
-- Name: Donations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Donations_id_seq"', 2912, true);


--
-- Data for Name: Events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Events" (id, name, description, "createdByUserId", "GroupId", slug, "locationName", "startsAt", "endsAt", "maxAmount", currency, "maxQuantity", "createdAt", "updatedAt", "deletedAt", address, "backgroundImage", "geoLocationLatLong", timezone) FROM stdin;
\.
COPY "Events" (id, name, description, "createdByUserId", "GroupId", slug, "locationName", "startsAt", "endsAt", "maxAmount", currency, "maxQuantity", "createdAt", "updatedAt", "deletedAt", address, "backgroundImage", "geoLocationLatLong", timezone) FROM '$$PATH$$/4081.dat';

--
-- Name: Events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Events_id_seq"', 26, true);


--
-- Data for Name: ExpenseHistories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "ExpenseHistories" (id, "UserId", "GroupId", currency, amount, title, "payoutMethod", notes, attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM stdin;
\.
COPY "ExpenseHistories" (id, "UserId", "GroupId", currency, amount, title, "payoutMethod", notes, attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", hid, "archivedAt") FROM '$$PATH$$/4083.dat';

--
-- Name: ExpenseHistories_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"ExpenseHistories_hid_seq"', 1607, true);


--
-- Data for Name: Expenses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Expenses" (id, "UserId", "GroupId", currency, amount, title, notes, attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM stdin;
\.
COPY "Expenses" (id, "UserId", "GroupId", currency, amount, title, notes, attachment, category, vat, "lastEditedById", status, "incurredAt", "createdAt", "updatedAt", "deletedAt", "payoutMethod") FROM '$$PATH$$/4085.dat';

--
-- Name: Expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Expenses_id_seq"', 1159, true);


--
-- Data for Name: GroupHistories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "GroupHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", logo, video, image, slug, website, "twitterHandle", tiers, burnrate, mission, budget, "expensePolicy", "backgroundImage", "hostFeePercent", settings, "whyJoin", data, tags, "isSupercollective", "lastEditedByUserId", hid, "archivedAt") FROM stdin;
\.
COPY "GroupHistories" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", logo, video, image, slug, website, "twitterHandle", tiers, burnrate, mission, budget, "expensePolicy", "backgroundImage", "hostFeePercent", settings, "whyJoin", data, tags, "isSupercollective", "lastEditedByUserId", hid, "archivedAt") FROM '$$PATH$$/4087.dat';

--
-- Name: GroupHistories_hid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"GroupHistories_hid_seq"', 31393, true);


--
-- Data for Name: Groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Groups" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", logo, video, image, slug, website, "twitterHandle", tiers, burnrate, mission, budget, "expensePolicy", "backgroundImage", "hostFeePercent", settings, "whyJoin", data, tags, "isSupercollective", "lastEditedByUserId") FROM stdin;
\.
COPY "Groups" (id, name, description, currency, "createdAt", "updatedAt", "deletedAt", "isActive", "longDescription", logo, video, image, slug, website, "twitterHandle", tiers, burnrate, mission, budget, "expensePolicy", "backgroundImage", "hostFeePercent", settings, "whyJoin", data, tags, "isSupercollective", "lastEditedByUserId") FROM '$$PATH$$/4089.dat';

--
-- Name: Groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Groups_id_seq"', 685, true);


--
-- Data for Name: Notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "GroupId", "webhookUrl") FROM stdin;
\.
COPY "Notifications" (id, channel, type, active, "createdAt", "updatedAt", "UserId", "GroupId", "webhookUrl") FROM '$$PATH$$/4091.dat';

--
-- Data for Name: Paykeys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Paykeys" (id, "trackingId", paykey, status, payload, data, error, "createdAt", "updatedAt", "deletedAt", "TransactionId") FROM stdin;
\.
COPY "Paykeys" (id, "trackingId", paykey, status, payload, data, error, "createdAt", "updatedAt", "deletedAt", "TransactionId") FROM '$$PATH$$/4092.dat';

--
-- Name: Paykeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Paykeys_id_seq"', 1, false);


--
-- Data for Name: PaymentMethods; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "PaymentMethods" (id, number, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "UserId", "expiryDate") FROM stdin;
\.
COPY "PaymentMethods" (id, number, token, "customerId", service, data, "createdAt", "updatedAt", "confirmedAt", "deletedAt", "UserId", "expiryDate") FROM '$$PATH$$/4073.dat';

--
-- Data for Name: Responses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Responses" (id, "UserId", "GroupId", "TierId", "EventId", "confirmedAt", status, quantity, "createdAt", "updatedAt", "deletedAt", description) FROM stdin;
\.
COPY "Responses" (id, "UserId", "GroupId", "TierId", "EventId", "confirmedAt", status, quantity, "createdAt", "updatedAt", "deletedAt", description) FROM '$$PATH$$/4094.dat';

--
-- Name: Responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Responses_id_seq"', 227, true);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "SequelizeMeta" (name) FROM stdin;
\.
COPY "SequelizeMeta" (name) FROM '$$PATH$$/4096.dat';

--
-- Data for Name: Sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
\.
COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM '$$PATH$$/4097.dat';

--
-- Data for Name: StripeAccounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "StripeAccounts" (id, "accessToken", "refreshToken", "tokenType", "stripePublishableKey", "stripeUserId", scope, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.
COPY "StripeAccounts" (id, "accessToken", "refreshToken", "tokenType", "stripePublishableKey", "stripeUserId", scope, "createdAt", "updatedAt", "deletedAt") FROM '$$PATH$$/4098.dat';

--
-- Name: StripeAccounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"StripeAccounts_id_seq"', 46, true);


--
-- Data for Name: Subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.
COPY "Subscriptions" (id, amount, currency, "interval", "isActive", data, "stripeSubscriptionId", "activatedAt", "deactivatedAt", "createdAt", "updatedAt", "deletedAt") FROM '$$PATH$$/4100.dat';

--
-- Name: Subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Subscriptions_id_seq"', 17102, true);


--
-- Name: Subscriptions_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Subscriptions_id_seq1"', 2214, true);


--
-- Data for Name: Tiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Tiers" (id, "EventId", name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug) FROM stdin;
\.
COPY "Tiers" (id, "EventId", name, description, amount, currency, "maxQuantity", password, "startsAt", "endsAt", "createdAt", "updatedAt", "deletedAt", slug) FROM '$$PATH$$/4103.dat';

--
-- Name: Tiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Tiers_id_seq"', 39, true);


--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "GroupId", "UserId", "PaymentMethodId", "deletedAt", data, "DonationId", "platformFeeInTxnCurrency", "hostFeeInTxnCurrency", "paymentProcessorFeeInTxnCurrency", "txnCurrency", "txnCurrencyFxRate", "amountInTxnCurrency", "netAmountInGroupCurrency", "ExpenseId", uuid, "HostId") FROM stdin;
\.
COPY "Transactions" (id, type, description, amount, currency, "createdAt", "updatedAt", "GroupId", "UserId", "PaymentMethodId", "deletedAt", data, "DonationId", "platformFeeInTxnCurrency", "hostFeeInTxnCurrency", "paymentProcessorFeeInTxnCurrency", "txnCurrency", "txnCurrencyFxRate", "amountInTxnCurrency", "netAmountInGroupCurrency", "ExpenseId", uuid, "HostId") FROM '$$PATH$$/4105.dat';

--
-- Name: Transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Transactions_id_seq"', 10341, true);


--
-- Data for Name: UserGroups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "UserGroups" ("createdAt", "updatedAt", "deletedAt", "UserId", "GroupId", role, id) FROM stdin;
\.
COPY "UserGroups" ("createdAt", "updatedAt", "deletedAt", "UserId", "GroupId", role, id) FROM '$$PATH$$/4107.dat';

--
-- Name: UserGroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"UserGroups_id_seq"', 4718, true);


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "Users" (id, _access, username, avatar, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "ApplicationId", "paypalEmail", website, "twitterHandle", "StripeAccountId", "resetPasswordTokenHash", "resetPasswordSentAt", "referrerId", "isOrganization", description, "longDescription", mission, "firstName", "lastName", "billingAddress", currency, "isHost") FROM stdin;
\.
COPY "Users" (id, _access, username, avatar, email, _salt, refresh_token, password_hash, "createdAt", "updatedAt", "seenAt", "deletedAt", "ApplicationId", "paypalEmail", website, "twitterHandle", "StripeAccountId", "resetPasswordTokenHash", "resetPasswordSentAt", "referrerId", "isOrganization", description, "longDescription", mission, "firstName", "lastName", "billingAddress", currency, "isHost") FROM '$$PATH$$/4109.dat';

--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"Users_id_seq"', 4973, true);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.
COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM '$$PATH$$/3797.dat';

--
-- Name: Activities Activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_pkey" PRIMARY KEY (id);


--
-- Name: ApplicationGroup ApplicationGroup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ApplicationGroup"
    ADD CONSTRAINT "ApplicationGroup_pkey" PRIMARY KEY ("GroupId", "ApplicationId");


--
-- Name: Applications Applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Applications"
    ADD CONSTRAINT "Applications_pkey" PRIMARY KEY (id);


--
-- Name: PaymentMethods Cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id);


--
-- Name: Comments Comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Comments"
    ADD CONSTRAINT "Comments_pkey" PRIMARY KEY (id, "UserId", "GroupId", "ExpenseId");


--
-- Name: ConnectedAccounts ConnectedAccounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_pkey" PRIMARY KEY (id);


--
-- Name: Donations Donations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_pkey" PRIMARY KEY (id);


--
-- Name: Events Events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Events"
    ADD CONSTRAINT "Events_pkey" PRIMARY KEY (id);


--
-- Name: ExpenseHistories ExpenseHistories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ExpenseHistories"
    ADD CONSTRAINT "ExpenseHistories_pkey" PRIMARY KEY (hid);


--
-- Name: Expenses Expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_pkey" PRIMARY KEY (id);


--
-- Name: GroupHistories GroupHistories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "GroupHistories"
    ADD CONSTRAINT "GroupHistories_pkey" PRIMARY KEY (hid);


--
-- Name: Groups Groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Groups"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (id);


--
-- Name: Paykeys Paykeys_paykey_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_paykey_key" UNIQUE (paykey);


--
-- Name: Paykeys Paykeys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_pkey" PRIMARY KEY (id);


--
-- Name: Responses Responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Responses"
    ADD CONSTRAINT "Responses_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Sessions Sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);


--
-- Name: StripeAccounts StripeAccounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "StripeAccounts"
    ADD CONSTRAINT "StripeAccounts_pkey" PRIMARY KEY (id);


--
-- Name: Notifications Subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (id);


--
-- Name: Subscriptions Subscriptions_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey1" PRIMARY KEY (id);


--
-- Name: Tiers Tiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_pkey" PRIMARY KEY (id);


--
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);


--
-- Name: UserGroups UserGroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserGroups"
    ADD CONSTRAINT "UserGroups_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);


--
-- Name: Users email_unique_idx; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT email_unique_idx UNIQUE (email);


--
-- Name: Transactions_GroupId; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Transactions_GroupId" ON "Transactions" USING btree ("GroupId", "deletedAt");


--
-- Name: UniqueGroupIdSlugIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UniqueGroupIdSlugIndex" ON "Events" USING btree ("GroupId", slug);


--
-- Name: UniqueSlugIndex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UniqueSlugIndex" ON "Groups" USING btree (slug);


--
-- Name: UserGroups_3way; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UserGroups_3way" ON "UserGroups" USING btree ("GroupId", "UserId", role);


--
-- Name: subscriptions_type__group_id__user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX subscriptions_type__group_id__user_id ON "Notifications" USING btree (type, "GroupId", "UserId");


--
-- Name: transactions_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX transactions_uuid ON "Transactions" USING btree (uuid);


--
-- Name: Activities Activities_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Activities Activities_TransactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Activities Activities_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Activities"
    ADD CONSTRAINT "Activities_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ApplicationGroup ApplicationGroup_ApplicationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ApplicationGroup"
    ADD CONSTRAINT "ApplicationGroup_ApplicationId_fkey" FOREIGN KEY ("ApplicationId") REFERENCES "Applications"(id);


--
-- Name: ApplicationGroup ApplicationGroup_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ApplicationGroup"
    ADD CONSTRAINT "ApplicationGroup_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PaymentMethods Cards_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "PaymentMethods"
    ADD CONSTRAINT "Cards_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Comments Comments_ExpenseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Comments"
    ADD CONSTRAINT "Comments_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id);


--
-- Name: Comments Comments_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Comments"
    ADD CONSTRAINT "Comments_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id);


--
-- Name: Comments Comments_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Comments"
    ADD CONSTRAINT "Comments_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ConnectedAccounts ConnectedAccounts_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ConnectedAccounts ConnectedAccounts_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ConnectedAccounts"
    ADD CONSTRAINT "ConnectedAccounts_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Donations Donations_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Donations Donations_PaymentMethodId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_PaymentMethodId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Donations Donations_ResponseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_ResponseId_fkey" FOREIGN KEY ("ResponseId") REFERENCES "Responses"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Donations Donations_SubscriptionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_SubscriptionId_fkey" FOREIGN KEY ("SubscriptionId") REFERENCES "Subscriptions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Donations Donations_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Donations"
    ADD CONSTRAINT "Donations_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Tiers EventId_foreign_idx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "EventId_foreign_idx" FOREIGN KEY ("EventId") REFERENCES "Events"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Events Events_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Events"
    ADD CONSTRAINT "Events_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Events Events_createdByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Events"
    ADD CONSTRAINT "Events_createdByUserId_fkey" FOREIGN KEY ("createdByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Expenses Expenses_lastEditedById_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Expenses"
    ADD CONSTRAINT "Expenses_lastEditedById_fkey" FOREIGN KEY ("lastEditedById") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Groups Groups_lastEditedByUserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Groups"
    ADD CONSTRAINT "Groups_lastEditedByUserId_fkey" FOREIGN KEY ("lastEditedByUserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Paykeys Paykeys_TransactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Paykeys"
    ADD CONSTRAINT "Paykeys_TransactionId_fkey" FOREIGN KEY ("TransactionId") REFERENCES "Transactions"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Responses Responses_EventId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Responses"
    ADD CONSTRAINT "Responses_EventId_fkey" FOREIGN KEY ("EventId") REFERENCES "Events"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Responses Responses_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Responses"
    ADD CONSTRAINT "Responses_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Responses Responses_TierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Responses"
    ADD CONSTRAINT "Responses_TierId_fkey" FOREIGN KEY ("TierId") REFERENCES "Tiers"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Responses Responses_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Responses"
    ADD CONSTRAINT "Responses_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Notifications Subscriptions_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Notifications Subscriptions_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "Subscriptions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Tiers Tiers_EventId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Tiers"
    ADD CONSTRAINT "Tiers_EventId_fkey" FOREIGN KEY ("EventId") REFERENCES "Events"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_CardId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_CardId_fkey" FOREIGN KEY ("PaymentMethodId") REFERENCES "PaymentMethods"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_DonationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_DonationId_fkey" FOREIGN KEY ("DonationId") REFERENCES "Donations"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_ExpenseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_ExpenseId_fkey" FOREIGN KEY ("ExpenseId") REFERENCES "Expenses"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_HostId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_HostId_fkey" FOREIGN KEY ("HostId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transactions Transactions_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Transactions"
    ADD CONSTRAINT "Transactions_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: UserGroups UserGroups_GroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserGroups"
    ADD CONSTRAINT "UserGroups_GroupId_fkey" FOREIGN KEY ("GroupId") REFERENCES "Groups"(id);


--
-- Name: UserGroups UserGroups_UserId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserGroups"
    ADD CONSTRAINT "UserGroups_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Users Users_ApplicationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_ApplicationId_fkey" FOREIGN KEY ("ApplicationId") REFERENCES "Applications"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Users Users_StripeAccountId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_StripeAccountId_fkey" FOREIGN KEY ("StripeAccountId") REFERENCES "StripeAccounts"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Users Users_referrerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_referrerId_fkey" FOREIGN KEY ("referrerId") REFERENCES "Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: geography_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE geography_columns TO opencollective;
GRANT ALL ON TABLE geography_columns TO dbuser;


--
-- Name: geometry_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE geometry_columns TO opencollective;
GRANT ALL ON TABLE geometry_columns TO dbuser;


--
-- Name: raster_columns; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE raster_columns TO opencollective;
GRANT ALL ON TABLE raster_columns TO dbuser;


--
-- Name: raster_overviews; Type: ACL; Schema: public; Owner: -
--

GRANT ALL ON TABLE raster_overviews TO opencollective;
GRANT ALL ON TABLE raster_overviews TO dbuser;


--
-- Name: spatial_ref_sys; Type: ACL; Schema: public; Owner: -
--

REVOKE SELECT ON TABLE spatial_ref_sys FROM PUBLIC;
REVOKE ALL ON TABLE spatial_ref_sys FROM xdamman;
GRANT ALL ON TABLE spatial_ref_sys TO dbuser;
GRANT SELECT ON TABLE spatial_ref_sys TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  