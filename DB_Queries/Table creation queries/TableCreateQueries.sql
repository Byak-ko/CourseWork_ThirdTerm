CREATE TABLE IF NOT EXISTS public.club_documents
(
    id bigint NOT NULL DEFAULT nextval('club_documents_id_seq'::regclass),
    member_id bigint,
    CONSTRAINT club_documents_pkey PRIMARY KEY (id),
    CONSTRAINT fk_rails_6c4aa490e6 FOREIGN KEY (member_id)
        REFERENCES public.members (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)


CREATE TABLE IF NOT EXISTS public.event_participations
(
    id bigint NOT NULL DEFAULT nextval('event_participations_id_seq'::regclass),
    member_id bigint NOT NULL,
    event_id bigint NOT NULL,
    CONSTRAINT event_participations_pkey PRIMARY KEY (id),
    CONSTRAINT fk_rails_b0b78337cd FOREIGN KEY (event_id)
        REFERENCES public.events (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_rails_ed7363eacf FOREIGN KEY (member_id)
        REFERENCES public.members (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)


CREATE TABLE IF NOT EXISTS public.events
(
    id bigint NOT NULL DEFAULT nextval('events_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    date date NOT NULL,
    location character varying(255) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    organizer character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT events_pkey PRIMARY KEY (id)
)


CREATE TABLE IF NOT EXISTS public.fish_infos
(
    id bigint NOT NULL DEFAULT nextval('fish_infos_id_seq'::regclass),
    name character varying(35) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    features text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT fish_infos_pkey PRIMARY KEY (id)
)


CREATE TABLE IF NOT EXISTS public.item_infos
(
    id bigint NOT NULL DEFAULT nextval('item_infos_id_seq'::regclass),
    name character varying(60) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    category character varying COLLATE pg_catalog."default" NOT NULL DEFAULT 'Інше'::character varying,
    CONSTRAINT item_infos_pkey PRIMARY KEY (id)
)


CREATE TABLE IF NOT EXISTS public.members
(
    id bigint NOT NULL DEFAULT nextval('members_id_seq'::regclass),
    first_name character varying(35) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(35) COLLATE pg_catalog."default" NOT NULL,
    address character varying(255) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(15) COLLATE pg_catalog."default" NOT NULL,
    role character varying COLLATE pg_catalog."default" NOT NULL DEFAULT 'Учасник'::character varying,
    encrypted_password character varying(255) COLLATE pg_catalog."default" NOT NULL DEFAULT ''::character varying,
    email character varying(60) COLLATE pg_catalog."default" NOT NULL DEFAULT ''::character varying,
    remember_created_at timestamp(6) without time zone,
    CONSTRAINT members_pkey PRIMARY KEY (id)
)



CREATE TABLE IF NOT EXISTS public.order_infos
(
    id bigint NOT NULL DEFAULT nextval('order_infos_id_seq'::regclass),
    price double precision NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    creator_id bigint NOT NULL,
    buyer_id bigint,
    item_info_id bigint NOT NULL,
    CONSTRAINT order_infos_pkey PRIMARY KEY (id),
    CONSTRAINT fk_rails_0dba4a24a5 FOREIGN KEY (item_info_id)
        REFERENCES public.item_infos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_rails_7ab9810eba FOREIGN KEY (creator_id)
        REFERENCES public.members (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_rails_ac28be7131 FOREIGN KEY (buyer_id)
        REFERENCES public.members (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)



CREATE TABLE IF NOT EXISTS public.partners
(
    id bigint NOT NULL DEFAULT nextval('partners_id_seq'::regclass),
    name character varying(60) COLLATE pg_catalog."default" NOT NULL,
    email character varying(60) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(15) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT partners_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.plant_infos
(
    id bigint NOT NULL DEFAULT nextval('plant_infos_id_seq'::regclass),
    name character varying(40) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    optimal_growth_conditions text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT plant_infos_pkey PRIMARY KEY (id)
)
