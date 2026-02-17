# Print & Run Command
_run() {
  printf "\n➜ $*\n"
  "$@"
  echo
}
