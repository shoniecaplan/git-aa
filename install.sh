#!/bin/bash
# Link git-aa and git-aap into ~/.local/bin and enable tab completion in ~/.bashrc.
set -e
DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
BIN="$HOME/.local/bin"

mkdir -p "$BIN"
chmod +x "$DIR/git-aa" "$DIR/git-aap"
ln -sf "$DIR/git-aa" "$BIN/git-aa"
ln -sf "$DIR/git-aap" "$BIN/git-aap"
echo "Linked: $BIN/git-aa, $BIN/git-aap"

LINE="source \"$DIR/completion.bash\""
if ! grep -qF "$LINE" ~/.bashrc 2>/dev/null; then
	echo "$LINE" >> ~/.bashrc
	echo "Added completion to ~/.bashrc"
fi

case ":$PATH:" in
	*":$BIN:"*) ;;
	*) echo "WARNING: $BIN is not on your PATH. Add it to ~/.bashrc." ;;
esac

echo "Done. Open a new shell, then try: git aa <TAB>"
