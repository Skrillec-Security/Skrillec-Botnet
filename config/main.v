module config

pub struct AppInfo{
	pub mut:
		title		            string = "Skrillec Botnet"
		description	            string = "The New 2022 All-In-One Botnet. Eliminating the hassle of looking for all botnet related files to start one up!"
		version		            string = "4.00"
}

pub struct HostnameSettings{
    pub mut:
        hostname                string
        hostname_p              string
        cli_cursor              string
}

pub struct Cnc_Ouput {
    pub mut:
        cnc_output_position     string
        output_rows             string
        output_wdith            string
        last_cmd_output         string
        cmd_response_output     string
}

pub struct Chat_Output {
    pub mut:
        chatroom_output_p       string
        output_rows             string
        output_width            string
}

pub const (
    //Colors
    Default          = "\x1b[39m"
    Black            = "\x1b[30m"
    Red              = "\x1b[31m"
    Green            = "\x1b[32m"
    Yellow           = "\x1b[33m"
    Blue             = "\x1b[34m"
    Purple           = "\x1b[35m"
    Cyan             = "\x1b[36m"
    Light_Grey       = "\x1b[37m"
    Dark_Grey        = "\x1b[90m"
    Light_red        = "\x1b[91m"
    Light_Green      = "\x1b[92m"
    Light_Yellow     = "\x1b[93m"
    Light_Blue       = "\x1b[94m"
    Light_Purple     = "\x1b[95m"
    Light_Cyan       = "\x1b[96m"
    White            = "\x1b[97m"
    // Background Colors
    Default_BG       = "\x1b[49m"
    Black_BG         = "\x1b[40m"
    Red_BG           = "\x1b[41m"
    Green_BG         = "\x1b[42m"
    Yellow_BG        = "\x1b[43m"
    Blue_BG          = "\x1b[44m"
    Purple_BG        = "\x1b[45m"
    Cyan_BG          = "\x1b[46m"
    Light_Gray_BG    = "\x1b[47m"
    Dark_Gray_BG     = "\x1b[100m"
    Light_Red_BG     = "\x1b[101m"
    Light_Green_BG   = "\x1b[102m"
    Light_Yellow_BG  = "\x1b[103m"
    Light_Blue_BG    = "\x1b[104m"
    Light_Purple_BG  = "\x1b[105m"
    Light_Cyan_BG    = "\x1b[106m"
    White_BG         = "\x1b[107m"
	// Extra ANSI Shit
	Clear			 = "\033[2J\033[1;1H"

    Help_MENU        = "      Tools              Description
_______________________________________________
      -t                 Skrillec CNC License Token [REQUIRED]
      -p                 CNC Port [REQUIRED]
      -b_port            Bot Port
      -b_key             Bot connecting Password (Encrypted Key)
      -sqlpw             Set MySQL Passowrd [REQUIRED]"
)

