# Dot Files

My personal collection of configuration files I use for various programs, as well as useful fuctions and features I've created over time.

<br><br>

## Folders

### .bash_additions

A folder of shell scripts for adding functions to a terminal instance. To automatically `source` these files, add the following to your `~/.bashrc` file:

```bash
if [ -d ~/.bash_additions ] ; then
	for file in ~/.bash_additions/*.sh ; do
		source $file
	done
fi
```

<br>

## Files

### .prettierrc.json

When prettier checks for a configuration file, it goes up one directory level at a time until a config is found. This behaviour means that a configuration in your home directory will be used as a default config if no others are explicitly defined.
