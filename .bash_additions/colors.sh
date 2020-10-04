colors() {
	local fgc bgc vals seq0 i
	i=(41 42 43 45 46 47)
	i=${i[$(shuf -i 0-5 -n 1)]}
	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[$(expr $i - 10)mforeground colors\e[m\n"
	printf "Values 40..47 are \e[30;${i}mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[$(expr $i - 10);1mbold text\e[m\n"
	printf "Value  2 gives a  \e[$(expr $i - 10);2mdim text\e[m\n\n"
	echo
	for fgc in {30..33}; do
		bgc=40
		bgc=${bgc#40}
		vals="${fgc:+$fgc;}${bgc}"
		vals=${vals%%;}
		seq0="${vals:+\e[${vals}m}"
		printf "  %-9s" "${seq0:-(default)}"
		printf " ${seq0}TEXT\e[m"
		printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		printf " \e[${vals:+${vals+$vals;}}2mDIM\e[m"
	done
	echo
	for fgc in {34..37}; do
		bgc=40
		bgc=${bgc#40}
		vals="${fgc:+$fgc;}${bgc}"
		vals=${vals%%;}
		seq0="${vals:+\e[${vals}m}"
		printf "  %-9s" "${seq0:-(default)}"
		printf " ${seq0}TEXT\e[m"
		printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		printf " \e[${vals:+${vals+$vals;}}2mDIM\e[m"
	done
	echo
	echo
	for fgc in {30..37}; do
		for bgc in {40..43}; do
			fgc=${fgc#37}
			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}
			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
			printf " \e[${vals:+${vals+$vals;}}2mDIM\e[m"
		done
		echo
	done
	echo
	for fgc in {30..37}; do
		for bgc in {44..47}; do
			fgc=${fgc#37}
			bgc=${bgc#40}
			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}
			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
			printf " \e[${vals:+${vals+$vals;}}2mDIM\e[m"
		done
		echo
	done
}
