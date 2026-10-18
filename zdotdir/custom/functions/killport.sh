# Kill whatever is listening on a port. When the listener's whole process
# group looks like a dev server (e.g. `pnpm dev`: pnpm → next → next-server →
# workerd), kill the group so no orphans are left behind. Refuses to touch
# non-node listeners unless -f is passed.
killport() {
  local force=0
  [[ $1 == -f ]] && { force=1; shift }
  local port=$1
  if [[ -z $port ]]; then
    echo "usage: killport [-f] <port>"
    return 1
  fi

  local pids=(${(f)"$(lsof -ti tcp:"$port" -sTCP:LISTEN)"})
  if (( ${#pids} == 0 )); then
    echo "nothing listening on port $port"
    return 1
  fi

  local devish='(node|*/node|next-server*|*pnpm*|*workerd|*esbuild|sh|*/sh|zsh|-zsh)'
  local self_pgid=$(ps -o pgid= -p $$ | tr -d ' ')
  local pid pgid comm cwd member targets=()
  for pid in $pids; do
    read -r pgid comm <<< "$(ps -o pgid=,comm= -p $pid)"
    cwd=$(lsof -a -p $pid -d cwd -Fn | sed -n 's/^n//p')
    echo "$pid  $comm  (${cwd/#$HOME/~})"
    if (( ! force )) && [[ $comm != (node|*/node|next-server*) ]]; then
      echo "  not a node process; rerun with -f to kill it anyway"
      return 1
    fi

    # Only take the whole group if every member is dev-server-ish. A dev
    # server started from a script without job control shares the script's
    # group, which could be an editor, agent, or terminal.
    local group_ok=1
    (( pgid > 1 && pgid != self_pgid )) || group_ok=0
    for member in ${(f)"$(ps -axo pgid=,comm= | awk -v g=$pgid '$1 == g { $1 = ""; sub(/^ /, ""); print }')"}; do
      [[ $member == ${~devish} ]] || { group_ok=0; break }
    done
    if (( group_ok )); then
      targets+=(-$pgid)
    else
      echo "  group $pgid has non-dev processes; killing only pid $pid"
      targets+=($pid)
    fi
  done
  targets=(${(u)targets})

  kill -TERM -- $targets 2>/dev/null
  local i
  for i in {1..30}; do
    lsof -ti tcp:"$port" -sTCP:LISTEN >/dev/null || { echo "port $port is free"; return 0 }
    sleep 0.1
  done
  echo "still listening after SIGTERM; sending SIGKILL"
  kill -KILL -- $targets 2>/dev/null
  sleep 0.3
  if lsof -ti tcp:"$port" -sTCP:LISTEN >/dev/null; then
    echo "port $port is still in use"
    return 1
  fi
  echo "port $port is free"
}
