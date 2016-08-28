sh-backup
=========

Easy backup files and MySQL/PostgreSQL database.

Feature
-------

- MySQL/PostgreSQL dump
- Archiving files
- Upload to FTP

Requirements
------------

- [LFTP](https://github.com/lavv17/lftp)
- Bash
- MySQL or PostgreSQL
- Linux or OS X

Configuration
-------------

- `ROOT_DIR`='Path to file directory'
- `DB_TYPE`='Database type (mysql or postgresql)'
- `DB_HOST`='localhost or another'
- `DB_PORT`='for mysql 3306, for postgresql 5432 or another'
- `DB_PASSWORD`='Database password'
- `DB_USERNAME`='Database username'
- `DB_NAME`='Database name'
- `FTP_SSL` - Use or no SSL. By default 'no'.
- `FTP_HOST`='FTP IP-address'
- `FTP_LOGIN`='FTP login'
- `FTP_PASSWORD`='FTP password'
- `FTP_ROOT`='Path to directory on FTP'
- `MAX_STORAGE_TIME` - Max storage time backups in FTP (Time in seconds. By default 30 days.).

Example:

```
ROOT_DIR=/Volumes/Home/User/sites/sh-backup
DB_TYPE='mysql'
DB_HOST='localhost'
DB_PORT=3306
DB_PASSWORD='1234'
DB_USERNAME='root'
DB_NAME='sh-backup'
FTP_SSL='no'
FTP_HOST='100.100.100.100'
FTP_LOGIN='ftp_user'
FTP_PASSWORD='ftp_pass'
FTP_ROOT='/'
MAX_STORAGE_TIME=2592000 # 30 days
```

Usage
-----

1. Clone or download the sh-backup.
2. Copy a config file `backup.conf.dist` to `backup.conf`.
3. Configure your the `backup.conf` file.
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

### Notes for PostgreSQL

For correct to work `sh-backup` you must have `md5` or `password` auth-method in
[`pg_hba.conf`](https://www.postgresql.org/docs/9.5/static/auth-pg-hba-conf.html) for your a database.

For authentication uses [`.pgpass`](https://www.postgresql.org/docs/9.5/static/libpq-pgpass.html)
file. If one not exists will try the file create.

License
-------

sh-backup is released under the BSD 3-Clause License.
