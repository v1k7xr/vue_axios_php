--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7
-- Dumped by pg_dump version 10.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE feedbackdb; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE feedbackdb IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bid (
    bid_id integer NOT NULL,
    fullname character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(11) NOT NULL,
    comment character varying(1000) NOT NULL,
    creation_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.bid OWNER TO postgres;

--
-- Name: bid_bid_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bid_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bid_bid_id_seq OWNER TO postgres;

--
-- Name: bid_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bid_bid_id_seq OWNED BY public.bid.bid_id;


--
-- Name: bid bid_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bid ALTER COLUMN bid_id SET DEFAULT nextval('public.bid_bid_id_seq'::regclass);


--
-- Data for Name: bid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bid (bid_id, fullname, email, phone, comment, creation_time) FROM stdin;
1	Test Testovin Testovich	test@mail.com	00000000001	test record	2020-05-24 11:46:47.358214
2	TTT	test@mail.com	00000000001	ttt test record	2020-05-25 12:45:00.845673
3	Test TT	1test@mail.com	00000000002	ttt test record 01	2020-05-25 13:49:38.957692
4	Test T1T1	1111test@mail.com	00000000003	tt123t test record 01	2020-05-25 13:50:17.061225
18	test from interface	testInter@mail.com	88889467891	test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test 	2020-05-25 15:50:38.563264
19	testasdasdasdas	qweqeqwe@asdasdasd.com	89991117751	ashdh kqjwhdjk hasjkd hqow;dh jaskdh iqwulhd kjaskd	2020-05-25 15:56:03.323265
20	asd asd asd test	testttttttt@mail.com	84561247895	qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty qwerty 	2020-05-25 16:07:58.385091
21	фывфыфывфывфы	asd@asd.com	88888888888	asdqwdqsid hjsadjkhqwlh dluihas dhuqw dlasd 	2020-05-25 16:13:11.569449
22	фывфывыфвфыв	test@mail.com	87945167854	qdasdqwd	2020-05-25 16:15:39.428643
23	asdasdasdas	test@mail.com	87945641895	asd	2020-05-25 16:16:32.314157
24	фывфывыфвф	qwe@wqweqweqwe.ry	83724352435	sadasdasdasd	2020-05-25 17:02:35.798404
25	Test TT	1tasdasdasdasdasdaest@mail.com	00000000002	ttt test record 01	2020-05-25 17:04:07.566869
26	asdasdasdasdasd	wqeqweqweqwe@asdasdasda.com	84561245754	qwe	2020-05-25 17:16:02.61051
27	asdasdasdas	asdasdaszzzz123@asd.re	84561234598	qwe	2020-05-25 17:17:42.052905
28	asdadasdsadasdasdasd w dqw d	asd@asd.asd	84561254852	qwe	2020-05-25 17:19:14.513564
29	asdasdasdsa	asdasdasd@asdasdasdas.as	85462548154	qwe	2020-05-25 17:21:20.619596
30	asdasdasd	asdasdasdasdasdasdasd@asd.qwe	84561274852	qwe	2020-05-25 17:21:52.931287
31	asdasdasdasd	asdasd@asd.qwe	89454567845	qwe	2020-05-25 17:22:56.574913
32	asdasdasdasd	qwe123asdqwe@asda.we	84562145874	qwe	2020-05-25 17:25:14.334992
33	qweqweqweqwe	asdassdasdwqweqwe2123@asd.ew	84561247777	qwe	2020-05-25 17:26:00.49954
34	asdasdasdasd	as123123213123123123dwqe@asdqwe.we	85461245841	qwe	2020-05-25 17:28:18.748249
35	фывфывфывфыв	asqweqweqweqweqweqwe123d@aa.comasd	84561247458	qwe	2020-05-25 17:33:55.982902
36	Test TT	1tasdasdaqwesdasdasdaest@mail.com	00000000034	ttt test recoqwerd 01	2020-05-25 17:45:39.422629
37	ashdjhqwdhjqhd	asduihqwujaskdqwhjkashdq@asdja.we	84561245548	asdasdasd	2020-05-25 18:12:10.801336
38	фывфыв	asd199000@asd.ty	84561254478	asd	2020-05-25 18:37:35.92418
39	asdasdasda	zzzzzz@qqqq.com	84561254785	qwe	2020-05-25 18:42:46.373274
40	asdasdasdasdasdasdasdasd	asdzzzz123@asd.er	89456541859	qwe	2020-05-25 18:47:34.762496
41	asdasdasd	1tasdasdaqwesdasdasdaest@mail.com	86665481245	asd	2020-05-25 18:49:03.531063
42	qweqweqwe	qweqeqzzzzzzzeeee@qqw.we	84561254755	qwe	2020-05-25 18:53:43.646646
43	asdqwe	asdasdadasdasd@qqqqqqq.qwe	84561254755	wqe	2020-05-25 18:55:58.565542
44	asdasd	1tasdasdaqqqqqwesdasdasdaest@mail.com	84561254755	qwe	2020-05-25 18:59:02.996358
45	asd	aas123d@asd.we	84561254755	asd	2020-05-25 19:01:10.759269
46	asdasdasd	1tasda123123123sdaqwesdasdasdaest@mail.com	84561254755	asd	2020-05-25 19:02:36.067774
47	asdasdasdasdasdasdasdasd	1tasdaqweqwesdaqwesdasdasdaest@mail.com	84561254755	qwe	2020-05-25 19:02:55.017214
48	qweqweqweqw	aaaaaaaazzzsd@asd.we	84561254755	qwe	2020-05-25 19:15:45.656384
49	asdasdasda	test@mail.com	84561254755	asd	2020-05-25 19:17:54.96253
50	asd	1test@mail.com	84561254755	asd	2020-05-25 19:19:08.359313
51	asd	aaasdadasad123sd@asd.we	84561254755	asd	2020-05-25 19:22:28.23661
52	asdasdasd	a123123125135262613zasd@asd.we	84561254755	asd	2020-05-25 19:26:58.41188
53	asd	aaszzz123yjyhgfsaczxvd@asd.we	84561254755	asd	2020-05-25 19:27:47.749216
54	asdasd	a111zzzzz231zzz123asd@asd.we	84561254755	asd	2020-05-25 19:32:15.692211
55	asdasd	aazzzzzzlllllloopopopsd@asd.we	84561254755	asd	2020-05-25 19:33:00.332231
56	asdasd	zzzzzzzzzqqqaaaaagghhyytt@aas.ty	89456541235	qwewqeqweqweqw	2020-05-25 19:51:49.754441
57	ыфвфвфывфывфыв	zzzzzzzzzzzzzzzzzzzzzzzzzzz@aaaa.er	84561254755	asd	2020-05-25 19:53:50.530974
58	qwerty	qwertyuioqweqwe123@mail.com	00000001034	ttasdasdqweqt test recoqwerd 01	2020-05-25 21:04:06.96667
59	qwertyqweqwe	qwertyuiozzzzqweqwe123@mail.com	00000001034	ttasdasdqweqt test recoqwerd 01	2020-05-25 21:05:14.198664
60	asdasdasdas	zzzqsdwefasdabadsrasdww@asdsa.ri	84561254755	asdasdasdasd	2020-05-25 21:08:09.715526
61	asdasdasd	aazzzzqweqweqwe1231231231zzlllllloopopopsd@asd.we	84561254755	adsadasdasdas	2020-05-25 21:38:38.924755
62	Иванов Иван Иваныч	ivanovIvan@asd.ru	84561254755	ТЕстовый комментарий\nбла бла бла :)	2020-05-25 21:39:16.637496
63	Иванов Иван Иваныч	ivannnnov@test.com	84561254755	Тестовая строка\nНовая строка	2020-05-25 21:42:10.57406
64	asdasdasdqweqweq	asd@asd.asd	84561254755	asdasdasda	2020-05-25 21:44:10.281413
65	Testovick	aszzzzz123d@asd.asd	84561254755	qweqweqweqwe	2020-05-25 21:47:01.739787
66	TEEEEEEEEEEEEEEEEEEST	teeeeeeeeeeeeeeest@mail.com	84561254755	asdasdsdasdasdl;askdasjdlkasjldkasd	2020-05-25 21:49:28.724036
67	asdqwdqdqwdqdqwdq	zzzqqqaaafffeee@asd.asd	84561254755	asdasdqweqsqdqwd	2020-05-25 21:50:39.089599
68	asdasdasdasd	nnn@zzz.asd	84561254755	qwe	2020-05-25 21:52:02.665612
69	asdasdasdasdasdasd	qweqweqweqweA@asda.asd	84561254755	wqeqweqweqweqwe	2020-05-25 21:52:15.400451
70	asdasdasdasdasd	zironananana@aszx.com	89455557485	asdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasdsasdasds	2020-05-25 21:53:43.514912
71	sdfnbdsadffd	erwrwerwertryrtyrtyrtiopiopi@azx.qweaaz	84561254755	weqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqwweqweqweqw	2020-05-25 21:56:03.560449
72	asdqwdasdwqdasdwqdasdwqdasd	asdasdadsasadasda123123123123213@adasdasd.ty	84561254755	asdasdasdqwdasdqwdasdqwdasdqwd	2020-05-25 21:58:02.862914
73	asdasdasdasdas	zzzznnnmmgg@qwe.rt	84561254755	asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd	2020-05-25 21:59:22.994509
74	Иванов Иван Иванович	zerotowm@mail.ru	84561234785	Тестовая заявочка, ежжи\nВот тут новая линия	2020-05-25 22:02:09.175022
75	Иванов Иван Петрович	zerotowm01biggun@mail.ru	84561254755	ТЕстовый коммент, ужжи\nновая строка	2020-05-25 22:03:24.253532
76	Иванов Иван Иваныч	zerotowm02biggun@mail.ru	86541234785	Тест\nТест о1	2020-05-25 22:06:36.361823
77	Ивано Иван Иваны	zeasdzaaaaqwe@asd.er	84561254755	asdsadsadadausd uaSD wda SHdgghaGWD GASHGDYWG gHASd aw 	2020-05-25 22:09:43.895168
78	aqweqweqwe	aquaqaq@qw.fde	84561254755	asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad asdqdad 	2020-05-25 22:10:47.262985
79	asdasdadasdasd	nnhnhnhyhyhttgtg@asdas.ew	84561254755	qweqweqweqweqweqwe	2020-05-25 22:12:25.055732
80	asdasdqweqeqweqeqwe	jjjjj@rt.qwe	84561254755	qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w qweqweqweqweasd wqd asd wq dasd w 	2020-05-25 22:17:00.211071
81	asdasdsadasdasd	lildddd@asd.asd	84561254755	asd	2020-05-25 22:18:40.42208
82	asdwqeqweqw	aaaaaqqqqkkkkuyit@asd.ty	84561254755	qweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqwe	2020-05-25 22:26:04.943785
83	zxcsadashr	hhh@asd.ret	84561254755	qweqweqwe	2020-05-25 22:28:07.259902
84	asdasd	zzzzzzzzbnd@asd.ty	84561254755	qwe	2020-05-25 22:28:52.401514
85	Иванов Иван Иваныч	iiiiiiiiiiiivan@mail.com	84561254755	Пажилая упячка\nШо	2020-05-25 22:29:48.578061
86	Петров Петр Петрович	petr@yandeaaax.ru	84561254755	qweqwewqeqwewqe	2020-05-25 22:31:08.900959
87	Ильин Илья Иваноы	zaratustra@zar.com	89324214678	test test test	2020-05-25 22:34:12.387046
88	Ленин Владимир Бугич	communistpower@kpss.srrr	87777777777	Комментарий от председателя партии	2020-05-25 22:35:46.874181
\.


--
-- Name: bid_bid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bid_bid_id_seq', 88, true);


--
-- Name: bid bid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bid
    ADD CONSTRAINT bid_pkey PRIMARY KEY (bid_id);


--
-- PostgreSQL database dump complete
--

