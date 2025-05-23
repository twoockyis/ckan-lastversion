--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22
-- Dumped by pg_dump version 12.22

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activity; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.activity (
    id text NOT NULL,
    "timestamp" timestamp without time zone,
    user_id text,
    object_id text,
    revision_id text,
    activity_type text,
    data text
);


ALTER TABLE public.activity OWNER TO ckandbuser;

--
-- Name: activity_detail; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.activity_detail (
    id text NOT NULL,
    activity_id text,
    object_id text,
    object_type text,
    activity_type text,
    data text
);


ALTER TABLE public.activity_detail OWNER TO ckandbuser;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO ckandbuser;

--
-- Name: api_token; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.api_token (
    id text NOT NULL,
    name text,
    user_id text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    last_access timestamp without time zone,
    plugin_extras jsonb
);


ALTER TABLE public.api_token OWNER TO ckandbuser;

--
-- Name: dashboard; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.dashboard (
    user_id text NOT NULL,
    activity_stream_last_viewed timestamp without time zone NOT NULL,
    email_last_sent timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL
);


ALTER TABLE public.dashboard OWNER TO ckandbuser;

--
-- Name: group; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public."group" (
    id text NOT NULL,
    name text NOT NULL,
    title text,
    description text,
    created timestamp without time zone,
    state text,
    type text NOT NULL,
    approval_status text,
    image_url text,
    is_organization boolean DEFAULT false
);


ALTER TABLE public."group" OWNER TO ckandbuser;

--
-- Name: group_extra; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.group_extra (
    id text NOT NULL,
    group_id text,
    key text,
    value text,
    state text
);


ALTER TABLE public.group_extra OWNER TO ckandbuser;

--
-- Name: group_extra_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.group_extra_revision (
    id text NOT NULL,
    group_id text,
    key text,
    value text,
    state text,
    revision_id text NOT NULL,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.group_extra_revision OWNER TO ckandbuser;

--
-- Name: group_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.group_revision (
    id text NOT NULL,
    name text NOT NULL,
    title text,
    description text,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    state text,
    revision_id text NOT NULL,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    type text NOT NULL,
    approval_status text,
    image_url text,
    is_organization boolean DEFAULT false
);


ALTER TABLE public.group_revision OWNER TO ckandbuser;

--
-- Name: member; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.member (
    id text NOT NULL,
    group_id text,
    table_id text NOT NULL,
    state text,
    table_name text NOT NULL,
    capacity text NOT NULL
);


ALTER TABLE public.member OWNER TO ckandbuser;

--
-- Name: member_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.member_revision (
    id text NOT NULL,
    table_id text NOT NULL,
    group_id text,
    state text,
    revision_id text NOT NULL,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    table_name text NOT NULL,
    capacity text NOT NULL
);


ALTER TABLE public.member_revision OWNER TO ckandbuser;

--
-- Name: package; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package (
    id text NOT NULL,
    name character varying(100) NOT NULL,
    title text,
    version character varying(100),
    url text,
    notes text,
    author text,
    author_email text,
    maintainer text,
    maintainer_email text,
    state text,
    license_id text,
    type text,
    owner_org text,
    private boolean DEFAULT false,
    metadata_modified timestamp without time zone,
    creator_user_id text,
    metadata_created timestamp without time zone,
    plugin_data jsonb
);


ALTER TABLE public.package OWNER TO ckandbuser;

--
-- Name: package_extra; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_extra (
    id text NOT NULL,
    key text,
    value text,
    state text,
    package_id text
);


ALTER TABLE public.package_extra OWNER TO ckandbuser;

--
-- Name: package_extra_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_extra_revision (
    id text NOT NULL,
    key text,
    value text,
    revision_id text NOT NULL,
    state text,
    package_id text,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.package_extra_revision OWNER TO ckandbuser;

--
-- Name: package_member; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_member (
    package_id text NOT NULL,
    user_id text NOT NULL,
    capacity text NOT NULL,
    modified timestamp without time zone NOT NULL
);


ALTER TABLE public.package_member OWNER TO ckandbuser;

--
-- Name: package_relationship; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_relationship (
    id text NOT NULL,
    subject_package_id text,
    object_package_id text,
    type text,
    comment text,
    state text
);


ALTER TABLE public.package_relationship OWNER TO ckandbuser;

--
-- Name: package_relationship_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_relationship_revision (
    id text NOT NULL,
    subject_package_id text,
    object_package_id text,
    type text,
    comment text,
    revision_id text NOT NULL,
    continuity_id text,
    state text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.package_relationship_revision OWNER TO ckandbuser;

--
-- Name: package_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_revision (
    id text NOT NULL,
    name character varying(100) NOT NULL,
    title text,
    version character varying(100),
    url text,
    notes text,
    author text,
    author_email text,
    maintainer text,
    maintainer_email text,
    revision_id text NOT NULL,
    state text,
    continuity_id text,
    license_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    type text,
    owner_org text,
    private boolean DEFAULT false,
    metadata_modified timestamp without time zone,
    creator_user_id text,
    metadata_created timestamp without time zone
);


ALTER TABLE public.package_revision OWNER TO ckandbuser;

--
-- Name: package_tag; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_tag (
    id text NOT NULL,
    state text,
    package_id text,
    tag_id text
);


ALTER TABLE public.package_tag OWNER TO ckandbuser;

--
-- Name: package_tag_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_tag_revision (
    id text NOT NULL,
    revision_id text NOT NULL,
    state text,
    package_id text,
    tag_id text,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.package_tag_revision OWNER TO ckandbuser;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.resource (
    id text NOT NULL,
    url text NOT NULL,
    format text,
    description text,
    "position" integer,
    hash text,
    state text,
    extras text,
    name text,
    resource_type text,
    mimetype text,
    mimetype_inner text,
    size bigint,
    last_modified timestamp without time zone,
    cache_url text,
    cache_last_updated timestamp without time zone,
    created timestamp without time zone,
    url_type text,
    package_id text DEFAULT ''::text NOT NULL,
    metadata_modified timestamp without time zone
);


ALTER TABLE public.resource OWNER TO ckandbuser;

--
-- Name: resource_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.resource_revision (
    id text NOT NULL,
    url text NOT NULL,
    format text,
    description text,
    "position" integer,
    revision_id text NOT NULL,
    hash text,
    state text,
    continuity_id text,
    extras text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    name text,
    resource_type text,
    mimetype text,
    mimetype_inner text,
    size bigint,
    last_modified timestamp without time zone,
    cache_url text,
    cache_last_updated timestamp without time zone,
    webstore_url text,
    webstore_last_updated timestamp without time zone,
    created timestamp without time zone,
    url_type text,
    package_id text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.resource_revision OWNER TO ckandbuser;

--
-- Name: resource_view; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.resource_view (
    id text NOT NULL,
    resource_id text,
    title text,
    description text,
    view_type text NOT NULL,
    "order" integer NOT NULL,
    config text
);


ALTER TABLE public.resource_view OWNER TO ckandbuser;

--
-- Name: revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.revision (
    id text NOT NULL,
    "timestamp" timestamp without time zone,
    author character varying(200),
    message text,
    state text,
    approved_timestamp timestamp without time zone
);


ALTER TABLE public.revision OWNER TO ckandbuser;

--
-- Name: system_info; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.system_info (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    value text,
    state text DEFAULT 'active'::text NOT NULL
);


ALTER TABLE public.system_info OWNER TO ckandbuser;

--
-- Name: system_info_id_seq; Type: SEQUENCE; Schema: public; Owner: ckandbuser
--

CREATE SEQUENCE public.system_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_info_id_seq OWNER TO ckandbuser;

--
-- Name: system_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ckandbuser
--

ALTER SEQUENCE public.system_info_id_seq OWNED BY public.system_info.id;


--
-- Name: system_info_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.system_info_revision (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    value text,
    revision_id text NOT NULL,
    continuity_id integer,
    state text DEFAULT 'active'::text NOT NULL,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.system_info_revision OWNER TO ckandbuser;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.tag (
    id text NOT NULL,
    name character varying(100) NOT NULL,
    vocabulary_id character varying(100)
);


ALTER TABLE public.tag OWNER TO ckandbuser;

--
-- Name: task_status; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.task_status (
    id text NOT NULL,
    entity_id text NOT NULL,
    entity_type text NOT NULL,
    task_type text NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    state text,
    error text,
    last_updated timestamp without time zone
);


ALTER TABLE public.task_status OWNER TO ckandbuser;

--
-- Name: term_translation; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.term_translation (
    term text NOT NULL,
    term_translation text NOT NULL,
    lang_code text NOT NULL
);


ALTER TABLE public.term_translation OWNER TO ckandbuser;

--
-- Name: tracking_raw; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.tracking_raw (
    user_key character varying(100) NOT NULL,
    url text NOT NULL,
    tracking_type character varying(10) NOT NULL,
    access_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tracking_raw OWNER TO ckandbuser;

--
-- Name: tracking_summary; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.tracking_summary (
    url text NOT NULL,
    package_id text,
    tracking_type character varying(10) NOT NULL,
    count integer NOT NULL,
    running_total integer DEFAULT 0 NOT NULL,
    recent_views integer DEFAULT 0 NOT NULL,
    tracking_date date
);


ALTER TABLE public.tracking_summary OWNER TO ckandbuser;

--
-- Name: user; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public."user" (
    id text NOT NULL,
    name text NOT NULL,
    apikey text,
    created timestamp without time zone,
    about text,
    password text,
    fullname text,
    email text,
    reset_key text,
    sysadmin boolean DEFAULT false,
    activity_streams_email_notifications boolean DEFAULT false,
    state text DEFAULT 'active'::text NOT NULL,
    plugin_extras jsonb,
    image_url text,
    last_active timestamp without time zone
);


ALTER TABLE public."user" OWNER TO ckandbuser;

--
-- Name: user_following_dataset; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.user_following_dataset (
    follower_id text NOT NULL,
    object_id text NOT NULL,
    datetime timestamp without time zone NOT NULL
);


ALTER TABLE public.user_following_dataset OWNER TO ckandbuser;

--
-- Name: user_following_group; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.user_following_group (
    follower_id text NOT NULL,
    object_id text NOT NULL,
    datetime timestamp without time zone NOT NULL
);


ALTER TABLE public.user_following_group OWNER TO ckandbuser;

--
-- Name: user_following_user; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.user_following_user (
    follower_id text NOT NULL,
    object_id text NOT NULL,
    datetime timestamp without time zone NOT NULL
);


ALTER TABLE public.user_following_user OWNER TO ckandbuser;

--
-- Name: vocabulary; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.vocabulary (
    id text NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.vocabulary OWNER TO ckandbuser;

--
-- Name: system_info id; Type: DEFAULT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info ALTER COLUMN id SET DEFAULT nextval('public.system_info_id_seq'::regclass);


--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.activity (id, "timestamp", user_id, object_id, revision_id, activity_type, data) FROM stdin;
\.


--
-- Data for Name: activity_detail; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.activity_detail (id, activity_id, object_id, object_type, activity_type, data) FROM stdin;
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.alembic_version (version_num) FROM stdin;
4a5e3465beb6
\.


--
-- Data for Name: api_token; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.api_token (id, name, user_id, created_at, last_access, plugin_extras) FROM stdin;
y1DU2tnqQ70wmNeSMg_3hIunIwC2nF4HU8Fe07MOLKs	RANDRIANJATOVO Tokiniaina	bae99562-13ca-4a84-9816-6d26c81a2dc2	2024-09-19 12:33:54.901796	\N	\N
s7r-GUQOYWIg8yPDBHFcqyMv__4Za1Q-wwyiF5rBikA	datapusher	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-01 12:49:06.019138	\N	\N
\.


--
-- Data for Name: dashboard; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.dashboard (user_id, activity_stream_last_viewed, email_last_sent) FROM stdin;
bae99562-13ca-4a84-9816-6d26c81a2dc2	2024-08-28 07:40:09.217939	2024-08-28 07:40:09.217948
0b5980bf-fd31-42a9-b129-2889609bc0dc	2024-08-28 10:31:44.553572	2024-08-28 10:31:44.553583
30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-09-12 10:43:54.185069	2024-09-12 10:43:54.185077
e1c0fa39-928a-451b-8fad-56ae2b7f7633	2024-11-05 10:46:13.622832	2024-11-05 10:46:13.62284
171fe78c-2079-4f0e-af62-91aca011e21e	2025-03-12 05:13:51.215182	2025-03-12 05:13:51.215191
\.


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public."group" (id, name, title, description, created, state, type, approval_status, image_url, is_organization) FROM stdin;
c6cabe59-e807-4b6b-978b-d44c26b277cb	pivot-science	pivot-science	pivot science depart	2024-08-28 07:49:50.954287	active	organization	approved	2024-08-28-103727.883234pivotlogo01.png	t
1d4c3118-d274-48a6-8543-ce48552c73de	administrative	Administrative	this includes primarily administrative bondaries or official locations of places	2024-09-11 14:22:26.964575	active	group	approved		f
646a6da7-9c69-4e49-b7cd-4a12c3ae6176	health-system	health-system	data on the health system in Ifanadiana	2024-09-12 06:35:05.349822	active	group	approved		f
96f4bcf0-89fc-4447-9b6f-fe9b1909fcd9	socio-demographic	socio-demographic	data on economic variables, populaton sizes, etc.	2024-09-12 06:35:25.501015	active	group	approved		f
905fd871-8d8b-4636-9f14-f3e3cda667c7	environmental	Environnemental	this includes environmental covariates, either aggregated to a spatial level or in raster format (depending on file size)	2024-09-12 06:34:44.103166	active	group	approved		f
7cb59ee7-609c-42d0-9da3-07220cc3c43c	ocha	OCHA		2024-10-30 12:36:13.533816	deleted	organization	approved		t
2b1d6e49-9764-41f6-ae5b-d64648f7d257	climate	Climate		2024-12-20 06:44:38.971114	deleted	group	approved		f
6ba0f63b-b8ff-40f9-881b-e3e521d78bf7	climate-data-rev	Climate data		2025-01-17 11:03:19.427472	active	group	approved		f
\.


--
-- Data for Name: group_extra; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.group_extra (id, group_id, key, value, state) FROM stdin;
\.


--
-- Data for Name: group_extra_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.group_extra_revision (id, group_id, key, value, state, revision_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: group_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.group_revision (id, name, title, description, created, state, revision_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current, type, approval_status, image_url, is_organization) FROM stdin;
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.member (id, group_id, table_id, state, table_name, capacity) FROM stdin;
04d66fbf-7528-44b4-b673-e28748219a5c	c6cabe59-e807-4b6b-978b-d44c26b277cb	bae99562-13ca-4a84-9816-6d26c81a2dc2	active	user	admin
776641a2-bf09-42c1-a368-292b52c7a8c3	c6cabe59-e807-4b6b-978b-d44c26b277cb	78e4abe0-ade0-4cf0-bf18-c9f44977abd0	active	package	organization
e0113548-2a87-4172-a31f-50d8d96eb866	1d4c3118-d274-48a6-8543-ce48552c73de	bae99562-13ca-4a84-9816-6d26c81a2dc2	active	user	admin
5125c368-aaed-445d-8455-a7dd692a8753	c6cabe59-e807-4b6b-978b-d44c26b277cb	b4bbc609-e5a6-4cc4-bc0e-2f0dfc5e2675	active	package	organization
3a2ff2ee-cd32-42fe-af7d-d6c8fa9ecdd2	c6cabe59-e807-4b6b-978b-d44c26b277cb	f4c9be2c-babf-4039-9d39-9a2436af711b	active	package	organization
b51bc4f0-f6ce-4c09-9622-e96b7d9372da	c6cabe59-e807-4b6b-978b-d44c26b277cb	486e0c18-1f2a-40ad-ad0a-90990692528a	active	package	organization
a875219f-4057-4f61-a669-6ccb4691c67e	1d4c3118-d274-48a6-8543-ce48552c73de	486e0c18-1f2a-40ad-ad0a-90990692528a	active	package	public
04b6d199-d0b4-4346-9d98-6a6185db0908	905fd871-8d8b-4636-9f14-f3e3cda667c7	bae99562-13ca-4a84-9816-6d26c81a2dc2	active	user	admin
4533e3df-0e8e-402a-8a88-d8f9083df062	646a6da7-9c69-4e49-b7cd-4a12c3ae6176	bae99562-13ca-4a84-9816-6d26c81a2dc2	active	user	admin
a64c2c9f-afa7-4a63-ac11-000a0938fd5c	96f4bcf0-89fc-4447-9b6f-fe9b1909fcd9	bae99562-13ca-4a84-9816-6d26c81a2dc2	active	user	admin
dd622f82-ff98-408f-8702-289d32b29cc0	1d4c3118-d274-48a6-8543-ce48552c73de	cc17bba4-b5f3-47fe-b84f-44038d8fdc35	deleted	package	public
e13f8a3d-6e8b-4f0e-8f55-59894fb890f5	c6cabe59-e807-4b6b-978b-d44c26b277cb	cc17bba4-b5f3-47fe-b84f-44038d8fdc35	deleted	package	organization
d8da9bf2-c138-4d94-a8d1-6bd7a1af6b76	c6cabe59-e807-4b6b-978b-d44c26b277cb	76163385-4df1-495e-b431-1c239125f473	deleted	package	organization
e37ae037-f3cb-4006-bc66-d4eb159ef70c	7cb59ee7-609c-42d0-9da3-07220cc3c43c	16946d28-cd29-4b20-b8a3-786130eeb6c8	deleted	package	organization
ac5f6a02-5ac6-431f-8716-8c9aa2d01a28	7cb59ee7-609c-42d0-9da3-07220cc3c43c	cf97285f-56cb-47e0-9be7-e1cbaae3004e	deleted	package	organization
ea9eb031-b5a6-4aa0-aa95-26166801fea4	1d4c3118-d274-48a6-8543-ce48552c73de	cf97285f-56cb-47e0-9be7-e1cbaae3004e	deleted	package	public
8b60e7d2-5cd1-4b73-abe0-48b977f622c9	1d4c3118-d274-48a6-8543-ce48552c73de	537403a5-8357-41c3-a478-5f3cd47420bc	active	package	public
3b526b28-fa23-4aab-a937-d326c0b83ec3	1d4c3118-d274-48a6-8543-ce48552c73de	640d9e53-38c5-4f6e-89e5-abcc7c8ef70c	active	package	public
6b4f9605-0ed4-4f5d-95b9-6c7fdbb6a163	1d4c3118-d274-48a6-8543-ce48552c73de	13241278-1db2-41b9-8cd0-b88c716c07dd	active	package	public
f967b657-69e9-4dcf-bf6b-1a83f68065a3	1d4c3118-d274-48a6-8543-ce48552c73de	4b509b07-ba24-478a-81d7-b292722572a0	active	package	public
cf239d0b-d8bc-4db1-b21f-1123017f8332	1d4c3118-d274-48a6-8543-ce48552c73de	5ad0ab9d-2a5f-4c69-aa93-40cd26f057c3	active	package	public
46332e82-b4db-4f31-a106-339ddb6a3039	c6cabe59-e807-4b6b-978b-d44c26b277cb	eda71f53-09b7-4594-8756-1dd9a8091ad9	deleted	package	organization
54ab3ecf-88bc-4e3a-8c42-3ac0819752bc	905fd871-8d8b-4636-9f14-f3e3cda667c7	eda71f53-09b7-4594-8756-1dd9a8091ad9	deleted	package	public
1917e899-85d7-4660-8260-f0cbd1e5f9f8	1d4c3118-d274-48a6-8543-ce48552c73de	b65ffc25-eb1f-4cfc-8298-d5218517a2ca	deleted	package	public
a2a3ad4f-3580-449d-b79b-57eed787eab1	905fd871-8d8b-4636-9f14-f3e3cda667c7	b65ffc25-eb1f-4cfc-8298-d5218517a2ca	deleted	package	public
d46379bc-ca61-4b27-844c-02f9f3c795c2	c6cabe59-e807-4b6b-978b-d44c26b277cb	b65ffc25-eb1f-4cfc-8298-d5218517a2ca	deleted	package	organization
fc78687e-2d8c-4d54-9d2b-024c1cd4806c	c6cabe59-e807-4b6b-978b-d44c26b277cb	8ea0fa3d-089f-489c-9169-acf6c03c0293	active	package	organization
6b4591f1-f5dc-4e07-b0ce-1b3f395ffdb2	905fd871-8d8b-4636-9f14-f3e3cda667c7	8ea0fa3d-089f-489c-9169-acf6c03c0293	active	package	public
f922f515-5665-4fc2-88db-e675763e5176	c6cabe59-e807-4b6b-978b-d44c26b277cb	bcd845a9-5f56-4262-8b24-343cf60f0764	active	package	organization
ebfeee80-ec97-4a7b-96f5-0a084794be06	646a6da7-9c69-4e49-b7cd-4a12c3ae6176	bcd845a9-5f56-4262-8b24-343cf60f0764	active	package	public
efac3300-efdb-4953-aa54-16c2696abed1	c6cabe59-e807-4b6b-978b-d44c26b277cb	9f533a04-b50e-4a02-9e03-4333c4c8345e	active	package	organization
b0e0b4df-f862-4528-8c2e-ba17c6ae1084	646a6da7-9c69-4e49-b7cd-4a12c3ae6176	9f533a04-b50e-4a02-9e03-4333c4c8345e	active	package	public
8fec3d1d-b92e-4467-ba13-21f2886c3d2c	7cb59ee7-609c-42d0-9da3-07220cc3c43c	13241278-1db2-41b9-8cd0-b88c716c07dd	deleted	package	organization
93970d1e-395d-494c-8257-d127caae3d1e	c6cabe59-e807-4b6b-978b-d44c26b277cb	13241278-1db2-41b9-8cd0-b88c716c07dd	active	package	organization
a43c7cd4-be05-4f58-89e4-be6d2ec41a81	7cb59ee7-609c-42d0-9da3-07220cc3c43c	5ad0ab9d-2a5f-4c69-aa93-40cd26f057c3	deleted	package	organization
ae773d26-c61f-4ed0-8f23-b727471f64ef	c6cabe59-e807-4b6b-978b-d44c26b277cb	5ad0ab9d-2a5f-4c69-aa93-40cd26f057c3	active	package	organization
4179ff47-2152-4923-a13f-cf2e93fab154	7cb59ee7-609c-42d0-9da3-07220cc3c43c	537403a5-8357-41c3-a478-5f3cd47420bc	deleted	package	organization
07d2f8f8-5e4e-4fc4-bcd1-af75ac4b4cfa	c6cabe59-e807-4b6b-978b-d44c26b277cb	537403a5-8357-41c3-a478-5f3cd47420bc	active	package	organization
e467c255-98a3-4c70-9960-b18bd9740d1e	7cb59ee7-609c-42d0-9da3-07220cc3c43c	640d9e53-38c5-4f6e-89e5-abcc7c8ef70c	deleted	package	organization
a78ba06d-a162-4653-928b-ca8270db893d	c6cabe59-e807-4b6b-978b-d44c26b277cb	640d9e53-38c5-4f6e-89e5-abcc7c8ef70c	active	package	organization
c4b97302-a501-4848-84cc-4ee42ce0501a	7cb59ee7-609c-42d0-9da3-07220cc3c43c	4b509b07-ba24-478a-81d7-b292722572a0	deleted	package	organization
e11258af-9b15-4ad7-a6ea-0a968cb34118	c6cabe59-e807-4b6b-978b-d44c26b277cb	4b509b07-ba24-478a-81d7-b292722572a0	active	package	organization
16cbdf0b-ae92-44ad-a02a-13aa9b7d44f2	7cb59ee7-609c-42d0-9da3-07220cc3c43c	30f02a07-c8dd-4715-bae7-39d92fe0e42d	deleted	user	admin
c9c0f7d1-4038-439b-bd71-a714b95cd022	c6cabe59-e807-4b6b-978b-d44c26b277cb	508dd869-7e3a-4e8f-bec4-19c9d6d82cf4	active	package	organization
a5ab0370-096f-45d1-a607-04c51f579387	c6cabe59-e807-4b6b-978b-d44c26b277cb	37892339-7110-46c7-b44d-a15dadf49f0b	active	package	organization
bb512620-c45c-41e7-ba13-7278e45ead87	c6cabe59-e807-4b6b-978b-d44c26b277cb	a593970e-68a6-42ee-818d-f75c4cc42463	active	package	organization
cbdea51d-802b-4928-b838-c1e1f9b6c5a5	c6cabe59-e807-4b6b-978b-d44c26b277cb	05aab56c-504c-452f-adef-17386fe84672	active	package	organization
53cf064e-6071-45f2-9dbc-2d3afa70d094	c6cabe59-e807-4b6b-978b-d44c26b277cb	c300f38f-d7b4-4622-8078-7b69a243681d	active	package	organization
e111d4d7-a67b-4bde-8154-311fd942fdc2	c6cabe59-e807-4b6b-978b-d44c26b277cb	a8d974a1-8692-4cb5-b7d2-ebcbf557c95f	active	package	organization
d8ff376e-422c-451f-a0d6-30cebd7cd10d	c6cabe59-e807-4b6b-978b-d44c26b277cb	396a5545-8618-4df3-b1a7-080e7208a291	active	package	organization
1d00581f-2b22-4357-9033-2df889f2c468	c6cabe59-e807-4b6b-978b-d44c26b277cb	05b01db2-693e-4dfd-94a4-832627467ded	active	package	organization
bb4d6a9c-d3eb-46e2-8835-4edc54b518d6	905fd871-8d8b-4636-9f14-f3e3cda667c7	8debdff7-67ad-4f22-a526-16852298526c	active	package	public
0e96ae88-af4e-405e-b8d0-16bfe118ed58	c6cabe59-e807-4b6b-978b-d44c26b277cb	577dee44-3b64-46c0-82b7-7e658bf37a5d	active	package	organization
439cb28b-d323-495e-b20f-f5fa323469d3	c6cabe59-e807-4b6b-978b-d44c26b277cb	8d531793-f96e-4aa2-b759-c271230d0292	active	package	organization
a75007c4-b149-45bf-a4db-cc37a8b6dcb1	c6cabe59-e807-4b6b-978b-d44c26b277cb	8d531793-f96e-4aa2-b759-c271230d0292	deleted	package	public
c664d262-3f86-4413-96fb-14d9854e26d4	96f4bcf0-89fc-4447-9b6f-fe9b1909fcd9	8d531793-f96e-4aa2-b759-c271230d0292	active	package	public
04f681dc-3d02-4295-b72f-44cdca2aa618	2b1d6e49-9764-41f6-ae5b-d64648f7d257	8ed37fb9-a6fb-4897-998b-469fe290d0f2	deleted	package	public
176c0847-4571-4c37-9c77-0a3934a6f2c3	2b1d6e49-9764-41f6-ae5b-d64648f7d257	a8d974a1-8692-4cb5-b7d2-ebcbf557c95f	deleted	package	public
501c2f5c-2929-4c02-b9ef-aa8c813290b1	2b1d6e49-9764-41f6-ae5b-d64648f7d257	c300f38f-d7b4-4622-8078-7b69a243681d	deleted	package	public
6d271415-e814-4b1e-9f9f-616c086bf4be	2b1d6e49-9764-41f6-ae5b-d64648f7d257	05b01db2-693e-4dfd-94a4-832627467ded	deleted	package	public
7e43f5b0-3f09-4311-8dce-b423cb1d5fa5	2b1d6e49-9764-41f6-ae5b-d64648f7d257	05aab56c-504c-452f-adef-17386fe84672	deleted	package	public
b1b0608d-fcca-4539-ad56-39f76c2e486d	2b1d6e49-9764-41f6-ae5b-d64648f7d257	396a5545-8618-4df3-b1a7-080e7208a291	deleted	package	public
bee96df6-545e-45e1-92c3-7be382b19a85	2b1d6e49-9764-41f6-ae5b-d64648f7d257	7267272a-af61-41d5-9258-c81bc24aef7b	deleted	package	public
d4786ea8-d669-451b-ab35-a6d11adfc598	2b1d6e49-9764-41f6-ae5b-d64648f7d257	a593970e-68a6-42ee-818d-f75c4cc42463	deleted	package	public
fe81a781-1e6f-4320-b6ee-640652e94fae	c6cabe59-e807-4b6b-978b-d44c26b277cb	9516034a-31af-4cb8-897b-fedbdbfa99c7	active	package	organization
f8fc0707-99f3-4e93-b2e6-67a8134ccd5a	c6cabe59-e807-4b6b-978b-d44c26b277cb	88f93207-23a2-437c-9965-1cb842f62508	active	package	organization
5461f35e-081b-40a9-a642-b365954a2f9c	c6cabe59-e807-4b6b-978b-d44c26b277cb	7267272a-af61-41d5-9258-c81bc24aef7b	active	package	organization
d1982546-55fa-4253-88f1-61cbb97ea54d	c6cabe59-e807-4b6b-978b-d44c26b277cb	299a7708-2841-4c14-98ae-fdc5cb85ca94	active	package	organization
aa5bc9ba-f096-4e35-bab9-0874cc83391b	c6cabe59-e807-4b6b-978b-d44c26b277cb	8ed37fb9-a6fb-4897-998b-469fe290d0f2	active	package	organization
d7367f16-39ff-4de6-ba62-656498172244	c6cabe59-e807-4b6b-978b-d44c26b277cb	8debdff7-67ad-4f22-a526-16852298526c	active	package	organization
2d749b9b-c481-433d-a503-15bbf4324380	c6cabe59-e807-4b6b-978b-d44c26b277cb	2c9ad599-cd38-4bf2-9b78-afad214abd60	active	package	organization
94a6386e-eb84-4970-a120-2fa87ebdfc94	96f4bcf0-89fc-4447-9b6f-fe9b1909fcd9	577dee44-3b64-46c0-82b7-7e658bf37a5d	active	package	public
b72dfaaf-0192-4bde-8bcb-78bb8d4684f5	6ba0f63b-b8ff-40f9-881b-e3e521d78bf7	30f02a07-c8dd-4715-bae7-39d92fe0e42d	active	user	admin
f89d2ba6-9052-4934-af38-88a5babc936d	c6cabe59-e807-4b6b-978b-d44c26b277cb	3a58b12f-909d-4bac-a232-1299c2452e02	active	package	organization
f51fb407-8205-4afa-b95d-aee548cb3bf7	6ba0f63b-b8ff-40f9-881b-e3e521d78bf7	3a58b12f-909d-4bac-a232-1299c2452e02	active	package	public
f9d87687-134d-4da8-8f55-cb4004ff811b	c6cabe59-e807-4b6b-978b-d44c26b277cb	bac15c29-55db-4be5-9c3c-f050e3b761d1	active	package	organization
472d959a-1a43-4c52-9aaf-758379b19c87	6ba0f63b-b8ff-40f9-881b-e3e521d78bf7	bac15c29-55db-4be5-9c3c-f050e3b761d1	active	package	public
37e5cff0-80eb-41a6-a280-de9b2b6378ea	c6cabe59-e807-4b6b-978b-d44c26b277cb	48a9bd62-e03e-4899-b324-92531b9f856c	active	package	organization
5f105c38-f01c-4d11-8d66-06e97bfc8d93	6ba0f63b-b8ff-40f9-881b-e3e521d78bf7	48a9bd62-e03e-4899-b324-92531b9f856c	active	package	public
f042f955-744d-4cd6-a738-5573ab9168b3	c6cabe59-e807-4b6b-978b-d44c26b277cb	3a36190a-c837-4f83-9081-3e172fe40839	active	package	organization
c4e69611-cbf3-4430-b9a6-2543280680de	6ba0f63b-b8ff-40f9-881b-e3e521d78bf7	3a36190a-c837-4f83-9081-3e172fe40839	active	package	public
c81817e9-02e1-42f7-a16a-6d9370fa2bbd	c6cabe59-e807-4b6b-978b-d44c26b277cb	f03e0c72-4265-471a-b75d-1b6de6171d0b	active	package	organization
8eb32573-20eb-464c-89e1-599fd74a6c5e	6ba0f63b-b8ff-40f9-881b-e3e521d78bf7	f03e0c72-4265-471a-b75d-1b6de6171d0b	active	package	public
c5f7d8e0-3b84-4c5f-8e42-8208a66e026b	c6cabe59-e807-4b6b-978b-d44c26b277cb	e93fd146-477b-41b3-8940-0dd208f6c988	active	package	organization
c194ec6d-2443-4932-b71d-2a6ed5a50735	6ba0f63b-b8ff-40f9-881b-e3e521d78bf7	e93fd146-477b-41b3-8940-0dd208f6c988	active	package	public
e2efeb98-d4bd-4dba-9067-69d1c415800b	c6cabe59-e807-4b6b-978b-d44c26b277cb	577fb635-cde3-46ce-80cb-4d6c783b5ca7	active	package	organization
731bf257-2e09-496b-a1cb-2bfaea583ca1	2b1d6e49-9764-41f6-ae5b-d64648f7d257	299a7708-2841-4c14-98ae-fdc5cb85ca94	deleted	package	public
799ccaa9-f848-4ca9-84d2-736725b9de49	2b1d6e49-9764-41f6-ae5b-d64648f7d257	30f02a07-c8dd-4715-bae7-39d92fe0e42d	deleted	user	admin
a87920d7-9c55-468f-9f7f-3ba28654e3c5	2b1d6e49-9764-41f6-ae5b-d64648f7d257	37892339-7110-46c7-b44d-a15dadf49f0b	deleted	package	public
cf6979ad-5ef7-4d85-94f8-3b8a6096e644	2b1d6e49-9764-41f6-ae5b-d64648f7d257	9516034a-31af-4cb8-897b-fedbdbfa99c7	deleted	package	public
d4a3ef49-b6a6-4adc-88a2-1a877d66009d	2b1d6e49-9764-41f6-ae5b-d64648f7d257	508dd869-7e3a-4e8f-bec4-19c9d6d82cf4	deleted	package	public
e13a0196-0364-403d-841d-e706f10397d9	2b1d6e49-9764-41f6-ae5b-d64648f7d257	88f93207-23a2-437c-9965-1cb842f62508	deleted	package	public
\.


--
-- Data for Name: member_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.member_revision (id, table_id, group_id, state, revision_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current, table_name, capacity) FROM stdin;
\.


--
-- Data for Name: package; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package (id, name, title, version, url, notes, author, author_email, maintainer, maintainer_email, state, license_id, type, owner_org, private, metadata_modified, creator_user_id, metadata_created, plugin_data) FROM stdin;
8ea0fa3d-089f-489c-9169-acf6c03c0293	ifanadiana-land-cover	Ifanadiana Land Cover								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 10:14:58.173342	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-31 09:55:31.754993	\N
8debdff7-67ad-4f22-a526-16852298526c	ifanadiana-elevation	Ifanadiana Elevation								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 10:17:48.003168	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 10:16:54.040176	\N
78e4abe0-ade0-4cf0-bf18-c9f44977abd0	csb-ifanadiana	csb-ifanadiana			21 CSB d'Ifanadiana					draft	notspecified	dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-08-28 08:42:25.723563	bae99562-13ca-4a84-9816-6d26c81a2dc2	2024-08-28 07:51:48.598809	\N
508dd869-7e3a-4e8f-bec4-19c9d6d82cf4	ifanadiana-precipitation-level-5-fokontany	Ifanadiana Precipitation level 5 (Fokontany)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 10:27:08.824435	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 06:42:40.018592	\N
16946d28-cd29-4b20-b8a3-786130eeb6c8	ifanadiana_adm_level3_fokontany	Ifanadiana_adm_level3_fokontany			Fokontany					deleted		dataset	7cb59ee7-609c-42d0-9da3-07220cc3c43c	t	2024-10-30 12:55:50.467922	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-30 12:39:45.902213	\N
b65ffc25-eb1f-4cfc-8298-d5218517a2ca	b65ffc25-eb1f-4cfc-8298-d5218517a2ca	Ifanadiana Land Cover								deleted		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	t	2024-10-31 09:53:54.855322	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-31 09:50:50.583886	\N
f4c9be2c-babf-4039-9d39-9a2436af711b	csv_hafa	csv_hafa								draft	cc-by	dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	t	2024-09-11 14:28:45.63565	bae99562-13ca-4a84-9816-6d26c81a2dc2	2024-09-11 14:28:45.635641	\N
b4bbc609-e5a6-4cc4-bc0e-2f0dfc5e2675	andrana_csv	andrana_csv								draft		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	t	2024-09-12 05:31:20.049894	bae99562-13ca-4a84-9816-6d26c81a2dc2	2024-09-11 14:27:46.839706	\N
486e0c18-1f2a-40ad-ad0a-90990692528a	aaaaaaa				sasasas					draft		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	t	2024-09-12 06:26:49.097462	bae99562-13ca-4a84-9816-6d26c81a2dc2	2024-09-11 14:30:10.731536	\N
cf97285f-56cb-47e0-9be7-e1cbaae3004e	ifanadiana-administrative-level-0	Ifanadiana administrative level 0								deleted		dataset	7cb59ee7-609c-42d0-9da3-07220cc3c43c	t	2024-10-31 08:50:44.701836	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-31 08:43:18.856618	\N
cc17bba4-b5f3-47fe-b84f-44038d8fdc35	csb	csb			CSB Ifanadiana					deleted		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-10-01 12:01:12.549571	bae99562-13ca-4a84-9816-6d26c81a2dc2	2024-08-28 07:53:04.825966	\N
76163385-4df1-495e-b431-1c239125f473	earth-explorer	Earth-explorer			Earth Explorer					deleted		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-08-28 10:32:56.225552	bae99562-13ca-4a84-9816-6d26c81a2dc2	2024-08-28 09:05:19.912178	\N
4b509b07-ba24-478a-81d7-b292722572a0	ifanadiana-administrative-level-0-district	Ifanadiana administrative GADM level 3 (District)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	t	2024-11-08 11:25:54.851308	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-31 09:29:42.823055	\N
eda71f53-09b7-4594-8756-1dd9a8091ad9	ifanadiana-landcover	Ifanadiana Land Cover								deleted		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	t	2024-10-31 09:48:51.62432	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-31 09:42:40.675838	\N
bcd845a9-5f56-4262-8b24-343cf60f0764	ifanadiana-community-site-locations	Ifanadiana Community Site Locations								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	t	2024-10-31 10:11:11.177273	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-31 10:09:57.74151	\N
5ad0ab9d-2a5f-4c69-aa93-40cd26f057c3	ifanadiana-standardized-name-of-level-2-fokontany	Ifanadiana Standardized name of level 5 (Fokontany)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-11-08 11:16:55.851945	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-31 09:34:18.373522	\N
640d9e53-38c5-4f6e-89e5-abcc7c8ef70c	ifanadiana-administrative-new-level-1	Ifanadiana administrative GADM new level 4 (new Commune)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	t	2024-11-08 11:29:55.823311	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-31 09:05:35.97506	\N
537403a5-8357-41c3-a478-5f3cd47420bc	ifanadiana-administrative-level-3	Ifanadiana administrative level 5 (Fokontany)			5					active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-11-08 11:30:31.128179	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-31 09:00:34.037265	\N
13241278-1db2-41b9-8cd0-b88c716c07dd	ifanadiana-administrative-old-level-1	Ifanadiana administrative GADM old level 4 (old Commune)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-11-08 11:31:18.687457	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-31 09:26:17.009751	\N
a593970e-68a6-42ee-818d-f75c4cc42463	ifanadiana-temperature-level-4-communes	Ifanadiana Temperature level 4 (Commune)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 06:58:42.763697	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 06:51:48.957842	\N
9f533a04-b50e-4a02-9e03-4333c4c8345e	location-of-basic-health-centres-csb	Ifanadiana Location of Basic Health Centres (CSB)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-11-08 12:22:40.948641	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-10-31 10:17:05.107075	\N
37892339-7110-46c7-b44d-a15dadf49f0b	ifanadiana-worldclim-dataset-level-5-fokontany	Ifanadiana WorldClim dataset level 5 (Fokontany)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 06:48:36.271767	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 06:47:30.503662	\N
88f93207-23a2-437c-9965-1cb842f62508	ifanadiana-evapotranspiration-level-4-commune	Ifanadiana Evapotranspiration level 4 (Commune)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 07:05:57.959691	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 07:02:21.348089	\N
05aab56c-504c-452f-adef-17386fe84672	ifanadiana-subsurface-runoff-level-4-commune	Ifanadiana Subsurface Runoff level 4 (Commune)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 06:54:44.305537	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 06:54:30.569953	\N
9516034a-31af-4cb8-897b-fedbdbfa99c7	ifanadiana-precipitation-level-4-commune	Ifanadiana Precipitation level 4 (Commune)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 07:00:07.193903	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 06:59:46.20478	\N
c300f38f-d7b4-4622-8078-7b69a243681d	ifanadiana-relative-humidity	Ifanadiana Relative Humidity level 4 (Commune)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 07:22:22.551289	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 07:18:41.036142	\N
299a7708-2841-4c14-98ae-fdc5cb85ca94	ifanadiana-temperature-level-5-fokontany	Ifanadiana Temperature level 5 (Fokontany)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 07:15:02.058978	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 07:13:08.87258	\N
7267272a-af61-41d5-9258-c81bc24aef7b	ifanadiana-subsurface-runoff-level-5-fokontany	Ifanadiana Subsurface Runoff level 5 (Fokontany)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 07:17:24.619954	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 07:09:47.335856	\N
8ed37fb9-a6fb-4897-998b-469fe290d0f2	ifanadiana-relative-humidity-level-5-fokontany	Ifanadiana Relative Humidity level 5 (Fokontany)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 07:24:21.339059	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 07:23:46.122916	\N
a8d974a1-8692-4cb5-b7d2-ebcbf557c95f	ifanadiana-bioclim-level-4-commune	Ifanadiana Bioclim level 4 (Commune)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 08:42:07.285426	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 08:40:04.200568	\N
396a5545-8618-4df3-b1a7-080e7208a291	ifanadiana-bioclim-level-5-fokontany	Ifanadiana Bioclim level 5 (Fokontany)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 08:54:21.966563	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 08:45:38.91444	\N
05b01db2-693e-4dfd-94a4-832627467ded	ifanadiana-worldclim-dataset-level-4-commune	Ifanadiana WorldClim dataset level 4 (Commune)								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 09:00:47.624868	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 08:57:17.343402	\N
577dee44-3b64-46c0-82b7-7e658bf37a5d	ifanadiana-population	Ifanadiana population								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 10:40:48.765443	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 10:35:57.922815	\N
f03e0c72-4265-471a-b75d-1b6de6171d0b	ifanadiana-era-5-evapotranspiration	Ifanadiana ERA 5 Evapotranspiration		The data come from the ECMWF/ERA5_LAND/MONTHLY_AGGR collection on Google Earth Engine (GEE). The band used, potential_evaporation_sum, gives the monthly sum of potential evapotranspiration.	Potential evapotranspiration represents the maximum quantity of water that could evaporate from the soil and be transpired by vegetation under ideal conditions, without limitation of available water. Data are available from 2000 to 2023, with an initial spatial resolution of 11,132 meters. These data have been aggregated by Commune and Fokontany to calculate monthly totals, expressed in meters. \r\nColumns:\r\nfid : numeric id of commune or fokontany\r\ndate : date\r\nnew_commun : commune name after 2019\r\nold_commun : commune name before 2019\r\ncomm_fkt : standardized fokontany name \r\nmean_pev : average of Evapotranspiration (m)\r\n	Randrianjatovo Tokiniaina	twoockyis@gmail.com		twoockyis@gmail.com	active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2025-03-12 04:17:17.151471	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2025-01-17 11:41:29.193245	\N
8d531793-f96e-4aa2-b759-c271230d0292	ifanadiana-settlements	Ifanadiana Village Location								active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2024-12-20 10:57:40.148308	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 10:48:08.653483	\N
3a58b12f-909d-4bac-a232-1299c2452e02	ifanadiana-bioclim	Ifanadiana Bioclim		WorldClim	Bioclim V2.1 data for the period 1970-2000 are a set of 19 bioclimatic variables derived from monthly temperature and precipitation values. These original data, at a spatial resolution of around 1 km┬▓, are static, representing climatological averages over a defined reference period (1970-2000). These variables have been aggregated at fokontany and commune level, taking the spatial average within the polygons of each administrative zone.\r\n	Randrianjatovo Tokiniaina	twoockyis@gmail.com	Randrianjatovo Tokiniaina	twoockyis@gmail.com	active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2025-03-12 05:05:09.747711	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2025-01-17 11:05:39.381977	\N
2c9ad599-cd38-4bf2-9b78-afad214abd60	ifanadiana-chirps-precipitation-level-5-fokontany	Ifanadiana CHIRPS Precipitation level 5 (Fokontany)				Michelle Evans	mevans@pivotworks.org	Randrianjatovo Tokiniaina	twoockyis@gmail.com	active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2025-01-17 12:07:59.022381	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2024-12-20 10:24:58.076992	\N
bac15c29-55db-4be5-9c3c-f050e3b761d1	ifanadiana-era-5-precipitation	Ifanadiana ERA 5 Precipitation		Les donn├®es de pr├®cipitations proviennent de la collection d'images mensuelles agr├®g├®es de ERA5 (ECMWF/ERA5_LAND/MONTHLY_AGGR) disponible sur Google Earth Engine (GEE). La bande utilis├®e, ÔÇ£total_precipitation_sumÔÇØ, fournit la somme totale des pr├®cipitations pour chaque mois, exprim├®e en m├¿tres.	WorldClim version 2.1 data, aggregated by Fokontany and Commune, provides global monthly average climate data for minimum, mean and maximum temperature, as well as precipitation. These data are static, representing climatological averages calculated over the reference period 1970-2000, and are available at an original spatial resolution of 1 km┬▓.  They have been aggregated to the administrative unit via a spatial mean.\r\n	Randrianjatovo Tokiniaina	twoockyis@gmail.com	Randrianjatovo Tokiniaina	twoockyis@gmail.com	active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2025-03-12 05:06:13.85843	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2025-01-17 11:20:26.534678	\N
3a36190a-c837-4f83-9081-3e172fe40839	ifanadiana-era-5-subsurface-runoff	Ifanadiana ERA 5 Subsurface Runoff		The data come from the ECMWF/ERA5_LAND/MONTHLY_AGGR collection on Google Earth Engine (GEE), with the sub_surface_runoff_sum band measuring total subsurface runoff.	Subsurface runoff represents the flow of water moving laterally through the surface layers of the soil. Data are available monthly from 2000 to 2023, with a spatial resolution of 11,132 meters. These data have been aggregated by Fokontany and by Communes to quantify the volume of water expressed in height-equivalents (meters), as if water were uniformly distributed over the administrative surface. \r\nColumns:\r\nfid : numeric id of commune or fokontany\r\nyear_month : date (format: YYYY-MM), corresponding to year and month\r\nnew_commune : commune name after 2019\r\nold_commune : commune name before 2019\r\ncomm_fkt : standardized fokontany name \r\nmean_subrunoff : average of subsurface runoff\r\n	Randrianjatovo Tokiniaina	twoockyis@gmail.com	Randrianjatovo Tokiniaina	twoockyis@gmail.com	active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2025-03-12 04:21:17.224587	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2025-01-17 11:33:15.687061	\N
577fb635-cde3-46ce-80cb-4d6c783b5ca7	ifanadiana-era-5-temperature	Ifanadiana ERA 5 Temperature		Les donn├®es proviennent de la collection ECMWF/ERA5_LAND/MONTHLY_AGGR sur Google Earth Engine (GEE). La bande utilis├®e, temperature_2m, donne la temp├®rature moyenne mensuelle ├á 2 m├¿tres au-dessus du sol, en Kelvin.	Les donn├®es de temp├®rature agr├®g├®es par Commune et Fokontany mesurent la temp├®rature de l'air ├á 2 m├¿tres au-dessus du sol. Ces donn├®es sont exprim├®es en Kelvin et sont agr├®g├®es mensuellement, couvrant la p├®riode de 2000 ├á 2023. Les donn├®es sont disponibles ├á une r├®solution spatiale de 11 132 m├¿tres..\r\n	Randrianjatovo Tokiniaina	twoockyis@gmail.com	Randrianjatovo Tokiniaina	twoockyis@gmail.com	active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2025-01-17 11:54:35.767596	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2025-01-17 11:51:00.206916	\N
e93fd146-477b-41b3-8940-0dd208f6c988	ifanadiana-era-5-relative-humidity	Ifanadiana ERA 5 Relative humidity		The data needed to calculate relative humidity comes from the following Google Earth Engine (GEE) collections: ÔÇ£ECMWF/ERA5_LAND/MONTHLY_AGGRÔÇØ, and the bands used are dewpoint_temperature_2m and temperature_2m.	Relative humidity represents the ratio between the quantity of water vapor present in the air and the maximum quantity the air can contain at a given temperature. Data are available from 2000 to 2023, with an initial spatial resolution of 11,132 meters.They are derived from the dew point temperature and the air temperature at 2 meters, according to the formula :\r\nRelative Humidity = 100 * (exp((17.625 * TD) / (243.04 + TD)) / exp((17.625 * T) / (243.04 + T)))\r\nwhere TD is the dew point temperature and T is the air temperature. These data have been aggregated by Commune and Fokontany to calculate monthly averages, expressed as a percentage (%), where 100% indicates complete saturation of the air with water vapor. \r\nDOI: https://doi.org/10.1175/1520-0450(1996)035<0601:IMFAOS>2.0.CO;2\r\n\r\nColumns:\r\nfid : numeric id of commune or fokontany\r\nyear_month : date (format: YYYY-MM), corresponding to year and month\r\nnew_commune : commune name after 2019\r\nold_commune : commune name before 2019\r\ncomm_fkt : standardized fokontany name \r\nmean : relative humidity values (%)\r\n	Randrianjatovo Tokiniaina	twoockyis@gmail.com	Randrianjatovo Tokiniaina	twoockyis@gmail.com	active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2025-03-12 04:06:40.476487	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2025-01-17 11:44:47.674174	\N
48a9bd62-e03e-4899-b324-92531b9f856c	ifanadiana-worldclim-dataset	Ifanadiana WorldClim		Les donn├®es climatiques utilis├®es proviennent de la collection WORLDCLIM/V1/MONTHLY disponible sur la plateforme Google Earth Engine (GEE).	WorldClim version 2.1 data, aggregated by Fokontany and Commune, provides global monthly average climate data for minimum, mean and maximum temperature, as well as precipitation. These data are static, representing climatological averages calculated over the reference period 1970-2000, and are available at an original spatial resolution of 1 km┬▓.  They have been aggregated to the administrative unit via a spatial mean.\r\nColumns : \r\nfid: numeric id of Commune or Fokontany \r\nnew_commun : commune name after 2019\r\nold_commun : commune name before 2019\r\ntmin : minimum temperature (┬░C)\r\ntmax : maximum temperature (┬░C)\r\ntavg : average temperature (┬░C)\r\nprec : precipitation (mm)\r\nsrad : solar radiation (kJ m-2 day-1)\r\nwind : wind speed (m s-1)\r\nvapr : water vapor pressure (kPa)	Randrianjatovo Tokiniaina	twoockyis@gmail.com	Randrianjatovo Tokiniaina	twoockyis@gmail.com	active		dataset	c6cabe59-e807-4b6b-978b-d44c26b277cb	f	2025-03-12 04:40:29.606434	30f02a07-c8dd-4715-bae7-39d92fe0e42d	2025-01-17 11:26:28.643866	\N
\.


--
-- Data for Name: package_extra; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_extra (id, key, value, state, package_id) FROM stdin;
b55b87e8-5b07-4dda-840a-fd10504f5b27	Data Link	Conversion de la temp├®rature en degr├®s Celsius / agr├®gation de donn├®es ├á l'aide de la moyenne	active	577fb635-cde3-46ce-80cb-4d6c783b5ca7
be0c108e-f1a1-4bef-8db1-c521ec3009b4	Cleaning steps	ee.ImageCollection("ECMWF/ERA5_LAND/MONTHLY_AGGR") .select('temperature_2m')	active	577fb635-cde3-46ce-80cb-4d6c783b5ca7
7354e707-019a-494b-83b3-ecd298ec64cd	Data Link	https://developers.google.com/earth-engine/datasets/catalog/ECMWF_ERA5_LAND_MONTHLY_AGGR#bands	active	e93fd146-477b-41b3-8940-0dd208f6c988
a4efa5fd-0ae0-4f94-b8be-fc527f321ee4	Processing steps	data aggregation using the spatial average of the polygon in each administrative zone	active	e93fd146-477b-41b3-8940-0dd208f6c988
48a56512-16fb-44fc-a9a7-e283b0d9be98	Data Link	https://developers.google.com/earth-engine/datasets/catalog/ECMWF_ERA5_LAND_MONTHLY_AGGR#bands	active	f03e0c72-4265-471a-b75d-1b6de6171d0b
520d79b9-a7e5-4d41-bb3d-d437b32759e8	Processing steps	data aggregation using the spatial average of the polygon in each administrative zone	active	f03e0c72-4265-471a-b75d-1b6de6171d0b
bea28c95-2da3-488e-8363-cd72df3fc7b2	Data Link	https://developers.google.com/earth-engine/datasets/catalog/ECMWF_ERA5_LAND_MONTHLY_AGGR#bands	active	3a36190a-c837-4f83-9081-3e172fe40839
11e44563-d931-4a91-bbdf-f5c2bf487a97	Processing steps	agr├®gation de donn├®es ├á l'aide de la moyenne	active	3a36190a-c837-4f83-9081-3e172fe40839
a4a03d41-1333-4609-b22c-7bd695bc3922	Data Link	https://www.worldclim.org/data/worldclim21.html#google_vignette	active	48a9bd62-e03e-4899-b324-92531b9f856c
82968ebc-8361-4143-854d-721d6c3b0d66	Processing steps	Data aggregation by fokontany/commune using spatial average (weighted mean). The average value was calculated using Google Earth Engine's reducer function, which computes a weighted mean based on the proportion of each pixel area that falls within the polygon boundary	active	48a9bd62-e03e-4899-b324-92531b9f856c
4f1475b1-8fec-44bf-9179-693bd544b9fe	Data Link	https://www.worldclim.org/data/worldclim21.html#google_vignette	active	bac15c29-55db-4be5-9c3c-f050e3b761d1
13a50e15-4735-47c0-bc51-abdff3139bc7	Processing steps 	Data aggregation by fokontany/commune using spatial average (weighted mean). The average value was calculated using Google Earth Engine's reducer function, which computes a weighted mean based on the proportion of each pixel area that falls within the polygon boundary	active	bac15c29-55db-4be5-9c3c-f050e3b761d1
1ee88a65-ae28-407f-83f7-29738933febc	Data Link	https://www.worldclim.org/data/worldclim21.html#google_vignette	active	3a58b12f-909d-4bac-a232-1299c2452e02
d389890c-76b6-47a9-ba3c-99fef0d6de1d	Processing steps	 Data aggregation by fokontany/commune using spatial average (weighted mean). The average value was calculated using Google Earth Engine's reducer function, which computes a weighted mean based on the proportion of each pixel area that falls within the polygon boundary. 	active	3a58b12f-909d-4bac-a232-1299c2452e02
\.


--
-- Data for Name: package_extra_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_extra_revision (id, key, value, revision_id, state, package_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: package_member; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_member (package_id, user_id, capacity, modified) FROM stdin;
\.


--
-- Data for Name: package_relationship; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_relationship (id, subject_package_id, object_package_id, type, comment, state) FROM stdin;
\.


--
-- Data for Name: package_relationship_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_relationship_revision (id, subject_package_id, object_package_id, type, comment, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: package_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_revision (id, name, title, version, url, notes, author, author_email, maintainer, maintainer_email, revision_id, state, continuity_id, license_id, expired_id, revision_timestamp, expired_timestamp, current, type, owner_org, private, metadata_modified, creator_user_id, metadata_created) FROM stdin;
\.


--
-- Data for Name: package_tag; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_tag (id, state, package_id, tag_id) FROM stdin;
c7866e79-3ec7-4182-91ab-b133f5585dfd	active	16946d28-cd29-4b20-b8a3-786130eeb6c8	8410c9cb-ca33-483e-be11-bc2d777d049c
a0fa6afa-6a24-4ed9-a14a-29091985e398	active	16946d28-cd29-4b20-b8a3-786130eeb6c8	01f996b3-92d9-48ec-8673-15cac36217c7
d5633f27-844b-4d47-a0a4-a36ef92bd258	active	16946d28-cd29-4b20-b8a3-786130eeb6c8	2239163b-673b-4887-81b0-79646760bc3e
2585ee50-bca4-4c1e-b8bc-e66cd2057e44	active	cf97285f-56cb-47e0-9be7-e1cbaae3004e	2239163b-673b-4887-81b0-79646760bc3e
2a56768f-11ef-4cb2-9f32-4d2cb9933b0a	active	cf97285f-56cb-47e0-9be7-e1cbaae3004e	8410c9cb-ca33-483e-be11-bc2d777d049c
7cce6742-1eab-4ca0-bb60-c791fed55d3b	active	cf97285f-56cb-47e0-9be7-e1cbaae3004e	01f996b3-92d9-48ec-8673-15cac36217c7
56ebf04c-41e8-4b44-9030-cdc5edabf93e	active	537403a5-8357-41c3-a478-5f3cd47420bc	01f996b3-92d9-48ec-8673-15cac36217c7
9a9d95dd-e70e-4286-803d-e536fb01aed4	active	537403a5-8357-41c3-a478-5f3cd47420bc	8410c9cb-ca33-483e-be11-bc2d777d049c
33ca2247-6e45-4063-9d23-44c702bddef0	active	537403a5-8357-41c3-a478-5f3cd47420bc	2239163b-673b-4887-81b0-79646760bc3e
\.


--
-- Data for Name: package_tag_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_tag_revision (id, revision_id, state, package_id, tag_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.resource (id, url, format, description, "position", hash, state, extras, name, resource_type, mimetype, mimetype_inner, size, last_modified, cache_url, cache_last_updated, created, url_type, package_id, metadata_modified) FROM stdin;
505e08cf-ffea-40f4-84ed-d77f85a21459	21_csb_ifanadiana.csv	CSV		0		active	{"datastore_active": false}	21_csb_Ifanadiana.csv	\N	text/csv	\N	952	2024-08-28 07:54:21.866081	\N	\N	2024-08-28 07:54:21.905585	upload	cc17bba4-b5f3-47fe-b84f-44038d8fdc35	2024-08-28 07:54:22.3362
eec764b7-8bfc-4b42-a98c-7eaa5530dc16	https://earthexplorer.usgs.gov/		Earth explorer	0		active	{"datastore_active": false}	Earth explorer	\N	\N	\N	\N	\N	\N	\N	2024-08-28 09:06:42.507347		76163385-4df1-495e-b431-1c239125f473	2024-08-28 09:06:42.771652
96bd7704-9792-4954-9a79-562e447f9526	ifd_fokontany.gpkg	gpkg		0		active	{"datastore_active": false}	ifd_fokontany.gpkg	\N	application/geopackage+sqlite3	\N	303104	2024-10-30 12:45:47.768257	\N	\N	2024-10-30 12:45:47.83132	upload	16946d28-cd29-4b20-b8a3-786130eeb6c8	2024-10-30 12:46:36.253895
daa08a34-ffa1-4b4d-ad82-2435c9a76ca5	ifd_fokontany.geojson	GeoJSON	geojson	1		active	{"datastore_active": false}	ifd_fokontany.geojson	\N	application/geo+json	\N	448448	2024-10-30 12:46:36.222181	\N	\N	2024-10-30 12:46:36.278171	upload	16946d28-cd29-4b20-b8a3-786130eeb6c8	2024-10-30 12:46:36.664934
8c4079e6-2f99-4741-bb8b-37dec466ebf6	ifd_fokontany.geojson	JSON		0		active	{"datastore_active": false}	ifd_fokontany.geojson	\N	application/geo+json	\N	448448	2024-10-31 08:44:51.569849	\N	\N	2024-10-31 08:44:51.655467	upload	cf97285f-56cb-47e0-9be7-e1cbaae3004e	2024-10-31 08:45:26.329027
9bf12f08-60c1-454e-b2a1-f205ddf1c1e8	ifd_fokontany.gpkg	GPKG		1		active	{"datastore_active": false}	ifd_fokontany.gpkg	\N	application/geopackage+sqlite3	\N	303104	2024-10-31 08:45:26.30124	\N	\N	2024-10-31 08:45:26.345153	upload	cf97285f-56cb-47e0-9be7-e1cbaae3004e	2024-10-31 08:47:09.259382
072b2e06-44d8-4ec3-b28b-bdec8f5b63aa	ifd_fokontany.geojson	GeoJSON		2		active	{"datastore_active": false}	ifd_fokontany.geojson	\N	application/geo+json	\N	448448	2024-10-31 08:47:09.222652	\N	\N	2024-10-31 08:47:09.287418	upload	cf97285f-56cb-47e0-9be7-e1cbaae3004e	2024-10-31 08:50:44.712213
a535e61f-38dd-49d9-a518-3a5a91f11c7d	ifd_fokontany.geojson	GeoJSON		0		active	{"datastore_active": false}	ifd_fokontany.geojson	\N	application/geo+json	\N	448448	2024-10-31 09:01:53.846874	\N	\N	2024-10-31 09:01:53.911444	upload	537403a5-8357-41c3-a478-5f3cd47420bc	2024-10-31 09:02:14.057975
3896d566-2b1e-406c-882a-69f3fee90798	ifd_fokontany.gpkg	GPKG		1		active	{"datastore_active": false}	ifd_fokontany.gpkg	\N	application/geopackage+sqlite3	\N	311296	2024-10-31 09:02:14.032821	\N	\N	2024-10-31 09:02:14.075772	upload	537403a5-8357-41c3-a478-5f3cd47420bc	2024-10-31 09:02:33.045757
884c3a10-9e50-4afc-a978-47466f6b892d	ifd_fokontany.kml	KML		2		active	{"datastore_active": false}	ifd_fokontany.kml	\N	application/vnd.google-earth.kml+xml	\N	423915	2024-10-31 09:02:33.022833	\N	\N	2024-10-31 09:02:33.059696	upload	537403a5-8357-41c3-a478-5f3cd47420bc	2024-10-31 09:02:52.444708
3ab362b6-b082-412c-a298-ff59048a45d6	ifd_new_commune.geojson	GeoJSON		0		active	{"datastore_active": false}	ifd_new_commune.geojson	\N	application/geo+json	\N	329735	2024-10-31 09:06:01.912779	\N	\N	2024-10-31 09:06:01.944624	upload	640d9e53-38c5-4f6e-89e5-abcc7c8ef70c	2024-10-31 09:06:32.018175
99cf9796-d8a4-4652-a8aa-14150bf8d330	ifd_new_commune.gpkg	GPKG		1		active	{"datastore_active": false}	ifd_new_commune.gpkg	\N	application/geopackage+sqlite3	\N	229376	2024-10-31 09:06:31.964507	\N	\N	2024-10-31 09:06:32.025299	upload	640d9e53-38c5-4f6e-89e5-abcc7c8ef70c	2024-10-31 09:06:56.920507
cb39132a-d35d-40e5-8099-d036682fb474	ifd_new_commune.kml	KML		2		active	{"datastore_active": false}	ifd_new_commune.kml	\N	application/vnd.google-earth.kml+xml	\N	262767	2024-10-31 09:06:56.896282	\N	\N	2024-10-31 09:06:56.927885	upload	640d9e53-38c5-4f6e-89e5-abcc7c8ef70c	2024-10-31 09:06:57.247232
02af3a19-25fc-4cee-bbcc-761152b4ddfb	ifd_old_commune.geojson	GeoJSON		0		active	{"datastore_active": false}	ifd_old_commune.geojson	\N	application/geo+json	\N	336535	2024-10-31 09:26:48.430488	\N	\N	2024-10-31 09:26:48.448162	upload	13241278-1db2-41b9-8cd0-b88c716c07dd	2024-10-31 09:27:04.389704
2ddf1fe0-699e-4b05-826a-ea5a0293190a	ifd_old_commune.gpkg	GPKG		1		active	{"datastore_active": false}	ifd_old_commune.gpkg	\N	application/geopackage+sqlite3	\N	229376	2024-10-31 09:27:04.369741	\N	\N	2024-10-31 09:27:04.394568	upload	13241278-1db2-41b9-8cd0-b88c716c07dd	2024-10-31 09:27:18.551752
ccc38fa3-23d3-4188-b9e1-b357adc6abab	ifd_old_commune.kml	KML		2		active	{"datastore_active": false}	ifd_old_commune.kml	\N	application/vnd.google-earth.kml+xml	\N	267108	2024-10-31 09:27:18.527181	\N	\N	2024-10-31 09:27:18.558128	upload	13241278-1db2-41b9-8cd0-b88c716c07dd	2024-10-31 09:27:18.80027
d210a3f1-e425-4202-881e-e6685996dfad	ifd_boundary.geojson	GeoJSON		0		active	{"datastore_active": false}	ifd_boundary.geojson	\N	application/geo+json	\N	140700	2024-10-31 09:29:57.088204	\N	\N	2024-10-31 09:29:57.109627	upload	4b509b07-ba24-478a-81d7-b292722572a0	2024-10-31 09:30:11.480997
65da55b2-620d-43e8-9e0d-7091662c9564	ifd_boundary.gpkg	GPKG		1		active	{"datastore_active": false}	ifd_boundary.gpkg	\N	application/geopackage+sqlite3	\N	155648	2024-10-31 09:30:11.456687	\N	\N	2024-10-31 09:30:11.485034	upload	4b509b07-ba24-478a-81d7-b292722572a0	2024-10-31 09:30:26.939867
ef96269d-9588-411f-971d-fcfaa1891d10	ifd_boundary.kml	KML		2		active	{"datastore_active": false}	ifd_boundary.kml	\N	application/vnd.google-earth.kml+xml	\N	109988	2024-10-31 09:30:26.917131	\N	\N	2024-10-31 09:30:26.947194	upload	4b509b07-ba24-478a-81d7-b292722572a0	2024-10-31 09:30:27.293101
7218467f-5380-4a6b-a7d1-efd24762ccc2	fokontany_names_std.csv	CSV		0		active	{"datastore_active": false}	fokontany_names_std.csv	\N	text/csv	\N	14064	2024-10-31 09:35:03.513815	\N	\N	2024-10-31 09:35:03.534505	upload	5ad0ab9d-2a5f-4c69-aa93-40cd26f057c3	2024-10-31 09:35:03.914539
b06d2a80-fc6c-4782-9b5d-fa4ab8ed811f	landcover_ifd_clean.zip	ZIP		0		active	{"datastore_active": false}	landcover_ifd_clean.zip	\N	application/zip	\N	19948340	2024-10-31 09:45:16.193239	\N	\N	2024-10-31 09:45:16.212851	upload	eda71f53-09b7-4594-8756-1dd9a8091ad9	2024-10-31 09:45:16.491657
388de07a-0ca8-40fc-9f0f-bbe8e73b3cff	landcover_ifd_clean.zip	ZIP		0		active	{"datastore_active": false}	landcover_ifd_clean.zip	\N	application/zip	\N	19948340	2024-10-31 09:51:09.148763	\N	\N	2024-10-31 09:51:09.188672	upload	b65ffc25-eb1f-4cfc-8298-d5218517a2ca	2024-10-31 09:51:57.20729
812c5cde-700f-4fc3-ba41-17f4a21d6411	landcover_ifd_clean.kml	KML		1		active	\N	landcover_ifd_clean.kml	\N	application/vnd.google-earth.kml+xml	\N	45839783	2024-10-31 09:53:54.845894	\N	\N	2024-10-31 09:53:54.86589	upload	b65ffc25-eb1f-4cfc-8298-d5218517a2ca	2024-10-31 09:53:54.861895
deb7e488-5ca3-417c-af1b-11c90692ead5	landcover_ifd_clean.geojson	GeoJSON		0		active	{"datastore_active": false}	landcover_ifd_clean.geojson	\N	application/geo+json	\N	57981182	2024-10-31 09:55:53.474783	\N	\N	2024-10-31 09:55:53.494275	upload	8ea0fa3d-089f-489c-9169-acf6c03c0293	2024-10-31 09:56:53.130314
deef2870-022e-44fb-8b85-6b0ec4dfbb07	landcover_ifd_clean.kml	KML		1		active	{"datastore_active": false}	landcover_ifd_clean.kml	\N	application/vnd.google-earth.kml+xml	\N	45839783	2024-10-31 09:56:53.114913	\N	\N	2024-10-31 09:56:53.134155	upload	8ea0fa3d-089f-489c-9169-acf6c03c0293	2024-10-31 09:57:04.785778
58c0f940-8041-433d-93a9-7fff67d8dece	landcover_ifd_clean.zip	ZIP		2		active	{"datastore_active": false}	landcover_ifd_clean.zip	\N	application/zip	\N	19948340	2024-10-31 09:57:04.757692	\N	\N	2024-10-31 09:57:04.790783	upload	8ea0fa3d-089f-489c-9169-acf6c03c0293	2024-10-31 09:57:05.083375
8587f496-9839-4d00-a3c4-59d450a15729	landcover_ifd_clean.gpkg	GPKG		3		active	\N	landcover_ifd_clean.gpkg	\N	application/geopackage+sqlite3	\N	56094720	2024-10-31 09:57:53.667847	\N	\N	2024-10-31 09:57:53.691147	upload	8ea0fa3d-089f-489c-9169-acf6c03c0293	2024-10-31 09:57:53.686991
63d39764-bc27-4b01-9da8-35632ba0e72c	localisationsitecommunautaire.csv	CSV		0		active	{"datastore_active": false}	LocalisationSiteCommunautaire.csv	\N	text/csv	\N	16107	2024-10-31 10:10:17.20047	\N	\N	2024-10-31 10:10:17.22232	upload	bcd845a9-5f56-4262-8b24-343cf60f0764	2024-10-31 10:10:29.965603
c7a00656-22e5-4a79-8cd6-ab4b5559bb4a	localisationsitecommunautaire.geojson	GeoJSON		1		active	{"datastore_active": false}	LocalisationSiteCommunautaire.geojson	\N	application/geo+json	\N	47581	2024-10-31 10:10:29.943827	\N	\N	2024-10-31 10:10:29.97111	upload	bcd845a9-5f56-4262-8b24-343cf60f0764	2024-10-31 10:10:42.590146
d358d5ac-3a81-443c-9416-8065240e81a8	localisationsitecommunautaire.gpkg	GPKG		2		active	{"datastore_active": false}	LocalisationSiteCommunautaire.gpkg	\N	application/geopackage+sqlite3	\N	143360	2024-10-31 10:10:42.566008	\N	\N	2024-10-31 10:10:42.595263	upload	bcd845a9-5f56-4262-8b24-343cf60f0764	2024-10-31 10:10:57.958847
dbe254c7-2133-4de7-9c7f-42932ae0d2be	localisationsitecommunautaire.kml	KML		3		active	{"datastore_active": false}	LocalisationSiteCommunautaire.kml	\N	application/vnd.google-earth.kml+xml	\N	91849	2024-10-31 10:10:57.932272	\N	\N	2024-10-31 10:10:57.963079	upload	bcd845a9-5f56-4262-8b24-343cf60f0764	2024-10-31 10:11:10.94136
9795402a-6aca-432c-94f4-ac8ca8b63bf8	localisationsitecommunautaire.zip	ZIP		4		active	{"datastore_active": false}	LocalisationSiteCommunautaire.zip	\N	application/zip	\N	10623	2024-10-31 10:11:10.912606	\N	\N	2024-10-31 10:11:10.948589	upload	bcd845a9-5f56-4262-8b24-343cf60f0764	2024-10-31 10:11:11.185229
d05072f4-762e-4d5d-b064-49139bca0a60	csb_locations.geojson	GeoJSON		0		active	{"datastore_active": false}	csb_locations.geojson	\N	application/geo+json	\N	4048	2024-10-31 10:17:20.115093	\N	\N	2024-10-31 10:17:20.136727	upload	9f533a04-b50e-4a02-9e03-4333c4c8345e	2024-10-31 10:17:31.11117
6bd4fdb1-e3eb-4bfb-ac6f-f2a8a3b32a1e	csb_locations.gpkg	GPKG		1		active	{"datastore_active": false}	csb_locations.gpkg	\N	application/geopackage+sqlite3	\N	106496	2024-10-31 10:17:31.093469	\N	\N	2024-10-31 10:17:31.118619	upload	9f533a04-b50e-4a02-9e03-4333c4c8345e	2024-10-31 10:17:42.603589
a117e490-36aa-4243-a656-1c5de3c839b4	csb_locations.kml	KML		2		active	{"datastore_active": false}	csb_locations.kml	\N	application/vnd.google-earth.kml+xml	\N	6789	2024-10-31 10:17:42.579563	\N	\N	2024-10-31 10:17:42.610438	upload	9f533a04-b50e-4a02-9e03-4333c4c8345e	2024-10-31 10:18:10.344624
b38426eb-048d-4ff6-a976-8bc60f8bb516	csb_locations.zip	ZIP		3		active	{"datastore_active": false}	csb_locations.zip	\N	application/zip	\N	2921	2024-10-31 10:18:10.302124	\N	\N	2024-10-31 10:18:10.354618	upload	9f533a04-b50e-4a02-9e03-4333c4c8345e	2024-10-31 10:18:10.662813
d643c3ce-502e-4cad-a742-22a978da2aa5	ifd_boundary_shp.zip	ZIP		3		active	\N	ifd_boundary_SHP.zip	\N	application/zip	\N	41315	2024-11-08 11:25:54.832066	\N	\N	2024-11-08 11:25:54.877195	upload	4b509b07-ba24-478a-81d7-b292722572a0	2024-11-08 11:25:54.866298
09396c28-36b0-44bb-899c-c16e53ea1ca2	ifd_new_commune_shp.zip	ZIP		3		active	\N	ifd_new_commune_SHP.zip	\N	application/zip	\N	87427	2024-11-08 11:29:40.303679	\N	\N	2024-11-08 11:29:40.339452	upload	640d9e53-38c5-4f6e-89e5-abcc7c8ef70c	2024-11-08 11:29:40.333343
4efc3b88-5df3-4dfe-9922-ef5170cf8dbd	ifd_fokontany_shp.zip	ZIP		3		active	\N	ifd_fokontany_SHP.zip	\N	application/zip	\N	111284	2024-11-08 11:30:31.078805	\N	\N	2024-11-08 11:30:31.191138	upload	537403a5-8357-41c3-a478-5f3cd47420bc	2024-11-08 11:30:31.155868
e9afee9c-9237-4a33-a619-9552f51d0b8b	ifd_old_commune_shp.zip	ZIP		3		active	\N	ifd_old_commune_SHP.zip	\N	application/zip	\N	85874	2024-11-08 11:31:18.655726	\N	\N	2024-11-08 11:31:18.711896	upload	13241278-1db2-41b9-8cd0-b88c716c07dd	2024-11-08 11:31:18.701942
ee9b14a8-1b3a-42ef-afd8-424c92668553	era5_precipitation_ifd_communes_mmperday-1.csv	CSV		0		active	{"datastore_active": false}	ERA5_precipitation_IFD_communes_mmPerDay (1).csv	\N	text/csv	\N	15800264	2024-12-20 07:00:06.767792	\N	\N	2024-12-20 07:00:06.789421	upload	9516034a-31af-4cb8-897b-fedbdbfa99c7	2024-12-20 07:00:07.201717
ba6f3005-0c8c-43e4-8477-dac11e1e3f29	worldclim_monthly_all_bands_ifd_fokontany.csv	CSV		0		active	{"datastore_active": false}	WORLDCLIM_monthly_all_bands_IFD_Fokontany.csv	\N	text/csv	\N	563584	2024-12-20 06:48:35.641471	\N	\N	2024-12-20 06:48:35.663333	upload	37892339-7110-46c7-b44d-a15dadf49f0b	2024-12-20 06:48:36.28089
92a1ce1a-4bb6-4804-b7ce-6b9f9233e3b1	era5_precipitation_ifd_fokontany_mmperday.csv	CSV		0		active	{"datastore_active": false}	ERA5_precipitation_IFD_Fokontany_mmPerDay.csv	\N	text/csv	\N	21522554	2024-12-20 06:43:30.484794	\N	\N	2024-12-20 06:43:30.518533	upload	508dd869-7e3a-4e8f-bec4-19c9d6d82cf4	2024-12-20 06:50:10.762601
6e1534e2-9786-4b8e-b2c5-985c059388d2	era5_temperature_ifd_communes-1.csv	CSV		0		active	{"datastore_active": false}	ERA5_Temperature_IFD_Communes (1).csv	\N	text/csv	\N	84120	2024-12-20 06:52:04.523826	\N	\N	2024-12-20 06:52:04.547513	upload	a593970e-68a6-42ee-818d-f75c4cc42463	2024-12-20 06:52:05.032606
09a96fd4-0007-4dea-b056-08add3e00fde	subsurface_runoff_monthly_ifd_commune-1.csv	CSV		0		active	{"datastore_active": false}	SubSurface_Runoff_Monthly_IFD_Commune (1).csv	\N	text/csv	\N	63720	2024-12-20 06:54:43.86898	\N	\N	2024-12-20 06:54:43.895111	upload	05aab56c-504c-452f-adef-17386fe84672	2024-12-20 06:54:44.317532
4f357e68-0811-40c3-b987-b21b380359ba	potential_evapotranspiration_monthly_ifd_commune.csv	CSV		0		active	{"datastore_active": false}	Potential_Evapotranspiration_Monthly_IFD_Commune.csv	\N	text/csv	\N	63780	2024-12-20 07:05:57.538856	\N	\N	2024-12-20 07:05:57.600466	upload	88f93207-23a2-437c-9965-1cb842f62508	2024-12-20 07:05:57.972766
871c832f-98a2-4ef7-96d3-d518fa6dcd52	era5_temperature_ifd_fokontany-1.csv	CSV		0		active	{"datastore_active": false}	ERA5_Temperature_IFD_Fokontany (1).csv	\N	text/csv	\N	1135531	2024-12-20 07:15:01.686877	\N	\N	2024-12-20 07:15:01.708975	upload	299a7708-2841-4c14-98ae-fdc5cb85ca94	2024-12-20 07:15:02.067487
e3a7b005-84d5-4ec6-97f2-c4fcfa872ff9	subsurface_runoff_monthly_ifd_fokontany.csv	CSV		0		active	{"datastore_active": false}	SubSurface_Runoff_Monthly_IFD_Fokontany.csv	\N	text/csv	\N	1099597	2024-12-20 07:17:24.237533	\N	\N	2024-12-20 07:17:24.261499	upload	7267272a-af61-41d5-9258-c81bc24aef7b	2024-12-20 07:17:24.62845
743b5255-a1f7-45c7-9efd-6782aab3fc63	relative_humidity_monthly_ifd_commune.csv	CSV		0		active	{"datastore_active": false}	Relative_Humidity_Monthly_IFD_Commune.csv	\N	text/csv	\N	59763	2024-12-20 07:18:56.142417	\N	\N	2024-12-20 07:18:56.170172	upload	c300f38f-d7b4-4622-8078-7b69a243681d	2024-12-20 07:20:10.542788
c5abedb1-620f-496b-9997-ecc7829999a3	relative_humidity_monthly_ifd_commune.csv	CSV		1		active	{"datastore_active": false}	Relative_Humidity_Monthly_IFD_Commune.csv	\N	text/csv	\N	59763	2024-12-20 07:20:10.515624	\N	\N	2024-12-20 07:20:10.553722	upload	c300f38f-d7b4-4622-8078-7b69a243681d	2024-12-20 07:20:10.963783
730ca137-487a-4f08-aaa4-28324bed89bf	relative_humidity_monthly_ifd_fokontany.csv	CSV		0		active	{"datastore_active": false}	Relative_Humidity_Monthly_IFD_Fokontany.csv	\N	text/csv	\N	1048136	2024-12-20 07:24:20.893775	\N	\N	2024-12-20 07:24:20.92142	upload	8ed37fb9-a6fb-4897-998b-469fe290d0f2	2024-12-20 07:24:21.346654
13d7b471-2644-4f5f-9d3f-77a6ce528175	worldclim_bio_variables_ifd_commune-1.csv	CSV		0		active	{"datastore_active": false}	WorldClim_Bio_Variables_IFD_Commune (1).csv	\N	text/csv	\N	5574	2024-12-20 08:42:06.859679	\N	\N	2024-12-20 08:42:06.885435	upload	a8d974a1-8692-4cb5-b7d2-ebcbf557c95f	2024-12-20 08:42:07.291672
73c46559-add2-4144-a7b5-b5a9d29af16b	worldclim_bio_variables_ifd_fokontany-1.csv	CSV		0		active	{"datastore_active": false}	WorldClim_Bio_Variables_IFD_Fokontany (1).csv	\N	text/csv	\N	73371	2024-12-20 08:54:21.610427	\N	\N	2024-12-20 08:54:21.637926	upload	396a5545-8618-4df3-b1a7-080e7208a291	2024-12-20 08:54:21.973928
b2d9edbb-afa8-420a-84ef-743a66d136f8	worldclim_monthly_all_bands_ifd_commune.csv	CSV		0		active	{"datastore_active": false}	WORLDCLIM_monthly_all_bands_IFD_Commune.csv	\N	text/csv	\N	305716	2024-12-20 09:00:47.29201	\N	\N	2024-12-20 09:00:47.313116	upload	05b01db2-693e-4dfd-94a4-832627467ded	2024-12-20 09:00:47.633177
bbb9fc16-a574-45f0-a058-1da9deb14047	strm.tif	TIFF		0		active	{"datastore_active": false}	strm.tif	\N	image/tiff	\N	16600961	2024-12-20 10:17:17.440189	\N	\N	2024-12-20 10:17:17.45969	upload	8debdff7-67ad-4f22-a526-16852298526c	2024-12-20 10:17:17.70483
a28e8dd2-7aa5-45ac-b30e-4c9501cfb342	chirps_rain_fkt_2015-2020.csv	CSV		1		active	\N	CHIRPS_rain_FKT_2015-2020.csv	\N	text/csv	\N	697978	2024-12-20 10:27:08.814034	\N	\N	2024-12-20 10:27:08.839551	upload	508dd869-7e3a-4e8f-bec4-19c9d6d82cf4	2024-12-20 10:27:08.834842
c1c02790-8783-4ab1-9084-fef4d505ee29	fokontany-pop-1993.csv	CSV		0		active	{"datastore_active": false}	fokontany-pop-1993.csv	\N	text/csv	\N	7179	2024-12-20 10:40:18.036799	\N	\N	2024-12-20 10:40:18.068656	upload	577dee44-3b64-46c0-82b7-7e658bf37a5d	2024-12-20 10:40:33.16003
09ca08c0-efa6-426b-afe5-3d495fe62351	population-fokontany-annual.csv	CSV		2		active	{"datastore_active": false}	population-fokontany-annual.csv	\N	text/csv	\N	56377	2024-12-20 10:40:48.16563	\N	\N	2024-12-20 10:40:48.201341	upload	577dee44-3b64-46c0-82b7-7e658bf37a5d	2024-12-20 10:40:48.789236
53c42410-be42-4177-b475-f1adf58ec482	fokontany-pop-2018.csv	CSV		1		active	{"datastore_active": false}	fokontany-pop-2018.csv	\N	text/csv	\N	7226	2024-12-20 10:40:33.127591	\N	\N	2024-12-20 10:40:33.166307	upload	577dee44-3b64-46c0-82b7-7e658bf37a5d	2024-12-20 10:40:48.191748
10f6257e-fd9c-482e-af90-2c70d7ab3a34	all_settlements.csv	CSV		0		active	{"datastore_active": false}	all_settlements.csv	\N	text/csv	\N	3040609	2024-12-20 10:48:42.051148	\N	\N	2024-12-20 10:48:42.074167	upload	8d531793-f96e-4aa2-b759-c271230d0292	2024-12-20 10:48:42.460911
4baab19d-fb54-41e7-a96f-21f3ab3f7b7b	major_villages.csv	CSV		1		active	\N	major_villages.csv	\N	text/csv	\N	61445	2024-12-20 10:55:34.701454	\N	\N	2024-12-20 10:55:34.730362	upload	8d531793-f96e-4aa2-b759-c271230d0292	2024-12-20 10:55:34.723867
be3a7fca-fc93-46da-93f0-53a233e24425	ifanadiana-bioclim-level-5-fokontany.csv	CSV	# Columns:\r\n- **fid**: numeric id of Commune / fokontany \r\n- **comm_fkt**: Name of fokontany using standardized 'new_commune'_'fokontany' nomenclature\r\n- **BIO1**: Annual Mean Temperature (┬░C)\r\n- **BIO2**: Mean Diurnal Range (┬░C) (Annual mean of (Tmax - Tmin))\r\n- **BIO3**: Isothermality (%) ((BIO2/BIO7) ├ù 100)\r\n- **BIO4**: Temperature Seasonality ((Temperature standard deviation) ├ù 100))\r\n- **BIO5**: Max Temperature of Warmest Month (┬░C)\r\n- **BIO6**: Min Temperature of Coldest Month (┬░C)\r\n- **BIO7**: Temperature Annual Range (┬░C)(BIO5 - BIO6)\r\n- **BIO8**: Mean Temperature of Wettest Quarter (┬░C)\r\n- **BIO9**: Mean Temperature of Driest Quarter (┬░C)\r\n- **BIO10**: Mean Temperature of Warmest Quarter (┬░C)\r\n- **BIO11**: Mean Temperature of Coldest Quarter (Mean temperature of coldest consecutive three months)\r\n- **BIO12**: Annual Precipitation (mm)\r\n- **BIO13**: Precipitation of Wettest Month (mm)\r\n- **BIO14**: Precipitation of Driest Month (mm)\r\n- **BIO15**: Precipitation Seasonality ((Precipitation standard deviation / Precipitation mean) ├ù 100)\r\n- **BIO16**: Precipitation of Wettest Quarter (mm)\r\n- **BIO17**: Precipitation of Driest Quarter (mm)\r\n- **BIO18**: Precipitation of Warmest Quarter (mm)\r\n- **BIO19**: Precipitation of Coldest Quarter (mm)	1		active	{"datastore_active": false}	ifd_bioclim_level_5_fokontany.csv	\N	text/csv	\N	73371	2025-01-17 11:16:43.445094	\N	\N	2025-01-17 11:16:43.477336	upload	3a58b12f-909d-4bac-a232-1299c2452e02	2025-03-12 05:04:43.545403
207bb945-5d05-4068-8113-5d71f0955ac2	ifanadiana-era-5-precipitation-level-5-fokontany.csv	CSV	Columns : \r\nfid: numeric id of Commune or Fokontany \r\ncomm_fkt: standardized fokontany identifier\r\ntmin : minimum temperature (┬░C)\r\ntmax : maximum temperature (┬░C)\r\ntavg : average temperature (┬░C)\r\nprec : precipitation (mm)\r\nsrad : solar radiation (kJ m-2 day-1)\r\nwind : wind speed (m s-1)\r\nvapr : water vapor pressure (kPa)	1		active	{"datastore_active": false}	ifd_worldclim_level_5_fokontany.csv	\N	text/csv	\N	21522554	2025-01-17 11:22:07.189874	\N	\N	2025-01-17 11:22:07.215742	upload	bac15c29-55db-4be5-9c3c-f050e3b761d1	2025-03-12 04:37:15.693003
1399fd4e-f91e-43e0-b2f0-86d8ae3b96d1	ifanadiana-era-5-subsurface-runoff-level-4-commune.csv	CSV		0		active	{"datastore_active": false}	ifd_era5_subsurface_runoff_level_4_commune.csv	\N	text/csv	\N	63720	2025-01-17 11:35:28.465572	\N	\N	2025-01-17 11:35:28.487344	upload	3a36190a-c837-4f83-9081-3e172fe40839	2025-03-12 04:21:01.239593
5c444b21-d01c-4c47-8cb8-8ee66531d9ac	ifanadiana-era-5-subsurface-runoff-level-5-fokontany.csv	CSV		1		active	{"datastore_active": false}	ifd_era_subsurface_runoff_level_5_fokontany.csv	\N	text/csv	\N	1099597	2025-01-17 11:35:41.128622	\N	\N	2025-01-17 11:35:41.156501	upload	3a36190a-c837-4f83-9081-3e172fe40839	2025-03-12 04:21:17.246162
f39a9937-b765-4845-b8fb-48b735745066	ifanadiana-worldclim-level-4-commune.csv	CSV		0		active	{"datastore_active": false}	ifd_worldclim_level_4_commune.csv	\N	text/csv	\N	305716	2025-01-17 11:27:00.822315	\N	\N	2025-01-17 11:27:00.852042	upload	48a9bd62-e03e-4899-b324-92531b9f856c	2025-03-12 04:26:19.716544
b0f7f77f-3a18-4e5f-9965-3a7eebb1ac28	ifanadiana-era-5-temperature-level-4-commune.csv	CSV		0		active	{"datastore_active": false}	Ifanadiana ERA 5 Temperature level 4 (Commune).csv	\N	text/csv	\N	84120	2025-01-17 11:54:15.769292	\N	\N	2025-01-17 11:54:15.811381	upload	577fb635-cde3-46ce-80cb-4d6c783b5ca7	2025-01-17 11:54:35.432153
0a55862a-8494-4f08-9dbc-7af8a5628e2f	ifanadiana-era-5-temperature-level-5-fokontany.csv	CSV		1		active	{"datastore_active": false}	Ifanadiana ERA 5 Temperature level 5 (Fokontany).csv	\N	text/csv	\N	1135531	2025-01-17 11:54:35.407057	\N	\N	2025-01-17 11:54:35.436621	upload	577fb635-cde3-46ce-80cb-4d6c783b5ca7	2025-01-17 11:54:35.7739
7074958b-953c-4a51-9567-f24b8eb96ed4	ifanadiana-chirps-precipitation-level-5-fokontany.csv	CSV		1		active	{"datastore_active": false}	Ifanadiana CHIRPS Precipitation level 5 (Fokontany).csv	\N	text/csv	\N	685302	2025-01-17 12:04:44.358271	\N	\N	2025-01-17 12:04:44.421577	upload	2c9ad599-cd38-4bf2-9b78-afad214abd60	2025-01-17 12:04:45.557031
45492a4c-fdf3-4590-a090-e4d19acdf992				0		active	{"datastore_active": false}		\N	\N	\N	\N	\N	\N	\N	2024-12-20 10:25:50.944584		2c9ad599-cd38-4bf2-9b78-afad214abd60	2025-01-17 12:07:59.039182
7bd7762c-f7b1-4f8d-911e-18e8be68d4e3	ifanadiana-era-5-relative-humidity-level-4-commune.csv	CSV		0		active	{"datastore_active": false}	ifd_era5_relative_humidity_level_4_ commune.csv	\N	text/csv	\N	59763	2025-01-17 11:45:58.058566	\N	\N	2025-01-17 11:45:58.085255	upload	e93fd146-477b-41b3-8940-0dd208f6c988	2025-03-11 19:35:28.115505
d647e626-3bbc-40e3-9efe-0782079ea09e	ifanadiana-era-5-relative-humidity-level-5-fokontany.csv	CSV		1		active	{"datastore_active": false}	ifd_era5_relative_humidity_level_5_ fokontany.csv	\N	text/csv	\N	1048136	2025-01-17 11:46:10.479294	\N	\N	2025-01-17 11:46:10.539059	upload	e93fd146-477b-41b3-8940-0dd208f6c988	2025-03-11 19:37:10.498185
d17f3e32-d03a-4963-b4a2-418ffd7dc8c5	ifanadiana-era-5-evapotranspiration-level-4-commune.csv	CSV		0		active	{"datastore_active": false}	ifd_era5_evapotranspiration_level_4_ commune.csv	\N	text/csv	\N	63780	2025-01-17 11:41:55.6459	\N	\N	2025-01-17 11:41:55.664884	upload	f03e0c72-4265-471a-b75d-1b6de6171d0b	2025-03-12 04:09:26.917396
c21b702d-646f-41b1-bbfc-0f1e5af6bd32	ifanadiana-era-5-evapotranspiration-level-5-fokontany.csv	CSV		1		active	{"datastore_active": false}	ifd_era5_evapotranspiration_level_5_ fokontany.csv	\N	text/csv	\N	1100951	2025-01-17 11:42:57.558616	\N	\N	2025-01-17 11:42:57.631751	upload	f03e0c72-4265-471a-b75d-1b6de6171d0b	2025-03-12 04:10:01.767579
083d09a8-6544-479b-b6aa-d33def0bd321	ifanadiana-worldclim-level-5-fokontany.csv	CSV		1		active	{"datastore_active": false}	ifd_worldclim_level_5_fokontany.csv	\N	text/csv	\N	563584	2025-01-17 11:27:14.4523	\N	\N	2025-01-17 11:27:14.478146	upload	48a9bd62-e03e-4899-b324-92531b9f856c	2025-03-12 04:29:54.432158
073702d6-767f-445f-a400-8700d2822755	ifanadiana-era-5-precipitation-level-4-commune.csv	CSV	Columns : \r\nfid: numeric id of Commune or Fokontany \r\nnew_commun : commune name after 2019\r\nold_commun : commune name before 2019\r\ntmin : minimum temperature (┬░C)\r\ntmax : maximum temperature (┬░C)\r\ntavg : average temperature (┬░C)\r\nprec : precipitation (mm)\r\nsrad : solar radiation (kJ m-2 day-1)\r\nwind : wind speed (m s-1)\r\nvapr : water vapor pressure (kPa)\r\n	0		active	{"datastore_active": false}	ifd_worldclim_level_4_commune.csv	\N	text/csv	\N	15800264	2025-01-17 11:21:54.930913	\N	\N	2025-01-17 11:21:54.950621	upload	bac15c29-55db-4be5-9c3c-f050e3b761d1	2025-03-12 04:34:06.522437
f4f52bd2-53b6-4fb4-9c15-3030eacefacc	ifanadiana-bioclim-level-4-commun.csv	CSV	# Columns:\r\n- **fid**: numeric id of Commune / fokontany \r\n- **new_commune**: commune name after 2019\r\n- **old_commune**: commune name before 2019\r\n- **BIO1**: Annual Mean Temperature (┬░C)\r\n- **BIO2**: Mean Diurnal Range (┬░C) (Annual mean of (Tmax - Tmin))\r\n- **BIO3**: Isothermality (%) ((BIO2/BIO7) ├ù 100)\r\n- **BIO4**: Temperature Seasonality ((Temperature standard deviation) ├ù 100))\r\n- **BIO5**: Max Temperature of Warmest Month (┬░C)\r\n- **BIO6**: Min Temperature of Coldest Month (┬░C)\r\n- **BIO7**: Temperature Annual Range (┬░C)(BIO5 - BIO6)\r\n- **BIO8**: Mean Temperature of Wettest Quarter (┬░C)\r\n- **BIO9**: Mean Temperature of Driest Quarter (┬░C)\r\n- **BIO10**: Mean Temperature of Warmest Quarter (┬░C)\r\n- **BIO11**: Mean Temperature of Coldest Quarter (Mean temperature of coldest consecutive three months)\r\n- **BIO12**: Annual Precipitation (mm)\r\n- **BIO13**: Precipitation of Wettest Month (mm)\r\n- **BIO14**: Precipitation of Driest Month (mm)\r\n- **BIO15**: Precipitation Seasonality ((Precipitation standard deviation / Precipitation mean) ├ù 100)\r\n- **BIO16**: Precipitation of Wettest Quarter (mm)\r\n- **BIO17**: Precipitation of Driest Quarter (mm)\r\n- **BIO18**: Precipitation of Warmest Quarter (mm)\r\n- **BIO19**: Precipitation of Coldest Quarter (mm)	0		active	{"datastore_active": false}	ifd_bioclim_level_4_commune.csv	\N	text/csv	\N	5574	2025-01-17 11:15:51.188392	\N	\N	2025-01-17 11:15:51.287764	upload	3a58b12f-909d-4bac-a232-1299c2452e02	2025-03-12 05:03:21.606718
\.


--
-- Data for Name: resource_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.resource_revision (id, url, format, description, "position", revision_id, hash, state, continuity_id, extras, expired_id, revision_timestamp, expired_timestamp, current, name, resource_type, mimetype, mimetype_inner, size, last_modified, cache_url, cache_last_updated, webstore_url, webstore_last_updated, created, url_type, package_id) FROM stdin;
\.


--
-- Data for Name: resource_view; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.resource_view (id, resource_id, title, description, view_type, "order", config) FROM stdin;
\.


--
-- Data for Name: revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.revision (id, "timestamp", author, message, state, approved_timestamp) FROM stdin;
\.


--
-- Data for Name: system_info; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.system_info (id, key, value, state) FROM stdin;
\.


--
-- Data for Name: system_info_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.system_info_revision (id, key, value, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.tag (id, name, vocabulary_id) FROM stdin;
8410c9cb-ca33-483e-be11-bc2d777d049c	Administrative	\N
01f996b3-92d9-48ec-8673-15cac36217c7	Fokontany	\N
2239163b-673b-4887-81b0-79646760bc3e	Subdistrict	\N
\.


--
-- Data for Name: task_status; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.task_status (id, entity_id, entity_type, task_type, key, value, state, error, last_updated) FROM stdin;
5080bc0d-5206-459e-bb7a-1054b7382ba1	a28e8dd2-7aa5-45ac-b30e-4c9501cfb342	resource	datapusher	datapusher	{"job_id": "f1d6d1ee-9213-4c04-be0c-e7e8f92c8a4b", "job_key": "e3ec8eeb-7369-40e8-9194-fbaa202439fd"}	pending	{}	2024-12-20 10:27:09.158389
ea88f340-fc7b-42f9-8bfe-6d3bf678b4fa	505e08cf-ffea-40f4-84ed-d77f85a21459	resource	datapusher	datapusher	{"job_id": "d096aac7-f2cb-460d-84ae-77cd36286a50", "job_key": "ef1eefd2-31fc-4973-a410-b912d2099cf3"}	pending	{}	2024-10-01 12:02:27.909014
bb6ee073-1070-42be-b616-8b7b824c8a0d	7218467f-5380-4a6b-a7d1-efd24762ccc2	resource	datapusher	datapusher	{"job_id": "4c6610ab-e623-4780-a78a-c510e38d01a7", "job_key": "39e43e3a-5922-4060-b61b-e3c8ac907374"}	pending	{}	2024-10-31 09:35:03.877601
26fbd710-eb04-436a-a730-00658e0c0d0f	63d39764-bc27-4b01-9da8-35632ba0e72c	resource	datapusher	datapusher	{"job_id": "5384c6ea-590b-4f3f-ad9e-e77585de0582", "job_key": "81541699-eb5a-46b3-befb-9d97e705f2f6"}	pending	{}	2024-10-31 10:10:17.4963
a4ed12e4-bc1e-4853-977e-8bb586b095ca	ba6f3005-0c8c-43e4-8477-dac11e1e3f29	resource	datapusher	datapusher	{"job_id": "a0021c2c-2ab4-418a-8226-52f8f7a44cab", "job_key": "86bb3609-e866-4e80-8f74-13ca8519f197"}	pending	{}	2024-12-20 06:48:36.215445
092399a2-b93f-4d99-80b8-d9ad0ce66afd	6e1534e2-9786-4b8e-b2c5-985c059388d2	resource	datapusher	datapusher	{"job_id": "0a31dd30-f70c-49cf-bc0a-ee2aedb77e7d", "job_key": "2c778434-70b2-4926-8a00-78c9ecf5dfa6"}	pending	{}	2024-12-20 06:52:04.959241
b4506f80-95f2-43de-97cd-ec231587884a	09a96fd4-0007-4dea-b056-08add3e00fde	resource	datapusher	datapusher	{"job_id": "837144a0-acd3-4ef7-9b0f-ad002d6666e0", "job_key": "d9bd937c-fe64-420b-b3e6-091454ecfe41"}	pending	{}	2024-12-20 06:54:44.257122
4635cff6-251b-45d8-916b-8415ada590c2	ee9b14a8-1b3a-42ef-afd8-424c92668553	resource	datapusher	datapusher	{"job_id": "f3ec8c9f-b85b-4658-b812-35a5b4a04487", "job_key": "de066456-aa5c-4fe5-8dca-96251b6b1dcd"}	pending	{}	2024-12-20 07:00:07.151787
3699d4c3-033c-443f-9752-24216f9cff8d	4f357e68-0811-40c3-b987-b21b380359ba	resource	datapusher	datapusher	{"job_id": "14e3d074-9945-4bef-8eda-b78f1cd69d5b", "job_key": "5da724d3-18bb-420a-9b27-4a2029d69de7"}	pending	{}	2024-12-20 07:05:57.928421
541f7805-a656-4dbc-a62b-fd8ad875b60f	871c832f-98a2-4ef7-96d3-d518fa6dcd52	resource	datapusher	datapusher	{"job_id": "1b74caa4-9bde-4f26-96e9-c68e9341f5fa", "job_key": "dfcc726f-0290-4182-9f01-9adc26ba1385"}	pending	{}	2024-12-20 07:15:02.027317
12e5069a-fba8-45e1-b220-ceaf821f30c6	e3a7b005-84d5-4ec6-97f2-c4fcfa872ff9	resource	datapusher	datapusher	{"job_id": "99e42916-713a-4763-b9de-ab39c54aaaf6", "job_key": "8afbf217-6696-45f5-b540-70cdffe93b05"}	pending	{}	2024-12-20 07:17:24.588058
07f2edbc-8ef9-431a-be78-e651f9953b55	743b5255-a1f7-45c7-9efd-6782aab3fc63	resource	datapusher	datapusher	{"job_id": "50aeea82-0bde-41b4-8682-7f023aa6bc14", "job_key": "5f8c18fd-db09-443f-9fde-ca504923b208"}	pending	{}	2024-12-20 07:18:56.511333
8d4f623c-f759-405a-bd3f-b0c462b09232	c5abedb1-620f-496b-9997-ecc7829999a3	resource	datapusher	datapusher	{"job_id": "d1db4f5f-029e-43ed-b0f2-a7b6e75d436a", "job_key": "2c0e8594-8ce7-4c28-a486-8a39bdde0564"}	pending	{}	2024-12-20 07:20:10.915759
979a93da-b91a-4218-94f3-c7683b9bf8a7	730ca137-487a-4f08-aaa4-28324bed89bf	resource	datapusher	datapusher	{"job_id": "eb604199-5b5a-46e9-8e8a-eb70fb27bb68", "job_key": "369e1d5c-d48d-4a33-a356-d33c584f6437"}	pending	{}	2024-12-20 07:24:21.279402
af36f354-2028-4fd8-a37e-33a8d0bafe1d	13d7b471-2644-4f5f-9d3f-77a6ce528175	resource	datapusher	datapusher	{"job_id": "63a267f5-2256-405b-a49a-3a41606c1998", "job_key": "4c50d82f-c842-46c2-bc4c-b28daa7e261f"}	pending	{}	2024-12-20 08:42:07.251141
2c0bdf44-b9f7-49f8-9ae8-eb1a24c1b056	73c46559-add2-4144-a7b5-b5a9d29af16b	resource	datapusher	datapusher	{"job_id": "dc550e85-37e9-4bb2-bacc-3c453a438dec", "job_key": "3bab861f-b827-4554-b2f8-55beceaf8d2d"}	pending	{}	2024-12-20 08:54:21.925754
31628c0d-2ebd-4def-ae01-838ff639c2e4	b2d9edbb-afa8-420a-84ef-743a66d136f8	resource	datapusher	datapusher	{"job_id": "7bf2acf5-4d8f-4f5c-8d4d-9dc4f45d3e61", "job_key": "225fde1f-9b4c-4617-bada-b001002b0f3a"}	pending	{}	2024-12-20 09:00:47.584392
7724b004-cc83-4f27-8bb8-87e82c5b09a3	c1c02790-8783-4ab1-9084-fef4d505ee29	resource	datapusher	datapusher	{"job_id": "f7ea6495-6b36-4714-bbf6-9d76fe9300e4", "job_key": "d740a076-2c2a-4d57-8a05-7acb7ab01b8a"}	pending	{}	2024-12-20 10:40:18.481715
b0333bea-7db8-4b1a-ba2d-e5d4b0576d5f	53c42410-be42-4177-b475-f1adf58ec482	resource	datapusher	datapusher	{"job_id": "53a231fc-2944-4952-a217-a8f9ca94aef8", "job_key": "ceab1c88-2ffa-4bd5-bed6-965e91fe4e41"}	pending	{}	2024-12-20 10:40:33.50991
08737aeb-579d-424a-a410-1727d09b91a4	09ca08c0-efa6-426b-afe5-3d495fe62351	resource	datapusher	datapusher	{"job_id": "06023934-949f-4319-8788-4568a322ab40", "job_key": "a180280b-3a8b-4f27-b459-4a7e6e661392"}	pending	{}	2024-12-20 10:40:48.666727
85e2cd73-7f09-4a8b-a29f-212efb73673a	10f6257e-fd9c-482e-af90-2c70d7ab3a34	resource	datapusher	datapusher	{"job_id": "5524fc6a-74d5-4545-9f34-a5d13395bfab", "job_key": "3a5d1772-9c25-4baf-9f9d-cc9f747cd302"}	pending	{}	2024-12-20 10:48:42.360798
72c0a572-b4b2-46f4-b43f-81e71f557d17	4baab19d-fb54-41e7-a96f-21f3ab3f7b7b	resource	datapusher	datapusher	{"job_id": "e4d8a2c0-4922-4857-a1fd-78c0c4d63923", "job_key": "5b5a80b4-2ffc-4dc4-a5cf-3e7aee2410ee"}	pending	{}	2024-12-20 10:55:35.049484
1aa19e6b-6571-4184-9127-f6cc9fef406c	f4f52bd2-53b6-4fb4-9c15-3030eacefacc	resource	datapusher	datapusher	{"job_id": "c5d8975e-0ea7-4dd7-83d8-a93b26387acb", "job_key": "ee4086f9-d9f3-4d62-b5d4-c9d69bb6cafb"}	pending	{}	2025-01-17 11:15:51.938247
c2bb327b-dfe5-440b-b460-120460f56fa9	be3a7fca-fc93-46da-93f0-53a233e24425	resource	datapusher	datapusher	{"job_id": "9037ab92-eeaa-427e-be1b-3110edd2fa99", "job_key": "82b7c915-7350-459a-8063-929028dedd8a"}	pending	{}	2025-01-17 11:16:43.909124
147dd206-c6f8-4d28-a88b-14226c611594	073702d6-767f-445f-a400-8700d2822755	resource	datapusher	datapusher	{"job_id": "d8fb7fe2-93e8-421e-a57e-3c097b8bf599", "job_key": "a9b98de2-4785-4fcc-936c-e1540e3c214b"}	pending	{}	2025-01-17 11:21:55.333319
16dfc154-8d6f-4f38-a149-ebf384ceb0a9	207bb945-5d05-4068-8113-5d71f0955ac2	resource	datapusher	datapusher	{"job_id": "f3d3d48d-70b0-473e-ad33-cbe8a2af656a", "job_key": "08816dbe-3481-4243-b83e-6bcccd890a4a"}	pending	{}	2025-01-17 11:22:07.545608
222d9d6d-1c9c-4d6b-b32c-b1466e69d277	f39a9937-b765-4845-b8fb-48b735745066	resource	datapusher	datapusher	{"job_id": "e91d4d85-8d3f-45a1-877b-3aca3afaeb4c", "job_key": "18d6dfd4-8d87-44fe-9a7f-5c5f0aa2b975"}	pending	{}	2025-01-17 11:27:01.221811
762581d5-fc80-47a4-bd71-1b9a3d733579	083d09a8-6544-479b-b6aa-d33def0bd321	resource	datapusher	datapusher	{"job_id": "fa16f116-1c2a-45f2-b984-f6acb140338d", "job_key": "0de7c3f5-ed1f-4053-b62b-151d60395580"}	pending	{}	2025-01-17 11:27:14.844434
bd76aa8e-8c6e-4521-8906-0b733c379e2f	1399fd4e-f91e-43e0-b2f0-86d8ae3b96d1	resource	datapusher	datapusher	{"job_id": "18668891-01c1-4165-aa5e-e8324557900e", "job_key": "c7530fe5-25de-40ed-8733-3eb97a2716c0"}	pending	{}	2025-01-17 11:35:28.870743
094c23df-bd8a-45f0-b8a8-e5f03cde2364	5c444b21-d01c-4c47-8cb8-8ee66531d9ac	resource	datapusher	datapusher	{"job_id": "5b7a2cb1-9610-47b1-acec-bc99dde6d9ea", "job_key": "d4a414c9-1a99-4954-a9e2-25ea658f8103"}	pending	{}	2025-01-17 11:35:41.524903
ca77a22d-4193-4116-8b26-d657a7fca211	d17f3e32-d03a-4963-b4a2-418ffd7dc8c5	resource	datapusher	datapusher	{"job_id": "cdfa47eb-44e3-4aa9-a6c3-6e6dbe5fabf6", "job_key": "2c1bf0df-ec18-4b91-8c06-7e701ce74f97"}	pending	{}	2025-01-17 11:41:56.002733
717af459-8f0b-4f7b-a215-f2c4bf8ec430	d647e626-3bbc-40e3-9efe-0782079ea09e	resource	datapusher	datapusher	{"job_id": "d40c581f-466b-46ea-9207-39e9135787c7", "job_key": "0a2b5e61-3341-410d-bb5d-d46f2247d6fb"}	pending	{}	2025-01-17 11:46:11.46439
a94bff15-a518-412a-be79-616071b26e3e	b0f7f77f-3a18-4e5f-9965-3a7eebb1ac28	resource	datapusher	datapusher	{"job_id": "886e4c13-4b04-47b4-9fc3-c8d08db64a0f", "job_key": "a99cb3e4-9a62-4ca2-814a-3a9e55c7fc12"}	pending	{}	2025-01-17 11:54:16.113055
a3ba65c3-9656-4485-84f8-cc77cbd23193	c21b702d-646f-41b1-bbfc-0f1e5af6bd32	resource	datapusher	datapusher	{"job_id": "43e06226-8a58-4cce-a33b-5180c2a9b59a", "job_key": "b51249ec-7227-45df-a045-58e939562fae"}	pending	{}	2025-01-17 11:42:58.069902
73af5355-1567-4738-a19d-bba575d96d10	7bd7762c-f7b1-4f8d-911e-18e8be68d4e3	resource	datapusher	datapusher	{"job_id": "7a492e16-6722-43f3-b708-31c7624397ff", "job_key": "2a7aa160-de67-433e-aea3-d21a15884c53"}	pending	{}	2025-01-17 11:45:58.408606
40553156-2761-4840-95eb-b68d350dd7ac	0a55862a-8494-4f08-9dbc-7af8a5628e2f	resource	datapusher	datapusher	{"job_id": "aab33d94-9645-42ae-aa58-d20d7c06a6f1", "job_key": "af1c1dcc-4615-4065-8e18-1db60c74cb87"}	pending	{}	2025-01-17 11:54:35.721357
c8cc32da-f43b-4474-846e-10838d1bc8a2	7074958b-953c-4a51-9567-f24b8eb96ed4	resource	datapusher	datapusher	{"job_id": "89f72112-0bb8-467d-a9d5-4300a4d8f29f", "job_key": "b4755fd7-8075-4c62-8c83-ebfb31e73ec7"}	pending	{}	2025-01-17 12:04:45.412704
\.


--
-- Data for Name: term_translation; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.term_translation (term, term_translation, lang_code) FROM stdin;
\.


--
-- Data for Name: tracking_raw; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.tracking_raw (user_key, url, tracking_type, access_timestamp) FROM stdin;
\.


--
-- Data for Name: tracking_summary; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.tracking_summary (url, package_id, tracking_type, count, running_total, recent_views, tracking_date) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public."user" (id, name, apikey, created, about, password, fullname, email, reset_key, sysadmin, activity_streams_email_notifications, state, plugin_extras, image_url, last_active) FROM stdin;
94ab6805-46d3-4084-89da-45a1e8fb9ab6	default	f2c2279a-efc5-4830-840c-99ddf43dd43a	2024-08-28 07:40:03.929571	\N	$pbkdf2-sha512$25000$ESLkfG9tLQXgfK8VIoTw/g$ckt71tkFMDLHf/Blye4e3H5dBHiyFidNK4PNNpnPBt0O6ENH0kvgftSoDARS5uvHy1e1mRi/Qu3WUo3b2ARpmA	\N	\N	\N	t	f	active	\N	\N	\N
bae99562-13ca-4a84-9816-6d26c81a2dc2	twoockyis	\N	2024-08-28 07:40:09.206885		$pbkdf2-sha512$25000$x/jf27s3RghhbA0hBMAYgw$h1s7qtr.FXWw6XYaglyqBn3GLxdzv46RddtQk4SS123E39WKW3PJxyvvx1FAmEcRs3vnQwZTbqrjbH5mdb8p0Q		twoockyis@localhost.com	\N	t	f	active	\N		2024-10-01 11:59:40.525081
0b5980bf-fd31-42a9-b129-2889609bc0dc	toky	\N	2024-08-28 10:31:44.547644	\N	$pbkdf2-sha512$25000$EeKc01qLUaqVUgqh1DrHmA$3BU6xu3MrKY9CLpy1mhMf4fQTRbc6o.hbkQhw3cPlyKLq7mahisx/ojyVFRiYCzE0E8waFNkc8RLVWxNJxlnUw	RANDRIANJATOVO Tokiniaina	twoockyis@gmail.com	\N	f	f	active	\N		2024-09-12 05:44:53.026477
171fe78c-2079-4f0e-af62-91aca011e21e	invite	\N	2025-03-12 05:13:51.195452	\N	$pbkdf2-sha512$25000$IOS8N2asVUppzXlvjXEOoQ$yag3Qye.05obygTctsPn2mWweMUl9KZDd3Bj.V4nCaK4gf6uUX5XN0bFVjCNMXuH/BUngOs3wutmJeqDqxE3Ag	test_invite	invite@gmail.com	\N	f	f	active	\N		2025-03-12 12:19:38.758708
e1c0fa39-928a-451b-8fad-56ae2b7f7633	ckan_toky	\N	2024-11-05 10:46:13.616161	\N	$pbkdf2-sha512$25000$0HpvTYlRipFybi1lrBUiRA$ydacp9y/aULgaiXFpbJlm6SzV7DDUuDts3htQ01mId.PVD59Ht0s/ozJJjx7P2Qmu.j9g71e.E5OUL3ShQavGA	RANDRIANJATOVO Tokiniaina	toky.fianarana@gmail.com	\N	f	f	active	\N		2024-11-05 12:18:11.886476
30f02a07-c8dd-4715-bae7-39d92fe0e42d	ckan_admin	\N	2024-09-12 10:43:54.167471	\N	$pbkdf2-sha512$25000$aK0VwnjvPcc4h1BqDYHwfg$FrTBJYYIOqWZkKYCEOPiPkgBd5PpVW0xbtb4eN24RHTGe3mg2V1sgZOJKRLZZXJ9RfkyC9JgP5wyQMeU7nyoxg	\N	your_email@example.com	\N	t	f	active	\N	\N	2025-05-06 06:50:06.537545
\.


--
-- Data for Name: user_following_dataset; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.user_following_dataset (follower_id, object_id, datetime) FROM stdin;
0b5980bf-fd31-42a9-b129-2889609bc0dc	76163385-4df1-495e-b431-1c239125f473	2024-08-28 10:38:48.593225
\.


--
-- Data for Name: user_following_group; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.user_following_group (follower_id, object_id, datetime) FROM stdin;
\.


--
-- Data for Name: user_following_user; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.user_following_user (follower_id, object_id, datetime) FROM stdin;
\.


--
-- Data for Name: vocabulary; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.vocabulary (id, name) FROM stdin;
\.


--
-- Name: system_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ckandbuser
--

SELECT pg_catalog.setval('public.system_info_id_seq', 1, false);


--
-- Name: activity_detail activity_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.activity_detail
    ADD CONSTRAINT activity_detail_pkey PRIMARY KEY (id);


--
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: api_token api_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.api_token
    ADD CONSTRAINT api_token_pkey PRIMARY KEY (id);


--
-- Name: dashboard dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (user_id);


--
-- Name: group_extra group_extra_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_extra
    ADD CONSTRAINT group_extra_pkey PRIMARY KEY (id);


--
-- Name: group_extra_revision group_extra_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_extra_revision
    ADD CONSTRAINT group_extra_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: group group_name_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_name_key UNIQUE (name);


--
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- Name: group_revision group_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_revision
    ADD CONSTRAINT group_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);


--
-- Name: member_revision member_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.member_revision
    ADD CONSTRAINT member_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: package_extra package_extra_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_extra
    ADD CONSTRAINT package_extra_pkey PRIMARY KEY (id);


--
-- Name: package_extra_revision package_extra_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_extra_revision
    ADD CONSTRAINT package_extra_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: package_member package_member_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_member
    ADD CONSTRAINT package_member_pkey PRIMARY KEY (package_id, user_id);


--
-- Name: package package_name_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_name_key UNIQUE (name);


--
-- Name: package package_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_pkey PRIMARY KEY (id);


--
-- Name: package_relationship package_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship
    ADD CONSTRAINT package_relationship_pkey PRIMARY KEY (id);


--
-- Name: package_relationship_revision package_relationship_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: package_revision package_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_revision
    ADD CONSTRAINT package_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: package_tag package_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag
    ADD CONSTRAINT package_tag_pkey PRIMARY KEY (id);


--
-- Name: package_tag_revision package_tag_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag_revision
    ADD CONSTRAINT package_tag_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);


--
-- Name: resource_revision resource_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource_revision
    ADD CONSTRAINT resource_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: resource_view resource_view_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource_view
    ADD CONSTRAINT resource_view_pkey PRIMARY KEY (id);


--
-- Name: revision revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.revision
    ADD CONSTRAINT revision_pkey PRIMARY KEY (id);


--
-- Name: system_info system_info_key_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info
    ADD CONSTRAINT system_info_key_key UNIQUE (key);


--
-- Name: system_info system_info_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info
    ADD CONSTRAINT system_info_pkey PRIMARY KEY (id);


--
-- Name: system_info_revision system_info_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info_revision
    ADD CONSTRAINT system_info_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: tag tag_name_vocabulary_id_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_name_vocabulary_id_key UNIQUE (name, vocabulary_id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: task_status task_status_entity_id_task_type_key_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.task_status
    ADD CONSTRAINT task_status_entity_id_task_type_key_key UNIQUE (entity_id, task_type, key);


--
-- Name: task_status task_status_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.task_status
    ADD CONSTRAINT task_status_pkey PRIMARY KEY (id);


--
-- Name: user_following_dataset user_following_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_dataset
    ADD CONSTRAINT user_following_dataset_pkey PRIMARY KEY (follower_id, object_id);


--
-- Name: user_following_group user_following_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_group
    ADD CONSTRAINT user_following_group_pkey PRIMARY KEY (follower_id, object_id);


--
-- Name: user_following_user user_following_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_user
    ADD CONSTRAINT user_following_user_pkey PRIMARY KEY (follower_id, object_id);


--
-- Name: user user_name_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_name_key UNIQUE (name);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: vocabulary vocabulary_name_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.vocabulary
    ADD CONSTRAINT vocabulary_name_key UNIQUE (name);


--
-- Name: vocabulary vocabulary_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.vocabulary
    ADD CONSTRAINT vocabulary_pkey PRIMARY KEY (id);


--
-- Name: idx_activity_detail_activity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_activity_detail_activity_id ON public.activity_detail USING btree (activity_id);


--
-- Name: idx_activity_object_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_activity_object_id ON public.activity USING btree (object_id, "timestamp");


--
-- Name: idx_activity_user_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_activity_user_id ON public.activity USING btree (user_id, "timestamp");


--
-- Name: idx_extra_grp_id_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_extra_grp_id_pkg_id ON public.member USING btree (group_id, table_id);


--
-- Name: idx_extra_id_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_extra_id_pkg_id ON public.package_extra USING btree (id, package_id);


--
-- Name: idx_extra_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_extra_pkg_id ON public.package_extra USING btree (package_id);


--
-- Name: idx_group_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_current ON public.group_revision USING btree (current);


--
-- Name: idx_group_extra_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_extra_current ON public.group_extra_revision USING btree (current);


--
-- Name: idx_group_extra_group_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_extra_group_id ON public.group_extra USING btree (group_id);


--
-- Name: idx_group_extra_period; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_extra_period ON public.group_extra_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_group_extra_period_group; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_extra_period_group ON public.group_extra_revision USING btree (revision_timestamp, expired_timestamp, group_id);


--
-- Name: idx_group_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_id ON public."group" USING btree (id);


--
-- Name: idx_group_name; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_name ON public."group" USING btree (name);


--
-- Name: idx_group_period; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_period ON public.group_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_group_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_pkg_id ON public.member USING btree (table_id);


--
-- Name: idx_member_continuity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_member_continuity_id ON public.member_revision USING btree (continuity_id);


--
-- Name: idx_only_one_active_email; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE UNIQUE INDEX idx_only_one_active_email ON public."user" USING btree (email, state) WHERE (state = 'active'::text);


--
-- Name: idx_package_continuity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_continuity_id ON public.package_revision USING btree (continuity_id);


--
-- Name: idx_package_creator_user_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_creator_user_id ON public.package USING btree (creator_user_id);


--
-- Name: idx_package_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_current ON public.package_revision USING btree (current);


--
-- Name: idx_package_extra_continuity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_continuity_id ON public.package_extra_revision USING btree (continuity_id);


--
-- Name: idx_package_extra_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_current ON public.package_extra_revision USING btree (current);


--
-- Name: idx_package_extra_package_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_package_id ON public.package_extra_revision USING btree (package_id, current);


--
-- Name: idx_package_extra_period; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_period ON public.package_extra_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_package_extra_period_package; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_period_package ON public.package_extra_revision USING btree (revision_timestamp, expired_timestamp, package_id);


--
-- Name: idx_package_extra_rev_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_rev_id ON public.package_extra_revision USING btree (revision_id);


--
-- Name: idx_package_group_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_group_current ON public.member_revision USING btree (current);


--
-- Name: idx_package_group_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_group_id ON public.member USING btree (id);


--
-- Name: idx_package_group_period_package_group; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_group_period_package_group ON public.member_revision USING btree (revision_timestamp, expired_timestamp, table_id, group_id);


--
-- Name: idx_package_period; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_period ON public.package_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_package_relationship_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_relationship_current ON public.package_relationship_revision USING btree (current);


--
-- Name: idx_package_resource_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_resource_id ON public.resource USING btree (id);


--
-- Name: idx_package_resource_package_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_resource_package_id ON public.resource USING btree (package_id);


--
-- Name: idx_package_resource_rev_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_resource_rev_id ON public.resource_revision USING btree (revision_id);


--
-- Name: idx_package_resource_url; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_resource_url ON public.resource USING btree (url);


--
-- Name: idx_package_tag_continuity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_continuity_id ON public.package_tag_revision USING btree (continuity_id);


--
-- Name: idx_package_tag_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_current ON public.package_tag_revision USING btree (current);


--
-- Name: idx_package_tag_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_id ON public.package_tag USING btree (id);


--
-- Name: idx_package_tag_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_pkg_id ON public.package_tag USING btree (package_id);


--
-- Name: idx_package_tag_pkg_id_tag_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_pkg_id_tag_id ON public.package_tag USING btree (tag_id, package_id);


--
-- Name: idx_package_tag_revision_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_revision_id ON public.package_tag_revision USING btree (id);


--
-- Name: idx_package_tag_revision_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_revision_pkg_id ON public.package_tag_revision USING btree (package_id);


--
-- Name: idx_package_tag_revision_pkg_id_tag_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_revision_pkg_id_tag_id ON public.package_tag_revision USING btree (tag_id, package_id);


--
-- Name: idx_package_tag_revision_rev_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_revision_rev_id ON public.package_tag_revision USING btree (revision_id);


--
-- Name: idx_package_tag_revision_tag_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_revision_tag_id ON public.package_tag_revision USING btree (tag_id);


--
-- Name: idx_period_package_relationship; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_period_package_relationship ON public.package_relationship_revision USING btree (revision_timestamp, expired_timestamp, object_package_id, subject_package_id);


--
-- Name: idx_period_package_tag; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_period_package_tag ON public.package_tag_revision USING btree (revision_timestamp, expired_timestamp, package_id, tag_id);


--
-- Name: idx_pkg_lname; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_lname ON public.package USING btree (lower((name)::text));


--
-- Name: idx_pkg_revision_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_revision_id ON public.package_revision USING btree (id);


--
-- Name: idx_pkg_revision_name; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_revision_name ON public.package_revision USING btree (name);


--
-- Name: idx_pkg_revision_rev_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_revision_rev_id ON public.package_revision USING btree (revision_id);


--
-- Name: idx_pkg_sid; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_sid ON public.package USING btree (id, state);


--
-- Name: idx_pkg_slname; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_slname ON public.package USING btree (lower((name)::text), state);


--
-- Name: idx_pkg_sname; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_sname ON public.package USING btree (name, state);


--
-- Name: idx_pkg_stitle; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_stitle ON public.package USING btree (title, state);


--
-- Name: idx_pkg_suname; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_suname ON public.package USING btree (upper((name)::text), state);


--
-- Name: idx_pkg_uname; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_uname ON public.package USING btree (upper((name)::text));


--
-- Name: idx_resource_continuity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_resource_continuity_id ON public.resource_revision USING btree (continuity_id);


--
-- Name: idx_resource_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_resource_current ON public.resource_revision USING btree (current);


--
-- Name: idx_resource_period; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_resource_period ON public.resource_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_rev_state; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_rev_state ON public.revision USING btree (state);


--
-- Name: idx_revision_author; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_revision_author ON public.revision USING btree (author);


--
-- Name: idx_tag_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_tag_id ON public.tag USING btree (id);


--
-- Name: idx_tag_name; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_tag_name ON public.tag USING btree (name);


--
-- Name: idx_user_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_user_id ON public."user" USING btree (id);


--
-- Name: idx_user_name; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_user_name ON public."user" USING btree (name);


--
-- Name: idx_user_name_index; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_user_name_index ON public."user" USING btree ((
CASE
    WHEN ((fullname IS NULL) OR (fullname = ''::text)) THEN name
    ELSE fullname
END));


--
-- Name: idx_view_resource_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_view_resource_id ON public.resource_view USING btree (resource_id);


--
-- Name: term_lang; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX term_lang ON public.term_translation USING btree (term, lang_code);


--
-- Name: tracking_raw_access_timestamp; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_raw_access_timestamp ON public.tracking_raw USING btree (access_timestamp);


--
-- Name: tracking_raw_url; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_raw_url ON public.tracking_raw USING btree (url);


--
-- Name: tracking_raw_user_key; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_raw_user_key ON public.tracking_raw USING btree (user_key);


--
-- Name: tracking_summary_date; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_summary_date ON public.tracking_summary USING btree (tracking_date);


--
-- Name: tracking_summary_package_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_summary_package_id ON public.tracking_summary USING btree (package_id);


--
-- Name: tracking_summary_url; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_summary_url ON public.tracking_summary USING btree (url);


--
-- Name: activity_detail activity_detail_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.activity_detail
    ADD CONSTRAINT activity_detail_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.activity(id);


--
-- Name: api_token api_token_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.api_token
    ADD CONSTRAINT api_token_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: dashboard dashboard_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT dashboard_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: group_extra group_extra_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_extra
    ADD CONSTRAINT group_extra_group_id_fkey FOREIGN KEY (group_id) REFERENCES public."group"(id);


--
-- Name: group_extra_revision group_extra_revision_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_extra_revision
    ADD CONSTRAINT group_extra_revision_group_id_fkey FOREIGN KEY (group_id) REFERENCES public."group"(id);


--
-- Name: group_extra_revision group_extra_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_extra_revision
    ADD CONSTRAINT group_extra_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: group_revision group_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_revision
    ADD CONSTRAINT group_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: member member_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_group_id_fkey FOREIGN KEY (group_id) REFERENCES public."group"(id);


--
-- Name: member_revision member_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.member_revision
    ADD CONSTRAINT member_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: package_extra package_extra_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_extra
    ADD CONSTRAINT package_extra_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.package(id);


--
-- Name: package_extra_revision package_extra_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_extra_revision
    ADD CONSTRAINT package_extra_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: package_member package_member_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_member
    ADD CONSTRAINT package_member_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.package(id);


--
-- Name: package_member package_member_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_member
    ADD CONSTRAINT package_member_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: package_relationship package_relationship_object_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship
    ADD CONSTRAINT package_relationship_object_package_id_fkey FOREIGN KEY (object_package_id) REFERENCES public.package(id);


--
-- Name: package_relationship_revision package_relationship_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES public.package_relationship(id);


--
-- Name: package_relationship_revision package_relationship_revision_object_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_object_package_id_fkey FOREIGN KEY (object_package_id) REFERENCES public.package(id);


--
-- Name: package_relationship_revision package_relationship_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: package_relationship_revision package_relationship_revision_subject_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_subject_package_id_fkey FOREIGN KEY (subject_package_id) REFERENCES public.package(id);


--
-- Name: package_relationship package_relationship_subject_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship
    ADD CONSTRAINT package_relationship_subject_package_id_fkey FOREIGN KEY (subject_package_id) REFERENCES public.package(id);


--
-- Name: package_revision package_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_revision
    ADD CONSTRAINT package_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: package_tag package_tag_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag
    ADD CONSTRAINT package_tag_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.package(id);


--
-- Name: package_tag_revision package_tag_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag_revision
    ADD CONSTRAINT package_tag_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: package_tag_revision package_tag_revision_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag_revision
    ADD CONSTRAINT package_tag_revision_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: package_tag package_tag_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag
    ADD CONSTRAINT package_tag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: resource resource_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.package(id);


--
-- Name: resource_revision resource_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource_revision
    ADD CONSTRAINT resource_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: resource_view resource_view_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource_view
    ADD CONSTRAINT resource_view_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.resource(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: system_info_revision system_info_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info_revision
    ADD CONSTRAINT system_info_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES public.system_info(id);


--
-- Name: system_info_revision system_info_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info_revision
    ADD CONSTRAINT system_info_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: tag tag_vocabulary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_vocabulary_id_fkey FOREIGN KEY (vocabulary_id) REFERENCES public.vocabulary(id);


--
-- Name: user_following_dataset user_following_dataset_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_dataset
    ADD CONSTRAINT user_following_dataset_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_dataset user_following_dataset_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_dataset
    ADD CONSTRAINT user_following_dataset_object_id_fkey FOREIGN KEY (object_id) REFERENCES public.package(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_group user_following_group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_group
    ADD CONSTRAINT user_following_group_group_id_fkey FOREIGN KEY (object_id) REFERENCES public."group"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_group user_following_group_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_group
    ADD CONSTRAINT user_following_group_user_id_fkey FOREIGN KEY (follower_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_user user_following_user_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_user
    ADD CONSTRAINT user_following_user_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_user user_following_user_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_user
    ADD CONSTRAINT user_following_user_object_id_fkey FOREIGN KEY (object_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

