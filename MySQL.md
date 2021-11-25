Debian MySQL Installation Tutorial: https://www.digitalocean.com/community/tutorials/how-to-install-the-latest-mysql-on-debian-10

Ubuntu MySQL Installation Tutorial: https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04

While installing MySQL. It should ask to you create or change the PW!
Insert MySQL Data

Start MySQL
```
mysql -u root -p
```

Create database
```
create database skrillec_net;
```

Create the USERS table
```
create table users(username varchar(20), ip varchar(20), password varchar(90), level int, maxtime int, conn int, ongoing int, admin int, expiry int);
```


Create your NET acc
```
INSERT INTO users(username, ip, password, level, maxtime, conn, ongoing, admin, expiry) VALUES("your_username", "1.1.1.1", SHA1("your_password"), 9, 1200, 99, 0, 3, "99/99/9999");
```