CRONTAB = $(CURDIR)/crontab

install:
	@if [ `whoami` = wbadm ]; then \
	    crontab $(CRONTAB); \
	else \
	    echo >&2 'Error: must run as user wbadm.'; \
	    exit 1; \
	fi

check:
	@-crontab -l | diff -u $(CRONTAB) -

