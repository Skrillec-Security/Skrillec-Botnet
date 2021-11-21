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

pub fn get_all_rows(mut s mysql.Connection, table string) {
	s.connect() or { panic("[x] Error, Failed to connect to MySQL!") exit(0)}
	table_query := s.query()
}