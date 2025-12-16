ldarkly() {
  # Initialize flag_id as empty
  flag_id=""

  # Default selected-env to test
  selected_env="test"

  # Loop through all arguments
  for arg in "$@"; do
    if [[ "$arg" == "--prod" || "$arg" == "-p" ]]; then
      # Set the selected environment to production if --prod or -p is passed
      selected_env="production"
    elif [[ "$arg" != --* && -z "$flag_id" ]]; then
      # If the argument doesn't start with '--' and flag_id is not set, use it as flag_id
      flag_id=$(echo "$arg" | tr '[:upper:]' '[:lower:]')
    fi
  done

  if [ -z "$flag_id" ]; then
    # No argument, open the default URL
    open "https://app.launchdarkly.com/projects/default/flags?env=production&env=test&selected-env=${selected_env}"
  else
    open "https://app.launchdarkly.com/projects/default/flags/${flag_id}/targeting?env=production&env=test&selected-env=${selected_env}"
  fi
}

alias ldp='ldarkly --prod'
