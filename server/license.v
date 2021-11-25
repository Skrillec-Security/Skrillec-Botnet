module server

import net
import net.http

pub fn update_check() {
	
}

pub fn validate_token(token string) {
	mut try_key := http.get_text("https://codetheworld.xyz/skrillec/?key=${token}")
	if try_key.starts_with("[x]") {
		print("[x] Error, Invalid key!\r\n")
		exit(0)
	} else if try_key.starts_with("[+]") {
		print("[+] Key Authorized! Welcome to Skrillec NET v4.0.0\r\n")
	} else {
		print("Something went wrong trying to validate your skrillec token! please try again later or contact owner!\r\n")
		exit(0)
	}
}