# Conditionally append to $PATH to prevent duplicates
add_path() {
  [[ $PATH != *$1* ]] && export PATH="$1:$PATH"
}
