module server

import net
import net.http
import server

pub fn update_check() {
	mut check_update := http.get_text("https://codetheworld.xyz/skrillec/?key=gfrwegregregergergeg")
	if check_update.contains("Update: 4.0.0") {} else { print("[x] A new update was found. Download the new update! Auto update is coming soon!\r\n") exit(0) }
}

pub fn validate_token(mut svr server.Server) int {
	mut try_key := http.get_text("https://codetheworld.xyz/skrillec/?key=${svr.cnc_key}")
	if try_key.contains("[x]") {
		print("[x] Error, Invalid key!\r\n")
		return 0
	} else if try_key.contains("[+]") {
		print("[+] Key Authorized! Welcome to Skrillec NET v4.0.0\r\n")
		return 1
	} else {
		print("Something went wrong trying to validate your skrillec token! please try again later or contact owner!\r\n")
		return 0
	}
}