##############################
## git
##############################

alias gcne='git commit --amend --no-edit'
alias gcamend='git commit --amend'

alias gad='git add . --dry-run'
alias gdn='git diff --name-only'
alias gc='git commit -vm '
alias gcob='git checkout -b'

git_prune_to_match_remote() {
  # Prune branches
  git fetch --prune

  # Get list of remote branches (without 'remotes/origin/'), escape for grep
  remote_branches=$(git branch -r | sed 's| *origin/||' | tr -d ' ')

  # Get local branches
  for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
    if ! echo "$remote_branches" | grep -qx "$branch"; then
      git branch -D "$branch"
    fi
  done
}

##############################
## github
##############################

# brew install gh
alias ghme="gh pr list -A $(gh api user -q '.login') --web" # Opens github with my current open PRs
alias ghpr="gh pr view --web"                               # Opens current branch's PR on web
alias ghrepo='gh repo view --web'

alias ghrev='open "https://github.com/pulls?q=is%3Aopen+is%3Apr+archived%3Afalse+user%3Ahighbeamco+review-requested%3A%40me"' # Opens PRs that are pending reviews from me
# Previous, might go back to it:
# alias ghrev='gh pr list --search "user-review-requested:@me" --web' # Opens PRs that are pending reviews from me

##############################
## graphite
##############################

alias gtc='gt continue'
