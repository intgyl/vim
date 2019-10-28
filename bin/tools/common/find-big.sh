find-big() {

	find . -type f -size +$1M  -print0 | xargs -0 du -h
}
