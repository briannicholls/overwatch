--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Ubuntu 13.4-4.pgdg20.04+1)
-- Dumped by pg_dump version 13.4 (Ubuntu 13.4-4.pgdg20.04+1)

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
-- Data for Name: staging_heros; Type: TABLE DATA; Schema: public; Owner: brian
--

COPY public.staging_heros (id, name, role_id, created_at, updated_at, hp, shield, armor, has_escape_ability, movement_speed, can_fly, game_id) FROM stdin;
4	Sigma	1	2022-06-25 00:44:39.475176	2022-06-25 00:44:39.475176	300	100	0	f	5.5	f	1
5	Winston	1	2022-06-25 00:44:39.501726	2022-06-25 00:44:39.501726	350	0	150	t	5.5	f	1
6	Wrecking Ball	1	2022-06-25 00:44:39.517758	2022-06-25 00:44:39.517758	500	0	100	t	10	f	1
7	Zarya	1	2022-06-25 00:44:39.533799	2022-06-25 00:44:39.533799	200	200	0	f	5.5	f	1
8	Ashe	2	2022-06-25 00:44:39.550666	2022-06-25 00:44:39.550666	200	0	0	f	5.5	f	1
9	Cassidy	2	2022-06-25 00:44:39.565928	2022-06-25 00:44:39.565928	225	0	0	f	5.5	f	1
10	Doomfist	2	2022-06-25 00:44:39.580418	2022-06-25 00:44:39.580418	250	0	0	t	5.5	f	1
11	Echo	2	2022-06-25 00:44:39.594602	2022-06-25 00:44:39.594602	200	0	0	t	5.5	t	1
12	Genji	2	2022-06-25 00:44:39.608349	2022-06-25 00:44:39.608349	200	0	0	t	5.5	f	1
13	Hanzo	2	2022-06-25 00:44:39.622306	2022-06-25 00:44:39.622306	200	0	0	f	5.5	f	1
14	Junkrat	2	2022-06-25 00:44:39.637327	2022-06-25 00:44:39.637327	200	0	0	t	5.5	f	1
15	Pharah	2	2022-06-25 00:44:39.652117	2022-06-25 00:44:39.652117	200	0	0	t	5.5	t	1
16	Sombra	2	2022-06-25 00:44:39.667076	2022-06-25 00:44:39.667076	200	0	0	t	5.5	f	1
17	Symmetra	2	2022-06-25 00:44:39.681779	2022-06-25 00:44:39.681779	100	125	0	f	5.5	f	1
18	Torbjörn	2	2022-06-25 00:44:39.695887	2022-06-25 00:44:39.695887	200	0	50	f	5.5	f	1
19	Tracer	2	2022-06-25 00:44:39.709661	2022-06-25 00:44:39.709661	150	0	0	t	5.5	f	1
20	Widowmaker	2	2022-06-25 00:44:39.72365	2022-06-25 00:44:39.72365	175	0	0	t	5.5	f	1
21	Zenyatta	3	2022-06-25 00:44:39.737754	2022-06-25 00:44:39.737754	50	150	0	f	5.5	f	1
22	Moira	3	2022-06-25 00:44:39.751611	2022-06-25 00:44:39.751611	200	0	0	t	5.5	f	1
23	Mercy	3	2022-06-25 00:44:39.7666	2022-06-25 00:44:39.7666	200	0	0	t	5.5	t	1
24	Lúcio	3	2022-06-25 00:44:39.781391	2022-06-25 00:44:39.781391	200	0	0	t	5.5	f	1
25	Brigitte	3	2022-06-25 00:44:39.795427	2022-06-25 00:44:39.795427	150	0	50	t	5.5	f	1
26	Baptiste	3	2022-06-25 00:44:39.809209	2022-06-25 00:44:39.809209	200	0	0	f	5.5	f	1
27	Ana	3	2022-06-25 00:44:39.826781	2022-06-25 00:44:39.826781	200	0	0	f	5.5	f	1
28	Roadhog	1	2022-06-25 00:44:39.841667	2022-06-25 00:44:39.841667	600	0	0	f	5.5	f	1
29	Bastion	2	2022-06-25 00:44:39.855663	2022-06-25 00:44:39.855663	200	0	100	f	5.5	f	1
30	Mei	2	2022-06-25 00:44:39.869868	2022-06-25 00:44:39.869868	250	0	0	t	5.5	f	1
31	Reaper	2	2022-06-25 00:44:39.883796	2022-06-25 00:44:39.883796	250	0	0	t	5.5	f	1
32	Soldier: 76	2	2022-06-25 00:44:39.897603	2022-06-25 00:44:39.897603	200	0	0	t	5.5	f	1
1	D.Va	1	2022-06-25 00:44:39.428912	2022-07-23 23:33:23.630635	600	0	0	t	5.5	t	1
2	Orisa	1	2022-06-25 00:44:39.445816	2022-06-25 00:44:39.445816	275	0	275	f	5.5	f	1
3	Reinhardt	1	2022-06-25 00:44:39.460243	2022-06-25 00:44:39.460243	300	0	250	t	5.5	f	1
33	Junker Queen	1	2022-06-25 00:44:39.897603	2022-06-25 00:44:39.897603	425	0	0	t	5.5	f	1
\.


--
-- PostgreSQL database dump complete
--
