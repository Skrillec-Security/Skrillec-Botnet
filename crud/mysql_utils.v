/**********************************************
*	Making easier function for MySQL to use!  *
**********************************************/
module crud

import mysql

pub fn get_row(mut s mysql.Connection, q string) string {
	s.connect() ? or { panic("[x] Error, Failed to connect to MySQL!") }
	q_resp := s.query(q)
}