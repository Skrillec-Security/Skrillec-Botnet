import os
import crud
import config
import server
import utils
import mysql

fn main() {
	mut sql_pw := os.input("MySQL Password: \x1b[30m")
	print("\x1b[39m")
	mut sql_info := config.get_db_info()
	mut sql := mysql.Connection{
		host: "127.0.0.1",
		port: 3306,
		username: "root",
		password: sql_pw,
		dbname: "skrillec_net"
	}
	mut user_info := crud.grab_user_info(sql, "root")
	println(user_info)
}