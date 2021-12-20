module crud

import crud
import mysql

pub fn get_api(mut s mysql.Connection, api_name string) []string {
	return crud.grab_api_info(mut &s, api_name)
}