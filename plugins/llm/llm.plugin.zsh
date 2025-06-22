llm_models_list="$HOME/.config/io.datasette.llm/models"
# Need that for debug purpose
llmUpdateModelsFull() {
  local filename="${llm_models_list}.full"
  llm models list > "$filename"
}
llmUpdateModels() {
  llm models list |sed -E 's/^[^:]*: *([^ ]*).*/\1/' > "$llm_models_list"
}
llmSelectModel () {
  cat "$llm_models_list"|fzf --no-preview
}
llmCheckFile () {
  local filename="$1"
  if [[ -e "$filename" ]]; then
    # Get file modification time in seconds since epoch
    mod_time=$(stat -c %Y "$filename") 2>/dev/null || \
    mod_time=$(stat -f %m "$filename") 2>/dev/null

    # Get current time
    current_time=$(date +%s)

    # Calculate age in seconds
    age=$(( current_time - mod_time ))

    # Check if age is less than or equal to 86400 seconds (24 hours)
    if (( age <= 86400 )); then
      echo "file_ok"
    else
      echo "file_outdated"
    fi
  else
    echo "file_not_exists"
  fi

}
cdf() {
    local revision="${1:-@}"
    jj diff -r $revision --git
}
cm() {
    local revision="${1:-@}"
    echo $(cdf $revision|llm -m $(llmSelectModel) -s "generate commit message for these changes. Return: (changes type) comment")
}

result=$(llmCheckFile $llm_models_list)
if [[ "$result" != "file_ok" ]]; then
  llmUpdateModels
fi
unset result

