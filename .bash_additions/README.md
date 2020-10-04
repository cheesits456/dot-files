# .bash_additions

A folder of shell scripts for adding functions to a terminal instance. To automatically `source` these files, add the following to your `~/.bashrc` file:

```bash
if [ -d ~/.bash_additions ] ; then
	for file in ~/.bash_additions/*.sh ; do
		source $file
	done
fi
```

<br><br>

## Files

### colors.sh

**Usage:** `colo[u]rs [--help|table]`

Print a table of color escape sequences along with sample text to show how they appear

- Also adds a `colours` alias for people in the UK

#### Example:

![colors](https://github.com/cheesits456/dot-files/raw/readme-images/colors.png)

<br>

### corner-clock.sh

Show the current date and time in top right corner of the terminal

#### Bugs:

- Can cause issues relating to cursor position
- If you source your `~/.bashrc`, the old loop won't stop, so this function will have 2 running instances

#### Example:

![corner-clock](https://github.com/cheesits456/dot-files/raw/readme-images/corner-clock.png)

<br>

### ls-colors.sh

Add ls-colors command to print $LS_COLORS in a nicer format

#### Bugs:

- Bash's `column` command processes color escape sequences as printable characters, so sometimes the column alignment can be a bit off

#### Example:

![ls-colors](https://github.com/cheesits456/dot-files/raw/readme-images/ls-colors.png)

<br>

### pacman-extension.sh [WIP]

Extend the functionality of the `pacman` command to support syntax like `pacman install` or `pacman update`
