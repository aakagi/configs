### Graphite

# Creates a graphite branch with the name YYYYMMDD-my-branch-name
TODAY=$(date +%Y%m%d)
gtc() {
  gt c $TODAY-$1
}
