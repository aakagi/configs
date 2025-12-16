FUNCTIONS_DIR="$ZDOTDIR/custom/functions"

for file in "$FUNCTIONS_DIR"/*.sh; do
  [ -r "$file" ] && source "$file"
done
