/**********************************************
*	Making easier function for MySQL to use!  *
**********************************************/
module crud

import mysql

pub fn get_row(mut s mysql.Connection, q string) []string {
	s.connect() or { panic("[x] Error, Failed to connect to MySQL!") exit(0) }
	q_resp := s.query(q)
	mut row := []string
	for i in q_resp.map() {
		row << i
	}
	q_resp.free()
	s.close()
	return row
}

/*
get_all_rows(mysql.Connection{
	host: ""
	port: 0
	username: ""
	password: ""
	dbname: ""
}, "ongoing", "users", "username=root") // this function called here is pulling 'ongoing' value from the username root in MySQL db
*/
pub fn get_all_rows(mut s mysql.Connection, selectt string, from string, where string) {
	s.connect() or { panic("[x] Error, Failed to connect to MySQL!") exit(0)}
	table_query := s.query('SELECT * FROM ${table}')
	if where.len > 0 {
		table_query += " WHERE ${where}"
	}
	mut rows := []string
	for i in table_query.map() {
		rows << "${i},"
	}
	rows[rows.len] = rows[rows.len].replace(",", "")
	return rows
}