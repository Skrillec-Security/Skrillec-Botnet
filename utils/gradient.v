module utils

pub fn gradient(startrgb []int, endrgb []int, text string) string {
	change_r := endrgb[0] - startrgb[0] / text.len
	change_g := endrgb[1] - startrgb[1] / text.len
	change_b := endrgb[2] - startrgb[2] / text.len

	mut r := startrgb[0]
	mut g := startrgb[1]
	mut b := startrgb[2]

	mut grad_text := ""
	for letter in text {
		if letter.ascii_str() == "\n" { 
			grad_text += "\n"
			continue 
		}
		grad_text += "\x1b[38;2;${r};${g};${b}m${letter.ascii_str()}"
	}

	r += change_r
	g += change_g
	b += change_b

	return grad_text + "\x1b[39m"
}