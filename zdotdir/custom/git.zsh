# -- git --

alias gcne='git commit --amend --no-edit'
alias gcamend='git commit --amend'

alias gad='git add . --dry-run'
alias gdn='git diff --name-only'
alias gc='git commit -vm '
alias gcob='git checkout -b'

git_prune_to_match_remote() {
  # Prune branches
  git fetch --prune
  # Removes all local branches that are not in remote
  # https://stackoverflow.com/a/53956328/13150411
  git branch -a | grep -v ${$(git branch -a | grep remotes | cut -d'/' -f3-)/#/-e} | xargs git branch -D
}

# -- github --

# brew install gh
alias ghme="gh pr list -A $(gh api user -q '.login') --web" # Opens github with my current open PRs
alias ghpr="gh pr view --web"                               # Opens current branch's PR on web
alias ghrepo='gh repo view --web'

alias ghrev='open "https://github.com/pulls?q=is%3Aopen+is%3Apr+archived%3Afalse+user%3Ahighbeamco+review-requested%3A%40me"' # Opens PRs that are pending reviews from me
# Previous, might go back to it:
# alias ghrev='gh pr list --search "user-review-requested:@me" --web' # Opens PRs that are pending reviews from me
