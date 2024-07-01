### Graphite

# Creates a graphite branch with the name YYYYMMDD-my-branch-name
gtc() {
  gt c $(date +%Y%m%d)-$1
}
