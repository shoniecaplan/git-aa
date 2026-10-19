# git aa

Stage modified files by a piece of their name — no paths.

```
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

Rules:
- Only *modified* tracked files are considered (not untracked, not staged-only).
- Each pattern must match exactly one file; otherwise nothing is staged and the matches are listed.
- Matching is a plain substring of the repo-relative path (no regex).
- Works from any subdirectory.
- `<TAB>` completes modified file names.

## Install

```
git clone <this repo> ~/git-aa
~/git-aa/install.sh
```

This links `git-aa` and `git-aap` into `~/.local/bin` (git runs any `git-<name>` on
`PATH` as `git <name>`) and adds a `source` line for the completion to `~/.bashrc`.

Requirements: bash, `~/.local/bin` on `PATH`, and git's bash completion enabled
(default on Ubuntu/Debian) for `<TAB>` to work.
