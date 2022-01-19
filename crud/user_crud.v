/*
	This file contains both MySQL and local file support!
	if the server fails to connect to MySQL then it will use local files!

	if you want a backup of your MySQL tables in your local files. you can 
	use the '--backup_sql' flag 
*/
module crud 

import os
import crud
import mysql

const ( 
	local_db_path = "${os.getwd()}/assets/db/users.skrillec"
)

pub fn get_user(mut s mysql.Connection, username string) []string {
	check_mysql := crud.grab_user_info(mut s, username)
	if check_mysql[0] == "[x] Error, Failed to connect to MySQL!" {
		exit_c, check_local := crud.find_user(username)
		print(check_local)
		return check_local
	}
	return check_mysql
}

pub fn find_user(username string) (int, []string) {
	mut users := os.read_lines(os.getwd() + "/assets/db/users.skrillec") or { panic("[x] Error, Unable to read local DB file!") }
	for user in users {
		println(user)
		parse_line := ((user.replace("('", "")).replace("')", "")).split(" ")
		if parse_line[0] == username {
			return 1, parse_line
		}
	}
	return 0, ['', '']
}

pub fn remove_user(mut s mysql.Connection, username string) int {
	users := os.read_lines(local_db_path) or { return 0 }
	mut new_db := ""
	for user in users {
		if user.starts_with("('${username}','") {} else {
			new_db += "${user}\n"
		}
	}
	os.write_file(local_db_path, new_db) or { return 0 }
	return 1
}

pub fn update_user(mut s mysql.Connection, username string, update []string) int {
	if update.len != 2 { return 0 }
	mut check_mysql := crud.edit_user(mut s, "users", ["username", username], [update[0], update[1]])
	if check_mysql == 0 {
		
	}
	return 0
}

// pub fn edit_info(mut s mysql.Connection, edits []string) int {
// 	mut querys := []string
// 	for i, arg in  {
// 		match arg {
// 			"-ip" in edits { 
// 				crud.edit_user(mysql.Connection{

// 				}, username, "ip='${edits[i+1]}'")
// 			}
// 			if "-lvl" in edits { 
// 				crud.edit_user(mysql.Connection{

// 				}, username, "level='${edits[i+1]}'")
// 			}
// 			if "-mtime" in edits { 
// 				crud.edit_user(mysql.Connection{

// 				}, username, "maxtime='${edits[i+1]}'")
// 			}
// 			if "-conn" in edits { 
// 				crud.edit_user(mysql.Connection{

// 				}, username, "conn='${edits[i+1]}'")
// 			}
// 			if "-admin" in edits { 
// 				crud.edit_user(mysql.Connection{

// 				}, username, "admin='${edits[i+1]}'") 
// 			}
// 			if "expiry" in edits { 
// 				crud.edit_user(mysql.Connection{

// 				}, username, "expiry='${edits[i+1]}'")
// 			}
// 		}
// 	}
// }