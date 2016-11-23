tab-color() {
	echo -ne "\033]6;1;bg;red;brightness;$1\a"
	echo -ne "\033]6;1;bg;green;brightness;$2\a"
	echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
	echo -ne "\033]6;1;bg;*;default\a"
}

color-ssh() {

	tab-color 0 255 0
	ssh $*
	tab-reset
}

alias ssh='color-ssh'
