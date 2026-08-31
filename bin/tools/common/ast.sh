
ast () {
	value="$@"

	if [ -d "$value" ]; then
		if [ $(find "$value" -type d | wc -l) -gt 1 ]; then
			depth=""
		else
			depth="-maxdepth 1"
		fi
		find "$value" $depth -type f \( -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.cc' \) \
			-exec clang-format -style=file:$HOME/.clang-format -i {} +
		find "$value" $depth -type f \( -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.cc' \) \
			-exec uncrustify -c "$HOME/.uncrustify.cfg" --replace --no-backup -q {} +
		find "$value" $depth -type f \( -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.cc' \) \
			-exec perl "$HOME/.vim/bin/tools/common/ast_post.pl" {} +
	else
		clang-format -style=file:$HOME/.clang-format -i "$value"
		uncrustify -c "$HOME/.uncrustify.cfg" --replace --no-backup -q "$value"
		perl "$HOME/.vim/bin/tools/common/ast_post.pl" "$value"
	fi
}
