import crud

import mysql

fn main() {
	mut conn := mysql.Connection{
		host: "127.0.0.1",
		username: "root",
		password: "Niggered12!",
		dbname: "skrillec_net"
	}
	find_table, table_count := crud.row_counter(mut conn, "users")

	if find_table  == 0 {
		println("The TABLE was not found in the database!")
	} else {
		println("Exit Code: ${find_table} | Table Rows: ${table_count}")
	}
}