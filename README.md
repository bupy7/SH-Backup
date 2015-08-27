sh-backup
=========

SH-Backup - easy backup for your sites. Makes backup files and MySQL databases. Backup stored 30 days and after will removed.

### Usage
Enter follow code in terminal:
```
$ sh sh_backup.sh -fs ~/my_site -fb ~/backup -u user -p 1234 -d my_db_name [-e name@mail.com]
```

### Arguments
+ -fs - Path to directory where content web application.
+ -fb - Path to directory where will be stored backups.
+ -u - Username of MySQL
+ -p - Password of MySQL
+ -d - Database of web application.
+ -e - Email at which will be sent report about backup. Message for send can change in file msg_ok.txt - if successfully and msg_error.txt - if error.
Arguments  -fs, -fb, -u, -p, -d - required!

> Note! Path must be set without closure at slash!
