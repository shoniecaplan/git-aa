# git aa

Stage modified files by typing part of their name.

```console
$ git status --short
 M src/net/socket_server.cpp
 M tests/socket_server_test.cpp
 M README.md

$ git aa README            # stages README.md
$ git aa server_test       # stages tests/socket_server_test.cpp
$ git aa socket
2 modified files matching: socket
 0: src/net/socket_server.cpp
 1: tests/socket_server_test.cpp
$ git aap socket_server.   # same, but interactive (git add -p)
```

- Only modified files are matched (not new files).
- Each word must match exactly one file. Otherwise nothing is staged.
- Works from any folder in the repo.
- `<TAB>` completes modified file names.

## Install

```bash
git clone <this repo> ~/git-aa
~/git-aa/install.sh
```

Needs bash, with `~/.local/bin` on your `PATH`.
