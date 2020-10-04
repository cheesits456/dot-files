sudo() {
	command sudo -v
	if [[ $1 == "pacman" ]]; then
		if [[ $@ == "$1 upgrade" ]]; then
			command sudo pacman -Syu
		elif [[ $2 == "install" ]]; then
			if [[ -z $3 ]]; then
				command sudo pacman -S
			else
				command $(echo -n "$@" | awk '{printf "command sudo pacman -S "; for (i=3; i<NF; i++) printf $i " "; print $NF}')
			fi
		else
			command sudo "$@"
		fi
	else
		command sudo "$@"
	fi
}
