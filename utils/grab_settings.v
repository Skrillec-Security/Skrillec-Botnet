module utils

import os
import utils

pub fn settings_checker() int {
	//check for the settings file!
	// return 1 if its there
	return 0
}

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

// Returning the amount of keys found in the structure field!
pub fn hostname_settings() (int, []string) {
	return 0, ["", ""]
}