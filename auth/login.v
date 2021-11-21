module auth

pub struct CurrentLogin{
	pub mut:
		username 	string
		password	string
		ip			string
}

pub fn login(mut c CurrentLogin) {
	
}