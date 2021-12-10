module utils

/*
File Notes: Ignoring lines starting with 'grad' (each found will increase 'grad_c' which will mean find 'grad_<grad_c>'  in file)
File Exmaple:

grad_1 = [255, 255, 255], [255, 255, 255]

*/

pub struct FileGradient{
	pub mut:
		file		string
		grad_c		int
}

pub fn get_gradient_rgb() {
	
}

pub fn gradient(startrgb []string, endrgb []string, text string) string {
	change_r := endrgb[0].int() - startrgb[0].int() / text.len
	change_g := endrgb[1].int() - startrgb[1].int() / text.len
	change_b := endrgb[2].int() - startrgb[2].int() / text.len

	mut r := startrgb[0].int()
	mut g := startrgb[1].int()
	mut b := startrgb[2].int()

	for num in 0..2 {
		r += change_r
		g += change_g
		b += change_b
	}
	mut grad_text := ""
	for f in text {
		letter := f.ascii_str()
		if letter == "\n" { 
			grad_text += "\n"
			continue 
		}
		print("\x1b[38;2;${r};${g};${b}m${letter}")
		grad_text += "\x1b[38;2;${r};${g};${b}m${letter}"

		print(" | RGB Colors: [${r},${g},${b}] | ")
		r += change_r
		g += change_g
		b += change_b
		print("[${r},${g},${b}]\r\n")
	}

	return grad_text + "\x1b[39m"
}

pub fn gradiennt(startrgb []int, endrgb []int, text string) string {
	change_r := endrgb[0] - startrgb[0] / text.len
	change_g := endrgb[1] - startrgb[1] / text.len
	change_b := endrgb[2] - startrgb[2] / text.len

	mut r := startrgb[0]
	mut g := startrgb[1]
	mut b := startrgb[2]

	mut grad_text := ""
	for f in text {
		letter := f.ascii_str()
		if letter == "\n" { 
			grad_text += "\n"
			continue 
		}
		print("\x1b[38;2;${r};${g};${b}m${letter}")
		grad_text += "\x1b[38;2;${r};${g};${b}m${letter}"
		print(" | RGB Colors: [${r},${g},${b}] | ")
		r += change_r
		g += change_g
		b += change_b
		print("[${r},${g},${b}]\r\n")

	}

	return grad_text + "\x1b[39m"
}