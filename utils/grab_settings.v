module utils

import os
import utils

pub fn grab_port() string {
	mut file_d := os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }
	p := utils.parse(file_d, "Net_Info", "net_port")
	return p
}

pub fn grab_cnc_token() string {
	mut file_d := os.read_file(os.getwd() + "/assets/config.skrillec") or { "" }
	if file_d.contains("skrillec_key") {} else { return "" }
	token := utils.parse(file_d, "Net_Info", "skrillec_key")
	return token
}