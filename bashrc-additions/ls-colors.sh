## Add ls-colors command to print $LS_COLORS in a nicer format
## Bugs:
## - column command processes color escape sequences as printable characters,
##     which can effect column alignment
ls-colors() {
	command -v node > /dev/null && (
		echo -e $(
			js="let ls=process.env.LS_COLORS"
			js+="	.split(':')"
			js+="	.filter(a => a)"
			js+="	.sort((a, b) => a.localeCompare(b));"
			js+="console.log("
			js+="	ls"
			js+="		.filter(a => a.match(/^\w/))"
			js+="		.concat(ls.filter(a => a.match(/^\W/)))"
			js+="		.join('\n')"
			js+=")"
			node -e "$js" |
			sed 's/:/\n/g' |
			awk -F\= '{print "\\e[" $2 "m" $1 "\\t" $2 "\\e[0m"}'
		) |
		sed 's/ /\n/g' |
		column -c 100 |
		column -t
	) || echo "You must install NodeJS to use this function"
}
