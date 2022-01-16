module crud 

import crud
import mysql

pub fn get_user(mut s mysql.Connection, username string) []string {
	return crud.grab_user_info(mut s, username)
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