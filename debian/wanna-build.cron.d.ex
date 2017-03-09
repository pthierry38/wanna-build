#
# Regular cron jobs for the wanna-build package
#
0 4	* * *	root	[ -x /usr/bin/wanna-build_maintenance ] && /usr/bin/wanna-build_maintenance
