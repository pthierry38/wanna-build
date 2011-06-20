BEGIN;
SET search_path = public;

-- Create new all-in-one tables.

CREATE TABLE packages (
    architecture character varying NOT NULL,
    package character varying NOT NULL,
    distribution character varying NOT NULL REFERENCES distributions(distribution),
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
    build_arch_all boolean DEFAULT false,
    PRIMARY KEY (architecture, package, distribution)
);
CREATE INDEX packages_distribution_package ON packages (distribution, package); -- For the stored procedure "query_source_package".
CREATE INDEX packages_arch_dist_state ON packages (architecture, distribution, upper(state)); -- For wanna-build's list query.
ALTER TABLE packages OWNER TO wbadm;
REVOKE ALL ON packages FROM PUBLIC;

CREATE TABLE pkg_history (
    architecture character varying NOT NULL,
    package character varying NOT NULL,
    distribution character varying NOT NULL REFERENCES distributions(distribution),
    version debversion NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    result character varying NOT NULL,
    build_time integer,
    disk_space bigint,
    builder character varying,
    PRIMARY KEY (architecture, package, distribution, version, "timestamp")
);
CREATE INDEX pkg_history_timestamp on pkg_history (timestamp); -- For the global view "lastlog".
ALTER TABLE pkg_history OWNER TO wbadm;
REVOKE ALL ON pkg_history FROM PUBLIC;

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
ALTER TABLE transactions OWNER TO wbadm;
REVOKE ALL ON transactions FROM PUBLIC;

CREATE TABLE users (
    architecture character varying NOT NULL,
    username character varying NOT NULL,
    distribution character varying NOT NULL,
    last_seen timestamp without time zone,
    PRIMARY KEY (architecture, username, distribution)
);
ALTER TABLE users OWNER TO wbadm;
REVOKE ALL ON users FROM PUBLIC;

-- Lock everything.

LOCK TABLE "alpha".packages IN EXCLUSIVE MODE;
LOCK TABLE "amd64".packages IN EXCLUSIVE MODE;
LOCK TABLE "arm".packages IN EXCLUSIVE MODE;
LOCK TABLE "armel".packages IN EXCLUSIVE MODE;
LOCK TABLE "hppa".packages IN EXCLUSIVE MODE;
LOCK TABLE "hurd-i386".packages IN EXCLUSIVE MODE;
LOCK TABLE "i386".packages IN EXCLUSIVE MODE;
LOCK TABLE "ia64".packages IN EXCLUSIVE MODE;
LOCK TABLE "kfreebsd-amd64".packages IN EXCLUSIVE MODE;
LOCK TABLE "kfreebsd-i386".packages IN EXCLUSIVE MODE;
LOCK TABLE "mips".packages IN EXCLUSIVE MODE;
LOCK TABLE "mipsel".packages IN EXCLUSIVE MODE;
LOCK TABLE "powerpc".packages IN EXCLUSIVE MODE;
LOCK TABLE "s390".packages IN EXCLUSIVE MODE;
LOCK TABLE "sparc".packages IN EXCLUSIVE MODE;

LOCK TABLE "alpha".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "amd64".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "arm".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "armel".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "hppa".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "hurd-i386".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "i386".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "ia64".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "kfreebsd-amd64".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "kfreebsd-i386".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "mips".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "mipsel".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "powerpc".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "s390".pkg_history IN EXCLUSIVE MODE;
LOCK TABLE "sparc".pkg_history IN EXCLUSIVE MODE;

LOCK TABLE "alpha".transactions IN EXCLUSIVE MODE;
LOCK TABLE "amd64".transactions IN EXCLUSIVE MODE;
LOCK TABLE "arm".transactions IN EXCLUSIVE MODE;
LOCK TABLE "armel".transactions IN EXCLUSIVE MODE;
LOCK TABLE "hppa".transactions IN EXCLUSIVE MODE;
LOCK TABLE "hurd-i386".transactions IN EXCLUSIVE MODE;
LOCK TABLE "i386".transactions IN EXCLUSIVE MODE;
LOCK TABLE "ia64".transactions IN EXCLUSIVE MODE;
LOCK TABLE "kfreebsd-amd64".transactions IN EXCLUSIVE MODE;
LOCK TABLE "kfreebsd-i386".transactions IN EXCLUSIVE MODE;
LOCK TABLE "mips".transactions IN EXCLUSIVE MODE;
LOCK TABLE "mipsel".transactions IN EXCLUSIVE MODE;
LOCK TABLE "powerpc".transactions IN EXCLUSIVE MODE;
LOCK TABLE "s390".transactions IN EXCLUSIVE MODE;
LOCK TABLE "sparc".transactions IN EXCLUSIVE MODE;

LOCK TABLE "alpha".users IN EXCLUSIVE MODE;
LOCK TABLE "amd64".users IN EXCLUSIVE MODE;
LOCK TABLE "arm".users IN EXCLUSIVE MODE;
LOCK TABLE "armel".users IN EXCLUSIVE MODE;
LOCK TABLE "hppa".users IN EXCLUSIVE MODE;
LOCK TABLE "hurd-i386".users IN EXCLUSIVE MODE;
LOCK TABLE "i386".users IN EXCLUSIVE MODE;
LOCK TABLE "ia64".users IN EXCLUSIVE MODE;
LOCK TABLE "kfreebsd-amd64".users IN EXCLUSIVE MODE;
LOCK TABLE "kfreebsd-i386".users IN EXCLUSIVE MODE;
LOCK TABLE "mips".users IN EXCLUSIVE MODE;
LOCK TABLE "mipsel".users IN EXCLUSIVE MODE;
LOCK TABLE "powerpc".users IN EXCLUSIVE MODE;
LOCK TABLE "s390".users IN EXCLUSIVE MODE;
LOCK TABLE "sparc".users IN EXCLUSIVE MODE;

-- Copy the old data into the new all-in-one tables.

INSERT INTO packages SELECT 'alpha' AS architecture, * FROM "alpha".packages;
INSERT INTO packages SELECT 'amd64' AS architecture, * FROM "amd64".packages;
INSERT INTO packages SELECT 'arm' AS architecture, * FROM "arm".packages;
INSERT INTO packages SELECT 'armel' AS architecture, * FROM "armel".packages;
INSERT INTO packages SELECT 'hppa' AS architecture, * FROM "hppa".packages;
INSERT INTO packages SELECT 'hurd-i386' AS architecture, * FROM "hurd-i386".packages;
INSERT INTO packages SELECT 'i386' AS architecture, * FROM "i386".packages;
INSERT INTO packages SELECT 'ia64' AS architecture, * FROM "ia64".packages;
INSERT INTO packages SELECT 'kfreebsd-amd64' AS architecture, * FROM "kfreebsd-amd64".packages;
INSERT INTO packages SELECT 'kfreebsd-i386' AS architecture, * FROM "kfreebsd-i386".packages;
INSERT INTO packages SELECT 'mips' AS architecture, * FROM "mips".packages;
INSERT INTO packages SELECT 'mipsel' AS architecture, * FROM "mipsel".packages;
INSERT INTO packages SELECT 'powerpc' AS architecture, * FROM "powerpc".packages;
INSERT INTO packages SELECT 's390' AS architecture, * FROM "s390".packages;
INSERT INTO packages SELECT 'sparc' AS architecture, * FROM "sparc".packages;

INSERT INTO pkg_history SELECT 'alpha' AS architecture, * FROM "alpha".pkg_history;
INSERT INTO pkg_history SELECT 'amd64' AS architecture, * FROM "amd64".pkg_history;
INSERT INTO pkg_history SELECT 'arm' AS architecture, * FROM "arm".pkg_history;
INSERT INTO pkg_history SELECT 'armel' AS architecture, * FROM "armel".pkg_history;
INSERT INTO pkg_history SELECT 'hppa' AS architecture, * FROM "hppa".pkg_history;
INSERT INTO pkg_history SELECT 'hurd-i386' AS architecture, * FROM "hurd-i386".pkg_history;
INSERT INTO pkg_history SELECT 'i386' AS architecture, * FROM "i386".pkg_history;
INSERT INTO pkg_history SELECT 'ia64' AS architecture, * FROM "ia64".pkg_history;
INSERT INTO pkg_history SELECT 'kfreebsd-amd64' AS architecture, * FROM "kfreebsd-amd64".pkg_history;
INSERT INTO pkg_history SELECT 'kfreebsd-i386' AS architecture, * FROM "kfreebsd-i386".pkg_history;
INSERT INTO pkg_history SELECT 'mips' AS architecture, * FROM "mips".pkg_history;
INSERT INTO pkg_history SELECT 'mipsel' AS architecture, * FROM "mipsel".pkg_history;
INSERT INTO pkg_history SELECT 'powerpc' AS architecture, * FROM "powerpc".pkg_history;
INSERT INTO pkg_history SELECT 's390' AS architecture, * FROM "s390".pkg_history;
INSERT INTO pkg_history SELECT 'sparc' AS architecture, * FROM "sparc".pkg_history;

INSERT INTO transactions SELECT 'alpha' AS architecture, * FROM "alpha".transactions;
INSERT INTO transactions SELECT 'amd64' AS architecture, * FROM "amd64".transactions;
INSERT INTO transactions SELECT 'arm' AS architecture, * FROM "arm".transactions;
INSERT INTO transactions SELECT 'armel' AS architecture, * FROM "armel".transactions;
INSERT INTO transactions SELECT 'hppa' AS architecture, * FROM "hppa".transactions;
INSERT INTO transactions SELECT 'hurd-i386' AS architecture, * FROM "hurd-i386".transactions;
INSERT INTO transactions SELECT 'i386' AS architecture, * FROM "i386".transactions;
INSERT INTO transactions SELECT 'ia64' AS architecture, * FROM "ia64".transactions;
INSERT INTO transactions SELECT 'kfreebsd-amd64' AS architecture, * FROM "kfreebsd-amd64".transactions;
INSERT INTO transactions SELECT 'kfreebsd-i386' AS architecture, * FROM "kfreebsd-i386".transactions;
INSERT INTO transactions SELECT 'mips' AS architecture, * FROM "mips".transactions;
INSERT INTO transactions SELECT 'mipsel' AS architecture, * FROM "mipsel".transactions;
INSERT INTO transactions SELECT 'powerpc' AS architecture, * FROM "powerpc".transactions;
INSERT INTO transactions SELECT 's390' AS architecture, * FROM "s390".transactions;
INSERT INTO transactions SELECT 'sparc' AS architecture, * FROM "sparc".transactions;

INSERT INTO users SELECT 'alpha' AS architecture, * FROM "alpha".users;
INSERT INTO users SELECT 'amd64' AS architecture, * FROM "amd64".users;
INSERT INTO users SELECT 'arm' AS architecture, * FROM "arm".users;
INSERT INTO users SELECT 'armel' AS architecture, * FROM "armel".users;
INSERT INTO users SELECT 'hppa' AS architecture, * FROM "hppa".users;
INSERT INTO users SELECT 'hurd-i386' AS architecture, * FROM "hurd-i386".users;
INSERT INTO users SELECT 'i386' AS architecture, * FROM "i386".users;
INSERT INTO users SELECT 'ia64' AS architecture, * FROM "ia64".users;
INSERT INTO users SELECT 'kfreebsd-amd64' AS architecture, * FROM "kfreebsd-amd64".users;
INSERT INTO users SELECT 'kfreebsd-i386' AS architecture, * FROM "kfreebsd-i386".users;
INSERT INTO users SELECT 'mips' AS architecture, * FROM "mips".users;
INSERT INTO users SELECT 'mipsel' AS architecture, * FROM "mipsel".users;
INSERT INTO users SELECT 'powerpc' AS architecture, * FROM "powerpc".users;
INSERT INTO users SELECT 's390' AS architecture, * FROM "s390".users;
INSERT INTO users SELECT 'sparc' AS architecture, * FROM "sparc".users;

-- Copy done, that's fine.  Some statistics follow…

SELECT COUNT(*) FROM packages;
SELECT COUNT(*) FROM pkg_history;
SELECT COUNT(*) FROM transactions;
SELECT COUNT(*) FROM users;

-- Now analyze the new tables to help the query planner.

ANALYZE packages;
ANALYZE pkg_history;
ANALYZE transactions;
ANALYZE users;

-- Redefine the global views.

DROP VIEW distribution_architectures_statistics;
DROP VIEW distribution_architectures;

SELECT DISTINCT packages.distribution, packages.architecture
	INTO distribution_architectures
	FROM packages;
ALTER TABLE distribution_architectures ADD PRIMARY KEY (distribution, architecture);
ALTER TABLE distribution_architectures OWNER TO wbadm;
REVOKE ALL ON distribution_architectures FROM PUBLIC;
GRANT SELECT ON distribution_architectures TO PUBLIC;

ALTER TABLE packages
	ADD CONSTRAINT distribution_architecture_fkey
		FOREIGN KEY (distribution, architecture)
		REFERENCES distribution_architectures (distribution, architecture);

CREATE OR REPLACE VIEW distribution_architectures_statistics AS
	SELECT DISTINCT packages.distribution, packages.architecture, sum(
                CASE
                    WHEN packages.state::text = 'Needs-Build'::text THEN 1
                    ELSE 0
                END) AS needsbuild, sum(
                CASE
                    WHEN packages.state_change < (now() - '1 day'::interval) AND (packages.state::text = 'Built'::text OR packages.state::text = 'Uploaded'::text) THEN 1
                    ELSE 0
                END) AS notinstalled
           FROM packages
          GROUP BY packages.distribution, packages.architecture;
ALTER TABLE distribution_architectures OWNER TO wbadm;
REVOKE ALL ON distribution_architectures FROM PUBLIC;
GRANT SELECT ON distribution_architectures TO PUBLIC;

DROP VIEW lastlog;
CREATE OR REPLACE VIEW lastlog AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.architecture FROM pkg_history NATURAL JOIN distributions WHERE distributions.public = 't' ORDER BY pkg_history."timestamp" DESC LIMIT 25;
ALTER TABLE lastlog OWNER TO wbadm;
REVOKE ALL ON lastlog FROM PUBLIC;
GRANT SELECT ON lastlog TO PUBLIC;

DROP VIEW log;
CREATE OR REPLACE VIEW log AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.architecture FROM pkg_history NATURAL JOIN distributions WHERE distributions.public = 't' ORDER BY pkg_history."timestamp" DESC;
ALTER TABLE log OWNER TO wbadm;
REVOKE ALL ON log FROM PUBLIC;
GRANT SELECT ON log TO PUBLIC;

DROP VIEW packages_all;
CREATE OR REPLACE VIEW packages_all AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.architecture FROM packages NATURAL JOIN distributions WHERE distributions.public = 't';
ALTER TABLE packages_all OWNER TO wbadm;
REVOKE ALL ON packages_all FROM PUBLIC;
GRANT SELECT ON packages_all TO PUBLIC;

CREATE OR REPLACE VIEW packages_public AS
	SELECT * FROM packages NATURAL JOIN distributions WHERE distributions.public = 't';
ALTER TABLE packages_public OWNER TO wbadm;
REVOKE ALL ON packages_public FROM PUBLIC;
GRANT SELECT ON packages_public TO PUBLIC;

-- Redefine the global functions.

CREATE OR REPLACE FUNCTION query_source_package(param_dist character varying, param_srcpkg character varying) RETURNS SETOF record
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY SELECT packages.architecture, packages.package, packages.distribution, packages.version::character varying, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM packages_public packages WHERE distribution = param_dist AND package = param_srcpkg;
END
$$ SECURITY INVOKER;

-- Redefine the architecture-specific public views.  We need that because
-- the version column changed its type.

DROP VIEW "alpha_public".packages;
DROP VIEW "alpha_public".pkg_history;
DROP VIEW "alpha_public".transactions;
DROP VIEW "amd64_public".packages;
DROP VIEW "amd64_public".pkg_history;
DROP VIEW "amd64_public".transactions;
DROP VIEW "arm_public".packages;
DROP VIEW "arm_public".pkg_history;
DROP VIEW "arm_public".transactions;
DROP VIEW "armel_public".packages;
DROP VIEW "armel_public".pkg_history;
DROP VIEW "armel_public".transactions;
DROP VIEW "hppa_public".packages;
DROP VIEW "hppa_public".pkg_history;
DROP VIEW "hppa_public".transactions;
DROP VIEW "hurd-i386_public".packages;
DROP VIEW "hurd-i386_public".pkg_history;
DROP VIEW "hurd-i386_public".transactions;
DROP VIEW "i386_public".packages;
DROP VIEW "i386_public".pkg_history;
DROP VIEW "i386_public".transactions;
DROP VIEW "ia64_public".packages;
DROP VIEW "ia64_public".pkg_history;
DROP VIEW "ia64_public".transactions;
DROP VIEW "kfreebsd-amd64_public".packages;
DROP VIEW "kfreebsd-amd64_public".pkg_history;
DROP VIEW "kfreebsd-amd64_public".transactions;
DROP VIEW "kfreebsd-i386_public".packages;
DROP VIEW "kfreebsd-i386_public".pkg_history;
DROP VIEW "kfreebsd-i386_public".transactions;
DROP VIEW "mips_public".packages;
DROP VIEW "mips_public".pkg_history;
DROP VIEW "mips_public".transactions;
DROP VIEW "mipsel_public".packages;
DROP VIEW "mipsel_public".pkg_history;
DROP VIEW "mipsel_public".transactions;
DROP VIEW "powerpc_public".packages;
DROP VIEW "powerpc_public".pkg_history;
DROP VIEW "powerpc_public".transactions;
DROP VIEW "s390_public".packages;
DROP VIEW "s390_public".pkg_history;
DROP VIEW "s390_public".transactions;
DROP VIEW "sparc_public".packages;
DROP VIEW "sparc_public".pkg_history;
DROP VIEW "sparc_public".transactions;

-- Redefine the architecture-specific public views.

CREATE OR REPLACE VIEW "alpha_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'alpha';
CREATE OR REPLACE VIEW "alpha_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'alpha';
CREATE OR REPLACE VIEW "alpha_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'alpha';
CREATE OR REPLACE VIEW "alpha_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'alpha';
ALTER TABLE "alpha_public".packages OWNER TO wbadm;
ALTER TABLE "alpha_public".pkg_history OWNER TO wbadm;
ALTER TABLE "alpha_public".transactions OWNER TO wbadm;
ALTER TABLE "alpha_public".users OWNER TO wbadm;
REVOKE ALL ON "alpha_public".packages FROM PUBLIC;
REVOKE ALL ON "alpha_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "alpha_public".transactions FROM PUBLIC;
REVOKE ALL ON "alpha_public".users FROM PUBLIC;
GRANT SELECT ON "alpha_public".packages TO PUBLIC;
GRANT SELECT ON "alpha_public".pkg_history TO PUBLIC;
GRANT SELECT ON "alpha_public".transactions TO PUBLIC;
GRANT SELECT ON "alpha_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "amd64_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'amd64';
CREATE OR REPLACE VIEW "amd64_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'amd64';
CREATE OR REPLACE VIEW "amd64_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'amd64';
CREATE OR REPLACE VIEW "amd64_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'amd64';
ALTER TABLE "amd64_public".packages OWNER TO wbadm;
ALTER TABLE "amd64_public".pkg_history OWNER TO wbadm;
ALTER TABLE "amd64_public".transactions OWNER TO wbadm;
ALTER TABLE "amd64_public".users OWNER TO wbadm;
REVOKE ALL ON "amd64_public".packages FROM PUBLIC;
REVOKE ALL ON "amd64_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "amd64_public".transactions FROM PUBLIC;
REVOKE ALL ON "amd64_public".users FROM PUBLIC;
GRANT SELECT ON "amd64_public".packages TO PUBLIC;
GRANT SELECT ON "amd64_public".pkg_history TO PUBLIC;
GRANT SELECT ON "amd64_public".transactions TO PUBLIC;
GRANT SELECT ON "amd64_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "arm_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'arm';
CREATE OR REPLACE VIEW "arm_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'arm';
CREATE OR REPLACE VIEW "arm_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'arm';
CREATE OR REPLACE VIEW "arm_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'arm';
ALTER TABLE "arm_public".packages OWNER TO wbadm;
ALTER TABLE "arm_public".pkg_history OWNER TO wbadm;
ALTER TABLE "arm_public".transactions OWNER TO wbadm;
ALTER TABLE "arm_public".users OWNER TO wbadm;
REVOKE ALL ON "arm_public".packages FROM PUBLIC;
REVOKE ALL ON "arm_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "arm_public".transactions FROM PUBLIC;
REVOKE ALL ON "arm_public".users FROM PUBLIC;
GRANT SELECT ON "arm_public".packages TO PUBLIC;
GRANT SELECT ON "arm_public".pkg_history TO PUBLIC;
GRANT SELECT ON "arm_public".transactions TO PUBLIC;
GRANT SELECT ON "arm_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "armel_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'armel';
CREATE OR REPLACE VIEW "armel_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'armel';
CREATE OR REPLACE VIEW "armel_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'armel';
CREATE OR REPLACE VIEW "armel_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'armel';
ALTER TABLE "armel_public".packages OWNER TO wbadm;
ALTER TABLE "armel_public".pkg_history OWNER TO wbadm;
ALTER TABLE "armel_public".transactions OWNER TO wbadm;
ALTER TABLE "armel_public".users OWNER TO wbadm;
REVOKE ALL ON "armel_public".packages FROM PUBLIC;
REVOKE ALL ON "armel_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "armel_public".transactions FROM PUBLIC;
REVOKE ALL ON "armel_public".users FROM PUBLIC;
GRANT SELECT ON "armel_public".packages TO PUBLIC;
GRANT SELECT ON "armel_public".pkg_history TO PUBLIC;
GRANT SELECT ON "armel_public".transactions TO PUBLIC;
GRANT SELECT ON "armel_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "hppa_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'hppa';
CREATE OR REPLACE VIEW "hppa_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'hppa';
CREATE OR REPLACE VIEW "hppa_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'hppa';
CREATE OR REPLACE VIEW "hppa_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'hppa';
ALTER TABLE "hppa_public".packages OWNER TO wbadm;
ALTER TABLE "hppa_public".pkg_history OWNER TO wbadm;
ALTER TABLE "hppa_public".transactions OWNER TO wbadm;
ALTER TABLE "hppa_public".users OWNER TO wbadm;
REVOKE ALL ON "hppa_public".packages FROM PUBLIC;
REVOKE ALL ON "hppa_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "hppa_public".transactions FROM PUBLIC;
REVOKE ALL ON "hppa_public".users FROM PUBLIC;
GRANT SELECT ON "hppa_public".packages TO PUBLIC;
GRANT SELECT ON "hppa_public".pkg_history TO PUBLIC;
GRANT SELECT ON "hppa_public".transactions TO PUBLIC;
GRANT SELECT ON "hppa_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "hurd-i386_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'hurd-i386';
CREATE OR REPLACE VIEW "hurd-i386_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'hurd-i386';
CREATE OR REPLACE VIEW "hurd-i386_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'hurd-i386';
CREATE OR REPLACE VIEW "hurd-i386_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'hurd-i386';
ALTER TABLE "hurd-i386_public".packages OWNER TO wbadm;
ALTER TABLE "hurd-i386_public".pkg_history OWNER TO wbadm;
ALTER TABLE "hurd-i386_public".transactions OWNER TO wbadm;
ALTER TABLE "hurd-i386_public".users OWNER TO wbadm;
REVOKE ALL ON "hurd-i386_public".packages FROM PUBLIC;
REVOKE ALL ON "hurd-i386_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "hurd-i386_public".transactions FROM PUBLIC;
REVOKE ALL ON "hurd-i386_public".users FROM PUBLIC;
GRANT SELECT ON "hurd-i386_public".packages TO PUBLIC;
GRANT SELECT ON "hurd-i386_public".pkg_history TO PUBLIC;
GRANT SELECT ON "hurd-i386_public".transactions TO PUBLIC;
GRANT SELECT ON "hurd-i386_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "i386_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'i386';
CREATE OR REPLACE VIEW "i386_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'i386';
CREATE OR REPLACE VIEW "i386_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'i386';
CREATE OR REPLACE VIEW "i386_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'i386';
ALTER TABLE "i386_public".packages OWNER TO wbadm;
ALTER TABLE "i386_public".pkg_history OWNER TO wbadm;
ALTER TABLE "i386_public".transactions OWNER TO wbadm;
ALTER TABLE "i386_public".users OWNER TO wbadm;
REVOKE ALL ON "i386_public".packages FROM PUBLIC;
REVOKE ALL ON "i386_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "i386_public".transactions FROM PUBLIC;
REVOKE ALL ON "i386_public".users FROM PUBLIC;
GRANT SELECT ON "i386_public".packages TO PUBLIC;
GRANT SELECT ON "i386_public".pkg_history TO PUBLIC;
GRANT SELECT ON "i386_public".transactions TO PUBLIC;
GRANT SELECT ON "i386_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "ia64_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'ia64';
CREATE OR REPLACE VIEW "ia64_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'ia64';
CREATE OR REPLACE VIEW "ia64_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'ia64';
CREATE OR REPLACE VIEW "ia64_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'ia64';
ALTER TABLE "ia64_public".packages OWNER TO wbadm;
ALTER TABLE "ia64_public".pkg_history OWNER TO wbadm;
ALTER TABLE "ia64_public".transactions OWNER TO wbadm;
ALTER TABLE "ia64_public".users OWNER TO wbadm;
REVOKE ALL ON "ia64_public".packages FROM PUBLIC;
REVOKE ALL ON "ia64_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "ia64_public".transactions FROM PUBLIC;
REVOKE ALL ON "ia64_public".users FROM PUBLIC;
GRANT SELECT ON "ia64_public".packages TO PUBLIC;
GRANT SELECT ON "ia64_public".pkg_history TO PUBLIC;
GRANT SELECT ON "ia64_public".transactions TO PUBLIC;
GRANT SELECT ON "ia64_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "kfreebsd-amd64_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'kfreebsd-amd64';
CREATE OR REPLACE VIEW "kfreebsd-amd64_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'kfreebsd-amd64';
CREATE OR REPLACE VIEW "kfreebsd-amd64_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'kfreebsd-amd64';
CREATE OR REPLACE VIEW "kfreebsd-amd64_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'kfreebsd-amd64';
ALTER TABLE "kfreebsd-amd64_public".packages OWNER TO wbadm;
ALTER TABLE "kfreebsd-amd64_public".pkg_history OWNER TO wbadm;
ALTER TABLE "kfreebsd-amd64_public".transactions OWNER TO wbadm;
ALTER TABLE "kfreebsd-amd64_public".users OWNER TO wbadm;
REVOKE ALL ON "kfreebsd-amd64_public".packages FROM PUBLIC;
REVOKE ALL ON "kfreebsd-amd64_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "kfreebsd-amd64_public".transactions FROM PUBLIC;
REVOKE ALL ON "kfreebsd-amd64_public".users FROM PUBLIC;
GRANT SELECT ON "kfreebsd-amd64_public".packages TO PUBLIC;
GRANT SELECT ON "kfreebsd-amd64_public".pkg_history TO PUBLIC;
GRANT SELECT ON "kfreebsd-amd64_public".transactions TO PUBLIC;
GRANT SELECT ON "kfreebsd-amd64_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "kfreebsd-i386_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'kfreebsd-i386';
CREATE OR REPLACE VIEW "kfreebsd-i386_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'kfreebsd-i386';
CREATE OR REPLACE VIEW "kfreebsd-i386_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'kfreebsd-i386';
CREATE OR REPLACE VIEW "kfreebsd-i386_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'kfreebsd-i386';
ALTER TABLE "kfreebsd-i386_public".packages OWNER TO wbadm;
ALTER TABLE "kfreebsd-i386_public".pkg_history OWNER TO wbadm;
ALTER TABLE "kfreebsd-i386_public".transactions OWNER TO wbadm;
ALTER TABLE "kfreebsd-i386_public".users OWNER TO wbadm;
REVOKE ALL ON "kfreebsd-i386_public".packages FROM PUBLIC;
REVOKE ALL ON "kfreebsd-i386_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "kfreebsd-i386_public".transactions FROM PUBLIC;
REVOKE ALL ON "kfreebsd-i386_public".users FROM PUBLIC;
GRANT SELECT ON "kfreebsd-i386_public".packages TO PUBLIC;
GRANT SELECT ON "kfreebsd-i386_public".pkg_history TO PUBLIC;
GRANT SELECT ON "kfreebsd-i386_public".transactions TO PUBLIC;
GRANT SELECT ON "kfreebsd-i386_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "mips_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'mips';
CREATE OR REPLACE VIEW "mips_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'mips';
CREATE OR REPLACE VIEW "mips_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'mips';
CREATE OR REPLACE VIEW "mips_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'mips';
ALTER TABLE "mips_public".packages OWNER TO wbadm;
ALTER TABLE "mips_public".pkg_history OWNER TO wbadm;
ALTER TABLE "mips_public".transactions OWNER TO wbadm;
ALTER TABLE "mips_public".users OWNER TO wbadm;
REVOKE ALL ON "mips_public".packages FROM PUBLIC;
REVOKE ALL ON "mips_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "mips_public".transactions FROM PUBLIC;
REVOKE ALL ON "mips_public".users FROM PUBLIC;
GRANT SELECT ON "mips_public".packages TO PUBLIC;
GRANT SELECT ON "mips_public".pkg_history TO PUBLIC;
GRANT SELECT ON "mips_public".transactions TO PUBLIC;
GRANT SELECT ON "mips_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "mipsel_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'mipsel';
CREATE OR REPLACE VIEW "mipsel_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'mipsel';
CREATE OR REPLACE VIEW "mipsel_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'mipsel';
CREATE OR REPLACE VIEW "mipsel_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'mipsel';
ALTER TABLE "mipsel_public".packages OWNER TO wbadm;
ALTER TABLE "mipsel_public".pkg_history OWNER TO wbadm;
ALTER TABLE "mipsel_public".transactions OWNER TO wbadm;
ALTER TABLE "mipsel_public".users OWNER TO wbadm;
REVOKE ALL ON "mipsel_public".packages FROM PUBLIC;
REVOKE ALL ON "mipsel_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "mipsel_public".transactions FROM PUBLIC;
REVOKE ALL ON "mipsel_public".users FROM PUBLIC;
GRANT SELECT ON "mipsel_public".packages TO PUBLIC;
GRANT SELECT ON "mipsel_public".pkg_history TO PUBLIC;
GRANT SELECT ON "mipsel_public".transactions TO PUBLIC;
GRANT SELECT ON "mipsel_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "powerpc_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'powerpc';
CREATE OR REPLACE VIEW "powerpc_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'powerpc';
CREATE OR REPLACE VIEW "powerpc_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'powerpc';
CREATE OR REPLACE VIEW "powerpc_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'powerpc';
ALTER TABLE "powerpc_public".packages OWNER TO wbadm;
ALTER TABLE "powerpc_public".pkg_history OWNER TO wbadm;
ALTER TABLE "powerpc_public".transactions OWNER TO wbadm;
ALTER TABLE "powerpc_public".users OWNER TO wbadm;
REVOKE ALL ON "powerpc_public".packages FROM PUBLIC;
REVOKE ALL ON "powerpc_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "powerpc_public".transactions FROM PUBLIC;
REVOKE ALL ON "powerpc_public".users FROM PUBLIC;
GRANT SELECT ON "powerpc_public".packages TO PUBLIC;
GRANT SELECT ON "powerpc_public".pkg_history TO PUBLIC;
GRANT SELECT ON "powerpc_public".transactions TO PUBLIC;
GRANT SELECT ON "powerpc_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "s390_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 's390';
CREATE OR REPLACE VIEW "s390_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 's390';
CREATE OR REPLACE VIEW "s390_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 's390';
CREATE OR REPLACE VIEW "s390_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 's390';
ALTER TABLE "s390_public".packages OWNER TO wbadm;
ALTER TABLE "s390_public".pkg_history OWNER TO wbadm;
ALTER TABLE "s390_public".transactions OWNER TO wbadm;
ALTER TABLE "s390_public".users OWNER TO wbadm;
REVOKE ALL ON "s390_public".packages FROM PUBLIC;
REVOKE ALL ON "s390_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "s390_public".transactions FROM PUBLIC;
REVOKE ALL ON "s390_public".users FROM PUBLIC;
GRANT SELECT ON "s390_public".packages TO PUBLIC;
GRANT SELECT ON "s390_public".pkg_history TO PUBLIC;
GRANT SELECT ON "s390_public".transactions TO PUBLIC;
GRANT SELECT ON "s390_public".users TO PUBLIC;
CREATE OR REPLACE VIEW "sparc_public".packages AS
	SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all FROM public.packages NATURAL JOIN public.distributions WHERE distributions.public = 't' AND packages.architecture = 'sparc';
CREATE OR REPLACE VIEW "sparc_public".pkg_history AS
	SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space FROM public.pkg_history NATURAL JOIN public.distributions WHERE distributions.public = 't' AND pkg_history.architecture = 'sparc';
CREATE OR REPLACE VIEW "sparc_public".transactions AS
	SELECT transactions.package, transactions.distribution, transactions.version, transactions.action, transactions.prevstate, transactions.state, transactions.real_user, transactions.set_user, transactions."time" FROM public.transactions NATURAL JOIN public.distributions WHERE distributions.public = 't' AND transactions.architecture = 'sparc';
CREATE OR REPLACE VIEW "sparc_public".users AS
	SELECT users.username, users.distribution, users.last_seen FROM public.users NATURAL JOIN public.distributions WHERE distributions.public = 't' AND users.architecture = 'sparc';
ALTER TABLE "sparc_public".packages OWNER TO wbadm;
ALTER TABLE "sparc_public".pkg_history OWNER TO wbadm;
ALTER TABLE "sparc_public".transactions OWNER TO wbadm;
ALTER TABLE "sparc_public".users OWNER TO wbadm;
REVOKE ALL ON "sparc_public".packages FROM PUBLIC;
REVOKE ALL ON "sparc_public".pkg_history FROM PUBLIC;
REVOKE ALL ON "sparc_public".transactions FROM PUBLIC;
REVOKE ALL ON "sparc_public".users FROM PUBLIC;
GRANT SELECT ON "sparc_public".packages TO PUBLIC;
GRANT SELECT ON "sparc_public".pkg_history TO PUBLIC;
GRANT SELECT ON "sparc_public".transactions TO PUBLIC;
GRANT SELECT ON "sparc_public".users TO PUBLIC;

-- Drop the architecture-specific tables.

DROP TABLE "alpha".packages;
DROP TABLE "alpha".pkg_history;
DROP TABLE "alpha".transactions;
DROP TABLE "alpha".users;
DROP TABLE "amd64".packages;
DROP TABLE "amd64".pkg_history;
DROP TABLE "amd64".transactions;
DROP TABLE "amd64".users;
DROP TABLE "arm".packages;
DROP TABLE "arm".pkg_history;
DROP TABLE "arm".transactions;
DROP TABLE "arm".users;
DROP TABLE "armel".packages;
DROP TABLE "armel".pkg_history;
DROP TABLE "armel".transactions;
DROP TABLE "armel".users;
DROP TABLE "hppa".packages;
DROP TABLE "hppa".pkg_history;
DROP TABLE "hppa".transactions;
DROP TABLE "hppa".users;
DROP TABLE "hurd-i386".packages;
DROP TABLE "hurd-i386".pkg_history;
DROP TABLE "hurd-i386".transactions;
DROP TABLE "hurd-i386".users;
DROP TABLE "i386".packages;
DROP TABLE "i386".pkg_history;
DROP TABLE "i386".transactions;
DROP TABLE "i386".users;
DROP TABLE "ia64".packages;
DROP TABLE "ia64".pkg_history;
DROP TABLE "ia64".transactions;
DROP TABLE "ia64".users;
DROP TABLE "kfreebsd-amd64".packages;
DROP TABLE "kfreebsd-amd64".pkg_history;
DROP TABLE "kfreebsd-amd64".transactions;
DROP TABLE "kfreebsd-amd64".users;
DROP TABLE "kfreebsd-i386".packages;
DROP TABLE "kfreebsd-i386".pkg_history;
DROP TABLE "kfreebsd-i386".transactions;
DROP TABLE "kfreebsd-i386".users;
DROP TABLE "mips".packages;
DROP TABLE "mips".pkg_history;
DROP TABLE "mips".transactions;
DROP TABLE "mips".users;
DROP TABLE "mipsel".packages;
DROP TABLE "mipsel".pkg_history;
DROP TABLE "mipsel".transactions;
DROP TABLE "mipsel".users;
DROP TABLE "powerpc".packages;
DROP TABLE "powerpc".pkg_history;
DROP TABLE "powerpc".transactions;
DROP TABLE "powerpc".users;
DROP TABLE "s390".packages;
DROP TABLE "s390".pkg_history;
DROP TABLE "s390".transactions;
DROP TABLE "s390".users;
DROP TABLE "sparc".packages;
DROP TABLE "sparc".pkg_history;
DROP TABLE "sparc".transactions;
DROP TABLE "sparc".users;

-- Redefine the architecture-specific tables.

CREATE OR REPLACE VIEW "alpha".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'alpha';
ALTER TABLE "alpha".packages OWNER TO wbadm;
REVOKE ALL ON "alpha".packages FROM PUBLIC;
GRANT SELECT ON "alpha".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "alpha".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "alpha".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('alpha', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "alpha".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'alpha' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "alpha".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'alpha' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "amd64".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'amd64';
ALTER TABLE "amd64".packages OWNER TO wbadm;
REVOKE ALL ON "amd64".packages FROM PUBLIC;
GRANT SELECT ON "amd64".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "amd64".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "amd64".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('amd64', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "amd64".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'amd64' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "amd64".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'amd64' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "arm".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'arm';
ALTER TABLE "arm".packages OWNER TO wbadm;
REVOKE ALL ON "arm".packages FROM PUBLIC;
GRANT SELECT ON "arm".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "arm".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "arm".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('arm', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "arm".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'arm' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "arm".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'arm' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "armel".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'armel';
ALTER TABLE "armel".packages OWNER TO wbadm;
REVOKE ALL ON "armel".packages FROM PUBLIC;
GRANT SELECT ON "armel".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "armel".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "armel".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('armel', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "armel".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'armel' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "armel".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'armel' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "hppa".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'hppa';
ALTER TABLE "hppa".packages OWNER TO wbadm;
REVOKE ALL ON "hppa".packages FROM PUBLIC;
GRANT SELECT ON "hppa".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "hppa".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "hppa".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('hppa', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "hppa".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'hppa' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "hppa".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'hppa' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "hurd-i386".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'hurd-i386';
ALTER TABLE "hurd-i386".packages OWNER TO wbadm;
REVOKE ALL ON "hurd-i386".packages FROM PUBLIC;
GRANT SELECT ON "hurd-i386".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "hurd-i386".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "hurd-i386".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('hurd-i386', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "hurd-i386".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'hurd-i386' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "hurd-i386".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'hurd-i386' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "i386".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'i386';
ALTER TABLE "i386".packages OWNER TO wbadm;
REVOKE ALL ON "i386".packages FROM PUBLIC;
GRANT SELECT ON "i386".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "i386".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "i386".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('i386', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "i386".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'i386' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "i386".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'i386' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "ia64".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'ia64';
ALTER TABLE "ia64".packages OWNER TO wbadm;
REVOKE ALL ON "ia64".packages FROM PUBLIC;
GRANT SELECT ON "ia64".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "ia64".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "ia64".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('ia64', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "ia64".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'ia64' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "ia64".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'ia64' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "kfreebsd-amd64".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'kfreebsd-amd64';
ALTER TABLE "kfreebsd-amd64".packages OWNER TO wbadm;
REVOKE ALL ON "kfreebsd-amd64".packages FROM PUBLIC;
GRANT SELECT ON "kfreebsd-amd64".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "kfreebsd-amd64".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "kfreebsd-amd64".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('kfreebsd-amd64', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "kfreebsd-amd64".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'kfreebsd-amd64' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "kfreebsd-amd64".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'kfreebsd-amd64' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "kfreebsd-i386".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'kfreebsd-i386';
ALTER TABLE "kfreebsd-i386".packages OWNER TO wbadm;
REVOKE ALL ON "kfreebsd-i386".packages FROM PUBLIC;
GRANT SELECT ON "kfreebsd-i386".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "kfreebsd-i386".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "kfreebsd-i386".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('kfreebsd-i386', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "kfreebsd-i386".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'kfreebsd-i386' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "kfreebsd-i386".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'kfreebsd-i386' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "mips".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'mips';
ALTER TABLE "mips".packages OWNER TO wbadm;
REVOKE ALL ON "mips".packages FROM PUBLIC;
GRANT SELECT ON "mips".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "mips".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "mips".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('mips', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "mips".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'mips' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "mips".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'mips' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "mipsel".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'mipsel';
ALTER TABLE "mipsel".packages OWNER TO wbadm;
REVOKE ALL ON "mipsel".packages FROM PUBLIC;
GRANT SELECT ON "mipsel".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "mipsel".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "mipsel".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('mipsel', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "mipsel".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'mipsel' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "mipsel".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'mipsel' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "powerpc".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'powerpc';
ALTER TABLE "powerpc".packages OWNER TO wbadm;
REVOKE ALL ON "powerpc".packages FROM PUBLIC;
GRANT SELECT ON "powerpc".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "powerpc".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "powerpc".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('powerpc', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "powerpc".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'powerpc' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "powerpc".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'powerpc' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "s390".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 's390';
ALTER TABLE "s390".packages OWNER TO wbadm;
REVOKE ALL ON "s390".packages FROM PUBLIC;
GRANT SELECT ON "s390".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "s390".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "s390".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('s390', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "s390".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 's390' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "s390".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 's390' AND
		p.package = old.package AND
		p.distribution = old.distribution;

CREATE OR REPLACE VIEW "sparc".packages AS
 SELECT packages.package, packages.distribution, packages.version, packages.state, packages.section, packages.priority, packages.installed_version, packages.previous_state, packages.state_change, packages.notes, packages.builder, packages.failed, packages.old_failed, packages.binary_nmu_version, packages.binary_nmu_changelog, packages.failed_category, packages.permbuildpri, packages.buildpri, packages.depends, packages.rel, packages.bd_problem, packages.extra_depends, packages.extra_conflicts, packages.build_arch_all
   FROM public.packages packages
  WHERE packages.architecture = 'sparc';
ALTER TABLE "sparc".packages OWNER TO wbadm;
REVOKE ALL ON "sparc".packages FROM PUBLIC;
GRANT SELECT ON "sparc".packages TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "sparc".packages TO wb_all;
CREATE OR REPLACE RULE packages_insert AS
	ON INSERT TO "sparc".packages DO INSTEAD
	INSERT INTO public.packages (architecture, package, distribution, version, state, section, priority, installed_version, previous_state, state_change, notes, builder, failed, old_failed, binary_nmu_version, binary_nmu_changelog, failed_category, permbuildpri, buildpri, depends, rel, bd_problem, extra_depends, extra_conflicts, build_arch_all)
	VALUES ('sparc', new.package, new.distribution, new.version, new.state, new.section, new.priority, new.installed_version, new.previous_state, new.state_change, new.notes, new.builder, new.failed, new.old_failed, new.binary_nmu_version, new.binary_nmu_changelog, new.failed_category, new.permbuildpri, new.buildpri, new.depends, new.rel, new.bd_problem, new.extra_depends, new.extra_conflicts, new.build_arch_all);
CREATE OR REPLACE RULE packages_update AS
	ON UPDATE TO "sparc".packages DO INSTEAD
	UPDATE public.packages p
		SET version = new.version,
			state = new.state,
			section = new.section,
			priority = new.priority,
			installed_version = new.installed_version,
			previous_state = new.previous_state,
			state_change = new.state_change,
			notes = new.notes,
			builder = new.builder,
			failed = new.failed,
			old_failed = new.old_failed,
			binary_nmu_version = new.binary_nmu_version,
			binary_nmu_changelog = new.binary_nmu_changelog,
			failed_category = new.failed_category,
			permbuildpri = new.permbuildpri,
			buildpri = new.buildpri,
			depends = new.depends,
			rel = new.rel,
			bd_problem = new.bd_problem,
			extra_depends = new.extra_depends,
			extra_conflicts = new.extra_conflicts,
			build_arch_all = new.build_arch_all
	WHERE p.architecture = 'sparc' AND
		p.package = old.package AND
		p.distribution = old.distribution;
CREATE OR REPLACE RULE packages_delete AS
	ON DELETE TO "sparc".packages DO INSTEAD
	DELETE FROM public.packages p
	WHERE p.architecture = 'sparc' AND
		p.package = old.package AND
		p.distribution = old.distribution;

--#EXPLAIN ANALYZE
--#	SELECT rel, priority, state_change, permbuildpri, section, buildpri, failed, state, binary_nmu_changelog, bd_problem, version, package, distribution, installed_version, notes, builder, old_failed, previous_state, binary_nmu_version, depends, extract(days from date_trunc('days', now() - state_change)) as state_days, floor(extract(epoch from now()) - extract(epoch from state_change)) as state_time, (SELECT max(build_time) FROM pkg_history WHERE pkg_history.package = packages.package AND pkg_history.distribution = packages.distribution AND result = 'successful' AND pkg_history.architecture = 'amd64') AS successtime, (SELECT max(build_time) FROM pkg_history WHERE pkg_history.package = packages.package AND pkg_history.distribution = packages.distribution AND pkg_history.architecture = 'amd64')  AS anytime, extra_depends, extra_conflicts, build_arch_all FROM packages WHERE package = 'gobby' AND distribution = 'sid';
--#EXPLAIN ANALYZE
--#	SELECT rel, priority, state_change, permbuildpri, section, buildpri, failed, state, binary_nmu_changelog, bd_problem, version, package, distribution, installed_version, notes, builder, old_failed, previous_state, binary_nmu_version, depends, extract(days from date_trunc('days', now() - state_change)) as state_days, floor(extract(epoch from now()) - extract(epoch from state_change)) as state_time, successtime.build_time as successtime, anytime.build_time as anytime, extra_depends, extra_conflicts FROM packages left join ( select distinct on (package, distribution) build_time, package, distribution from pkg_history where architecture = 'amd64' and result = 'successful' order by package, distribution, timestamp  ) as successtime using (package, distribution)  left join ( select distinct on (package, distribution) build_time, package, distribution from pkg_history where architecture = 'amd64' order by package, distribution, timestamp desc ) as anytime using (package, distribution)  WHERE TRUE AND ( architecture = 'amd64' ) AND ( distribution = 'sid'  ) AND upper(state) = 'NEEDS-BUILD';
--#EXPLAIN ANALYZE
--#	SELECT rel, priority, state_change, permbuildpri, section, buildpri, failed, state, binary_nmu_changelog, bd_problem, version, package, distribution, installed_version, notes, builder, old_failed, previous_state, binary_nmu_version, depends, extract(days from date_trunc('days', now() - state_change)) as state_days, floor(extract(epoch from now()) - extract(epoch from state_change)) as state_time, successtime.build_time as successtime, anytime.build_time as anytime, extra_depends, extra_conflicts FROM packages left join ( select distinct on (package, distribution) build_time, package, distribution from pkg_history where architecture = 'amd64' and result = 'successful' order by package, distribution, timestamp  ) as successtime using (package, distribution)  left join ( select distinct on (package, distribution) build_time, package, distribution from pkg_history where architecture = 'amd64' order by package, distribution, timestamp desc ) as anytime using (package, distribution)  WHERE TRUE AND ( architecture = 'amd64' ) AND ( distribution = 'sid'  ) AND upper(state) = 'INSTALLED';
--#
--SELECT rel, priority, state_change, permbuildpri, section, buildpri, failed, state, binary_nmu_changelog, bd_problem, version, package, distribution, installed_version, notes, builder, old_failed, previous_state, binary_nmu_version, depends, extract(days from date_trunc('days', now() - state_change)) as state_days, floor(extract(epoch from now()) - extract(epoch from state_change)) as state_time, (SELECT max(build_time) FROM "amd64_public".pkg_history WHERE pkg_history.package = packages.package AND pkg_history.distribution = packages.distribution AND result = 'successful') AS successtime, (SELECT max(build_time) FROM "amd64_public".pkg_history WHERE pkg_history.package = packages.package AND pkg_history.distribution = packages.distribution ) AS anytime, extra_depends, extra_conflicts, build_arch_all FROM "amd64_public".packages WHERE package = 'gobby' AND distribution = 'sid';
--SELECT rel, priority, state_change, permbuildpri, section, buildpri, failed, state, binary_nmu_changelog, bd_problem, version, package, distribution, installed_version, notes, builder, old_failed, previous_state, binary_nmu_version, depends, extract(days from date_trunc('days', now() - state_change)) as state_days, floor(extract(epoch from now()) - extract(epoch from state_change)) as state_time, successtime.build_time as successtime, anytime.build_time as anytime, extra_depends, extra_conflicts FROM "amd64_public".packages left join ( select distinct on (package, distribution) build_time, package, distribution from "amd64_public".pkg_history where result = 'successful' order by package, distribution, timestamp  ) as successtime using (package, distribution)  left join ( select distinct on (package, distribution) build_time, package, distribution from "amd64_public".pkg_history order by package, distribution, timestamp desc ) as anytime using (package, distribution)  WHERE TRUE  AND ( distribution = 'sid'  ) AND upper(state) = 'NEEDS-BUILD';
--SELECT rel, priority, state_change, permbuildpri, section, buildpri, failed, state, binary_nmu_changelog, bd_problem, version, package, distribution, installed_version, notes, builder, old_failed, previous_state, binary_nmu_version, depends, extract(days from date_trunc('days', now() - state_change)) as state_days, floor(extract(epoch from now()) - extract(epoch from state_change)) as state_time, successtime.build_time as successtime, anytime.build_time as anytime, extra_depends, extra_conflicts FROM "amd64_public".packages left join ( select distinct on (package, distribution) build_time, package, distribution from "amd64_public".pkg_history where result = 'successful' order by package, distribution, timestamp  ) as successtime using (package, distribution)  left join ( select distinct on (package, distribution) build_time, package, distribution from "amd64_public".pkg_history order by package, distribution, timestamp desc ) as anytime using (package, distribution)  WHERE TRUE  AND ( distribution = 'sid'  ) AND upper(state) = 'INSTALLED';
CREATE OR REPLACE VIEW "alpha".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'alpha';
ALTER TABLE "alpha".pkg_history OWNER TO wbadm;
REVOKE ALL ON "alpha".pkg_history FROM PUBLIC;
GRANT SELECT ON "alpha".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "alpha".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "alpha".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('alpha', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "alpha".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'alpha' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "alpha".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'alpha' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "amd64".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'amd64';
ALTER TABLE "amd64".pkg_history OWNER TO wbadm;
REVOKE ALL ON "amd64".pkg_history FROM PUBLIC;
GRANT SELECT ON "amd64".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "amd64".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "amd64".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('amd64', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "amd64".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'amd64' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "amd64".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'amd64' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "arm".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'arm';
ALTER TABLE "arm".pkg_history OWNER TO wbadm;
REVOKE ALL ON "arm".pkg_history FROM PUBLIC;
GRANT SELECT ON "arm".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "arm".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "arm".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('arm', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "arm".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'arm' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "arm".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'arm' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "armel".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'armel';
ALTER TABLE "armel".pkg_history OWNER TO wbadm;
REVOKE ALL ON "armel".pkg_history FROM PUBLIC;
GRANT SELECT ON "armel".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "armel".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "armel".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('armel', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "armel".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'armel' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "armel".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'armel' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "hppa".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'hppa';
ALTER TABLE "hppa".pkg_history OWNER TO wbadm;
REVOKE ALL ON "hppa".pkg_history FROM PUBLIC;
GRANT SELECT ON "hppa".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "hppa".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "hppa".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('hppa', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "hppa".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'hppa' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "hppa".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'hppa' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "hurd-i386".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'hurd-i386';
ALTER TABLE "hurd-i386".pkg_history OWNER TO wbadm;
REVOKE ALL ON "hurd-i386".pkg_history FROM PUBLIC;
GRANT SELECT ON "hurd-i386".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "hurd-i386".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "hurd-i386".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('hurd-i386', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "hurd-i386".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'hurd-i386' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "hurd-i386".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'hurd-i386' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "i386".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'i386';
ALTER TABLE "i386".pkg_history OWNER TO wbadm;
REVOKE ALL ON "i386".pkg_history FROM PUBLIC;
GRANT SELECT ON "i386".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "i386".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "i386".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('i386', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "i386".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'i386' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "i386".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'i386' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "ia64".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'ia64';
ALTER TABLE "ia64".pkg_history OWNER TO wbadm;
REVOKE ALL ON "ia64".pkg_history FROM PUBLIC;
GRANT SELECT ON "ia64".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "ia64".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "ia64".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('ia64', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "ia64".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'ia64' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "ia64".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'ia64' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "kfreebsd-amd64".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'kfreebsd-amd64';
ALTER TABLE "kfreebsd-amd64".pkg_history OWNER TO wbadm;
REVOKE ALL ON "kfreebsd-amd64".pkg_history FROM PUBLIC;
GRANT SELECT ON "kfreebsd-amd64".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "kfreebsd-amd64".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "kfreebsd-amd64".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('kfreebsd-amd64', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "kfreebsd-amd64".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'kfreebsd-amd64' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "kfreebsd-amd64".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'kfreebsd-amd64' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "kfreebsd-i386".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'kfreebsd-i386';
ALTER TABLE "kfreebsd-i386".pkg_history OWNER TO wbadm;
REVOKE ALL ON "kfreebsd-i386".pkg_history FROM PUBLIC;
GRANT SELECT ON "kfreebsd-i386".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "kfreebsd-i386".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "kfreebsd-i386".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('kfreebsd-i386', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "kfreebsd-i386".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'kfreebsd-i386' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "kfreebsd-i386".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'kfreebsd-i386' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "mips".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'mips';
ALTER TABLE "mips".pkg_history OWNER TO wbadm;
REVOKE ALL ON "mips".pkg_history FROM PUBLIC;
GRANT SELECT ON "mips".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "mips".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "mips".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('mips', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "mips".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'mips' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "mips".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'mips' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "mipsel".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'mipsel';
ALTER TABLE "mipsel".pkg_history OWNER TO wbadm;
REVOKE ALL ON "mipsel".pkg_history FROM PUBLIC;
GRANT SELECT ON "mipsel".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "mipsel".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "mipsel".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('mipsel', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "mipsel".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'mipsel' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "mipsel".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'mipsel' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "powerpc".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'powerpc';
ALTER TABLE "powerpc".pkg_history OWNER TO wbadm;
REVOKE ALL ON "powerpc".pkg_history FROM PUBLIC;
GRANT SELECT ON "powerpc".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "powerpc".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "powerpc".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('powerpc', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "powerpc".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'powerpc' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "powerpc".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'powerpc' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "s390".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 's390';
ALTER TABLE "s390".pkg_history OWNER TO wbadm;
REVOKE ALL ON "s390".pkg_history FROM PUBLIC;
GRANT SELECT ON "s390".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "s390".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "s390".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('s390', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "s390".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 's390' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "s390".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 's390' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "sparc".pkg_history AS
 SELECT pkg_history.package, pkg_history.distribution, pkg_history.version, pkg_history."timestamp", pkg_history.result, pkg_history.build_time, pkg_history.disk_space
   FROM public.pkg_history
  WHERE pkg_history.architecture = 'sparc';
ALTER TABLE "sparc".pkg_history OWNER TO wbadm;
REVOKE ALL ON "sparc".pkg_history FROM PUBLIC;
GRANT SELECT ON "sparc".pkg_history TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "sparc".pkg_history TO wb_all;
CREATE OR REPLACE RULE pkg_history_insert AS
	ON INSERT TO "sparc".pkg_history DO INSTEAD
	INSERT INTO public.pkg_history (architecture, package, distribution, version, "timestamp", result, build_time, disk_space)
	VALUES ('sparc', new.package, new.distribution, new.version, new."timestamp", new.result, new.build_time, new.disk_space);
CREATE OR REPLACE RULE pkg_history_update AS
	ON UPDATE TO "sparc".pkg_history DO INSTEAD
	UPDATE public.pkg_history p
		SET result = new.result,
			build_time = new.build_time,
			disk_space = new.disk_space
	WHERE p.architecture = 'sparc' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;
CREATE OR REPLACE RULE pkg_history_delete AS
	ON DELETE TO "sparc".pkg_history DO INSTEAD
	DELETE FROM public.pkg_history p
	WHERE p.architecture = 'sparc' AND
		p.package = old.package AND
		p.distribution = old.distribution AND
		p.version = old.version AND
		p.timestamp = old.timestamp;

CREATE OR REPLACE VIEW "alpha".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'alpha';
ALTER TABLE "alpha".users OWNER TO wbadm;
REVOKE ALL ON "alpha".users FROM PUBLIC;
GRANT SELECT ON "alpha".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "alpha".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "alpha".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('alpha', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "alpha".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'alpha' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "alpha".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'alpha' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "amd64".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'amd64';
ALTER TABLE "amd64".users OWNER TO wbadm;
REVOKE ALL ON "amd64".users FROM PUBLIC;
GRANT SELECT ON "amd64".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "amd64".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "amd64".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('amd64', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "amd64".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'amd64' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "amd64".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'amd64' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "arm".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'arm';
ALTER TABLE "arm".users OWNER TO wbadm;
REVOKE ALL ON "arm".users FROM PUBLIC;
GRANT SELECT ON "arm".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "arm".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "arm".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('arm', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "arm".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'arm' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "arm".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'arm' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "armel".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'armel';
ALTER TABLE "armel".users OWNER TO wbadm;
REVOKE ALL ON "armel".users FROM PUBLIC;
GRANT SELECT ON "armel".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "armel".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "armel".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('armel', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "armel".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'armel' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "armel".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'armel' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "hppa".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'hppa';
ALTER TABLE "hppa".users OWNER TO wbadm;
REVOKE ALL ON "hppa".users FROM PUBLIC;
GRANT SELECT ON "hppa".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "hppa".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "hppa".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('hppa', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "hppa".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'hppa' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "hppa".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'hppa' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "hurd-i386".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'hurd-i386';
ALTER TABLE "hurd-i386".users OWNER TO wbadm;
REVOKE ALL ON "hurd-i386".users FROM PUBLIC;
GRANT SELECT ON "hurd-i386".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "hurd-i386".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "hurd-i386".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('hurd-i386', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "hurd-i386".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'hurd-i386' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "hurd-i386".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'hurd-i386' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "i386".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'i386';
ALTER TABLE "i386".users OWNER TO wbadm;
REVOKE ALL ON "i386".users FROM PUBLIC;
GRANT SELECT ON "i386".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "i386".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "i386".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('i386', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "i386".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'i386' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "i386".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'i386' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "ia64".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'ia64';
ALTER TABLE "ia64".users OWNER TO wbadm;
REVOKE ALL ON "ia64".users FROM PUBLIC;
GRANT SELECT ON "ia64".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "ia64".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "ia64".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('ia64', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "ia64".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'ia64' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "ia64".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'ia64' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "kfreebsd-amd64".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'kfreebsd-amd64';
ALTER TABLE "kfreebsd-amd64".users OWNER TO wbadm;
REVOKE ALL ON "kfreebsd-amd64".users FROM PUBLIC;
GRANT SELECT ON "kfreebsd-amd64".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "kfreebsd-amd64".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "kfreebsd-amd64".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('kfreebsd-amd64', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "kfreebsd-amd64".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'kfreebsd-amd64' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "kfreebsd-amd64".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'kfreebsd-amd64' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "kfreebsd-i386".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'kfreebsd-i386';
ALTER TABLE "kfreebsd-i386".users OWNER TO wbadm;
REVOKE ALL ON "kfreebsd-i386".users FROM PUBLIC;
GRANT SELECT ON "kfreebsd-i386".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "kfreebsd-i386".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "kfreebsd-i386".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('kfreebsd-i386', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "kfreebsd-i386".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'kfreebsd-i386' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "kfreebsd-i386".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'kfreebsd-i386' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "mips".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'mips';
ALTER TABLE "mips".users OWNER TO wbadm;
REVOKE ALL ON "mips".users FROM PUBLIC;
GRANT SELECT ON "mips".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "mips".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "mips".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('mips', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "mips".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'mips' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "mips".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'mips' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "mipsel".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'mipsel';
ALTER TABLE "mipsel".users OWNER TO wbadm;
REVOKE ALL ON "mipsel".users FROM PUBLIC;
GRANT SELECT ON "mipsel".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "mipsel".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "mipsel".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('mipsel', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "mipsel".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'mipsel' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "mipsel".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'mipsel' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "powerpc".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'powerpc';
ALTER TABLE "powerpc".users OWNER TO wbadm;
REVOKE ALL ON "powerpc".users FROM PUBLIC;
GRANT SELECT ON "powerpc".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "powerpc".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "powerpc".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('powerpc', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "powerpc".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'powerpc' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "powerpc".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'powerpc' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "s390".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 's390';
ALTER TABLE "s390".users OWNER TO wbadm;
REVOKE ALL ON "s390".users FROM PUBLIC;
GRANT SELECT ON "s390".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "s390".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "s390".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('s390', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "s390".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 's390' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "s390".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 's390' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "sparc".users AS
 SELECT users.username, users.distribution, users.last_seen
   FROM public.users
  WHERE users.architecture = 'sparc';
ALTER TABLE "sparc".users OWNER TO wbadm;
REVOKE ALL ON "sparc".users FROM PUBLIC;
GRANT SELECT ON "sparc".users TO wb_security;
GRANT SELECT, INSERT, UPDATE ON "sparc".users TO wb_all;
CREATE OR REPLACE RULE users_insert AS
	ON INSERT TO "sparc".users DO INSTEAD
	INSERT INTO public.users (architecture, username, distribution, last_seen)
	VALUES ('sparc', new.username, new.distribution, new.last_seen);
CREATE OR REPLACE RULE users_update AS
	ON UPDATE TO "sparc".users DO INSTEAD
	UPDATE public.users u
		SET last_seen = new.last_seen
	WHERE u.architecture = 'sparc' AND
		u.distribution = old.distribution AND
		u.username = old.username;
CREATE OR REPLACE RULE users_delete AS
	ON DELETE TO "sparc".users DO INSTEAD
	DELETE FROM public.users u
	WHERE u.architecture = 'sparc' AND
		u.distribution = old.distribution AND
		u.username = old.username;

CREATE OR REPLACE VIEW "alpha".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'alpha';
ALTER TABLE "alpha".transactions OWNER TO wbadm;
REVOKE ALL ON "alpha".transactions FROM PUBLIC;
GRANT SELECT ON "alpha".transactions TO wb_security;
GRANT SELECT, INSERT ON "alpha".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "alpha".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('alpha', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "amd64".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'amd64';
ALTER TABLE "amd64".transactions OWNER TO wbadm;
REVOKE ALL ON "amd64".transactions FROM PUBLIC;
GRANT SELECT ON "amd64".transactions TO wb_security;
GRANT SELECT, INSERT ON "amd64".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "amd64".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('amd64', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "arm".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'arm';
ALTER TABLE "arm".transactions OWNER TO wbadm;
REVOKE ALL ON "arm".transactions FROM PUBLIC;
GRANT SELECT ON "arm".transactions TO wb_security;
GRANT SELECT, INSERT ON "arm".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "arm".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('arm', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "armel".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'armel';
ALTER TABLE "armel".transactions OWNER TO wbadm;
REVOKE ALL ON "armel".transactions FROM PUBLIC;
GRANT SELECT ON "armel".transactions TO wb_security;
GRANT SELECT, INSERT ON "armel".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "armel".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('armel', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "hppa".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'hppa';
ALTER TABLE "hppa".transactions OWNER TO wbadm;
REVOKE ALL ON "hppa".transactions FROM PUBLIC;
GRANT SELECT ON "hppa".transactions TO wb_security;
GRANT SELECT, INSERT ON "hppa".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "hppa".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('hppa', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "hurd-i386".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'hurd-i386';
ALTER TABLE "hurd-i386".transactions OWNER TO wbadm;
REVOKE ALL ON "hurd-i386".transactions FROM PUBLIC;
GRANT SELECT ON "hurd-i386".transactions TO wb_security;
GRANT SELECT, INSERT ON "hurd-i386".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "hurd-i386".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('hurd-i386', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "i386".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'i386';
ALTER TABLE "i386".transactions OWNER TO wbadm;
REVOKE ALL ON "i386".transactions FROM PUBLIC;
GRANT SELECT ON "i386".transactions TO wb_security;
GRANT SELECT, INSERT ON "i386".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "i386".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('i386', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "ia64".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'ia64';
ALTER TABLE "ia64".transactions OWNER TO wbadm;
REVOKE ALL ON "ia64".transactions FROM PUBLIC;
GRANT SELECT ON "ia64".transactions TO wb_security;
GRANT SELECT, INSERT ON "ia64".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "ia64".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('ia64', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "kfreebsd-amd64".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'kfreebsd-amd64';
ALTER TABLE "kfreebsd-amd64".transactions OWNER TO wbadm;
REVOKE ALL ON "kfreebsd-amd64".transactions FROM PUBLIC;
GRANT SELECT ON "kfreebsd-amd64".transactions TO wb_security;
GRANT SELECT, INSERT ON "kfreebsd-amd64".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "kfreebsd-amd64".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('kfreebsd-amd64', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "kfreebsd-i386".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'kfreebsd-i386';
ALTER TABLE "kfreebsd-i386".transactions OWNER TO wbadm;
REVOKE ALL ON "kfreebsd-i386".transactions FROM PUBLIC;
GRANT SELECT ON "kfreebsd-i386".transactions TO wb_security;
GRANT SELECT, INSERT ON "kfreebsd-i386".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "kfreebsd-i386".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('kfreebsd-i386', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "mips".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'mips';
ALTER TABLE "mips".transactions OWNER TO wbadm;
REVOKE ALL ON "mips".transactions FROM PUBLIC;
GRANT SELECT ON "mips".transactions TO wb_security;
GRANT SELECT, INSERT ON "mips".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "mips".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('mips', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "mipsel".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'mipsel';
ALTER TABLE "mipsel".transactions OWNER TO wbadm;
REVOKE ALL ON "mipsel".transactions FROM PUBLIC;
GRANT SELECT ON "mipsel".transactions TO wb_security;
GRANT SELECT, INSERT ON "mipsel".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "mipsel".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('mipsel', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "powerpc".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'powerpc';
ALTER TABLE "powerpc".transactions OWNER TO wbadm;
REVOKE ALL ON "powerpc".transactions FROM PUBLIC;
GRANT SELECT ON "powerpc".transactions TO wb_security;
GRANT SELECT, INSERT ON "powerpc".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "powerpc".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('powerpc', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "s390".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 's390';
ALTER TABLE "s390".transactions OWNER TO wbadm;
REVOKE ALL ON "s390".transactions FROM PUBLIC;
GRANT SELECT ON "s390".transactions TO wb_security;
GRANT SELECT, INSERT ON "s390".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "s390".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('s390', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);

CREATE OR REPLACE VIEW "sparc".transactions AS
 SELECT package, distribution, version, action, prevstate, state, real_user, set_user, "time"
   FROM public.transactions
  WHERE architecture = 'sparc';
ALTER TABLE "sparc".transactions OWNER TO wbadm;
REVOKE ALL ON "sparc".transactions FROM PUBLIC;
GRANT SELECT ON "sparc".transactions TO wb_security;
GRANT SELECT, INSERT ON "sparc".transactions TO wb_all;
CREATE OR REPLACE RULE transactions_insert AS
	ON INSERT TO "sparc".transactions DO INSTEAD
	INSERT INTO public.transactions (architecture, package, distribution, version, action, prevstate, state, real_user, set_user, "time")
	VALUES ('sparc', new.package, new.distribution, new.version, new.action, new.prevstate, new.state, new.real_user, new.set_user, new.time);
COMMIT;

