BEGIN;
SET search_path = "alpha", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'alpha'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'alpha'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('alpha'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'alpha'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "amd64", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'amd64'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('amd64'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "arm", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'arm'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'arm'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('arm'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'arm'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "armel", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'armel'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'armel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('armel'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'armel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "hppa", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'hppa'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'hppa'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('hppa'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'hppa'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "hurd-i386", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'hurd-i386'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'hurd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('hurd-i386'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'hurd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "i386", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'i386'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('i386'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "ia64", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'ia64'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'ia64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('ia64'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'ia64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "kfreebsd-amd64", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'kfreebsd-amd64'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'kfreebsd-amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('kfreebsd-amd64'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'kfreebsd-amd64'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "kfreebsd-i386", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'kfreebsd-i386'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'kfreebsd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('kfreebsd-i386'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'kfreebsd-i386'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "mips", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'mips'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'mips'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('mips'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'mips'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "mipsel", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'mipsel'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'mipsel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('mipsel'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'mipsel'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "powerpc", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'powerpc'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'powerpc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('powerpc'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'powerpc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "s390", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 's390'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 's390'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('s390'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 's390'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

SET search_path = "sparc", public;

DROP VIEW pkg_history;

CREATE OR REPLACE VIEW pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space, pkg_history.builder
   FROM pkg_history
  WHERE pkg_history.architecture::text = 'sparc'::text;

CREATE RULE pkg_history_delete AS ON DELETE TO pkg_history DO INSTEAD DELETE FROM public.pkg_history p WHERE ((((((p.architecture)::text = 'sparc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

CREATE RULE pkg_history_insert AS ON INSERT TO pkg_history DO INSTEAD INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space, builder) VALUES ('sparc'::character varying, new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space, new.builder);

CREATE RULE pkg_history_update AS ON UPDATE TO pkg_history DO INSTEAD UPDATE public.pkg_history p SET result = new.result, build_time = new.build_time, disk_space = new.disk_space, builder = new.builder WHERE ((((((p.architecture)::text = 'sparc'::text) AND ((p.package)::text = (old.package)::text)) AND ((p.distribution)::text = (old.distribution)::text)) AND (p.version OPERATOR(public.=) old.version)) AND (p."timestamp" = old."timestamp"));

