BEGIN;

CREATE TABLE public.locks AS
	SELECT DISTINCT distribution, architecture FROM packages;
ALTER TABLE public.locks OWNER TO wbadm;
REVOKE ALL ON public.locks FROM PUBLIC;
GRANT SELECT ON public.locks TO PUBLIC;
GRANT UPDATE ON public.locks TO wb_all;

COMMIT;
