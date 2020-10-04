# `~/.bashrc-additions`

A folder of shell scripts for adding functions to a terminal instance. To automatically `source` these files, add the following to your `~/.bashrc` file:

```bash
if [ -d ~/.bashrc_additions ] ; then
	for file in ~/.bashrc_additions/*.sh ; do
		source $file
	done
fi
```

## Files

### `corner-clock.sh`

Show the current date and time in top right corner of the terminal

#### Bugs:

- Can cause issues relating to cursor position
- If you source your `~/.bashrc`, the old loop won't stop, so this function will have 2 running instances

### `ls-colors.sh`

Add ls-colors command to print $LS_COLORS in a nicer format

#### Bugs:

- Bash's `column` command processes color escape sequences as printable characters, so sometimes the column alignment can be a bit off
