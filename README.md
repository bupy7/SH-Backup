sh-backup
=========

Easy backup files and MySQL database.

Feature
-------

- MySQL Dump
- Archiving files
- Upload to FTP

Requirements
------------

- [LFTP](https://github.com/lavv17/lftp)
- Bash
- Linux or OS X

Configuration
-------------

- `ROOT_DIR`='Path to file directory'
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
