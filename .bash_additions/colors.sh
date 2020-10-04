## Show useful information pertaining to color escape sequences
## - Usage: colo[u]rs [--help|table]
colors() {
	if [ -z "$1" ]; then
		local n=(41 42 43 44 45 46)
		local i=${n[$(shuf -i 0-5 -n 1)]}
		local j=${n[$(shuf -i 0-5 -n 1)]}
		local k=${n[$(shuf -i 0-5 -n 1)]}
		echo -e "Color escapes are formatted like \e[36;40m\\\\e[\e[35;40m\$1\e[36;40m;\e[35;40m\$2\e[36;40m;\e[35;40m\$3\e[36;40mm\e[0m, where:"
		echo -e "├> \e[35;40m\$1\e[0m is a number for the formatting style (ie bold, underline, etc)"
		echo -e "│  ├> \e[40m1\e[0m : \e[$(expr $i - 10);1mBold\e[0m"
		echo -e "│  ├> \e[40m2\e[0m : \e[$(expr $i - 10);2mDim\e[0m"
		echo -e "│  ├> \e[40m4\e[0m : \e[$(expr $i - 10);4mUnderlined\e[0m"
		echo -e "│  ├> \e[40m5\e[0m : \e[$(expr $i - 10);5mBlinking\e[0m"
		echo -e "│  └> \e[40m7\e[0m : \e[$(expr $i - 10);7mInverted\e[0m"
		echo -e "├> \e[35;40m\$2\e[0m is a number for the foreground color, within the range:"
		echo -e "│  ├> \e[40m30-37\e[0m   : \e[$(expr $j - 10)mDark colors\e[m"
		echo -e "│  └> \e[40m90-97\e[0m   : \e[$(expr $j + 50)mBright colors\e[m"
		echo -e "└> \e[35;40m\$3\e[0m is a number for the background color, within the range:"
		echo -e "   ├> \e[40m40-47\e[0m   : \e[30;${k}mDark colors\e[m"
		echo -e "   └> \e[40m100-107\e[0m : \e[30;$(expr $k + 60)mBright colors\e[m"
	elif [ "$1" = "table" ]; then
		function printLine {
			local vals="${1:+$1;}${2}"
			local vals=${vals%%;}
			local seq0="${vals:+\e[${vals}m}"
			printf "  %-10s" "${seq0:-(default)}"
			printf " ${seq0}TEXT"
			printf " \e[0;${vals:+${vals+$vals;}}1mBOLD"
			printf " \e[0;${vals:+${vals+$vals;}}2mDIM\e[m "
		}
		# no background
		for fgc in {30..33}; do
			bgc=
			printLine $fgc $bgc
		done
		echo
		for fgc in {90..93}; do
			bgc=
			printLine $fgc $bgc
		done
		echo
		# dark background
		for fgc in {30..37}; do
			for bgc in {40..43}; do
				fgc=${fgc#37}
				printLine $fgc $bgc
			done
			echo
			fgc=$(expr $fgc + 60)
			for bgc in {40..43}; do
				printLine $fgc $bgc
			done
			echo
		done
		# light background
		for fgc in {30..37}; do
			for bgc in {100..103}; do
				fgc=${fgc#37}
				printLine $fgc $bgc
			done
			echo
			fgc=$(expr $fgc + 60)
			for bgc in {100..103}; do
				printLine $fgc $bgc
			done
			echo
		done
		# no background
		for fgc in {34..37}; do
			bgc=
			printLine $fgc $bgc
		done
		echo
		for fgc in {94..97}; do
			bgc=
			printLine $fgc $bgc
		done
		echo
		# dark background
		for fgc in {30..37}; do
			for bgc in {44..47}; do
				fgc=${fgc#37}
				printLine $fgc $bgc
			done
			echo
			fgc=$(expr $fgc + 60)
			for bgc in {44..47}; do
				printLine $fgc $bgc
			done
			echo
		done
		# light background
		for fgc in {30..37}; do
			for bgc in {104..107}; do
				fgc=${fgc#37}
				printLine $fgc $bgc
			done
			echo
			fgc=$(expr $fgc + 60)
			for bgc in {104..107}; do
				printLine $fgc $bgc
			done
			echo
		done
	else
		[[ "$1" != "--help" ]] && echo "Invalid argument provided!"
		echo "Usage: colo[u]rs [--help|table]"
		return 1
	fi
}
alias colours=colors
