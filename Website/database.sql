--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Maps_event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Maps_event" (
    id bigint NOT NULL,
    year integer,
    country_name character varying(50) NOT NULL,
    event_name character varying(50) NOT NULL,
    event_content character varying(150) NOT NULL,
    location public.geometry(Point,4326) NOT NULL
);


--
-- Name: Maps_event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."Maps_event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Maps_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."Maps_event_id_seq" OWNED BY public."Maps_event".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.country (
    country_id integer NOT NULL,
    iso character varying(80) NOT NULL,
    name character varying(80) NOT NULL,
    nicename character varying(80) NOT NULL,
    iso3 character varying(4) DEFAULT NULL::character varying,
    numcode integer,
    phonecode integer NOT NULL
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: django_site; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: markers_event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.markers_event (
    id bigint NOT NULL,
    country_id integer,
    event_name character varying(455) NOT NULL,
    event_content character varying(1000),
    year date,
    country_name character varying(455)
);


--
-- Name: markers_event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.markers_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: markers_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.markers_event_id_seq OWNED BY public.markers_event.id;


--
-- Name: markers_marker; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.markers_marker (
    id bigint NOT NULL,
    event_name character varying(455) NOT NULL,
    location public.geometry(Point,4326) NOT NULL,
    country_name character varying(455),
    event_content character varying(1000),
    year date,
    country_id integer
);


--
-- Name: markers_marker_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.markers_marker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: markers_marker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.markers_marker_id_seq OWNED BY public.markers_marker.id;


--
-- Name: Maps_event id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Maps_event" ALTER COLUMN id SET DEFAULT nextval('public."Maps_event_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: markers_event id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markers_event ALTER COLUMN id SET DEFAULT nextval('public.markers_event_id_seq'::regclass);


--
-- Name: markers_marker id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markers_marker ALTER COLUMN id SET DEFAULT nextval('public.markers_marker_id_seq'::regclass);


--
-- Data for Name: Maps_event; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."Maps_event" (id, year, country_name, event_name, event_content, location) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add user	3	add_user
10	Can change user	3	change_user
11	Can delete user	3	delete_user
12	Can view user	3	view_user
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add site	6	add_site
22	Can change site	6	change_site
23	Can delete site	6	delete_site
24	Can view site	6	view_site
25	Can add log entry	7	add_logentry
26	Can change log entry	7	change_logentry
27	Can delete log entry	7	delete_logentry
28	Can view log entry	7	view_logentry
29	Can add event	8	add_event
30	Can change event	8	change_event
31	Can delete event	8	delete_event
32	Can view event	8	view_event
33	Can add marker	9	add_marker
34	Can change marker	9	change_marker
35	Can delete marker	9	delete_marker
36	Can view marker	9	view_marker
37	Can add event	10	add_event
38	Can change event	10	change_event
39	Can delete event	10	delete_event
40	Can view event	10	view_event
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$320000$6EUCjkjMchLn7QIbWihOTw$riKjvu+9RORN99K+CqzAAZPIoKtp3YXUl9D+eYEVQb4=	2022-03-15 00:08:17.024525+00	t	mihai				t	t	2022-03-11 15:25:27.201124+00
1	pbkdf2_sha256$320000$5joey5d19mKCQNbtIRCRVC$9/GGyj4dg0bR7R+D2NKZKVcCZlwGcTZuX9Vb/hu2dbQ=	2022-03-16 21:23:05.595909+00	t	postgres				t	t	2022-03-11 12:06:54.785305+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.country (country_id, iso, name, nicename, iso3, numcode, phonecode) FROM stdin;
1	AF	AFGHANISTAN	Afghanistan	AFG	4	93
2	AL	ALBANIA	Albania	ALB	8	355
3	DZ	ALGERIA	Algeria	DZA	12	213
4	AS	AMERICAN SAMOA	American Samoa	ASM	16	1684
5	AD	ANDORRA	Andorra	AND	20	376
6	AO	ANGOLA	Angola	AGO	24	244
7	AI	ANGUILLA	Anguilla	AIA	660	1264
8	AQ	ANTARCTICA	Antarctica	\N	\N	0
9	AG	ANTIGUA AND BARBUDA	Antigua and Barbuda	ATG	28	1268
10	AR	ARGENTINA	Argentina	ARG	32	54
11	AM	ARMENIA	Armenia	ARM	51	374
12	AW	ARUBA	Aruba	ABW	533	297
13	AU	AUSTRALIA	Australia	AUS	36	61
14	AT	AUSTRIA	Austria	AUT	40	43
15	AZ	AZERBAIJAN	Azerbaijan	AZE	31	994
16	BS	BAHAMAS	Bahamas	BHS	44	1242
17	BH	BAHRAIN	Bahrain	BHR	48	973
18	BD	BANGLADESH	Bangladesh	BGD	50	880
19	BB	BARBADOS	Barbados	BRB	52	1246
20	BY	BELARUS	Belarus	BLR	112	375
21	BE	BELGIUM	Belgium	BEL	56	32
22	BZ	BELIZE	Belize	BLZ	84	501
23	BJ	BENIN	Benin	BEN	204	229
24	BM	BERMUDA	Bermuda	BMU	60	1441
25	BT	BHUTAN	Bhutan	BTN	64	975
26	BO	BOLIVIA	Bolivia	BOL	68	591
27	BA	BOSNIA AND HERZEGOVINA	Bosnia and Herzegovina	BIH	70	387
28	BW	BOTSWANA	Botswana	BWA	72	267
29	BV	BOUVET ISLAND	Bouvet Island	\N	\N	0
30	BR	BRAZIL	Brazil	BRA	76	55
31	IO	BRITISH INDIAN OCEAN TERRITORY	British Indian Ocean Territory	\N	\N	246
32	BN	BRUNEI DARUSSALAM	Brunei Darussalam	BRN	96	673
33	BG	BULGARIA	Bulgaria	BGR	100	359
34	BF	BURKINA FASO	Burkina Faso	BFA	854	226
35	BI	BURUNDI	Burundi	BDI	108	257
36	KH	CAMBODIA	Cambodia	KHM	116	855
37	CM	CAMEROON	Cameroon	CMR	120	237
38	CA	CANADA	Canada	CAN	124	1
39	CV	CAPE VERDE	Cape Verde	CPV	132	238
40	KY	CAYMAN ISLANDS	Cayman Islands	CYM	136	1345
41	CF	CENTRAL AFRICAN REPUBLIC	Central African Republic	CAF	140	236
42	TD	CHAD	Chad	TCD	148	235
43	CL	CHILE	Chile	CHL	152	56
44	CN	CHINA	China	CHN	156	86
45	CX	CHRISTMAS ISLAND	Christmas Island	\N	\N	61
46	CC	COCOS (KEELING) ISLANDS	Cocos (Keeling) Islands	\N	\N	672
47	CO	COLOMBIA	Colombia	COL	170	57
48	KM	COMOROS	Comoros	COM	174	269
49	CG	CONGO	Congo	COG	178	242
50	CD	CONGO, THE DEMOCRATIC REPUBLIC OF THE	Congo, the Democratic Republic of the	COD	180	242
51	CK	COOK ISLANDS	Cook Islands	COK	184	682
52	CR	COSTA RICA	Costa Rica	CRI	188	506
53	CI	COTE D'IVOIRE	Cote D'Ivoire	CIV	384	225
54	HR	CROATIA	Croatia	HRV	191	385
55	CU	CUBA	Cuba	CUB	192	53
56	CY	CYPRUS	Cyprus	CYP	196	357
57	CZ	CZECH REPUBLIC	Czech Republic	CZE	203	420
58	DK	DENMARK	Denmark	DNK	208	45
59	DJ	DJIBOUTI	Djibouti	DJI	262	253
60	DM	DOMINICA	Dominica	DMA	212	1767
61	DO	DOMINICAN REPUBLIC	Dominican Republic	DOM	214	1809
62	EC	ECUADOR	Ecuador	ECU	218	593
63	EG	EGYPT	Egypt	EGY	818	20
64	SV	EL SALVADOR	El Salvador	SLV	222	503
65	GQ	EQUATORIAL GUINEA	Equatorial Guinea	GNQ	226	240
66	ER	ERITREA	Eritrea	ERI	232	291
67	EE	ESTONIA	Estonia	EST	233	372
68	ET	ETHIOPIA	Ethiopia	ETH	231	251
69	FK	FALKLAND ISLANDS (MALVINAS)	Falkland Islands (Malvinas)	FLK	238	500
70	FO	FAROE ISLANDS	Faroe Islands	FRO	234	298
71	FJ	FIJI	Fiji	FJI	242	679
72	FI	FINLAND	Finland	FIN	246	358
73	FR	FRANCE	France	FRA	250	33
74	GF	FRENCH GUIANA	French Guiana	GUF	254	594
75	PF	FRENCH POLYNESIA	French Polynesia	PYF	258	689
76	TF	FRENCH SOUTHERN TERRITORIES	French Southern Territories	\N	\N	0
77	GA	GABON	Gabon	GAB	266	241
78	GM	GAMBIA	Gambia	GMB	270	220
79	GE	GEORGIA	Georgia	GEO	268	995
80	DE	GERMANY	Germany	DEU	276	49
81	GH	GHANA	Ghana	GHA	288	233
82	GI	GIBRALTAR	Gibraltar	GIB	292	350
83	GR	GREECE	Greece	GRC	300	30
84	GL	GREENLAND	Greenland	GRL	304	299
85	GD	GRENADA	Grenada	GRD	308	1473
86	GP	GUADELOUPE	Guadeloupe	GLP	312	590
87	GU	GUAM	Guam	GUM	316	1671
88	GT	GUATEMALA	Guatemala	GTM	320	502
89	GN	GUINEA	Guinea	GIN	324	224
90	GW	GUINEA-BISSAU	Guinea-Bissau	GNB	624	245
91	GY	GUYANA	Guyana	GUY	328	592
92	HT	HAITI	Haiti	HTI	332	509
93	HM	HEARD ISLAND AND MCDONALD ISLANDS	Heard Island and Mcdonald Islands	\N	\N	0
94	VA	HOLY SEE (VATICAN CITY STATE)	Holy See (Vatican City State)	VAT	336	39
95	HN	HONDURAS	Honduras	HND	340	504
96	HK	HONG KONG	Hong Kong	HKG	344	852
97	HU	HUNGARY	Hungary	HUN	348	36
98	IS	ICELAND	Iceland	ISL	352	354
99	IN	INDIA	India	IND	356	91
100	ID	INDONESIA	Indonesia	IDN	360	62
101	IR	IRAN, ISLAMIC REPUBLIC OF	Iran, Islamic Republic of	IRN	364	98
102	IQ	IRAQ	Iraq	IRQ	368	964
103	IE	IRELAND	Ireland	IRL	372	353
104	IL	ISRAEL	Israel	ISR	376	972
105	IT	ITALY	Italy	ITA	380	39
106	JM	JAMAICA	Jamaica	JAM	388	1876
107	JP	JAPAN	Japan	JPN	392	81
108	JO	JORDAN	Jordan	JOR	400	962
109	KZ	KAZAKHSTAN	Kazakhstan	KAZ	398	7
110	KE	KENYA	Kenya	KEN	404	254
111	KI	KIRIBATI	Kiribati	KIR	296	686
112	KP	KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF	Korea, Democratic People's Republic of	PRK	408	850
113	KR	KOREA, REPUBLIC OF	Korea, Republic of	KOR	410	82
114	KW	KUWAIT	Kuwait	KWT	414	965
115	KG	KYRGYZSTAN	Kyrgyzstan	KGZ	417	996
116	LA	LAO PEOPLE'S DEMOCRATIC REPUBLIC	Lao People's Democratic Republic	LAO	418	856
117	LV	LATVIA	Latvia	LVA	428	371
118	LB	LEBANON	Lebanon	LBN	422	961
119	LS	LESOTHO	Lesotho	LSO	426	266
120	LR	LIBERIA	Liberia	LBR	430	231
121	LY	LIBYAN ARAB JAMAHIRIYA	Libyan Arab Jamahiriya	LBY	434	218
122	LI	LIECHTENSTEIN	Liechtenstein	LIE	438	423
123	LT	LITHUANIA	Lithuania	LTU	440	370
124	LU	LUXEMBOURG	Luxembourg	LUX	442	352
125	MO	MACAO	Macao	MAC	446	853
126	MK	MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF	Macedonia, the Former Yugoslav Republic of	MKD	807	389
127	MG	MADAGASCAR	Madagascar	MDG	450	261
128	MW	MALAWI	Malawi	MWI	454	265
129	MY	MALAYSIA	Malaysia	MYS	458	60
130	MV	MALDIVES	Maldives	MDV	462	960
131	ML	MALI	Mali	MLI	466	223
132	MT	MALTA	Malta	MLT	470	356
133	MH	MARSHALL ISLANDS	Marshall Islands	MHL	584	692
134	MQ	MARTINIQUE	Martinique	MTQ	474	596
135	MR	MAURITANIA	Mauritania	MRT	478	222
136	MU	MAURITIUS	Mauritius	MUS	480	230
137	YT	MAYOTTE	Mayotte	\N	\N	269
138	MX	MEXICO	Mexico	MEX	484	52
139	FM	MICRONESIA, FEDERATED STATES OF	Micronesia, Federated States of	FSM	583	691
140	MD	MOLDOVA, REPUBLIC OF	Moldova, Republic of	MDA	498	373
141	MC	MONACO	Monaco	MCO	492	377
142	MN	MONGOLIA	Mongolia	MNG	496	976
143	MS	MONTSERRAT	Montserrat	MSR	500	1664
144	MA	MOROCCO	Morocco	MAR	504	212
145	MZ	MOZAMBIQUE	Mozambique	MOZ	508	258
146	MM	MYANMAR	Myanmar	MMR	104	95
147	NA	NAMIBIA	Namibia	NAM	516	264
148	NR	NAURU	Nauru	NRU	520	674
149	NP	NEPAL	Nepal	NPL	524	977
150	NL	NETHERLANDS	Netherlands	NLD	528	31
151	AN	NETHERLANDS ANTILLES	Netherlands Antilles	ANT	530	599
152	NC	NEW CALEDONIA	New Caledonia	NCL	540	687
153	NZ	NEW ZEALAND	New Zealand	NZL	554	64
154	NI	NICARAGUA	Nicaragua	NIC	558	505
155	NE	NIGER	Niger	NER	562	227
156	NG	NIGERIA	Nigeria	NGA	566	234
157	NU	NIUE	Niue	NIU	570	683
158	NF	NORFOLK ISLAND	Norfolk Island	NFK	574	672
159	MP	NORTHERN MARIANA ISLANDS	Northern Mariana Islands	MNP	580	1670
160	NO	NORWAY	Norway	NOR	578	47
161	OM	OMAN	Oman	OMN	512	968
162	PK	PAKISTAN	Pakistan	PAK	586	92
163	PW	PALAU	Palau	PLW	585	680
164	PS	PALESTINIAN TERRITORY, OCCUPIED	Palestinian Territory, Occupied	\N	\N	970
165	PA	PANAMA	Panama	PAN	591	507
166	PG	PAPUA NEW GUINEA	Papua New Guinea	PNG	598	675
167	PY	PARAGUAY	Paraguay	PRY	600	595
168	PE	PERU	Peru	PER	604	51
169	PH	PHILIPPINES	Philippines	PHL	608	63
170	PN	PITCAIRN	Pitcairn	PCN	612	0
171	PL	POLAND	Poland	POL	616	48
172	PT	PORTUGAL	Portugal	PRT	620	351
173	PR	PUERTO RICO	Puerto Rico	PRI	630	1787
174	QA	QATAR	Qatar	QAT	634	974
175	RE	REUNION	Reunion	REU	638	262
176	RO	ROMANIA	Romania	ROM	642	40
177	RU	RUSSIAN FEDERATION	Russian Federation	RUS	643	70
178	RW	RWANDA	Rwanda	RWA	646	250
179	SH	SAINT HELENA	Saint Helena	SHN	654	290
180	KN	SAINT KITTS AND NEVIS	Saint Kitts and Nevis	KNA	659	1869
181	LC	SAINT LUCIA	Saint Lucia	LCA	662	1758
182	PM	SAINT PIERRE AND MIQUELON	Saint Pierre and Miquelon	SPM	666	508
183	VC	SAINT VINCENT AND THE GRENADINES	Saint Vincent and the Grenadines	VCT	670	1784
184	WS	SAMOA	Samoa	WSM	882	684
185	SM	SAN MARINO	San Marino	SMR	674	378
186	ST	SAO TOME AND PRINCIPE	Sao Tome and Principe	STP	678	239
187	SA	SAUDI ARABIA	Saudi Arabia	SAU	682	966
188	SN	SENEGAL	Senegal	SEN	686	221
189	CS	SERBIA AND MONTENEGRO	Serbia and Montenegro	\N	\N	381
190	SC	SEYCHELLES	Seychelles	SYC	690	248
191	SL	SIERRA LEONE	Sierra Leone	SLE	694	232
192	SG	SINGAPORE	Singapore	SGP	702	65
193	SK	SLOVAKIA	Slovakia	SVK	703	421
194	SI	SLOVENIA	Slovenia	SVN	705	386
195	SB	SOLOMON ISLANDS	Solomon Islands	SLB	90	677
196	SO	SOMALIA	Somalia	SOM	706	252
197	ZA	SOUTH AFRICA	South Africa	ZAF	710	27
198	GS	SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS	South Georgia and the South Sandwich Islands	\N	\N	0
199	ES	SPAIN	Spain	ESP	724	34
200	LK	SRI LANKA	Sri Lanka	LKA	144	94
201	SD	SUDAN	Sudan	SDN	736	249
202	SR	SURINAME	Suriname	SUR	740	597
203	SJ	SVALBARD AND JAN MAYEN	Svalbard and Jan Mayen	SJM	744	47
204	SZ	SWAZILAND	Swaziland	SWZ	748	268
205	SE	SWEDEN	Sweden	SWE	752	46
206	CH	SWITZERLAND	Switzerland	CHE	756	41
207	SY	SYRIAN ARAB REPUBLIC	Syrian Arab Republic	SYR	760	963
208	TW	TAIWAN, PROVINCE OF CHINA	Taiwan, Province of China	TWN	158	886
209	TJ	TAJIKISTAN	Tajikistan	TJK	762	992
210	TZ	TANZANIA, UNITED REPUBLIC OF	Tanzania, United Republic of	TZA	834	255
211	TH	THAILAND	Thailand	THA	764	66
212	TL	TIMOR-LESTE	Timor-Leste	\N	\N	670
213	TG	TOGO	Togo	TGO	768	228
214	TK	TOKELAU	Tokelau	TKL	772	690
215	TO	TONGA	Tonga	TON	776	676
216	TT	TRINIDAD AND TOBAGO	Trinidad and Tobago	TTO	780	1868
217	TN	TUNISIA	Tunisia	TUN	788	216
218	TR	TURKEY	Turkey	TUR	792	90
219	TM	TURKMENISTAN	Turkmenistan	TKM	795	7370
220	TC	TURKS AND CAICOS ISLANDS	Turks and Caicos Islands	TCA	796	1649
221	TV	TUVALU	Tuvalu	TUV	798	688
222	UG	UGANDA	Uganda	UGA	800	256
223	UA	UKRAINE	Ukraine	UKR	804	380
224	AE	UNITED ARAB EMIRATES	United Arab Emirates	ARE	784	971
225	GB	UNITED KINGDOM	United Kingdom	GBR	826	44
226	US	UNITED STATES	United States	USA	840	1
227	UM	UNITED STATES MINOR OUTLYING ISLANDS	United States Minor Outlying Islands	\N	\N	1
228	UY	URUGUAY	Uruguay	URY	858	598
229	UZ	UZBEKISTAN	Uzbekistan	UZB	860	998
230	VU	VANUATU	Vanuatu	VUT	548	678
231	VE	VENEZUELA	Venezuela	VEN	862	58
232	VN	VIET NAM	Viet Nam	VNM	704	84
233	VG	VIRGIN ISLANDS, BRITISH	Virgin Islands, British	VGB	92	1284
234	VI	VIRGIN ISLANDS, U.S.	Virgin Islands, U.s.	VIR	850	1340
235	WF	WALLIS AND FUTUNA	Wallis and Futuna	WLF	876	681
236	EH	WESTERN SAHARA	Western Sahara	ESH	732	212
237	YE	YEMEN	Yemen	YEM	887	967
238	ZM	ZAMBIA	Zambia	ZMB	894	260
239	ZW	ZIMBABWE	Zimbabwe	ZWE	716	263
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-03-11 15:36:41.02091+00	1	I went to uni here	1	[{"added": {}}]	9	2
2	2022-03-11 15:49:23.841922+00	1	I went to uni here	2	[]	9	2
3	2022-03-11 15:54:14.430291+00	1	I went to uni here	3		9	2
4	2022-03-11 15:56:37.423638+00	2	I went to uni here	1	[{"added": {}}]	9	2
5	2022-03-11 17:34:54.312915+00	3	I went to uni here	1	[{"added": {}}]	9	2
6	2022-03-11 17:37:21.550478+00	3	I went to uni here	3		9	2
7	2022-03-11 17:37:27.288443+00	2	I went to uni here	3		9	2
8	2022-03-14 21:27:44.308099+00	3	pastlook	3		3	2
9	2022-03-15 00:09:55.876915+00	4	test	1	[{"added": {}}]	9	2
10	2022-03-15 00:10:15.512297+00	4	test	2	[]	9	2
11	2022-03-15 00:10:25.424989+00	5	sdadas	1	[{"added": {}}]	9	2
12	2022-03-15 00:10:28.961466+00	6	sadasdas	1	[{"added": {}}]	9	2
13	2022-03-15 00:10:33.359875+00	7	gwrgesd	1	[{"added": {}}]	9	2
14	2022-03-15 21:10:59.465224+00	4	test	2	[{"changed": {"fields": ["Year", "Country name", "Event content"]}}]	9	2
15	2022-03-15 21:22:27.649232+00	4	test	2	[{"changed": {"fields": ["Year"]}}]	9	2
16	2022-03-15 21:26:07.302919+00	7	gwrgesd	3		9	2
17	2022-03-15 21:26:07.307096+00	6	sadasdas	3		9	2
18	2022-03-15 21:26:07.309603+00	5	sdadas	3		9	2
19	2022-03-15 21:29:13.204051+00	8	London	1	[{"added": {}}]	9	2
20	2022-03-16 19:28:34.965153+00	9	Revolution	1	[{"added": {}}]	9	2
21	2022-03-16 19:29:47.859441+00	9	Revolution	2	[{"changed": {"fields": ["Event content"]}}]	9	2
22	2022-03-16 19:38:45.768432+00	8	Death Of Prince Phillip	2	[{"changed": {"fields": ["Event name", "Event content"]}}]	9	2
23	2022-03-16 19:39:20.132343+00	8	Death Of Prince Phillip	2	[{"changed": {"fields": ["Year"]}}]	9	2
24	2022-03-16 21:33:54.632739+00	10	The Revolution of 1848	1	[{"added": {}}]	9	1
25	2022-03-16 21:39:31.373934+00	11	The French Revolution	1	[{"added": {}}]	9	1
26	2022-03-16 21:50:12.918212+00	11	The French Revolution	2	[{"changed": {"fields": ["Event content"]}}]	9	1
27	2022-03-16 21:56:13.487171+00	10	The Revolution of 1848	2	[{"changed": {"fields": ["Event content"]}}]	9	1
28	2022-03-16 22:12:46.886823+00	12	Seven Weeks War	1	[{"added": {}}]	9	1
29	2022-03-16 22:53:53.246377+00	13	Expelling of the Jews	1	[{"added": {}}]	9	1
30	2022-03-16 23:05:24.564088+00	14	Change Of Constitution	1	[{"added": {}}]	9	1
32	2022-03-19 17:06:29.786136+00	14	Change Of Constitution	2	[{"changed": {"fields": ["Country id"]}}]	9	1
33	2022-03-19 17:06:38.588895+00	13	Expelling of the Jews	2	[{"changed": {"fields": ["Country id"]}}]	9	1
34	2022-03-19 17:09:42.86439+00	14	Change Of Constitution	2	[{"changed": {"fields": ["Country id"]}}]	9	1
35	2022-03-19 17:10:11.342018+00	13	Expelling of the Jews	2	[{"changed": {"fields": ["Country id"]}}]	9	1
36	2022-03-19 17:10:29.091772+00	12	Seven Weeks War	2	[{"changed": {"fields": ["Country id"]}}]	9	1
37	2022-03-19 17:10:43.692665+00	11	The French Revolution	2	[{"changed": {"fields": ["Country id"]}}]	9	1
38	2022-03-19 17:11:03.921843+00	10	The Revolution of 1848	2	[{"changed": {"fields": ["Country id"]}}]	9	1
39	2022-03-19 17:11:18.358741+00	9	Revolution	2	[{"changed": {"fields": ["Country id"]}}]	9	1
40	2022-03-19 17:11:39.604232+00	8	Death Of Prince Phillip	2	[{"changed": {"fields": ["Country id"]}}]	9	1
41	2022-03-19 17:12:07.730186+00	4	test	2	[{"changed": {"fields": ["Country id"]}}]	9	1
42	2022-03-20 10:04:38.636225+00	4	Marker object (4)	2	[{"changed": {"fields": ["Event name", "Year", "Event content"]}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	admin	logentry
8	Maps	event
9	markers	marker
10	markers	event
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-11 10:41:09.102489+00
2	auth	0001_initial	2022-03-11 10:41:09.248201+00
3	admin	0001_initial	2022-03-11 10:41:09.288474+00
4	admin	0002_logentry_remove_auto_add	2022-03-11 10:41:09.31296+00
5	admin	0003_logentry_add_action_flag_choices	2022-03-11 10:41:09.334484+00
6	contenttypes	0002_remove_content_type_name	2022-03-11 10:41:09.386311+00
7	auth	0002_alter_permission_name_max_length	2022-03-11 10:41:09.410995+00
8	auth	0003_alter_user_email_max_length	2022-03-11 10:41:09.444002+00
9	auth	0004_alter_user_username_opts	2022-03-11 10:41:09.46874+00
10	auth	0005_alter_user_last_login_null	2022-03-11 10:41:09.495172+00
11	auth	0006_require_contenttypes_0002	2022-03-11 10:41:09.501295+00
12	auth	0007_alter_validators_add_error_messages	2022-03-11 10:41:09.5253+00
13	auth	0008_alter_user_username_max_length	2022-03-11 10:41:09.557358+00
14	auth	0009_alter_user_last_name_max_length	2022-03-11 10:41:09.589006+00
15	auth	0010_alter_group_name_max_length	2022-03-11 10:41:09.617201+00
16	auth	0011_update_proxy_permissions	2022-03-11 10:41:09.644965+00
17	auth	0012_alter_user_first_name_max_length	2022-03-11 10:41:09.678051+00
18	sessions	0001_initial	2022-03-11 10:41:09.708071+00
19	sites	0001_initial	2022-03-11 10:41:09.726187+00
20	sites	0002_alter_domain_unique	2022-03-11 10:41:09.743303+00
21	Maps	0001_initial	2022-03-11 11:52:10.763182+00
22	markers	0001_initial	2022-03-11 15:25:08.018642+00
23	markers	0002_rename_name_marker_event_name_marker_country_name_and_more	2022-03-15 21:08:40.09288+00
24	markers	0003_alter_marker_year	2022-03-15 21:22:02.438827+00
25	markers	0004_alter_marker_country_name_alter_marker_event_content_and_more	2022-03-16 19:29:17.863248+00
26	markers	0005_alter_marker_event_content	2022-03-16 21:48:02.164177+00
27	markers	0006_rename_id_marker_country_id	2022-03-19 16:28:24.321239+00
28	markers	0006_event_marker_country_id	2022-03-19 17:48:16.603167+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
gt0129pugba7zyy0iv1t6vplbw7zf9ez	.eJxVjDsOwyAQBe9CHSFgzS9lep8BLQsEJxGWjF1FuXtsyUXSvpl5bxZwW2vYel7ClNiVKXb53SLSM7cDpAe2-8xpbusyRX4o_KSdj3PKr9vp_h1U7HWvIzrw1viClqyL0kTEAVwpIiOBBUUFcJDOSpOs8EkkkwGUNiS13lP2-QLtMDd_:1nShGZ:XzD7i3T1UGG1wtTRG1qbvim0rAbWw7JwtOm5_OL31os	2022-03-25 15:33:19.342958+00
7w1nqocni0nj1w9gqb8tbm4w2yu65lz6	.eJxVjEEOwiAQRe_C2hCgMoBL9z0DgZmpVA0kpV0Z765NutDtf-_9l4hpW0vcOi9xJnERWpx-t5zwwXUHdE_11iS2ui5zlrsiD9rl2Iif18P9Oyipl29tLQTrlQJP3qIeDCDy2VBwBgmGYdKIgV1wAMphNk4BBeUhOwaYUhbvD7fMNzI:1nUb6n:m85VG_-QTQekwiXUdo8FgGT3S0npdthkTtrTHDkpqFM	2022-03-30 22:23:05.602008+01
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: markers_event; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.markers_event (id, country_id, event_name, event_content, year, country_name) FROM stdin;
1	193	Change Of Constitution	Parliament approves far-reaching changes to the constitution, a key step towards gaining membership of the EU and Nato. It decentralises power to the regions, strengthens the judiciary, and gives greater recognition to minority rights.	2001-02-01	Slovakia
2	199	Expelling of the Jews	In 1492, King Ferdinand II of Aragon and Queen Isabella I of Castille conquered the Nasrid Kingdom of Granada, finally freeing Spain from Muslim rule after nearly 800 years. Not long after, the monarchs, whose marriage and conquests cemented Spain as a unified kingdom, issued the Alhambra Decree, mandating that all Jews be expelled from the country.	1492-03-31	Spain
3	80	Seven Weeks War	Seven Weeks’ War, also called Austro-Prussian War, (1866), war between Prussia on the one side and Austria, Bavaria, Saxony, Hanover, and certain minor German states on the other. It ended in a Prussian victory, which meant the exclusion of Austria from Germany. The issue was decided in Bohemia, where the principal Prussian armies met the main Austrian forces and the Saxon army, most decisively at the Battle of Königgrätz. A Prussian detachment, known as the army of the Main, meanwhile dealt with the forces of Bavaria and other German states that had sided with Austria. Simultaneously, a campaign was fought in Venetia between the Austrian army of the south and the Italians, who had made an alliance with Prussia.	1866-01-01	Germany
4	73	The French Revolution	The French Revolution was a period of radical political and societal change in France that began with the Estates General of 1789 and ended with the formation of the French Consulate in November 1799. Many of its ideas are considered fundamental principles of liberal democracy, while phrases like liberté, égalité, fraternité reappeared in other revolts, such as the 1917 Russian Revolution, and inspired campaigns for the abolition of slavery and universal suffrage. The values and institutions it created dominate French politics to this day.	1789-01-01	France
5	105	The Revolution of 1848	A series of revolutions broke loose in Italy in early 1848, prompting many states to implement new constitutions, including the constitutional monarchy of Piedmont/Sardinia. As revolution spread across Europe, Piedmont tried to take the nationalist imitative and went to war with Austria over their Italian possessions; Piedmont lost, but the kingdom survived under Victor Emanuel II and was seen as the natural rallying point for Italian unity.	1848-02-23	Italy
6	176	Revolution	The Romanian Revolution started in the city of Timișoara and soon spread throughout the country, ultimately culminating in the show trial and execution of longtime Romanian Communist Party (PCR) General Secretary Nicolae Ceaușescu and his wife Elena, and the end of 42 years of Communist rule in Romania.	1989-12-25	Romania
7	225	Death Of Prince Phillip	Buckingham Palace announces the death of Prince Philip, Duke of Edinburgh and husband of the Queen, at the age of 99.	2021-04-09	United Kingdom
9	225	Coronavirus Pandemic	The coronavirus pandemic began on 31st of january 2020.	2020-01-31	United Kingdom
10	176	Joining NATO	Romania joined the North Atlantic Treaty Organization (NATO) in late March 2004. It was a big step for Romania, as this decision had a major influence on the foreign and domestic policy of the country. In early April 2008, Romania hosted the NATO Summit in Bucharest, which is one of the biggest foreign policy events organized by Romania. As a NATO member, Romania takes part in all Alliance missions and operations, including those out of the Euro-Atlantic area..	2004-03-31	Romania
11	176	A new Constitution	The new Constitution of Romania was adopted in November 1991. It was approved on December 8 of the same year, in a national referendum, and promulgated on the same day. Its text was amended only once so far, in October 2003, also by referendum. The idea of a second revision surfaced in 2010 and has been discussed in the years to follow, but nothing concrete has happened so far.	1991-11-01	Romania
12	176	The ruling of Nicolae Ceausescu	Nicolae Ceausescu, the last leader of Communist Romania, came to power following the death of Gheorghe Gheorghiu-Dej in 1965. He was elected general secretary on March 22, 1965, three days after Gheorghiu-Dej's death. One of his first moves was to change the name of the party from the Romanian Workers' Party back to the Communist Party of Romania and to declare the country a socialist republic. Although his ultimate goal was to turn Romania into one of the world's great powers, the oppression and bad life of Romanians led to the Revolution of 1989, which ended the Communist era in Romania and led to the execution of Ceausescu and his wife.	1965-03-22	Romania
13	225	UK returns Hong Kong to China	In the Hall of the People in Beijing, British Prime Minister Margaret Thatcher and Chinese Premier Zhao Ziyang sign an agreement committing Britain to return Hong Kong to China in 1997 in return for terms guaranteeing a 50-year extension of its capitalist system.	1997-07-01	United Kingdom
14	73	The Execution of Louis XVI by decapitation	This one might be the most important historical event in French contemporary thought. It is engraved in French collective memory, and it is the date of the most important national holiday in France: the 14 Juillet (also known as Bastille Day in English). The Storming of the Bastille happened in the 18th century, on the afternoon of 14 July 1789. It represented a revolt of the people against royal authority. Tensions had been rising all summer due to lack of edible goods and high taxes in Paris, and on the 14th, a massive group of armed people decided to take over the Bastille, which was a political prison, a fortress and a previous medieval armory.	1793-01-21	France
15	50	Search for peace	Presidents of DR Congo and Rwanda sign a peace deal under which Rwanda will withdraw troops from the east and DR Congo will disarm and arrest Rwandan Hutu gunmen blamed for the killing of the Tutsi minority in Rwanda's 1994 genocide.	2002-07-01	Congo Republic
16	50	Dashed hopes for independence	In May 1960 Patrice Lumumba is elected the Democratic Republic of Congo’s first Prime Minister. Four months later in September 1960, he is overthrown in a military coup led by Col. Joseph-Désiré Mobutu.  With assistance from Belgium and the U.S., Mobutu begins a 36-year reign as dictator. Lumumba is executed in early 1961.	1960-05-01	Congo Republic
17	50	Colonization	Belgium’s King Leopold II launches a 90-year colonial period marked by forced labor, exploitation of natural resources, disease, and mass killings. Later academic research suggests that, during Leopold II’s rule and its immediate aftermath, Congo’s population may have been reduced by as many as 10 million people.	1870-01-01	Congo Republic
\.


--
-- Data for Name: markers_marker; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.markers_marker (id, event_name, location, country_name, event_content, year, country_id) FROM stdin;
9	Revolution	0101000020E61000001C65F0FF7F1A3A40C9C578118A3B4640	Romania	The Romanian Revolution started in the city of Timișoara and soon spread throughout the country, ultimately culminating in the show trial and execution of longtime Romanian Communist Party (PCR) General Secretary Nicolae Ceaușescu and his wife Elena, and the end of 42 years of Communist rule in Romania.	1989-12-25	176
8	Death Of Prince Phillip	0101000020E6100000A2D7F0FFFF4FE9BFA9D136A213304A40	United Kingdom	Buckingham Palace announces the death of Prince Philip, Duke of Edinburgh and husband of the Queen, at the age of 99.	2021-04-09	225
14	Change Of Constitution	0101000020E6100000DFC3F5FFDF1D3140FB010CCD71124840	Slovakia	Parliament approves far-reaching changes to the constitution, a key step towards gaining membership of the EU and Nato. It decentralises power to the regions, strengthens the judiciary, and gives greater recognition to minority rights.	2001-02-01	193
13	Expelling of the Jews	0101000020E61000007158EEFFFF870DC0F019006B593B4440	Spain	In 1492, King Ferdinand II of Aragon and Queen Isabella I of Castille conquered the Nasrid Kingdom of Granada, finally freeing Spain from Muslim rule after nearly 800 years. Not long after, the monarchs, whose marriage and conquests cemented Spain as a unified kingdom, issued the Alhambra Decree, mandating that all Jews be expelled from the country.	1492-03-31	199
12	Seven Weeks War	0101000020E6100000D520F0FFFF8A2A40443AFDBDCB3D4A40	Germany	Seven Weeks’ War, also called Austro-Prussian War, (1866), war between Prussia on the one side and Austria, Bavaria, Saxony, Hanover, and certain minor German states on the other. It ended in a Prussian victory, which meant the exclusion of Austria from Germany. The issue was decided in Bohemia, where the principal Prussian armies met the main Austrian forces and the Saxon army, most decisively at the Battle of Königgrätz. A Prussian detachment, known as the army of the Main, meanwhile dealt with the forces of Bavaria and other German states that had sided with Austria. Simultaneously, a campaign was fought in Venetia between the Austrian army of the south and the Italians, who had made an alliance with Prussia.	1866-01-01	80
11	The French Revolution	0101000020E61000001F3EF4FFFFAF0340BD25BBC6378C4840	France	The French Revolution was a period of radical political and societal change in France that began with the Estates General of 1789 and ended with the formation of the French Consulate in November 1799. Many of its ideas are considered fundamental principles of liberal democracy, while phrases like liberté, égalité, fraternité reappeared in other revolts, such as the 1917 Russian Revolution, and inspired campaigns for the abolition of slavery and universal suffrage. The values and institutions it created dominate French politics to this day	1789-01-01	73
10	The Revolution of 1848	0101000020E61000005C73EEFFFF5A2D40F7AA239A67A44440	Italy	A series of revolutions broke loose in Italy in early 1848, prompting many states to implement new constitutions, including the constitutional monarchy of Piedmont/Sardinia. As revolution spread across Europe, Piedmont tried to take the nationalist imitative and went to war with Austria over their Italian possessions; Piedmont lost, but the kingdom survived under Victor Emanuel II and was seen as the natural rallying point for Italian unity.	1848-02-23	105
4	Dashed hopes for independence	0101000020E610000026DDF1FF7FA4374096C92DDE030E0D40	Congo Republic	In May 1960 Patrice Lumumba is elected the Democratic Republic of Congo’s first Prime Minister. Four months later in September 1960, he is overthrown in a military coup led by Col. Joseph-Désiré Mobutu.  With assistance from Belgium and the U.S., Mobutu begins a 36-year reign as dictator. Lumumba is executed in early 1961.	1960-05-01	50
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: Maps_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."Maps_event_id_seq"', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 42, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: markers_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.markers_event_id_seq', 17, true);


--
-- Name: markers_marker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.markers_marker_id_seq', 14, true);


--
-- Name: Maps_event Maps_event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Maps_event"
    ADD CONSTRAINT "Maps_event_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: markers_event markers_event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markers_event
    ADD CONSTRAINT markers_event_pkey PRIMARY KEY (id);


--
-- Name: markers_marker markers_marker_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markers_marker
    ADD CONSTRAINT markers_marker_pkey PRIMARY KEY (id);


--
-- Name: Maps_event_location_5595b66c_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "Maps_event_location_5595b66c_id" ON public."Maps_event" USING gist (location);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: markers_marker_location_fb0b1f87_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX markers_marker_location_fb0b1f87_id ON public.markers_marker USING gist (location);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

