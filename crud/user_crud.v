module crud 

import crud
import mysql

pub fn get_user(mut s mysql.Connection, username string) []string {
	return crud.grab_user_info(mut s, username)
}

pub fn edit_info(mut s mysql.Connection, edits []string) int {
	mut querys := []string
	if "-ip" in edits { querys << "" }
	if "-lvl" in edits { querys << "" }
	if "-mtime" in edits { querys << "" }
	if ""
}