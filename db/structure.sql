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
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: group_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_groups (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    priorities_count integer,
    priority integer NOT NULL,
    is_infinity boolean DEFAULT true NOT NULL,
    end_at timestamp without time zone,
    archved boolean DEFAULT false NOT NULL,
    wall_id uuid NOT NULL,
    move_falied integer,
    faled_move_id uuid NOT NULL,
    move_completed integer,
    completed_move_id uuid NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: task_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_tasks (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    title character varying NOT NULL,
    is_complete boolean DEFAULT true NOT NULL,
    priority integer NOT NULL,
    is_infinity boolean DEFAULT true NOT NULL,
    end_at timestamp without time zone,
    archved boolean DEFAULT false NOT NULL,
    group_id uuid NOT NULL,
    move_falied integer,
    faled_move_id uuid NOT NULL,
    move_completed integer,
    completed_move_id uuid NOT NULL
);


--
-- Name: user_refresh_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_refresh_tokens (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    token character varying NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    user_id uuid NOT NULL
);


--
-- Name: user_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_users (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    full_name character varying NOT NULL,
    email character varying NOT NULL,
    encrypted_password character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT user_email_format_must_be_valid CHECK (((email)::text ~ '^[а-яА-яa-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'::text))
);


--
-- Name: user_walls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_walls (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    wall_id uuid NOT NULL
);


--
-- Name: wall_walls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wall_walls (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    priorities_count integer DEFAULT 10 NOT NULL,
    archved boolean DEFAULT false NOT NULL,
    is_infinity boolean DEFAULT true NOT NULL,
    end_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: group_groups group_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_groups
    ADD CONSTRAINT group_groups_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: task_tasks task_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_tasks
    ADD CONSTRAINT task_tasks_pkey PRIMARY KEY (id);


--
-- Name: user_refresh_tokens user_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_refresh_tokens
    ADD CONSTRAINT user_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: user_users user_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_users
    ADD CONSTRAINT user_users_pkey PRIMARY KEY (id);


--
-- Name: user_walls user_walls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_walls
    ADD CONSTRAINT user_walls_pkey PRIMARY KEY (id);


--
-- Name: wall_walls wall_walls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wall_walls
    ADD CONSTRAINT wall_walls_pkey PRIMARY KEY (id);


--
-- Name: index_group_groups_on_completed_move_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_groups_on_completed_move_id ON public.group_groups USING btree (completed_move_id);


--
-- Name: index_group_groups_on_faled_move_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_groups_on_faled_move_id ON public.group_groups USING btree (faled_move_id);


--
-- Name: index_group_groups_on_wall_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_groups_on_wall_id ON public.group_groups USING btree (wall_id);


--
-- Name: index_task_tasks_on_completed_move_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_task_tasks_on_completed_move_id ON public.task_tasks USING btree (completed_move_id);


--
-- Name: index_task_tasks_on_faled_move_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_task_tasks_on_faled_move_id ON public.task_tasks USING btree (faled_move_id);


--
-- Name: index_task_tasks_on_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_task_tasks_on_group_id ON public.task_tasks USING btree (group_id);


--
-- Name: index_user_refresh_tokens_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_user_refresh_tokens_on_token ON public.user_refresh_tokens USING btree (token);


--
-- Name: index_user_refresh_tokens_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_refresh_tokens_on_user_id ON public.user_refresh_tokens USING btree (user_id);


--
-- Name: index_user_walls_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_walls_on_user_id ON public.user_walls USING btree (user_id);


--
-- Name: index_user_walls_on_wall_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_walls_on_wall_id ON public.user_walls USING btree (wall_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.user_users USING btree (lower((email)::text));


--
-- Name: group_groups fk_rails_896e827f40; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_groups
    ADD CONSTRAINT fk_rails_896e827f40 FOREIGN KEY (faled_move_id) REFERENCES public.wall_walls(id) ON DELETE CASCADE;


--
-- Name: group_groups fk_rails_8ee77aa5e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_groups
    ADD CONSTRAINT fk_rails_8ee77aa5e1 FOREIGN KEY (completed_move_id) REFERENCES public.wall_walls(id) ON DELETE CASCADE;


--
-- Name: task_tasks fk_rails_8fce137366; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_tasks
    ADD CONSTRAINT fk_rails_8fce137366 FOREIGN KEY (group_id) REFERENCES public.group_groups(id) ON DELETE CASCADE;


--
-- Name: user_walls fk_rails_95952a63fe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_walls
    ADD CONSTRAINT fk_rails_95952a63fe FOREIGN KEY (user_id) REFERENCES public.user_users(id) ON DELETE CASCADE;


--
-- Name: user_walls fk_rails_98ff304e98; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_walls
    ADD CONSTRAINT fk_rails_98ff304e98 FOREIGN KEY (wall_id) REFERENCES public.wall_walls(id) ON DELETE CASCADE;


--
-- Name: task_tasks fk_rails_9f7ae21fb7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_tasks
    ADD CONSTRAINT fk_rails_9f7ae21fb7 FOREIGN KEY (completed_move_id) REFERENCES public.group_groups(id) ON DELETE CASCADE;


--
-- Name: user_refresh_tokens fk_rails_cfcb3d6477; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_refresh_tokens
    ADD CONSTRAINT fk_rails_cfcb3d6477 FOREIGN KEY (user_id) REFERENCES public.user_users(id) ON DELETE CASCADE;


--
-- Name: group_groups fk_rails_ea3152d191; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_groups
    ADD CONSTRAINT fk_rails_ea3152d191 FOREIGN KEY (wall_id) REFERENCES public.wall_walls(id) ON DELETE CASCADE;


--
-- Name: task_tasks fk_rails_fd18b78039; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_tasks
    ADD CONSTRAINT fk_rails_fd18b78039 FOREIGN KEY (faled_move_id) REFERENCES public.group_groups(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20211018163540'),
('20211018165925'),
('20211020150046'),
('20211020155507'),
('20211020163914');


