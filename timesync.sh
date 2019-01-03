

#크론탭으로 하루 한번
vim /etc/crontab
0 5 * * * root /usr/bin/rdate -s time.bora.net && /sbin/hwclock -w


#부팅시 
vim /etc/rc.local
/usr/bin/rdate -s time.bora.net
/sbin/hwclock -w
exit 0

