``Edit the config file to customize the botnet to your liking!``

Config file location: ``skrillec/assets/config.skrillec``

Required information that has to be change:

Everything in ``Net_Info`` and ``DB`` structure

The rest of the information in the config file is optional but one of the best features brought to BOTNETs/C2s. Be able to customize your CLI instead of having commands stack under each other and only being able to type something at the last line on the terminal or Cleared screen with only the banner!

How to change the command response position
``cnc_output_position`` field is used to store the position of where the command response should start writing on the terminal.
``output_rows`` field is used to store the max line to pull from the command response incase its to much lines for the box/UI!
``output_width`` field is used to store the max character per line so it doesn't go over the BOX border or UI border!
``last_cmd_output`` field is to store the position of where the last command should start writing on the terminal.

For the Chat Output Structure should be the same as CNC_Output structure 