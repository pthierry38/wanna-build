create role alpha;
create role amd64;
create role arm;
create role armel;
create role hppa;
create role i386;
create role ia64;
create role "kfreebsd-amd64";
create role "kfreebsd-i386";
create role mips;
create role mipsel;
create role powerpc;
create role s390;
create role sparc;
create role "hurd-i386";

create user buildd_alpha;
create user buildd_amd64;
create user buildd_arm;
create user buildd_armel;
create user buildd_hppa;
create user buildd_i386;
create user buildd_ia64;
create user "buildd_kfreebsd-amd64";
create user "buildd_kfreebsd-i386";
create user buildd_mips;
create user buildd_mipsel;
create user buildd_powerpc;
create user buildd_s390;
create user buildd_sparc;
create user "buildd_hurd-i386";

grant alpha to buildd_alpha;
grant amd64 to buildd_amd64;
grant arm to buildd_arm;
grant armel to buildd_armel;
grant hppa to buildd_hppa;
grant i386 to buildd_i386;
grant ia64 to buildd_ia64;
grant "kfreebsd-amd64" to "buildd_kfreebsd-amd64";
grant "kfreebsd-i386" to "buildd_kfreebsd-i386";
grant mips to buildd_mips;
grant mipsel to buildd_mipsel;
grant powerpc to buildd_powerpc;
grant s390 to buildd_s390;
grant sparc to buildd_sparc;
grant "hurd-i386" to "buildd_hurd-i386";

create role wb_all in role alpha, amd64, arm, armel, hppa, i386, ia64, "kfreebsd-amd64", "kfreebsd-i386", mips, mipsel, powerpc, s390, sparc;
grant "hurd-i386" to wb_all;

grant wb_all to wbadm;

create user aba in role wbadm;
create user adeodato in role wbadm;
create user aloiret in role alpha;
create user aurel32 in role arm, armel, "kfreebsd-amd64", "kfreebsd-i386";
create user colint in role arm, armel;
create user fs in role amd64;
create user he in role sparc, wbadm;
create user jurij in role wb_all;
create user kibi in role "kfreebsd-amd64", "kfreebsd-i386";
create user kroeckx in role amd64, i386, wb_all, wbadm;
create user lamont in role hppa, ia64;
create user luk in role i386, wbadm;
create user p2 in role mips;
create user pkern in role i386, powerpc, wbadm;
create user riku in role arm, armel;
create user vorlon in role alpha, wb_all;
create user waldi in role s390;
create user wookey in role arm, armel;
create user wouter in role powerpc;
create user zobel in role mipsel, sparc, wb_all;
create user sthibault in role "hurd-i386";
create user mbanck in role "hurd-i386";

create role wb_security;

create user sf in role wb_security;
create user devin in role wb_security;
create user fw in role wb_security;
create user geissert in role wb_security;
create user iuculano in role wb_security;
create user jmm in role wb_security;
create user joey in role wb_security;
create user nion in role wb_security;
create user noahm in role wb_security;
create user seb in role wb_security;
create user thijs in role wb_security;
create user white in role wb_security;
grant wb_security to dannf;

create user nomeata in role wb_all;

