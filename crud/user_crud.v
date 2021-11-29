module crud

import crud
import mysql

pub fn get_user(username string, mut s mysql.Connection) {
        rows := s.query("select $username from users") ?
        return rows
}

pub fn create_user(username string, password string, maxtime int, level string, expiry string, admin int, mut s mysql.Connection) {
        s.insert(table, username, password, maxtime, level, expiry, admin) ?
}

pub fn delete_user(username string, mut s mysql.Connection) {
        s.delete(table, username) ?
        }

pub fn update_user(username string, password string, maxtime int, level string, expiry string, admin int, mut s mysql.Connection) {
        s.update(table, username, "username")
}
