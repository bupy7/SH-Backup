sh-backup
=========

Easy backup files and MySQL/PostgreSQL database.

Feature
-------

- MySQL/PostgreSQL Dump
- Archiving files
- Upload to FTP

Requirements
------------

- [LFTP](https://github.com/lavv17/lftp)
- Bash
- MySQL/PostgreSQL
- Linux or OS X

Configuration
-------------

- `ROOT_DIR`='Path to file directory'
- `DB_TYPE`='Database type (mysql or postgresql)'
- `DB_PASSWORD`='Database password'
- `DB_USERNAME`='Database username'
- `DB_NAME`='Database name'
- `FTP_HOST`='FTP IP-address'
- `FTP_LOGIN`='FTP login'
- `FTP_PASSWORD`='FTP password'
- `FTP_ROOT`='Path to directory on FTP'
- `MAX_STORAGE_TIME` - Max storage time backups in FTP (Time in seconds. By default 30 days.).

Example:

```
ROOT_DIR=/Volumes/Home/User/sites/sh-backup
DB_TYPE='mysql'
DB_PASSWORD='1234'
DB_USERNAME='root'
DB_NAME='sh-backup'
FTP_HOST='100.100.100.100'
FTP_LOGIN='ftp_user'
FTP_PASSWORD='ftp_pass'
FTP_ROOT='/'
MAX_STORAGE_TIME=2592000 # 30 days
```

Usage
-----

1. Clone of download the sh-backup.
2. Copy the config file `backup.conf.dist` to `backup.conf`.
3. Configure your `backup.conf` file.
4. Run command:

```bash
$ bash backup
Backup...
- Prepare files...
- Prepare database...
- Archiving...
- Uploading to FTP...
- Cleaning tmp...                                 
OK
```

License
-------

sh-backup is released under the BSD 3-Clause License.
