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
	printf '\e[>4;0m'
	printf '\e[?1000l\e[?1002l\e[?1003l\e[?1005l\e[?1006l\e[?1015l\e[?1016l\e[?9l'
	tab-reset
}

alias ssh='color-ssh'
