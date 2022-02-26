
CREATE SCHEMA uat;

CREATE TABLE IF NOT EXISTS uat.user_details
(
    user_id SERIAL NOT NULL,
    user_name character varying(50)  NOT NULL,
    first_name character varying(50) ,
    last_name character varying(50) ,
    address character varying(100) ,
    city character varying(20) ,
    zip_code numeric(10,0),
    created_by character varying(50) ,
    created_date date,
    modified_by character varying(50) ,
    modified_date date,
    gender "char",
    age numeric(5,0),
    contact_number numeric(15,0),
    email_id character varying(20) ,
    pass_word character varying(20) ,
    active boolean,
    CONSTRAINT user_details_pkey PRIMARY KEY (user_id)
);



CREATE TABLE IF NOT EXISTS uat.user_role
(
    user_id bigint NOT NULL ,
    user_role_id SERIAL NOT NULL,
    user_role_name character varying(50) ,
    active boolean,
    created_by character varying(50) ,
    created_date date,
    modified_by character varying(50) ,
    modified_date date,
    CONSTRAINT user_role_pkey PRIMARY KEY (user_role_id),
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public.user_details (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS uat.persistent_logins
(
    user_name character varying(50) NOT NULL,
    series_id SERIAL NOT NULL,
    token_id bigint,
    last_used date,
    CONSTRAINT persistent_logins_pkey PRIMARY KEY (series_id)
);


CREATE TABLE IF NOT EXISTS uat.audit_log
(
    log_id SERIAL NOT NULL,
    event_type character varying ,
    log_number numeric,
    user_id character varying(20) ,
    log_description character varying(500) ,
    log_time date,
    tag character varying(20) ,
    browser_type character varying(20) ,
    ip_number numeric(10,0),
    CONSTRAINT audit_log_pkey PRIMARY KEY (log_id)
);


CREATE TABLE IF NOT EXISTS uat.exception_event_log
(
    error_id SERIAL NOT NULL,
    event_type character varying(500) ,
    ip_number numeric(10,0),
    user_id bigint,
    error_desc character varying(500) ,
    error_time date,
    tag character varying(20) ,
    exception_line_number character varying(10) 
);


CREATE TABLE IF NOT EXISTS uat.login_attempt
(
    login_attempt_id SERIAL NOT NULL,
    user_id bigint,
    ip_number numeric,
    pass_word character varying(20) ,
    browser_type character varying(20) ,
    success_flag boolean,
    created_date date
);
