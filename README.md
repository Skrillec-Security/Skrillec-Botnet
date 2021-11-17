# Skrillec Botnet
 The New 2022 All-In-One Botnet. Eliminating the process of getting a bunch of botnet related files to start one up. No more hassles!
 
 ## Skrillec Supported OS(s) (DIRECTLY FROM SOURCE)
 The compiled built is supported on any unix platform!
 ```
 Debian/Ubuntu
 ```

## Install Dependencies
The compiled version does not need any dependencies installed to use it!

Make sure to have V installed!! (URL: ``https://vlang.io``)
```
sudo apt install openssl-dev
```

## Start the Botnet
The compiled built
```
./skrillec
```
Directly from source
```
v run skrillec.v
```

## How to setup and design the botnet to your likings!
Edit the 'config.skrillec' file located in ``skrillec/assets/config.skrillec``

Required Changes
The following fields should not be set to 'None'
```
    net_title = "Skrillec"
    net_description = "The New 2022 All-In-One Botnet. Eliminating the hassle of looking for all botnet related files to start one up!"
    net_versoin = "4.0.0"
    net_port = None
    access_token = None
```
