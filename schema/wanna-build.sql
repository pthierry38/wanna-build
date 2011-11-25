--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: alpha; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA alpha;


ALTER SCHEMA alpha OWNER TO wbadm;

--
-- Name: alpha_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA alpha_public;


ALTER SCHEMA alpha_public OWNER TO wbadm;

--
-- Name: amd64; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA amd64;


ALTER SCHEMA amd64 OWNER TO wbadm;

--
-- Name: amd64_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA amd64_public;


ALTER SCHEMA amd64_public OWNER TO wbadm;

--
-- Name: arm; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA arm;


ALTER SCHEMA arm OWNER TO wbadm;

--
-- Name: arm_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA arm_public;


ALTER SCHEMA arm_public OWNER TO wbadm;

--
-- Name: armel; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA armel;


ALTER SCHEMA armel OWNER TO wbadm;

--
-- Name: armel_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA armel_public;


ALTER SCHEMA armel_public OWNER TO wbadm;

--
-- Name: armhf; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA armhf;


ALTER SCHEMA armhf OWNER TO wbadm;

--
-- Name: armhf_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA armhf_public;


ALTER SCHEMA armhf_public OWNER TO wbadm;

--
-- Name: hppa; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA hppa;


ALTER SCHEMA hppa OWNER TO wbadm;

--
-- Name: hppa_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA hppa_public;


ALTER SCHEMA hppa_public OWNER TO wbadm;

--
-- Name: hurd-i386; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA "hurd-i386";


ALTER SCHEMA "hurd-i386" OWNER TO wbadm;

--
-- Name: hurd-i386_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA "hurd-i386_public";


ALTER SCHEMA "hurd-i386_public" OWNER TO wbadm;

--
-- Name: i386; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA i386;


ALTER SCHEMA i386 OWNER TO wbadm;

--
-- Name: i386_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA i386_public;


ALTER SCHEMA i386_public OWNER TO wbadm;

--
-- Name: ia64; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA ia64;


ALTER SCHEMA ia64 OWNER TO wbadm;

--
-- Name: ia64_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA ia64_public;


ALTER SCHEMA ia64_public OWNER TO wbadm;

--
-- Name: kfreebsd-amd64; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA "kfreebsd-amd64";


ALTER SCHEMA "kfreebsd-amd64" OWNER TO wbadm;

--
-- Name: kfreebsd-amd64_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA "kfreebsd-amd64_public";


ALTER SCHEMA "kfreebsd-amd64_public" OWNER TO wbadm;

--
-- Name: kfreebsd-i386; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA "kfreebsd-i386";


ALTER SCHEMA "kfreebsd-i386" OWNER TO wbadm;

--
-- Name: kfreebsd-i386_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA "kfreebsd-i386_public";


ALTER SCHEMA "kfreebsd-i386_public" OWNER TO wbadm;

--
-- Name: mips; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA mips;


ALTER SCHEMA mips OWNER TO wbadm;

--
-- Name: mips_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA mips_public;


ALTER SCHEMA mips_public OWNER TO wbadm;

--
-- Name: mipsel; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA mipsel;


ALTER SCHEMA mipsel OWNER TO wbadm;

--
-- Name: mipsel_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA mipsel_public;


ALTER SCHEMA mipsel_public OWNER TO wbadm;

--
-- Name: powerpc; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA powerpc;


ALTER SCHEMA powerpc OWNER TO wbadm;

--
-- Name: powerpc_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA powerpc_public;


ALTER SCHEMA powerpc_public OWNER TO wbadm;

--
-- Name: s390; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA s390;


ALTER SCHEMA s390 OWNER TO wbadm;

--
-- Name: s390_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA s390_public;


ALTER SCHEMA s390_public OWNER TO wbadm;

--
-- Name: s390x; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA s390x;


ALTER SCHEMA s390x OWNER TO wbadm;

--
-- Name: s390x_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA s390x_public;


ALTER SCHEMA s390x_public OWNER TO wbadm;

--
-- Name: sparc; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA sparc;


ALTER SCHEMA sparc OWNER TO wbadm;

--
-- Name: sparc_public; Type: SCHEMA; Schema: -; Owner: wbadm
--

CREATE SCHEMA sparc_public;


ALTER SCHEMA sparc_public OWNER TO wbadm;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: wbadm
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO wbadm;

SET search_path = public, pg_catalog;

--
-- Name: debversion; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE debversion;


--
-- Name: debversionin(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversionin(cstring) RETURNS debversion
    LANGUAGE internal IMMUTABLE STRICT
    AS $$textin$$;


ALTER FUNCTION public.debversionin(cstring) OWNER TO postgres;

--
-- Name: debversionout(debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversionout(debversion) RETURNS cstring
    LANGUAGE internal IMMUTABLE STRICT
    AS $$textout$$;


ALTER FUNCTION public.debversionout(debversion) OWNER TO postgres;

--
-- Name: debversionrecv(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversionrecv(internal) RETURNS debversion
    LANGUAGE internal STABLE STRICT
    AS $$textrecv$$;


ALTER FUNCTION public.debversionrecv(internal) OWNER TO postgres;

--
-- Name: debversionsend(debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversionsend(debversion) RETURNS bytea
    LANGUAGE internal STABLE STRICT
    AS $$textsend$$;


ALTER FUNCTION public.debversionsend(debversion) OWNER TO postgres;

--
-- Name: debversion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE debversion (
    INTERNALLENGTH = variable,
    INPUT = debversionin,
    OUTPUT = debversionout,
    RECEIVE = debversionrecv,
    SEND = debversionsend,
    CATEGORY = 'S',
    ALIGNMENT = int4,
    STORAGE = extended
);


ALTER TYPE public.debversion OWNER TO postgres;

--
-- Name: TYPE debversion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE debversion IS 'Debian package version number';


--
-- Name: commacat(text, text); Type: FUNCTION; Schema: public; Owner: pkern
--

CREATE FUNCTION commacat(acc text, instr text) RETURNS text
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF acc IS NULL OR acc = '' THEN
      RETURN instr;
    ELSE
      RETURN acc || ', ' || instr;
    END IF;
  END;
$$;


ALTER FUNCTION public.commacat(acc text, instr text) OWNER TO pkern;

--
-- Name: debversion(character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversion(character) RETURNS debversion
    LANGUAGE internal IMMUTABLE STRICT
    AS $$rtrim1$$;


ALTER FUNCTION public.debversion(character) OWNER TO postgres;

--
-- Name: debversion_cmp(debversion, debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversion_cmp(version1 debversion, version2 debversion) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/debversion', 'debversion_cmp';


ALTER FUNCTION public.debversion_cmp(version1 debversion, version2 debversion) OWNER TO postgres;

--
-- Name: FUNCTION debversion_cmp(version1 debversion, version2 debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION debversion_cmp(version1 debversion, version2 debversion) IS 'Compare Debian versions';


--
-- Name: debversion_eq(debversion, debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversion_eq(version1 debversion, version2 debversion) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/debversion', 'debversion_eq';


ALTER FUNCTION public.debversion_eq(version1 debversion, version2 debversion) OWNER TO postgres;

--
-- Name: FUNCTION debversion_eq(version1 debversion, version2 debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION debversion_eq(version1 debversion, version2 debversion) IS 'debversion equal';


--
-- Name: debversion_ge(debversion, debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversion_ge(version1 debversion, version2 debversion) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/debversion', 'debversion_ge';


ALTER FUNCTION public.debversion_ge(version1 debversion, version2 debversion) OWNER TO postgres;

--
-- Name: FUNCTION debversion_ge(version1 debversion, version2 debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION debversion_ge(version1 debversion, version2 debversion) IS 'debversion greater-than-or-equal';


--
-- Name: debversion_gt(debversion, debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversion_gt(version1 debversion, version2 debversion) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/debversion', 'debversion_gt';


ALTER FUNCTION public.debversion_gt(version1 debversion, version2 debversion) OWNER TO postgres;

--
-- Name: FUNCTION debversion_gt(version1 debversion, version2 debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION debversion_gt(version1 debversion, version2 debversion) IS 'debversion greater-than';


--
-- Name: debversion_hash(debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversion_hash(debversion) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/debversion', 'debversion_hash';


ALTER FUNCTION public.debversion_hash(debversion) OWNER TO postgres;

--
-- Name: debversion_larger(debversion, debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversion_larger(version1 debversion, version2 debversion) RETURNS debversion
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/debversion', 'debversion_larger';


ALTER FUNCTION public.debversion_larger(version1 debversion, version2 debversion) OWNER TO postgres;

--
-- Name: debversion_le(debversion, debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversion_le(version1 debversion, version2 debversion) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/debversion', 'debversion_le';


ALTER FUNCTION public.debversion_le(version1 debversion, version2 debversion) OWNER TO postgres;

--
-- Name: FUNCTION debversion_le(version1 debversion, version2 debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION debversion_le(version1 debversion, version2 debversion) IS 'debversion less-than-or-equal';


--
-- Name: debversion_lt(debversion, debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversion_lt(version1 debversion, version2 debversion) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/debversion', 'debversion_lt';


ALTER FUNCTION public.debversion_lt(version1 debversion, version2 debversion) OWNER TO postgres;

--
-- Name: FUNCTION debversion_lt(version1 debversion, version2 debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION debversion_lt(version1 debversion, version2 debversion) IS 'debversion less-than';


--
-- Name: debversion_ne(debversion, debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversion_ne(version1 debversion, version2 debversion) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/debversion', 'debversion_ne';


ALTER FUNCTION public.debversion_ne(version1 debversion, version2 debversion) OWNER TO postgres;

--
-- Name: FUNCTION debversion_ne(version1 debversion, version2 debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON FUNCTION debversion_ne(version1 debversion, version2 debversion) IS 'debversion not equal';


--
-- Name: debversion_smaller(debversion, debversion); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION debversion_smaller(version1 debversion, version2 debversion) RETURNS debversion
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/debversion', 'debversion_smaller';


ALTER FUNCTION public.debversion_smaller(version1 debversion, version2 debversion) OWNER TO postgres;

--
-- Name: query_source_package(character varying, character varying); Type: FUNCTION; Schema: public; Owner: wbadm
--

CREATE FUNCTION query_source_package(param_dist character varying, param_srcpkg character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY SELECT packages.architecture, packages.package, packages.distribution, packages.version::character varying, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM packages_public packages WHERE distribution = param_dist AND package = param_srcpkg;
END
$$;


ALTER FUNCTION public.query_source_package(param_dist character varying, param_srcpkg character varying) OWNER TO wbadm;

--
-- Name: spacecat(text, text); Type: FUNCTION; Schema: public; Owner: pkern
--

CREATE FUNCTION spacecat(acc text, instr text) RETURNS text
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF acc IS NULL OR acc = '' THEN
      RETURN instr;
    ELSE
      RETURN acc || ' ' || instr;
    END IF;
  END;
$$;


ALTER FUNCTION public.spacecat(acc text, instr text) OWNER TO pkern;

--
-- Name: commacat_all(text); Type: AGGREGATE; Schema: public; Owner: pkern
--

CREATE AGGREGATE commacat_all(text) (
    SFUNC = commacat,
    STYPE = text,
    INITCOND = ''
);


ALTER AGGREGATE public.commacat_all(text) OWNER TO pkern;

--
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = debversion_gt,
    LEFTARG = debversion,
    RIGHTARG = debversion,
    COMMUTATOR = <,
    NEGATOR = >=
);


ALTER OPERATOR public.> (debversion, debversion) OWNER TO postgres;

--
-- Name: OPERATOR > (debversion, debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON OPERATOR > (debversion, debversion) IS 'debversion greater-than';


--
-- Name: max(debversion); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE max(debversion) (
    SFUNC = debversion_larger,
    STYPE = debversion,
    SORTOP = >
);


ALTER AGGREGATE public.max(debversion) OWNER TO postgres;

--
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = debversion_lt,
    LEFTARG = debversion,
    RIGHTARG = debversion,
    COMMUTATOR = >,
    NEGATOR = >=
);


ALTER OPERATOR public.< (debversion, debversion) OWNER TO postgres;

--
-- Name: OPERATOR < (debversion, debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON OPERATOR < (debversion, debversion) IS 'debversion less-than';


--
-- Name: min(debversion); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE min(debversion) (
    SFUNC = debversion_smaller,
    STYPE = debversion,
    SORTOP = <
);


ALTER AGGREGATE public.min(debversion) OWNER TO postgres;

--
-- Name: spacecat_all(text); Type: AGGREGATE; Schema: public; Owner: pkern
--

CREATE AGGREGATE spacecat_all(text) (
    SFUNC = spacecat,
    STYPE = text,
    INITCOND = ''
);


ALTER AGGREGATE public.spacecat_all(text) OWNER TO pkern;

--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = debversion_le,
    LEFTARG = debversion,
    RIGHTARG = debversion,
    COMMUTATOR = >=,
    NEGATOR = >
);


ALTER OPERATOR public.<= (debversion, debversion) OWNER TO postgres;

--
-- Name: OPERATOR <= (debversion, debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON OPERATOR <= (debversion, debversion) IS 'debversion less-than-or-equal';


--
-- Name: <>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <> (
    PROCEDURE = debversion_ne,
    LEFTARG = debversion,
    RIGHTARG = debversion,
    COMMUTATOR = <>,
    NEGATOR = =
);


ALTER OPERATOR public.<> (debversion, debversion) OWNER TO postgres;

--
-- Name: OPERATOR <> (debversion, debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON OPERATOR <> (debversion, debversion) IS 'debversion not equal';


--
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = debversion_eq,
    LEFTARG = debversion,
    RIGHTARG = debversion,
    COMMUTATOR = =,
    NEGATOR = <>
);


ALTER OPERATOR public.= (debversion, debversion) OWNER TO postgres;

--
-- Name: OPERATOR = (debversion, debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON OPERATOR = (debversion, debversion) IS 'debversion equal';


--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = debversion_ge,
    LEFTARG = debversion,
    RIGHTARG = debversion,
    COMMUTATOR = <=,
    NEGATOR = <
);


ALTER OPERATOR public.>= (debversion, debversion) OWNER TO postgres;

--
-- Name: OPERATOR >= (debversion, debversion); Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON OPERATOR >= (debversion, debversion) IS 'debversion greater-than-or-equal';


--
-- Name: debversion_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS debversion_ops
    DEFAULT FOR TYPE debversion USING btree AS
    OPERATOR 1 <(debversion,debversion) ,
    OPERATOR 2 <=(debversion,debversion) ,
    OPERATOR 3 =(debversion,debversion) ,
    OPERATOR 4 >=(debversion,debversion) ,
    OPERATOR 5 >(debversion,debversion) ,
    FUNCTION 1 debversion_cmp(debversion,debversion);


ALTER OPERATOR CLASS public.debversion_ops USING btree OWNER TO postgres;

--
-- Name: debversion_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS debversion_ops
    DEFAULT FOR TYPE debversion USING hash AS
    OPERATOR 1 =(debversion,debversion) ,
    FUNCTION 1 debversion_hash(debversion);


ALTER OPERATOR CLASS public.debversion_ops USING hash OWNER TO postgres;

SET search_path = pg_catalog;

--
-- Name: CAST (character AS public.debversion); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (character AS public.debversion) WITH FUNCTION public.debversion(character);


--
-- Name: CAST (public.debversion AS character); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.debversion AS character) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- Name: CAST (public.debversion AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.debversion AS text) WITHOUT FUNCTION AS IMPLICIT;


--
-- Name: CAST (public.debversion AS character varying); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.debversion AS character varying) WITHOUT FUNCTION AS IMPLICIT;


--
-- Name: CAST (text AS public.debversion); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.debversion) WITHOUT FUNCTION AS ASSIGNMENT;


--
-- Name: CAST (character varying AS public.debversion); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (character varying AS public.debversion) WITHOUT FUNCTION AS ASSIGNMENT;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: packages; Type: TABLE; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    architecture character varying NOT NULL,
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version debversion,
    state character varying,
    section character varying,
    priority character varying,
    installed_version character varying,
    previous_state character varying,
    state_change timestamp without time zone,
    notes character varying,
    builder character varying,
    failed text,
    old_failed text,
    binary_nmu_version integer,
    binary_nmu_changelog character varying,
    failed_category character varying,
    permbuildpri integer,
    buildpri integer,
    depends character varying,
    rel character varying,
    bd_problem text,
    extra_depends character varying,
    extra_conflicts character varying,
    build_arch_all boolean DEFAULT false
);


ALTER TABLE public.packages OWNER TO wbadm;

SET search_path = alpha, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: alpha; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'alpha'::text);


ALTER TABLE alpha.packages OWNER TO wbadm;

SET search_path = public, pg_catalog;

--
-- Name: pkg_history; Type: TABLE; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    architecture character varying NOT NULL,
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version debversion NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint,
    builder character varying
);


ALTER TABLE public.pkg_history OWNER TO wbadm;

SET search_path = alpha, pg_catalog;

--
-- Name: pkg_history; Type: VIEW; Schema: alpha; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'alpha'::text);


ALTER TABLE alpha.pkg_history OWNER TO wbadm;

SET search_path = public, pg_catalog;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    architecture character varying,
    package character varying,
    distribution character varying,
    version debversion,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE public.transactions OWNER TO wbadm;

SET search_path = alpha, pg_catalog;

--
-- Name: transactions; Type: VIEW; Schema: alpha; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'alpha'::text);


ALTER TABLE alpha.transactions OWNER TO wbadm;

SET search_path = public, pg_catalog;

--
-- Name: users; Type: TABLE; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    architecture character varying NOT NULL,
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE public.users OWNER TO wbadm;

SET search_path = alpha, pg_catalog;

--
-- Name: users; Type: VIEW; Schema: alpha; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'alpha'::text);


ALTER TABLE alpha.users OWNER TO wbadm;

SET search_path = public, pg_catalog;

--
-- Name: distributions; Type: TABLE; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE TABLE distributions (
    distribution character varying NOT NULL,
    public boolean DEFAULT true NOT NULL,
    sort_order integer DEFAULT 0,
    auto_dep_wait boolean DEFAULT true,
    build_dep_resolver character varying,
    archive character varying,
    suppress_successful_logs boolean DEFAULT false NOT NULL
);


ALTER TABLE public.distributions OWNER TO wbadm;

SET search_path = alpha_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: alpha_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'alpha'::text));


ALTER TABLE alpha_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: alpha_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'alpha'::text));


ALTER TABLE alpha_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: alpha_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'alpha'::text));


ALTER TABLE alpha_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: alpha_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'alpha'::text));


ALTER TABLE alpha_public.users OWNER TO wbadm;

SET search_path = amd64, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: amd64; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'amd64'::text);


ALTER TABLE amd64.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: amd64; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'amd64'::text);


ALTER TABLE amd64.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: amd64; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'amd64'::text);


ALTER TABLE amd64.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: amd64; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'amd64'::text);


ALTER TABLE amd64.users OWNER TO wbadm;

SET search_path = amd64_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: amd64_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'amd64'::text));


ALTER TABLE amd64_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: amd64_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'amd64'::text));


ALTER TABLE amd64_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: amd64_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'amd64'::text));


ALTER TABLE amd64_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: amd64_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'amd64'::text));


ALTER TABLE amd64_public.users OWNER TO wbadm;

SET search_path = arm, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: arm; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'arm'::text);


ALTER TABLE arm.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: arm; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'arm'::text);


ALTER TABLE arm.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: arm; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'arm'::text);


ALTER TABLE arm.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: arm; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'arm'::text);


ALTER TABLE arm.users OWNER TO wbadm;

SET search_path = arm_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: arm_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'arm'::text));


ALTER TABLE arm_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: arm_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'arm'::text));


ALTER TABLE arm_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: arm_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'arm'::text));


ALTER TABLE arm_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: arm_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'arm'::text));


ALTER TABLE arm_public.users OWNER TO wbadm;

SET search_path = armel, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: armel; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'armel'::text);


ALTER TABLE armel.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: armel; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'armel'::text);


ALTER TABLE armel.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: armel; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'armel'::text);


ALTER TABLE armel.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: armel; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'armel'::text);


ALTER TABLE armel.users OWNER TO wbadm;

SET search_path = armel_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: armel_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'armel'::text));


ALTER TABLE armel_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: armel_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'armel'::text));


ALTER TABLE armel_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: armel_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'armel'::text));


ALTER TABLE armel_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: armel_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'armel'::text));


ALTER TABLE armel_public.users OWNER TO wbadm;

SET search_path = armhf, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: armhf; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'armhf'::text);


ALTER TABLE armhf.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: armhf; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'armhf'::text);


ALTER TABLE armhf.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: armhf; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'armhf'::text);


ALTER TABLE armhf.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: armhf; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'armhf'::text);


ALTER TABLE armhf.users OWNER TO wbadm;

SET search_path = armhf_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: armhf_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'armhf'::text));


ALTER TABLE armhf_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: armhf_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'armhf'::text));


ALTER TABLE armhf_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: armhf_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'armhf'::text));


ALTER TABLE armhf_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: armhf_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'armhf'::text));


ALTER TABLE armhf_public.users OWNER TO wbadm;

SET search_path = hppa, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: hppa; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'hppa'::text);


ALTER TABLE hppa.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: hppa; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'hppa'::text);


ALTER TABLE hppa.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: hppa; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'hppa'::text);


ALTER TABLE hppa.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: hppa; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'hppa'::text);


ALTER TABLE hppa.users OWNER TO wbadm;

SET search_path = hppa_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: hppa_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'hppa'::text));


ALTER TABLE hppa_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: hppa_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'hppa'::text));


ALTER TABLE hppa_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: hppa_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'hppa'::text));


ALTER TABLE hppa_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: hppa_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'hppa'::text));


ALTER TABLE hppa_public.users OWNER TO wbadm;

SET search_path = "hurd-i386", pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: hurd-i386; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'hurd-i386'::text);


ALTER TABLE "hurd-i386".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: hurd-i386; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'hurd-i386'::text);


ALTER TABLE "hurd-i386".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: hurd-i386; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'hurd-i386'::text);


ALTER TABLE "hurd-i386".transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: hurd-i386; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'hurd-i386'::text);


ALTER TABLE "hurd-i386".users OWNER TO wbadm;

SET search_path = "hurd-i386_public", pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: hurd-i386_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'hurd-i386'::text));


ALTER TABLE "hurd-i386_public".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: hurd-i386_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'hurd-i386'::text));


ALTER TABLE "hurd-i386_public".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: hurd-i386_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'hurd-i386'::text));


ALTER TABLE "hurd-i386_public".transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: hurd-i386_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'hurd-i386'::text));


ALTER TABLE "hurd-i386_public".users OWNER TO wbadm;

SET search_path = i386, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: i386; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'i386'::text);


ALTER TABLE i386.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: i386; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'i386'::text);


ALTER TABLE i386.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: i386; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'i386'::text);


ALTER TABLE i386.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: i386; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'i386'::text);


ALTER TABLE i386.users OWNER TO wbadm;

SET search_path = i386_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: i386_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'i386'::text));


ALTER TABLE i386_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: i386_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'i386'::text));


ALTER TABLE i386_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: i386_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'i386'::text));


ALTER TABLE i386_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: i386_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'i386'::text));


ALTER TABLE i386_public.users OWNER TO wbadm;

SET search_path = ia64, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: ia64; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'ia64'::text);


ALTER TABLE ia64.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: ia64; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'ia64'::text);


ALTER TABLE ia64.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: ia64; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'ia64'::text);


ALTER TABLE ia64.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: ia64; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'ia64'::text);


ALTER TABLE ia64.users OWNER TO wbadm;

SET search_path = ia64_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: ia64_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'ia64'::text));


ALTER TABLE ia64_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: ia64_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'ia64'::text));


ALTER TABLE ia64_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: ia64_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'ia64'::text));


ALTER TABLE ia64_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: ia64_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'ia64'::text));


ALTER TABLE ia64_public.users OWNER TO wbadm;

SET search_path = "kfreebsd-amd64", pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'kfreebsd-amd64'::text);


ALTER TABLE "kfreebsd-amd64".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'kfreebsd-amd64'::text);


ALTER TABLE "kfreebsd-amd64".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'kfreebsd-amd64'::text);


ALTER TABLE "kfreebsd-amd64".transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'kfreebsd-amd64'::text);


ALTER TABLE "kfreebsd-amd64".users OWNER TO wbadm;

SET search_path = "kfreebsd-amd64_public", pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: kfreebsd-amd64_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'kfreebsd-amd64'::text));


ALTER TABLE "kfreebsd-amd64_public".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: kfreebsd-amd64_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'kfreebsd-amd64'::text));


ALTER TABLE "kfreebsd-amd64_public".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: kfreebsd-amd64_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'kfreebsd-amd64'::text));


ALTER TABLE "kfreebsd-amd64_public".transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: kfreebsd-amd64_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'kfreebsd-amd64'::text));


ALTER TABLE "kfreebsd-amd64_public".users OWNER TO wbadm;

SET search_path = "kfreebsd-i386", pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'kfreebsd-i386'::text);


ALTER TABLE "kfreebsd-i386".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'kfreebsd-i386'::text);


ALTER TABLE "kfreebsd-i386".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'kfreebsd-i386'::text);


ALTER TABLE "kfreebsd-i386".transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'kfreebsd-i386'::text);


ALTER TABLE "kfreebsd-i386".users OWNER TO wbadm;

SET search_path = "kfreebsd-i386_public", pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: kfreebsd-i386_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'kfreebsd-i386'::text));


ALTER TABLE "kfreebsd-i386_public".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: kfreebsd-i386_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'kfreebsd-i386'::text));


ALTER TABLE "kfreebsd-i386_public".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: kfreebsd-i386_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'kfreebsd-i386'::text));


ALTER TABLE "kfreebsd-i386_public".transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: kfreebsd-i386_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'kfreebsd-i386'::text));


ALTER TABLE "kfreebsd-i386_public".users OWNER TO wbadm;

SET search_path = mips, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: mips; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'mips'::text);


ALTER TABLE mips.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: mips; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'mips'::text);


ALTER TABLE mips.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: mips; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'mips'::text);


ALTER TABLE mips.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: mips; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'mips'::text);


ALTER TABLE mips.users OWNER TO wbadm;

SET search_path = mips_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: mips_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'mips'::text));


ALTER TABLE mips_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: mips_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'mips'::text));


ALTER TABLE mips_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: mips_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'mips'::text));


ALTER TABLE mips_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: mips_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'mips'::text));


ALTER TABLE mips_public.users OWNER TO wbadm;

SET search_path = mipsel, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: mipsel; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'mipsel'::text);


ALTER TABLE mipsel.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: mipsel; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'mipsel'::text);


ALTER TABLE mipsel.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: mipsel; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'mipsel'::text);


ALTER TABLE mipsel.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: mipsel; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'mipsel'::text);


ALTER TABLE mipsel.users OWNER TO wbadm;

SET search_path = mipsel_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: mipsel_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'mipsel'::text));


ALTER TABLE mipsel_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: mipsel_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'mipsel'::text));


ALTER TABLE mipsel_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: mipsel_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'mipsel'::text));


ALTER TABLE mipsel_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: mipsel_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'mipsel'::text));


ALTER TABLE mipsel_public.users OWNER TO wbadm;

SET search_path = powerpc, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: powerpc; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'powerpc'::text);


ALTER TABLE powerpc.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: powerpc; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'powerpc'::text);


ALTER TABLE powerpc.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: powerpc; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'powerpc'::text);


ALTER TABLE powerpc.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: powerpc; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'powerpc'::text);


ALTER TABLE powerpc.users OWNER TO wbadm;

SET search_path = powerpc_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: powerpc_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'powerpc'::text));


ALTER TABLE powerpc_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: powerpc_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'powerpc'::text));


ALTER TABLE powerpc_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: powerpc_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'powerpc'::text));


ALTER TABLE powerpc_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: powerpc_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'powerpc'::text));


ALTER TABLE powerpc_public.users OWNER TO wbadm;

SET search_path = public, pg_catalog;

--
-- Name: architectures; Type: TABLE; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE TABLE architectures (
    architecture character varying NOT NULL
);


ALTER TABLE public.architectures OWNER TO wbadm;

--
-- Name: distribution_aliases; Type: TABLE; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE TABLE distribution_aliases (
    alias character varying NOT NULL,
    distribution character varying NOT NULL
);


ALTER TABLE public.distribution_aliases OWNER TO wbadm;

--
-- Name: distribution_architectures; Type: TABLE; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE TABLE distribution_architectures (
    distribution character varying NOT NULL,
    architecture character varying NOT NULL
);


ALTER TABLE public.distribution_architectures OWNER TO wbadm;

--
-- Name: distribution_architectures_statistics; Type: VIEW; Schema: public; Owner: wbadm
--

CREATE VIEW distribution_architectures_statistics AS
    SELECT DISTINCT packages.distribution, packages.architecture, sum(CASE WHEN ((packages.state)::text = 'Needs-Build'::text) THEN 1 ELSE 0 END) AS needsbuild, sum(CASE WHEN ((packages.state_change < (now() - '1 day'::interval)) AND (((packages.state)::text = 'Built'::text) OR ((packages.state)::text = 'Uploaded'::text))) THEN 1 ELSE 0 END) AS notinstalled FROM packages GROUP BY packages.distribution, packages.architecture;


ALTER TABLE public.distribution_architectures_statistics OWNER TO wbadm;

--
-- Name: lastlog; Type: VIEW; Schema: public; Owner: wbadm
--

CREATE VIEW lastlog AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.architecture FROM (pkg_history NATURAL JOIN distributions) WHERE (distributions.public = true) ORDER BY pkg_history."timestamp" DESC LIMIT 25;


ALTER TABLE public.lastlog OWNER TO wbadm;

--
-- Name: locks; Type: TABLE; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE TABLE locks (
    distribution character varying,
    architecture character varying
);


ALTER TABLE public.locks OWNER TO wbadm;

--
-- Name: log; Type: VIEW; Schema: public; Owner: wbadm
--

CREATE VIEW log AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.architecture FROM (pkg_history NATURAL JOIN distributions) WHERE (distributions.public = true) ORDER BY pkg_history."timestamp" DESC;


ALTER TABLE public.log OWNER TO wbadm;

--
-- Name: packages_all; Type: VIEW; Schema: public; Owner: wbadm
--

CREATE VIEW packages_all AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.architecture FROM (packages NATURAL JOIN distributions) WHERE (distributions.public = true);


ALTER TABLE public.packages_all OWNER TO wbadm;

--
-- Name: packages_public; Type: VIEW; Schema: public; Owner: wbadm
--

CREATE VIEW packages_public AS
    SELECT packages.distribution, packages.architecture, packages.package, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all, distributions.public, distributions.sort_order, distributions.auto_dep_wait, distributions.build_dep_resolver, distributions.archive, distributions.suppress_successful_logs FROM (packages NATURAL JOIN distributions) WHERE (distributions.public = true);


ALTER TABLE public.packages_public OWNER TO wbadm;

SET search_path = s390, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: s390; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 's390'::text);


ALTER TABLE s390.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: s390; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 's390'::text);


ALTER TABLE s390.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: s390; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 's390'::text);


ALTER TABLE s390.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: s390; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 's390'::text);


ALTER TABLE s390.users OWNER TO wbadm;

SET search_path = s390_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: s390_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 's390'::text));


ALTER TABLE s390_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: s390_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 's390'::text));


ALTER TABLE s390_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: s390_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 's390'::text));


ALTER TABLE s390_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: s390_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 's390'::text));


ALTER TABLE s390_public.users OWNER TO wbadm;

SET search_path = s390x, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: s390x; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 's390x'::text);


ALTER TABLE s390x.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: s390x; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 's390x'::text);


ALTER TABLE s390x.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: s390x; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 's390x'::text);


ALTER TABLE s390x.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: s390x; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 's390x'::text);


ALTER TABLE s390x.users OWNER TO wbadm;

SET search_path = s390x_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: s390x_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 's390x'::text));


ALTER TABLE s390x_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: s390x_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 's390x'::text));


ALTER TABLE s390x_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: s390x_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 's390x'::text));


ALTER TABLE s390x_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: s390x_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 's390x'::text));


ALTER TABLE s390x_public.users OWNER TO wbadm;

SET search_path = sparc, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: sparc; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages packages WHERE ((packages.architecture)::text = 'sparc'::text);


ALTER TABLE sparc.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: sparc; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM public.pkg_history WHERE ((pkg_history.architecture)::text = 'sparc'::text);


ALTER TABLE sparc.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: sparc; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions WHERE ((transactions.architecture)::text = 'sparc'::text);


ALTER TABLE sparc.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: sparc; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM public.users WHERE ((users.architecture)::text = 'sparc'::text);


ALTER TABLE sparc.users OWNER TO wbadm;

SET search_path = sparc_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: sparc_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM (public.packages NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((packages.architecture)::text = 'sparc'::text));


ALTER TABLE sparc_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: sparc_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder FROM (public.pkg_history NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((pkg_history.architecture)::text = 'sparc'::text));


ALTER TABLE sparc_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: sparc_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM (public.transactions NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((transactions.architecture)::text = 'sparc'::text));


ALTER TABLE sparc_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: sparc_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM (public.users NATURAL JOIN public.distributions) WHERE ((distributions.public = true) AND ((users.architecture)::text = 'sparc'::text));


ALTER TABLE sparc_public.users OWNER TO wbadm;

SET search_path = public, pg_catalog;

--
-- Name: architectures_pkey; Type: CONSTRAINT; Schema: public; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY architectures
    ADD CONSTRAINT architectures_pkey PRIMARY KEY (architecture);


--
-- Name: distribution_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY distribution_aliases
    ADD CONSTRAINT distribution_aliases_pkey PRIMARY KEY (alias);


--
-- Name: distribution_architectures_pkey; Type: CONSTRAINT; Schema: public; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY distribution_architectures
    ADD CONSTRAINT distribution_architectures_pkey PRIMARY KEY (distribution, architecture);


--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: public; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (architecture, package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: public; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (architecture, package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (architecture, username, distribution);


--
-- Name: distribution_unique; Type: INDEX; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE UNIQUE INDEX distribution_unique ON distributions USING btree (distribution);


--
-- Name: distributions_distribution; Type: INDEX; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE INDEX distributions_distribution ON distributions USING hash (distribution);


--
-- Name: packages_arch_dist_state; Type: INDEX; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE INDEX packages_arch_dist_state ON packages USING btree (architecture, distribution, upper((state)::text));


--
-- Name: packages_distribution_package; Type: INDEX; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE INDEX packages_distribution_package ON packages USING btree (distribution, package);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = alpha, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: alpha; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'alpha'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: alpha; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('alpha'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: alpha; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'alpha'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: alpha; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'alpha'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: alpha; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('alpha'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: alpha; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'alpha'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: alpha; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('alpha'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: alpha; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'alpha'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: alpha; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('alpha'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: alpha; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'alpha'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = amd64, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: amd64; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: amd64; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('amd64'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: amd64; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: amd64; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: amd64; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('amd64'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: amd64; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: amd64; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('amd64'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: amd64; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'amd64'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: amd64; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('amd64'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: amd64; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'amd64'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = arm, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: arm; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'arm'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: arm; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('arm'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: arm; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'arm'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: arm; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'arm'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: arm; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('arm'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: arm; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'arm'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: arm; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('arm'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: arm; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'arm'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: arm; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('arm'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: arm; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'arm'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = armel, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: armel; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'armel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: armel; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('armel'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: armel; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'armel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: armel; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'armel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: armel; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('armel'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: armel; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'armel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: armel; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('armel'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: armel; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'armel'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: armel; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('armel'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: armel; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'armel'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = armhf, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: armhf; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'armhf'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: armhf; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('armhf'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: armhf; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'armhf'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: armhf; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'armhf'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: armhf; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space) VALUES ('armhf'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);


--
-- Name: pkg_history_update; Type: RULE; Schema: armhf; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space WHERE ((((((p.architecture)::text = 'armhf'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: armhf; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('armhf'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: armhf; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'armhf'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: armhf; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('armhf'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: armhf; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'armhf'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = hppa, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: hppa; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'hppa'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: hppa; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('hppa'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: hppa; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'hppa'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: hppa; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'hppa'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: hppa; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('hppa'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: hppa; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'hppa'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: hppa; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('hppa'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: hppa; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'hppa'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: hppa; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('hppa'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: hppa; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'hppa'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = "hurd-i386", pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: hurd-i386; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'hurd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: hurd-i386; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('hurd-i386'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: hurd-i386; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'hurd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: hurd-i386; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'hurd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: hurd-i386; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('hurd-i386'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: hurd-i386; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'hurd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: hurd-i386; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('hurd-i386'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: hurd-i386; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'hurd-i386'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: hurd-i386; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('hurd-i386'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: hurd-i386; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'hurd-i386'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = i386, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: i386; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: i386; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('i386'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: i386; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: i386; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: i386; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('i386'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: i386; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: i386; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('i386'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: i386; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'i386'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: i386; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('i386'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: i386; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'i386'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = ia64, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: ia64; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'ia64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: ia64; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('ia64'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: ia64; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'ia64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: ia64; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'ia64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: ia64; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('ia64'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: ia64; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'ia64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: ia64; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('ia64'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: ia64; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'ia64'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: ia64; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('ia64'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: ia64; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'ia64'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = "kfreebsd-amd64", pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'kfreebsd-amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('kfreebsd-amd64'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'kfreebsd-amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'kfreebsd-amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('kfreebsd-amd64'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'kfreebsd-amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('kfreebsd-amd64'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'kfreebsd-amd64'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('kfreebsd-amd64'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: kfreebsd-amd64; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'kfreebsd-amd64'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = "kfreebsd-i386", pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'kfreebsd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('kfreebsd-i386'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'kfreebsd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'kfreebsd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('kfreebsd-i386'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'kfreebsd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('kfreebsd-i386'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'kfreebsd-i386'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('kfreebsd-i386'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: kfreebsd-i386; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'kfreebsd-i386'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = mips, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: mips; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'mips'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: mips; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('mips'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: mips; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'mips'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: mips; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'mips'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: mips; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('mips'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: mips; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'mips'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: mips; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('mips'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: mips; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'mips'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: mips; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('mips'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: mips; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'mips'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = mipsel, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: mipsel; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'mipsel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: mipsel; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('mipsel'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: mipsel; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'mipsel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: mipsel; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'mipsel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: mipsel; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('mipsel'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: mipsel; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'mipsel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: mipsel; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('mipsel'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: mipsel; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'mipsel'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: mipsel; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('mipsel'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: mipsel; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'mipsel'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = powerpc, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: powerpc; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'powerpc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: powerpc; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('powerpc'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: powerpc; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'powerpc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: powerpc; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'powerpc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: powerpc; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('powerpc'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: powerpc; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'powerpc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: powerpc; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('powerpc'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: powerpc; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'powerpc'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: powerpc; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('powerpc'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: powerpc; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'powerpc'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = s390, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: s390; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 's390'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: s390; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('s390'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: s390; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 's390'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: s390; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 's390'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: s390; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('s390'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: s390; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 's390'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: s390; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('s390'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: s390; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 's390'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: s390; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('s390'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: s390; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 's390'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = s390x, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: s390x; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 's390x'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: s390x; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('s390x'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: s390x; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 's390x'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: s390x; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 's390x'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: s390x; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space) VALUES ('s390x'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);


--
-- Name: pkg_history_update; Type: RULE; Schema: s390x; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space WHERE ((((((p.architecture)::text = 's390x'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: s390x; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('s390x'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: s390x; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 's390x'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: s390x; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('s390x'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: s390x; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 's390x'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = sparc, pg_catalog;

--
-- Name: packages_delete; Type: RULE; Schema: sparc; Owner: wbadm
--

CREATE RULE packages_delete AS ON DELETE TO packages DO INSTEAD DELETE FROM public.packages p WHERE ((((p.architecture)::text = 'sparc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: packages_insert; Type: RULE; Schema: sparc; Owner: wbadm
--

CREATE RULE packages_insert AS ON INSERT TO packages DO INSTEAD INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all) VALUES ('sparc'::character varying, new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);


--
-- Name: packages_update; Type: RULE; Schema: sparc; Owner: wbadm
--

CREATE RULE packages_update AS ON UPDATE TO packages DO INSTEAD UPDATE public.packages p SET version = new.version, state = new.state, section = new.section, priority = new.priority, installed_version = new.installed_version, previous_state = new.previous_state, state_change = new.state_change, notes = new.notes, builder = new.builder, failed = new.failed, old_failed = new.old_failed, binary_nmu_version = new.binary_nmu_version, binary_nmu_changelog = new.binary_nmu_changelog, failed_category = new.failed_category, permbuildpri = new.permbuildpri, buildpri = new.buildpri, depends = new.depends, rel = new.rel, bd_problem = new.bd_problem, extra_depends = new.extra_depends, extra_conflicts = new.extra_conflicts, build_arch_all = new.build_arch_all WHERE ((((p.architecture)::text = 'sparc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text));


--
-- Name: pkg_history_delete; Type: RULE; Schema: sparc; Owner: wbadm
--

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'sparc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: pkg_history_insert; Type: RULE; Schema: sparc; Owner: wbadm
--

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('sparc'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);


--
-- Name: pkg_history_update; Type: RULE; Schema: sparc; Owner: wbadm
--

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'sparc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));


--
-- Name: transactions_insert; Type: RULE; Schema: sparc; Owner: wbadm
--

CREATE RULE transactions_insert AS ON INSERT TO transactions DO INSTEAD INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time") VALUES ('sparc'::character varying, new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new."time");


--
-- Name: users_delete; Type: RULE; Schema: sparc; Owner: wbadm
--

CREATE RULE users_delete AS ON DELETE TO users DO INSTEAD DELETE FROM public.users u WHERE ((((u.architecture)::text = 'sparc'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


--
-- Name: users_insert; Type: RULE; Schema: sparc; Owner: wbadm
--

CREATE RULE users_insert AS ON INSERT TO users DO INSTEAD INSERT INTO public.users (architecture, username, distribution, last_seen) VALUES ('sparc'::character varying, new.username, new.distribution, new.last_seen);


--
-- Name: users_update; Type: RULE; Schema: sparc; Owner: wbadm
--

CREATE RULE users_update AS ON UPDATE TO users DO INSTEAD UPDATE public.users u SET last_seen = new.last_seen WHERE ((((u.architecture)::text = 'sparc'::text) AND ((u.distribution)::text = (old.distribution)::text)) AND ((u.username)::text = (old.username)::text));


SET search_path = public, pg_catalog;

--
-- Name: distribution_aliases_distribution_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wbadm
--

ALTER TABLE ONLY distribution_aliases
    ADD CONSTRAINT distribution_aliases_distribution_fkey FOREIGN KEY (distribution) REFERENCES distributions(distribution);


--
-- Name: distribution_architecture_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT distribution_architecture_fkey FOREIGN KEY (distribution, architecture) REFERENCES distribution_architectures(distribution, architecture);


--
-- Name: packages_architecture_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_architecture_fkey FOREIGN KEY (architecture) REFERENCES architectures(architecture);


--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES distributions(distribution);


--
-- Name: pkg_history_distribution_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fkey FOREIGN KEY (distribution) REFERENCES distributions(distribution);


--
-- Name: alpha; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA alpha FROM PUBLIC;
REVOKE ALL ON SCHEMA alpha FROM wbadm;
GRANT ALL ON SCHEMA alpha TO wbadm;
GRANT USAGE ON SCHEMA alpha TO alpha;
GRANT USAGE ON SCHEMA alpha TO wb_all;
GRANT USAGE ON SCHEMA alpha TO wb_security;


--
-- Name: alpha_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA alpha_public FROM PUBLIC;
REVOKE ALL ON SCHEMA alpha_public FROM wbadm;
GRANT ALL ON SCHEMA alpha_public TO wbadm;
GRANT USAGE ON SCHEMA alpha_public TO alpha;
GRANT USAGE ON SCHEMA alpha_public TO PUBLIC;


--
-- Name: amd64; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA amd64 FROM PUBLIC;
REVOKE ALL ON SCHEMA amd64 FROM wbadm;
GRANT ALL ON SCHEMA amd64 TO wbadm;
GRANT USAGE ON SCHEMA amd64 TO amd64;
GRANT USAGE ON SCHEMA amd64 TO wb_all;
GRANT USAGE ON SCHEMA amd64 TO wb_security;


--
-- Name: amd64_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA amd64_public FROM PUBLIC;
REVOKE ALL ON SCHEMA amd64_public FROM wbadm;
GRANT ALL ON SCHEMA amd64_public TO wbadm;
GRANT USAGE ON SCHEMA amd64_public TO amd64;
GRANT USAGE ON SCHEMA amd64_public TO PUBLIC;


--
-- Name: arm; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA arm FROM PUBLIC;
REVOKE ALL ON SCHEMA arm FROM wbadm;
GRANT ALL ON SCHEMA arm TO wbadm;
GRANT USAGE ON SCHEMA arm TO arm;
GRANT USAGE ON SCHEMA arm TO wb_all;
GRANT USAGE ON SCHEMA arm TO wb_security;


--
-- Name: arm_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA arm_public FROM PUBLIC;
REVOKE ALL ON SCHEMA arm_public FROM wbadm;
GRANT ALL ON SCHEMA arm_public TO wbadm;
GRANT USAGE ON SCHEMA arm_public TO arm;
GRANT USAGE ON SCHEMA arm_public TO PUBLIC;


--
-- Name: armel; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA armel FROM PUBLIC;
REVOKE ALL ON SCHEMA armel FROM wbadm;
GRANT ALL ON SCHEMA armel TO wbadm;
GRANT USAGE ON SCHEMA armel TO armel;
GRANT USAGE ON SCHEMA armel TO wb_all;
GRANT USAGE ON SCHEMA armel TO wb_security;


--
-- Name: armel_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA armel_public FROM PUBLIC;
REVOKE ALL ON SCHEMA armel_public FROM wbadm;
GRANT ALL ON SCHEMA armel_public TO wbadm;
GRANT USAGE ON SCHEMA armel_public TO armel;
GRANT USAGE ON SCHEMA armel_public TO PUBLIC;


--
-- Name: armhf; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA armhf FROM PUBLIC;
REVOKE ALL ON SCHEMA armhf FROM wbadm;
GRANT ALL ON SCHEMA armhf TO wbadm;
GRANT USAGE ON SCHEMA armhf TO wb_all;
GRANT USAGE ON SCHEMA armhf TO wb_security;


--
-- Name: armhf_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA armhf_public FROM PUBLIC;
REVOKE ALL ON SCHEMA armhf_public FROM wbadm;
GRANT ALL ON SCHEMA armhf_public TO wbadm;
GRANT USAGE ON SCHEMA armhf_public TO PUBLIC;


--
-- Name: hppa; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA hppa FROM PUBLIC;
REVOKE ALL ON SCHEMA hppa FROM wbadm;
GRANT ALL ON SCHEMA hppa TO wbadm;
GRANT USAGE ON SCHEMA hppa TO hppa;
GRANT USAGE ON SCHEMA hppa TO wb_all;
GRANT USAGE ON SCHEMA hppa TO wb_security;


--
-- Name: hppa_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA hppa_public FROM PUBLIC;
REVOKE ALL ON SCHEMA hppa_public FROM wbadm;
GRANT ALL ON SCHEMA hppa_public TO wbadm;
GRANT USAGE ON SCHEMA hppa_public TO hppa;
GRANT USAGE ON SCHEMA hppa_public TO PUBLIC;


--
-- Name: hurd-i386; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA "hurd-i386" FROM PUBLIC;
REVOKE ALL ON SCHEMA "hurd-i386" FROM wbadm;
GRANT ALL ON SCHEMA "hurd-i386" TO wbadm;
GRANT USAGE ON SCHEMA "hurd-i386" TO "hurd-i386";
GRANT USAGE ON SCHEMA "hurd-i386" TO wb_all;
GRANT USAGE ON SCHEMA "hurd-i386" TO wb_security;


--
-- Name: hurd-i386_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA "hurd-i386_public" FROM PUBLIC;
REVOKE ALL ON SCHEMA "hurd-i386_public" FROM wbadm;
GRANT ALL ON SCHEMA "hurd-i386_public" TO wbadm;
GRANT USAGE ON SCHEMA "hurd-i386_public" TO "hurd-i386";
GRANT USAGE ON SCHEMA "hurd-i386_public" TO PUBLIC;


--
-- Name: i386; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA i386 FROM PUBLIC;
REVOKE ALL ON SCHEMA i386 FROM wbadm;
GRANT ALL ON SCHEMA i386 TO wbadm;
GRANT USAGE ON SCHEMA i386 TO i386;
GRANT USAGE ON SCHEMA i386 TO wb_all;
GRANT USAGE ON SCHEMA i386 TO wb_security;


--
-- Name: i386_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA i386_public FROM PUBLIC;
REVOKE ALL ON SCHEMA i386_public FROM wbadm;
GRANT ALL ON SCHEMA i386_public TO wbadm;
GRANT USAGE ON SCHEMA i386_public TO i386;
GRANT USAGE ON SCHEMA i386_public TO PUBLIC;


--
-- Name: ia64; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA ia64 FROM PUBLIC;
REVOKE ALL ON SCHEMA ia64 FROM wbadm;
GRANT ALL ON SCHEMA ia64 TO wbadm;
GRANT USAGE ON SCHEMA ia64 TO ia64;
GRANT USAGE ON SCHEMA ia64 TO wb_all;
GRANT USAGE ON SCHEMA ia64 TO wb_security;


--
-- Name: ia64_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA ia64_public FROM PUBLIC;
REVOKE ALL ON SCHEMA ia64_public FROM wbadm;
GRANT ALL ON SCHEMA ia64_public TO wbadm;
GRANT USAGE ON SCHEMA ia64_public TO ia64;
GRANT USAGE ON SCHEMA ia64_public TO PUBLIC;


--
-- Name: kfreebsd-amd64; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA "kfreebsd-amd64" FROM PUBLIC;
REVOKE ALL ON SCHEMA "kfreebsd-amd64" FROM wbadm;
GRANT ALL ON SCHEMA "kfreebsd-amd64" TO wbadm;
GRANT USAGE ON SCHEMA "kfreebsd-amd64" TO "kfreebsd-amd64";
GRANT USAGE ON SCHEMA "kfreebsd-amd64" TO wb_all;
GRANT USAGE ON SCHEMA "kfreebsd-amd64" TO wb_security;


--
-- Name: kfreebsd-amd64_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA "kfreebsd-amd64_public" FROM PUBLIC;
REVOKE ALL ON SCHEMA "kfreebsd-amd64_public" FROM wbadm;
GRANT ALL ON SCHEMA "kfreebsd-amd64_public" TO wbadm;
GRANT USAGE ON SCHEMA "kfreebsd-amd64_public" TO "kfreebsd-amd64";
GRANT USAGE ON SCHEMA "kfreebsd-amd64_public" TO PUBLIC;


--
-- Name: kfreebsd-i386; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA "kfreebsd-i386" FROM PUBLIC;
REVOKE ALL ON SCHEMA "kfreebsd-i386" FROM wbadm;
GRANT ALL ON SCHEMA "kfreebsd-i386" TO wbadm;
GRANT USAGE ON SCHEMA "kfreebsd-i386" TO "kfreebsd-i386";
GRANT USAGE ON SCHEMA "kfreebsd-i386" TO wb_all;
GRANT USAGE ON SCHEMA "kfreebsd-i386" TO wb_security;


--
-- Name: kfreebsd-i386_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA "kfreebsd-i386_public" FROM PUBLIC;
REVOKE ALL ON SCHEMA "kfreebsd-i386_public" FROM wbadm;
GRANT ALL ON SCHEMA "kfreebsd-i386_public" TO wbadm;
GRANT USAGE ON SCHEMA "kfreebsd-i386_public" TO "kfreebsd-i386";
GRANT USAGE ON SCHEMA "kfreebsd-i386_public" TO PUBLIC;


--
-- Name: mips; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA mips FROM PUBLIC;
REVOKE ALL ON SCHEMA mips FROM wbadm;
GRANT ALL ON SCHEMA mips TO wbadm;
GRANT USAGE ON SCHEMA mips TO mips;
GRANT USAGE ON SCHEMA mips TO wb_all;
GRANT USAGE ON SCHEMA mips TO wb_security;


--
-- Name: mips_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA mips_public FROM PUBLIC;
REVOKE ALL ON SCHEMA mips_public FROM wbadm;
GRANT ALL ON SCHEMA mips_public TO wbadm;
GRANT USAGE ON SCHEMA mips_public TO mips;
GRANT USAGE ON SCHEMA mips_public TO PUBLIC;


--
-- Name: mipsel; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA mipsel FROM PUBLIC;
REVOKE ALL ON SCHEMA mipsel FROM wbadm;
GRANT ALL ON SCHEMA mipsel TO wbadm;
GRANT USAGE ON SCHEMA mipsel TO mipsel;
GRANT USAGE ON SCHEMA mipsel TO wb_all;
GRANT USAGE ON SCHEMA mipsel TO wb_security;


--
-- Name: mipsel_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA mipsel_public FROM PUBLIC;
REVOKE ALL ON SCHEMA mipsel_public FROM wbadm;
GRANT ALL ON SCHEMA mipsel_public TO wbadm;
GRANT USAGE ON SCHEMA mipsel_public TO mipsel;
GRANT USAGE ON SCHEMA mipsel_public TO PUBLIC;


--
-- Name: powerpc; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA powerpc FROM PUBLIC;
REVOKE ALL ON SCHEMA powerpc FROM wbadm;
GRANT ALL ON SCHEMA powerpc TO wbadm;
GRANT USAGE ON SCHEMA powerpc TO powerpc;
GRANT USAGE ON SCHEMA powerpc TO wb_all;
GRANT USAGE ON SCHEMA powerpc TO wb_security;


--
-- Name: powerpc_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA powerpc_public FROM PUBLIC;
REVOKE ALL ON SCHEMA powerpc_public FROM wbadm;
GRANT ALL ON SCHEMA powerpc_public TO wbadm;
GRANT USAGE ON SCHEMA powerpc_public TO powerpc;
GRANT USAGE ON SCHEMA powerpc_public TO PUBLIC;


--
-- Name: public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM wbadm;
GRANT ALL ON SCHEMA public TO wbadm;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: s390; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA s390 FROM PUBLIC;
REVOKE ALL ON SCHEMA s390 FROM wbadm;
GRANT ALL ON SCHEMA s390 TO wbadm;
GRANT USAGE ON SCHEMA s390 TO s390;
GRANT USAGE ON SCHEMA s390 TO wb_all;
GRANT USAGE ON SCHEMA s390 TO wb_security;


--
-- Name: s390_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA s390_public FROM PUBLIC;
REVOKE ALL ON SCHEMA s390_public FROM wbadm;
GRANT ALL ON SCHEMA s390_public TO wbadm;
GRANT USAGE ON SCHEMA s390_public TO s390;
GRANT USAGE ON SCHEMA s390_public TO PUBLIC;


--
-- Name: s390x; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA s390x FROM PUBLIC;
REVOKE ALL ON SCHEMA s390x FROM wbadm;
GRANT ALL ON SCHEMA s390x TO wbadm;
GRANT USAGE ON SCHEMA s390x TO wb_all;
GRANT USAGE ON SCHEMA s390x TO wb_security;


--
-- Name: s390x_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA s390x_public FROM PUBLIC;
REVOKE ALL ON SCHEMA s390x_public FROM wbadm;
GRANT ALL ON SCHEMA s390x_public TO wbadm;
GRANT USAGE ON SCHEMA s390x_public TO PUBLIC;


--
-- Name: sparc; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA sparc FROM PUBLIC;
REVOKE ALL ON SCHEMA sparc FROM wbadm;
GRANT ALL ON SCHEMA sparc TO wbadm;
GRANT USAGE ON SCHEMA sparc TO sparc;
GRANT USAGE ON SCHEMA sparc TO wb_all;
GRANT USAGE ON SCHEMA sparc TO wb_security;


--
-- Name: sparc_public; Type: ACL; Schema: -; Owner: wbadm
--

REVOKE ALL ON SCHEMA sparc_public FROM PUBLIC;
REVOKE ALL ON SCHEMA sparc_public FROM wbadm;
GRANT ALL ON SCHEMA sparc_public TO wbadm;
GRANT USAGE ON SCHEMA sparc_public TO sparc;
GRANT USAGE ON SCHEMA sparc_public TO PUBLIC;


--
-- Name: packages; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;


SET search_path = alpha, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: alpha; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


SET search_path = public, pg_catalog;

--
-- Name: pkg_history; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;


SET search_path = alpha, pg_catalog;

--
-- Name: pkg_history; Type: ACL; Schema: alpha; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


SET search_path = public, pg_catalog;

--
-- Name: transactions; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;


SET search_path = alpha, pg_catalog;

--
-- Name: transactions; Type: ACL; Schema: alpha; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


SET search_path = public, pg_catalog;

--
-- Name: users; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;


SET search_path = alpha, pg_catalog;

--
-- Name: users; Type: ACL; Schema: alpha; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = public, pg_catalog;

--
-- Name: distributions; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE distributions FROM PUBLIC;
REVOKE ALL ON TABLE distributions FROM wbadm;
GRANT ALL ON TABLE distributions TO wbadm;
GRANT SELECT ON TABLE distributions TO PUBLIC;


SET search_path = alpha_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: alpha_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: alpha_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: alpha_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: alpha_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = amd64, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: amd64; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: amd64; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: amd64; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: amd64; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = amd64_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: amd64_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: amd64_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: amd64_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: amd64_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = arm, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: arm; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: arm; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: arm; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: arm; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = arm_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: arm_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: arm_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: arm_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: arm_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = armel, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: armel; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: armel; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: armel; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: armel; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = armel_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: armel_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: armel_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: armel_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: armel_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = armhf, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: armhf; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: armhf; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: armhf; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: armhf; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = armhf_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: armhf_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: armhf_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: armhf_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: armhf_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = hppa, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: hppa; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: hppa; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: hppa; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: hppa; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = hppa_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: hppa_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: hppa_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: hppa_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: hppa_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = "hurd-i386", pg_catalog;

--
-- Name: packages; Type: ACL; Schema: hurd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: hurd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: hurd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: hurd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = "hurd-i386_public", pg_catalog;

--
-- Name: packages; Type: ACL; Schema: hurd-i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: hurd-i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: hurd-i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: hurd-i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = i386, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: i386; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: i386; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: i386; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: i386; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = i386_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = ia64, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: ia64; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: ia64; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: ia64; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: ia64; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = ia64_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: ia64_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: ia64_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: ia64_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: ia64_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = "kfreebsd-amd64", pg_catalog;

--
-- Name: packages; Type: ACL; Schema: kfreebsd-amd64; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: kfreebsd-amd64; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: kfreebsd-amd64; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: kfreebsd-amd64; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = "kfreebsd-amd64_public", pg_catalog;

--
-- Name: packages; Type: ACL; Schema: kfreebsd-amd64_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: kfreebsd-amd64_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: kfreebsd-amd64_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: kfreebsd-amd64_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = "kfreebsd-i386", pg_catalog;

--
-- Name: packages; Type: ACL; Schema: kfreebsd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: kfreebsd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: kfreebsd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: kfreebsd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = "kfreebsd-i386_public", pg_catalog;

--
-- Name: packages; Type: ACL; Schema: kfreebsd-i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: kfreebsd-i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: kfreebsd-i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: kfreebsd-i386_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = mips, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: mips; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: mips; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: mips; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: mips; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = mips_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: mips_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: mips_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: mips_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: mips_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = mipsel, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: mipsel; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: mipsel; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: mipsel; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: mipsel; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = mipsel_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: mipsel_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: mipsel_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: mipsel_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: mipsel_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = powerpc, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: powerpc; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: powerpc; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: powerpc; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: powerpc; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = powerpc_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: powerpc_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: powerpc_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: powerpc_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: powerpc_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = public, pg_catalog;

--
-- Name: architectures; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE architectures FROM PUBLIC;
REVOKE ALL ON TABLE architectures FROM wbadm;
GRANT ALL ON TABLE architectures TO wbadm;
GRANT SELECT ON TABLE architectures TO PUBLIC;


--
-- Name: distribution_aliases; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE distribution_aliases FROM PUBLIC;
REVOKE ALL ON TABLE distribution_aliases FROM wbadm;
GRANT ALL ON TABLE distribution_aliases TO wbadm;
GRANT SELECT ON TABLE distribution_aliases TO PUBLIC;


--
-- Name: distribution_architectures; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE distribution_architectures FROM PUBLIC;
REVOKE ALL ON TABLE distribution_architectures FROM wbadm;
GRANT ALL ON TABLE distribution_architectures TO wbadm;
GRANT SELECT ON TABLE distribution_architectures TO PUBLIC;


--
-- Name: distribution_architectures_statistics; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE distribution_architectures_statistics FROM PUBLIC;
REVOKE ALL ON TABLE distribution_architectures_statistics FROM wbadm;
GRANT ALL ON TABLE distribution_architectures_statistics TO wbadm;
GRANT SELECT ON TABLE distribution_architectures_statistics TO PUBLIC;


--
-- Name: lastlog; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE lastlog FROM PUBLIC;
REVOKE ALL ON TABLE lastlog FROM wbadm;
GRANT ALL ON TABLE lastlog TO wbadm;
GRANT SELECT ON TABLE lastlog TO PUBLIC;


--
-- Name: locks; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE locks FROM PUBLIC;
REVOKE ALL ON TABLE locks FROM wbadm;
GRANT ALL ON TABLE locks TO wbadm;
GRANT SELECT ON TABLE locks TO PUBLIC;
GRANT UPDATE ON TABLE locks TO wb_all;


--
-- Name: log; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE log FROM PUBLIC;
REVOKE ALL ON TABLE log FROM wbadm;
GRANT ALL ON TABLE log TO wbadm;
GRANT SELECT ON TABLE log TO PUBLIC;


--
-- Name: packages_all; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE packages_all FROM PUBLIC;
REVOKE ALL ON TABLE packages_all FROM wbadm;
GRANT ALL ON TABLE packages_all TO wbadm;
GRANT SELECT ON TABLE packages_all TO PUBLIC;


--
-- Name: packages_public; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE packages_public FROM PUBLIC;
REVOKE ALL ON TABLE packages_public FROM wbadm;
GRANT ALL ON TABLE packages_public TO wbadm;
GRANT SELECT ON TABLE packages_public TO PUBLIC;


SET search_path = s390, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: s390; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: s390; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: s390; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: s390; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = s390_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: s390_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: s390_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: s390_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: s390_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = s390x, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: s390x; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: s390x; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: s390x; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: s390x; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = s390x_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: s390x_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: s390x_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: s390x_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: s390x_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


SET search_path = sparc, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: sparc; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE packages TO wb_all;


--
-- Name: pkg_history; Type: ACL; Schema: sparc; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE pkg_history TO wb_all;


--
-- Name: transactions; Type: ACL; Schema: sparc; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO wb_security;
GRANT SELECT,INSERT ON TABLE transactions TO wb_all;


--
-- Name: users; Type: ACL; Schema: sparc; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO wb_security;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO wb_all;


SET search_path = sparc_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: sparc_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


--
-- Name: pkg_history; Type: ACL; Schema: sparc_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


--
-- Name: transactions; Type: ACL; Schema: sparc_public; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT ON TABLE transactions TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: sparc_public; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT SELECT ON TABLE users TO PUBLIC;


--
-- PostgreSQL database dump complete
--

