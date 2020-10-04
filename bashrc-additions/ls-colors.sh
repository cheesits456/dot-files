## Add ls-colors command to print $LS_COLORS in a nicer format
## Bugs:
## - column command processes color escape sequences as printable characters,
##     which can effect column alignment
ls-colors() {
	echo -e $(
		printf "%s" $LS_COLORS |
			sed 's/:/\n/g' |
			awk -F\= '{print "\\e[" $2 "m" $0 "\\e[0m"}'
		) |
		sed 's/ /\n/g' |
		column |
		column -t
}
