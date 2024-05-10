## Build firmware:

```shell 
cd contrib
make
```

the binaries can then be found in `contrib/bin`

## Debug w/ OpenOCD server + GDB

```shell 
./contrib/debug.sh
```

will start a `GDB` debug session

## Tool suite

[stlink](https://github.com/stlink-org/stlink) open source toolset is usefull.

`stlink` can be installed via package manager:

### Ubuntu Install:
```shell 
sudo apt install stlink-tools
```

### Arch Install:
```shell 
yay -S stlink-git
```

### Usage:

 - write .bin:

```shell 
st-flash write bin/plc_axis_nucleo.bin 0x8000000  
```

 - read .bin:

```shell 
st-flash read bin/plc_axis_nucleo.bin 0x8000000 0x10000
```