module crud

import os
import crud
import mysql

const (
	local_api_path = "${os.getwd()}/assets/db/apis.skrillec"
)

pub fn get_api(mut s mysql.Connection, api_name string) []string {
	return crud.grab_api_info(mut &s, api_name)
}