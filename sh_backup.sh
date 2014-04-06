#!bin/sh
# SH Backup 1.0
# Vasilij Belosludcev 13-02-2014
#
# Backup for your web-application. Backup files and dump database.
# Backup stored 30 days and after will removed.
#
# Example use:
# sh sh_backup.sh -fs ~/my_site -fb ~/backup -u user -p 1234 -d my_db_name [-e name@mail.com]
#
# Description of arguments:
# "-fs" and "-fb" - Directory where is your site and backup folder. Without a slash at the ending.
# "-u" - Username of database
# "-p" - Password of database
# "-d" - Name database
# "-e" - Email to receive messages 

if [ $# -eq 0 ]; then
	echo "Fatal error"
	exit 1;
fi

while [ $# -gt 0 ]; do
	case "${1}" in
		-fs) folder_site=$2; shift 2;;
		-fb) fb=$2; shift 2;;
		-u) db_user=$2; shift 2;;
		-p) db_pass=$2; shift 2;;
		-d) db_name=$2; shift 2;;
		-e) email=$2; shift 2;;
	esac
done	

if test -z $folder_site ||  test -z $db_user || test -z $db_pass || test -z $db_name; then
	echo "Not all arguments have been specified"
	exit 1
fi

script=`readlink -f "$0"`
src_path=`dirname $script`

readonly d=`date +%s`
folder_backup=$fb"/backup_"`date --date="@${d}" +%F`"_"`date --date="@${d}" +%H%M%S`

sendMail ()
{
	if test -z $email; then
		return
	fi
		
	if [ $1 -eq 1 ]; then
		mail -s "Backup web-application" "${email}" < $src_path/msg_ok.txt
	else
		mail -s "Backup web-application" "${email}" < $src_path/msg_error.txt
	fi
}

#create backup
mkdir $folder_backup
echo `date --date="@${d}"`" > Start" > $folder_backup/log.txt || exit 1
echo "`date` > Create directory ${folder_backup}" >> $folder_backup/log.txt

cd $folder_site
tar -czpf $folder_backup/www.tar.gz *
if [ ${?} -ne 0 ]; then
	echo "`date` > Error backup root folder a site" >> $folder_backup/log.txt
	sendMail 0
	exit 1
fi
echo "`date` > Backup root folder a site" >> $folder_backup/log.txt

mysqldump -u$db_user -p$db_pass $db_name | gzip > $folder_backup/$db_name.sql.gz
if [ ${?} -ne 0 ]; then
	echo "`date` > Error backup database" >> $folder_backup/log.txt
	sendMail 0
	exit 1
fi
echo "`date` > Backup database" >> $folder_backup/log.txt

#delete all backup that is created 30 days ago
readonly storage=$((24*31*60*60)) #30 days
time_delete=`date --date="@$((d-storage))" +%F`;

cd $folder_backup/../
find . -type d -name "backup_${time_delete}_*" | xargs rm -rf
if [ ${?} -ne 0 ]; then
	echo "`date` > Error delete old backup" >> $folder_backup/log.txt
	sendMail 0
	exit 1
fi
echo "`date` > Successfully removed old backups or they not were found" >> $folder_backup/log.txt

sendMail 1

exit 0
