/**********************************************
*	Making easier function for MySQL to use!  *
**********************************************/
module crud

import mysql

/* This function reads all users from mySQL DB */
fn grab_users(mut s mysql.Connection, user string) []string {
        s.connect() or { panic("[x] Error, Failed to connect to MySQL!") }
        q_resp := s.query(q) or { panic("Unable to send query to MySQL!") }
        mut row := []string
        for i in q_resp.maps() {
			if i['username'] == user {
                row << i['username']
                row << i['ip']
                row << i['password']
                row << i['level']
                row << i['maxtime']
                row << i['conn']
                row << i['ongoing']
                row << i['admin']
                row << i['expiry']
			}
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
pub fn mysql_select(mut s mysql.Connection, selectt string, from string, where string) {
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