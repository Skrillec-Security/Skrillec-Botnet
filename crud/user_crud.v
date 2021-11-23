module crud

import crud
import mysql

pub fn get_user(mut s mysql.Connection, username string) []string {
	rows := crud.grab_user_info(mut s, username)
	return rows
}