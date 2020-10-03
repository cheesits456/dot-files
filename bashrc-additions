## ~/.bashrc Additions
## Each of these can be added to your bashrc file to add useful features and
## functions


## Show date in top corner
## Bugs:
## - Can cause issues relating to cursor position
## - If you source your bashrc, the old loop won't stop, so this function will
##     have 2 running instances
while sleep 1; do
  DATE=$(date +"%a %b %d %Y %I:%M %p")
  START_COL=$(($(tput cols)-26))
  tput sc
  tput cup 0 $START_COL
  echo -n "│ $DATE"
  tput cup 1 $START_COL
  echo -n "╰─────────────────────────"
  tput rc
done &


## Add ls-colors command to print $LS_COLORS in a nicer format
## Bugs:
## - column command processes color escape sequences as printable characters
ls-colors() {
	echo -e $(
		printf "%s" $LS_COLORS |
			sed 's/:/\n/g' |
			awk -F\= '{print "\\e[" $2 "m" $0 "\\e[0m"}'
		) |
		sed 's/ /\n/g' |
		column
}
