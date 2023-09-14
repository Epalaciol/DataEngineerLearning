show con_name

select name,open_mode
from v$pdbs;

alter session set container=xepdb1

show con_name

alter pluggable database xepdb1 close;

select name,open_mode
from v$pdbs;

alter pluggable database xepdb1 open;

select name,open_mode
from v$pdbs;

alter pluggable database all open;

--alter session set container =cdb$root
--show con_name
--alter pluggable database all open;


CREATE PLUGGABLE DATABASE training 
  ADMIN USER admin IDENTIFIED BY password
  STORAGE (MAXSIZE 2G)
  DEFAULT TABLESPACE sales 
    DATAFILE '/opt/oracle/oradata/XE/pdbseed/system01.dbf' SIZE 250M 
    AUTOEXTEND ON
    FILE_NAME_CONVERT = ('/opt/oracle/oradata/XE/pdbseed/', 
                         '/opt/oracle/oradata/XE/training/');