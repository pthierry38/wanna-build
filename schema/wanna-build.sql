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
DECLARE
	temp_row RECORD;
BEGIN
        SELECT 'alpha'::character varying AS arch, * INTO temp_row FROM "alpha_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'amd64'::character varying AS arch, * INTO temp_row FROM "amd64_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'arm'::character varying AS arch, * INTO temp_row FROM "arm_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'armel'::character varying AS arch, * INTO temp_row FROM "armel_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'hppa'::character varying AS arch, * INTO temp_row FROM "hppa_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'hurd-i386'::character varying AS arch, * INTO temp_row FROM "hurd-i386_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'i386'::character varying AS arch, * INTO temp_row FROM "i386_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'ia64'::character varying AS arch, * INTO temp_row FROM "ia64_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'kfreebsd-amd64'::character varying AS arch, * INTO temp_row FROM "kfreebsd-amd64_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'freebsd-i386'::character varying AS arch, * INTO temp_row FROM "kfreebsd-i386_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'mips'::character varying AS arch, * INTO temp_row FROM "mips_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'mipsel'::character varying AS arch, * INTO temp_row FROM "mipsel_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'powerpc'::character varying AS arch, * INTO temp_row FROM "powerpc_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 's390'::character varying AS arch, * INTO temp_row FROM "s390_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
        SELECT 'sparc'::character varying AS arch, * INTO temp_row FROM "sparc_public".packages WHERE distribution = param_dist AND package = param_srcpkg;
	IF FOUND THEN
	        RETURN NEXT temp_row;
	END IF;
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


SET search_path = alpha, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: packages; Type: TABLE; Schema: alpha; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE alpha.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: alpha; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE alpha.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: alpha; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE alpha.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: alpha; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE alpha.users OWNER TO wbadm;

SET search_path = alpha_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: alpha_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM alpha.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE alpha_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: alpha_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM alpha.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE alpha_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: alpha_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM alpha.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE alpha_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: alpha_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM alpha.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE alpha_public.users OWNER TO wbadm;

SET search_path = amd64, pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: amd64; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE amd64.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: amd64; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE amd64.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: amd64; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE amd64.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: amd64; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE amd64.users OWNER TO wbadm;

SET search_path = amd64_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: amd64_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM amd64.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE amd64_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: amd64_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM amd64.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE amd64_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: amd64_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM amd64.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE amd64_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: amd64_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM amd64.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE amd64_public.users OWNER TO wbadm;

SET search_path = arm, pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: arm; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE arm.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: arm; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE arm.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: arm; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE arm.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: arm; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE arm.users OWNER TO wbadm;

SET search_path = arm_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: arm_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM arm.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE arm_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: arm_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM arm.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE arm_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: arm_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM arm.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE arm_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: arm_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM arm.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE arm_public.users OWNER TO wbadm;

SET search_path = armel, pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: armel; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE armel.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: armel; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE armel.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: armel; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE armel.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: armel; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE armel.users OWNER TO wbadm;

SET search_path = armel_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: armel_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM armel.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE armel_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: armel_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM armel.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE armel_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: armel_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM armel.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE armel_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: armel_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM armel.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE armel_public.users OWNER TO wbadm;

SET search_path = hppa, pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: hppa; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE hppa.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: hppa; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE hppa.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: hppa; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE hppa.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: hppa; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE hppa.users OWNER TO wbadm;

SET search_path = hppa_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: hppa_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM hppa.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE hppa_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: hppa_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM hppa.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE hppa_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: hppa_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM hppa.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE hppa_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: hppa_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM hppa.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE hppa_public.users OWNER TO wbadm;

SET search_path = "hurd-i386", pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: hurd-i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE "hurd-i386".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: hurd-i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE "hurd-i386".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: hurd-i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE "hurd-i386".transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: hurd-i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE "hurd-i386".users OWNER TO wbadm;

SET search_path = "hurd-i386_public", pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: hurd-i386_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM "hurd-i386".packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE "hurd-i386_public".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: hurd-i386_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM "hurd-i386".pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE "hurd-i386_public".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: hurd-i386_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM "hurd-i386".transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE "hurd-i386_public".transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: hurd-i386_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM "hurd-i386".users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE "hurd-i386_public".users OWNER TO wbadm;

SET search_path = i386, pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE i386.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE i386.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE i386.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE i386.users OWNER TO wbadm;

SET search_path = i386_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: i386_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM i386.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE i386_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: i386_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM i386.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE i386_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: i386_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM i386.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE i386_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: i386_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM i386.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE i386_public.users OWNER TO wbadm;

SET search_path = ia64, pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: ia64; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE ia64.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: ia64; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE ia64.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: ia64; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE ia64.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: ia64; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE ia64.users OWNER TO wbadm;

SET search_path = ia64_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: ia64_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM ia64.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE ia64_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: ia64_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM ia64.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE ia64_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: ia64_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM ia64.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE ia64_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: ia64_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM ia64.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE ia64_public.users OWNER TO wbadm;

SET search_path = "kfreebsd-amd64", pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: kfreebsd-amd64; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE "kfreebsd-amd64".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: kfreebsd-amd64; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE "kfreebsd-amd64".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: kfreebsd-amd64; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE "kfreebsd-amd64".transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: kfreebsd-amd64; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE "kfreebsd-amd64".users OWNER TO wbadm;

SET search_path = "kfreebsd-amd64_public", pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: kfreebsd-amd64_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM "kfreebsd-amd64".packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE "kfreebsd-amd64_public".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: kfreebsd-amd64_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM "kfreebsd-amd64".pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE "kfreebsd-amd64_public".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: kfreebsd-amd64_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM "kfreebsd-amd64".transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE "kfreebsd-amd64_public".transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: kfreebsd-amd64_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM "kfreebsd-amd64".users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE "kfreebsd-amd64_public".users OWNER TO wbadm;

SET search_path = "kfreebsd-i386", pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: kfreebsd-i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE "kfreebsd-i386".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: kfreebsd-i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE "kfreebsd-i386".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: kfreebsd-i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE "kfreebsd-i386".transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: kfreebsd-i386; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE "kfreebsd-i386".users OWNER TO wbadm;

SET search_path = "kfreebsd-i386_public", pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: kfreebsd-i386_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM "kfreebsd-i386".packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE "kfreebsd-i386_public".packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: kfreebsd-i386_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM "kfreebsd-i386".pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE "kfreebsd-i386_public".pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: kfreebsd-i386_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM "kfreebsd-i386".transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE "kfreebsd-i386_public".transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: kfreebsd-i386_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM "kfreebsd-i386".users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE "kfreebsd-i386_public".users OWNER TO wbadm;

SET search_path = mips, pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: mips; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE mips.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: mips; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE mips.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: mips; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE mips.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: mips; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE mips.users OWNER TO wbadm;

SET search_path = mips_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: mips_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM mips.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE mips_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: mips_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM mips.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE mips_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: mips_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM mips.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE mips_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: mips_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM mips.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE mips_public.users OWNER TO wbadm;

SET search_path = mipsel, pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: mipsel; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE mipsel.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: mipsel; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE mipsel.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: mipsel; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE mipsel.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: mipsel; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE mipsel.users OWNER TO wbadm;

SET search_path = mipsel_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: mipsel_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM mipsel.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE mipsel_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: mipsel_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM mipsel.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE mipsel_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: mipsel_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM mipsel.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE mipsel_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: mipsel_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM mipsel.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE mipsel_public.users OWNER TO wbadm;

SET search_path = powerpc, pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: powerpc; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE powerpc.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: TABLE; Schema: powerpc; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE powerpc.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: TABLE; Schema: powerpc; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE powerpc.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: powerpc; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE powerpc.users OWNER TO wbadm;

SET search_path = powerpc_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: powerpc_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM powerpc.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE powerpc_public.packages OWNER TO wbadm;

--
-- Name: pkg_history; Type: VIEW; Schema: powerpc_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM powerpc.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE powerpc_public.pkg_history OWNER TO wbadm;

--
-- Name: transactions; Type: VIEW; Schema: powerpc_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM powerpc.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE powerpc_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: powerpc_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM powerpc.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE powerpc_public.users OWNER TO wbadm;

SET search_path = public, pg_catalog;

--
-- Name: distribution_aliases; Type: TABLE; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE TABLE distribution_aliases (
    alias character varying NOT NULL,
    distribution character varying NOT NULL
);


ALTER TABLE public.distribution_aliases OWNER TO wbadm;

SET search_path = s390, pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: s390; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE s390.packages OWNER TO wbadm;

SET search_path = sparc, pg_catalog;

--
-- Name: packages; Type: TABLE; Schema: sparc; Owner: wbadm; Tablespace: 
--

CREATE TABLE packages (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying,
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
    extra_conflicts character varying
);


ALTER TABLE sparc.packages OWNER TO wbadm;

SET search_path = public, pg_catalog;

--
-- Name: distribution_architectures; Type: VIEW; Schema: public; Owner: wbadm
--

CREATE VIEW distribution_architectures AS
    (((((((((((((SELECT DISTINCT packages.distribution, 'alpha'::character varying AS architecture FROM alpha.packages UNION SELECT DISTINCT packages.distribution, 'amd64'::character varying AS architecture FROM amd64.packages) UNION SELECT DISTINCT packages.distribution, 'arm'::character varying AS architecture FROM arm.packages) UNION SELECT DISTINCT packages.distribution, 'armel'::character varying AS architecture FROM armel.packages) UNION SELECT DISTINCT packages.distribution, 'hppa'::character varying AS architecture FROM hppa.packages) UNION SELECT DISTINCT packages.distribution, 'hurd-i386'::character varying AS architecture FROM "hurd-i386".packages) UNION SELECT DISTINCT packages.distribution, 'i386'::character varying AS architecture FROM i386.packages) UNION SELECT DISTINCT packages.distribution, 'ia64'::character varying AS architecture FROM ia64.packages) UNION SELECT DISTINCT packages.distribution, 'kfreebsd-amd64'::character varying AS architecture FROM "kfreebsd-amd64".packages) UNION SELECT DISTINCT packages.distribution, 'kfreebsd-i386'::character varying AS architecture FROM "kfreebsd-i386".packages) UNION SELECT DISTINCT packages.distribution, 'mips'::character varying AS architecture FROM mips.packages) UNION SELECT DISTINCT packages.distribution, 'mipsel'::character varying AS architecture FROM mipsel.packages) UNION SELECT DISTINCT packages.distribution, 'powerpc'::character varying AS architecture FROM powerpc.packages) UNION SELECT DISTINCT packages.distribution, 's390'::character varying AS architecture FROM s390.packages) UNION SELECT DISTINCT packages.distribution, 'sparc'::character varying AS architecture FROM sparc.packages;


ALTER TABLE public.distribution_architectures OWNER TO wbadm;

--
-- Name: distributions; Type: TABLE; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE TABLE distributions (
    distribution character varying NOT NULL,
    public boolean DEFAULT true NOT NULL,
    sort_order integer DEFAULT 0,
    auto_dep_wait boolean DEFAULT true
);


ALTER TABLE public.distributions OWNER TO wbadm;

SET search_path = s390, pg_catalog;

--
-- Name: pkg_history; Type: TABLE; Schema: s390; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE s390.pkg_history OWNER TO wbadm;

SET search_path = s390_public, pg_catalog;

--
-- Name: pkg_history; Type: VIEW; Schema: s390_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM s390.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE s390_public.pkg_history OWNER TO wbadm;

SET search_path = sparc, pg_catalog;

--
-- Name: pkg_history; Type: TABLE; Schema: sparc; Owner: wbadm; Tablespace: 
--

CREATE TABLE pkg_history (
    package character varying NOT NULL,
    distribution character varying NOT NULL,
    version character varying NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint
);


ALTER TABLE sparc.pkg_history OWNER TO wbadm;

SET search_path = sparc_public, pg_catalog;

--
-- Name: pkg_history; Type: VIEW; Schema: sparc_public; Owner: wbadm
--

CREATE VIEW pkg_history AS
    SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM sparc.pkg_history WHERE ((pkg_history.distribution)::text !~~ '%-security'::text);


ALTER TABLE sparc_public.pkg_history OWNER TO wbadm;

SET search_path = public, pg_catalog;

--
-- Name: lastlog; Type: VIEW; Schema: public; Owner: wbadm
--

CREATE VIEW lastlog AS
    ((((((((((((((SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'alpha'::character varying AS architecture FROM alpha_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'amd64'::character varying AS architecture FROM amd64_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'arm'::character varying AS architecture FROM arm_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'armel'::character varying AS architecture FROM armel_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'hppa'::character varying AS architecture FROM hppa_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'hurd-i386'::character varying AS architecture FROM "hurd-i386_public".pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'i386'::character varying AS architecture FROM i386_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'ia64'::character varying AS architecture FROM ia64_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'kfreebsd-amd64'::character varying AS architecture FROM "kfreebsd-amd64_public".pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'kfreebsd-i386'::character varying AS architecture FROM "kfreebsd-i386_public".pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'mips'::character varying AS architecture FROM mips_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'mipsel'::character varying AS architecture FROM mipsel_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'powerpc'::character varying AS architecture FROM powerpc_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 's390'::character varying AS architecture FROM s390_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25)) UNION (SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'sparc'::character varying AS architecture FROM sparc_public.pkg_history ORDER BY pkg_history."timestamp" DESC LIMIT 25) ORDER BY 4 DESC LIMIT 25;


ALTER TABLE public.lastlog OWNER TO wbadm;

--
-- Name: log; Type: VIEW; Schema: public; Owner: wbadm
--

CREATE VIEW log AS
    (((((((((((((SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'alpha'::character varying AS architecture FROM alpha_public.pkg_history UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'amd64'::character varying AS architecture FROM amd64_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'arm'::character varying AS architecture FROM arm_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'armel'::character varying AS architecture FROM armel_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'hppa'::character varying AS architecture FROM hppa_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'hurd-i386'::character varying AS architecture FROM "hurd-i386_public".pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'i386'::character varying AS architecture FROM i386_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'ia64'::character varying AS architecture FROM ia64_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'kfreebsd-amd64'::character varying AS architecture FROM "kfreebsd-amd64_public".pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'kfreebsd-i386'::character varying AS architecture FROM "kfreebsd-i386_public".pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'mips'::character varying AS architecture FROM mips_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'mipsel'::character varying AS architecture FROM mipsel_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'powerpc'::character varying AS architecture FROM powerpc_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 's390'::character varying AS architecture FROM s390_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", 'sparc'::character varying AS architecture FROM sparc_public.pkg_history ORDER BY 4 DESC;


ALTER TABLE public.log OWNER TO wbadm;

--
-- Name: log_v2; Type: VIEW; Schema: public; Owner: pkern
--

CREATE VIEW log_v2 AS
    (((((((((((((SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'alpha'::character varying AS architecture FROM alpha_public.pkg_history UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'amd64'::character varying AS architecture FROM amd64_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'arm'::character varying AS architecture FROM arm_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'armel'::character varying AS architecture FROM armel_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'hppa'::character varying AS architecture FROM hppa_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'hurd-i386'::character varying AS architecture FROM "hurd-i386_public".pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'i386'::character varying AS architecture FROM i386_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'ia64'::character varying AS architecture FROM ia64_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'kfreebsd-amd64'::character varying AS architecture FROM "kfreebsd-amd64_public".pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'kfreebsd-i386'::character varying AS architecture FROM "kfreebsd-i386_public".pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'mips'::character varying AS architecture FROM mips_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'mipsel'::character varying AS architecture FROM mipsel_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'powerpc'::character varying AS architecture FROM powerpc_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 's390'::character varying AS architecture FROM s390_public.pkg_history) UNION ALL SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, 'sparc'::character varying AS architecture FROM sparc_public.pkg_history ORDER BY 4 DESC;


ALTER TABLE public.log_v2 OWNER TO pkern;

SET search_path = s390_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: s390_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM s390.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE s390_public.packages OWNER TO wbadm;

SET search_path = sparc_public, pg_catalog;

--
-- Name: packages; Type: VIEW; Schema: sparc_public; Owner: wbadm
--

CREATE VIEW packages AS
    SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts FROM sparc.packages WHERE ((packages.distribution)::text !~~ '%-security'::text);


ALTER TABLE sparc_public.packages OWNER TO wbadm;

SET search_path = public, pg_catalog;

--
-- Name: packages_all; Type: VIEW; Schema: public; Owner: wbadm
--

CREATE VIEW packages_all AS
    (((((((((((((SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'alpha'::character varying AS architecture FROM alpha_public.packages UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'amd64'::character varying AS architecture FROM amd64_public.packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'arm'::character varying AS architecture FROM arm_public.packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'armel'::character varying AS architecture FROM armel_public.packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'hppa'::character varying AS architecture FROM hppa_public.packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'hurd-i386'::character varying AS architecture FROM "hurd-i386_public".packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'i386'::character varying AS architecture FROM i386_public.packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'ia64'::character varying AS architecture FROM ia64_public.packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'kfreebsd-amd64'::character varying AS architecture FROM "kfreebsd-amd64_public".packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'kfreebsd-i386'::character varying AS architecture FROM "kfreebsd-i386_public".packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'mips'::character varying AS architecture FROM mips_public.packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'mipsel'::character varying AS architecture FROM mipsel_public.packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'powerpc'::character varying AS architecture FROM powerpc_public.packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 's390'::character varying AS architecture FROM s390_public.packages) UNION ALL SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, 'sparc'::character varying AS architecture FROM sparc_public.packages;


ALTER TABLE public.packages_all OWNER TO wbadm;

SET search_path = s390, pg_catalog;

--
-- Name: transactions; Type: TABLE; Schema: s390; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE s390.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: s390; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE s390.users OWNER TO wbadm;

SET search_path = s390_public, pg_catalog;

--
-- Name: transactions; Type: VIEW; Schema: s390_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM s390.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE s390_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: s390_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM s390.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE s390_public.users OWNER TO wbadm;

SET search_path = sparc, pg_catalog;

--
-- Name: transactions; Type: TABLE; Schema: sparc; Owner: wbadm; Tablespace: 
--

CREATE TABLE transactions (
    package character varying,
    distribution character varying,
    version character varying,
    action character varying,
    prevstate character varying,
    state character varying,
    real_user character varying,
    set_user character varying,
    "time" timestamp without time zone
);


ALTER TABLE sparc.transactions OWNER TO wbadm;

--
-- Name: users; Type: TABLE; Schema: sparc; Owner: wbadm; Tablespace: 
--

CREATE TABLE users (
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone
);


ALTER TABLE sparc.users OWNER TO wbadm;

SET search_path = sparc_public, pg_catalog;

--
-- Name: transactions; Type: VIEW; Schema: sparc_public; Owner: wbadm
--

CREATE VIEW transactions AS
    SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM sparc.transactions WHERE ((transactions.distribution)::text !~~ '%-security'::text);


ALTER TABLE sparc_public.transactions OWNER TO wbadm;

--
-- Name: users; Type: VIEW; Schema: sparc_public; Owner: wbadm
--

CREATE VIEW users AS
    SELECT users.username, users.distribution, users.last_seen FROM sparc.users WHERE ((users.distribution)::text !~~ '%-security'::text);


ALTER TABLE sparc_public.users OWNER TO wbadm;

SET search_path = alpha, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: alpha; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: alpha; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: alpha; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = amd64, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: amd64; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: amd64; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: amd64; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = arm, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: arm; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: arm; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: arm; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = armel, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: armel; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: armel; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: armel; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = hppa, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: hppa; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: hppa; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: hppa; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = "hurd-i386", pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: hurd-i386; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: hurd-i386; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: hurd-i386; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = i386, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: i386; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: i386; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: i386; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = ia64, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: ia64; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: ia64; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: ia64; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = "kfreebsd-amd64", pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: kfreebsd-amd64; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: kfreebsd-amd64; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: kfreebsd-amd64; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = "kfreebsd-i386", pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: kfreebsd-i386; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: kfreebsd-i386; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: kfreebsd-i386; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = mips, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: mips; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: mips; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: mips; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = mipsel, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: mipsel; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: mipsel; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: mipsel; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = powerpc, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: powerpc; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: powerpc; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: powerpc; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = public, pg_catalog;

--
-- Name: distribution_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY distribution_aliases
    ADD CONSTRAINT distribution_aliases_pkey PRIMARY KEY (alias);


SET search_path = s390, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: s390; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: s390; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: s390; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = sparc, pg_catalog;

--
-- Name: packages_pkey; Type: CONSTRAINT; Schema: sparc; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (package, distribution);


--
-- Name: pkg_history_pkey; Type: CONSTRAINT; Schema: sparc; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_pkey PRIMARY KEY (package, distribution, version, "timestamp");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: sparc; Owner: wbadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username, distribution);


SET search_path = alpha, pg_catalog;

--
-- Name: idx_alpha_state; Type: INDEX; Schema: alpha; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_alpha_state ON packages USING btree (state);


--
-- Name: pkg_history_distribution; Type: INDEX; Schema: alpha; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_distribution ON pkg_history USING hash (distribution);


--
-- Name: pkg_history_index; Type: INDEX; Schema: alpha; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: alpha; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = amd64, pg_catalog;

--
-- Name: idx_amd64_state; Type: INDEX; Schema: amd64; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_amd64_state ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: amd64; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: amd64; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = arm, pg_catalog;

--
-- Name: idx_arm_state; Type: INDEX; Schema: arm; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_arm_state ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: arm; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: arm; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = armel, pg_catalog;

--
-- Name: idx_armel_state; Type: INDEX; Schema: armel; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_armel_state ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: armel; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: armel; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = hppa, pg_catalog;

--
-- Name: idx_hppa_state; Type: INDEX; Schema: hppa; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_hppa_state ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: hppa; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: hppa; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = "hurd-i386", pg_catalog;

--
-- Name: idx_hurd-i386_state; Type: INDEX; Schema: hurd-i386; Owner: wbadm; Tablespace: 
--

CREATE INDEX "idx_hurd-i386_state" ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: hurd-i386; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: hurd-i386; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = i386, pg_catalog;

--
-- Name: idx_i386_state; Type: INDEX; Schema: i386; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_i386_state ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: i386; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: i386; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = ia64, pg_catalog;

--
-- Name: idx_ia64_state; Type: INDEX; Schema: ia64; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_ia64_state ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: ia64; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: ia64; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = "kfreebsd-amd64", pg_catalog;

--
-- Name: idx_kfreebsd-amd64_state; Type: INDEX; Schema: kfreebsd-amd64; Owner: wbadm; Tablespace: 
--

CREATE INDEX "idx_kfreebsd-amd64_state" ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: kfreebsd-amd64; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: kfreebsd-amd64; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = "kfreebsd-i386", pg_catalog;

--
-- Name: idx_kfreebsd-i386_state; Type: INDEX; Schema: kfreebsd-i386; Owner: wbadm; Tablespace: 
--

CREATE INDEX "idx_kfreebsd-i386_state" ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: kfreebsd-i386; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: kfreebsd-i386; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = mips, pg_catalog;

--
-- Name: idx_mips_state; Type: INDEX; Schema: mips; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_mips_state ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: mips; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: mips; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = mipsel, pg_catalog;

--
-- Name: idx_mipsel_state; Type: INDEX; Schema: mipsel; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_mipsel_state ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: mipsel; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: mipsel; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = powerpc, pg_catalog;

--
-- Name: idx_powerpc_state; Type: INDEX; Schema: powerpc; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_powerpc_state ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: powerpc; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: powerpc; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = public, pg_catalog;

--
-- Name: distribution_unique; Type: INDEX; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE UNIQUE INDEX distribution_unique ON distributions USING btree (distribution);


--
-- Name: distributions_distribution; Type: INDEX; Schema: public; Owner: wbadm; Tablespace: 
--

CREATE INDEX distributions_distribution ON distributions USING hash (distribution);


SET search_path = s390, pg_catalog;

--
-- Name: idx_s390_state; Type: INDEX; Schema: s390; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_s390_state ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: s390; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: s390; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = sparc, pg_catalog;

--
-- Name: idx_sparc_state; Type: INDEX; Schema: sparc; Owner: wbadm; Tablespace: 
--

CREATE INDEX idx_sparc_state ON packages USING btree (state);


--
-- Name: pkg_history_index; Type: INDEX; Schema: sparc; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_index ON pkg_history USING btree (package, distribution, "timestamp" DESC, result);


--
-- Name: pkg_history_timestamp; Type: INDEX; Schema: sparc; Owner: wbadm; Tablespace: 
--

CREATE INDEX pkg_history_timestamp ON pkg_history USING btree ("timestamp");


SET search_path = alpha, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: alpha; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: alpha; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: alpha; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = amd64, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: amd64; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: amd64; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: amd64; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = arm, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: arm; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: arm; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: arm; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = armel, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: armel; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: armel; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: armel; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = hppa, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: hppa; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: hppa; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: hppa; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = "hurd-i386", pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: hurd-i386; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: hurd-i386; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: hurd-i386; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = i386, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: i386; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: i386; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: i386; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = ia64, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: ia64; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: ia64; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: ia64; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = "kfreebsd-amd64", pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: kfreebsd-amd64; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: kfreebsd-amd64; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: kfreebsd-amd64; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = "kfreebsd-i386", pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: kfreebsd-i386; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: kfreebsd-i386; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: kfreebsd-i386; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = mips, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: mips; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: mips; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: mips; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = mipsel, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: mipsel; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: mipsel; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: mipsel; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = powerpc, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: powerpc; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: powerpc; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: powerpc; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = public, pg_catalog;

--
-- Name: distribution_aliases_distribution_fkey; Type: FK CONSTRAINT; Schema: public; Owner: wbadm
--

ALTER TABLE ONLY distribution_aliases
    ADD CONSTRAINT distribution_aliases_distribution_fkey FOREIGN KEY (distribution) REFERENCES distributions(distribution);


SET search_path = s390, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: s390; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: s390; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: s390; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


SET search_path = sparc, pg_catalog;

--
-- Name: packages_distribution_fkey; Type: FK CONSTRAINT; Schema: sparc; Owner: wbadm
--

ALTER TABLE ONLY packages
    ADD CONSTRAINT packages_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


--
-- Name: pkg_history_distribution_fk; Type: FK CONSTRAINT; Schema: sparc; Owner: wbadm
--

ALTER TABLE ONLY pkg_history
    ADD CONSTRAINT pkg_history_distribution_fk FOREIGN KEY (distribution) REFERENCES public.distributions(distribution) MATCH FULL;


--
-- Name: users_distribution_fkey; Type: FK CONSTRAINT; Schema: sparc; Owner: wbadm
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_distribution_fkey FOREIGN KEY (distribution) REFERENCES public.distributions(distribution);


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
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
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


SET search_path = alpha, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: alpha; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT ALL ON TABLE packages TO alpha;
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: alpha; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO alpha;
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: alpha; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO alpha;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: alpha; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO alpha;


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
GRANT ALL ON TABLE packages TO amd64;
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: amd64; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO amd64;
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: amd64; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO amd64;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: amd64; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO amd64;


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
GRANT ALL ON TABLE packages TO arm;
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: arm; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO arm;
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: arm; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO arm;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: arm; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO arm;


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
GRANT ALL ON TABLE packages TO armel;
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: armel; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO armel;
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: armel; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO armel;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: armel; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO armel;


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


SET search_path = hppa, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: hppa; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT ALL ON TABLE packages TO hppa;
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: hppa; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO hppa;
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: hppa; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO hppa;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: hppa; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO hppa;


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
GRANT ALL ON TABLE packages TO "hurd-i386";
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: hurd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO "hurd-i386";
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: hurd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO "hurd-i386";
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: hurd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO "hurd-i386";


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
GRANT ALL ON TABLE packages TO i386;
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: i386; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO i386;
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: i386; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO i386;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: i386; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO i386;


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
GRANT ALL ON TABLE packages TO ia64;
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: ia64; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO ia64;
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: ia64; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO ia64;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: ia64; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO ia64;


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
GRANT ALL ON TABLE packages TO "kfreebsd-amd64";
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: kfreebsd-amd64; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO "kfreebsd-amd64";
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: kfreebsd-amd64; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO "kfreebsd-amd64";
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: kfreebsd-amd64; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO "kfreebsd-amd64";


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
GRANT ALL ON TABLE packages TO "kfreebsd-i386";
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: kfreebsd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO "kfreebsd-i386";
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: kfreebsd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO "kfreebsd-i386";
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: kfreebsd-i386; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO "kfreebsd-i386";


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
GRANT ALL ON TABLE packages TO mips;
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: mips; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO mips;
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: mips; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO mips;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: mips; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO mips;


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
GRANT ALL ON TABLE packages TO mipsel;
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: mipsel; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO mipsel;
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: mipsel; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO mipsel;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: mipsel; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO mipsel;


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
GRANT ALL ON TABLE packages TO powerpc;
GRANT SELECT ON TABLE packages TO wb_security;


--
-- Name: pkg_history; Type: ACL; Schema: powerpc; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO powerpc;
GRANT SELECT ON TABLE pkg_history TO wb_security;


--
-- Name: transactions; Type: ACL; Schema: powerpc; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO powerpc;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: powerpc; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO powerpc;


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
-- Name: distribution_aliases; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE distribution_aliases FROM PUBLIC;
REVOKE ALL ON TABLE distribution_aliases FROM wbadm;
GRANT ALL ON TABLE distribution_aliases TO wbadm;
GRANT SELECT ON TABLE distribution_aliases TO PUBLIC;


SET search_path = s390, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: s390; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT ALL ON TABLE packages TO s390;
GRANT SELECT ON TABLE packages TO wb_security;


SET search_path = sparc, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: sparc; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT ALL ON TABLE packages TO sparc;
GRANT SELECT ON TABLE packages TO wb_security;


SET search_path = public, pg_catalog;

--
-- Name: distribution_architectures; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE distribution_architectures FROM PUBLIC;
REVOKE ALL ON TABLE distribution_architectures FROM wbadm;
GRANT ALL ON TABLE distribution_architectures TO wbadm;
GRANT SELECT ON TABLE distribution_architectures TO PUBLIC;


--
-- Name: distributions; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE distributions FROM PUBLIC;
REVOKE ALL ON TABLE distributions FROM wbadm;
GRANT ALL ON TABLE distributions TO wbadm;
GRANT SELECT ON TABLE distributions TO PUBLIC;


SET search_path = s390, pg_catalog;

--
-- Name: pkg_history; Type: ACL; Schema: s390; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO s390;
GRANT SELECT ON TABLE pkg_history TO wb_security;


SET search_path = s390_public, pg_catalog;

--
-- Name: pkg_history; Type: ACL; Schema: s390_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


SET search_path = sparc, pg_catalog;

--
-- Name: pkg_history; Type: ACL; Schema: sparc; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT ALL ON TABLE pkg_history TO sparc;
GRANT SELECT ON TABLE pkg_history TO wb_security;


SET search_path = sparc_public, pg_catalog;

--
-- Name: pkg_history; Type: ACL; Schema: sparc_public; Owner: wbadm
--

REVOKE ALL ON TABLE pkg_history FROM PUBLIC;
REVOKE ALL ON TABLE pkg_history FROM wbadm;
GRANT ALL ON TABLE pkg_history TO wbadm;
GRANT SELECT ON TABLE pkg_history TO PUBLIC;


SET search_path = public, pg_catalog;

--
-- Name: lastlog; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE lastlog FROM PUBLIC;
REVOKE ALL ON TABLE lastlog FROM wbadm;
GRANT ALL ON TABLE lastlog TO wbadm;
GRANT SELECT ON TABLE lastlog TO PUBLIC;


--
-- Name: log; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE log FROM PUBLIC;
REVOKE ALL ON TABLE log FROM wbadm;
GRANT ALL ON TABLE log TO wbadm;
GRANT SELECT ON TABLE log TO PUBLIC;


--
-- Name: log_v2; Type: ACL; Schema: public; Owner: pkern
--

REVOKE ALL ON TABLE log_v2 FROM PUBLIC;
REVOKE ALL ON TABLE log_v2 FROM pkern;
GRANT ALL ON TABLE log_v2 TO pkern;
GRANT SELECT ON TABLE log_v2 TO PUBLIC;


SET search_path = s390_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: s390_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


SET search_path = sparc_public, pg_catalog;

--
-- Name: packages; Type: ACL; Schema: sparc_public; Owner: wbadm
--

REVOKE ALL ON TABLE packages FROM PUBLIC;
REVOKE ALL ON TABLE packages FROM wbadm;
GRANT ALL ON TABLE packages TO wbadm;
GRANT SELECT ON TABLE packages TO PUBLIC;


SET search_path = public, pg_catalog;

--
-- Name: packages_all; Type: ACL; Schema: public; Owner: wbadm
--

REVOKE ALL ON TABLE packages_all FROM PUBLIC;
REVOKE ALL ON TABLE packages_all FROM wbadm;
GRANT ALL ON TABLE packages_all TO wbadm;
GRANT SELECT ON TABLE packages_all TO PUBLIC;


SET search_path = s390, pg_catalog;

--
-- Name: transactions; Type: ACL; Schema: s390; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO s390;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: s390; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO s390;


SET search_path = s390_public, pg_catalog;

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


SET search_path = sparc, pg_catalog;

--
-- Name: transactions; Type: ACL; Schema: sparc; Owner: wbadm
--

REVOKE ALL ON TABLE transactions FROM PUBLIC;
REVOKE ALL ON TABLE transactions FROM wbadm;
GRANT ALL ON TABLE transactions TO wbadm;
GRANT SELECT,INSERT ON TABLE transactions TO sparc;
GRANT SELECT ON TABLE transactions TO wb_security;


--
-- Name: users; Type: ACL; Schema: sparc; Owner: wbadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM wbadm;
GRANT ALL ON TABLE users TO wbadm;
GRANT ALL ON TABLE users TO sparc;


SET search_path = sparc_public, pg_catalog;

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

