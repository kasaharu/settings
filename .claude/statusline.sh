#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Start time tracking
start_time=$(date +%s)

# Extract model display name
model=$(echo "$input" | jq -r '.model.display_name')

# Calculate context window usage percentage
usage=$(echo "$input" | jq '.context_window.current_usage')
context_info=""
if [ "$usage" != "null" ]; then
  current=$(echo "$usage" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')
  size=$(echo "$input" | jq '.context_window.context_window_size')
  pct=$((current * 100 / size))
  context_info=$(printf "コンテキスト: %d%%" "$pct")
fi

# Get Git branch and change stats
dir=$(echo "$input" | jq -r '.workspace.current_dir')
git_info=""
if [ -d "$dir/.git" ]; then
  cd "$dir" || exit 1

  # Get current branch name
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

  # Get number of changed lines (additions + deletions)
  changes=$(git -c core.fileMode=false diff --numstat 2>/dev/null | awk '{add+=$1; del+=$2} END {print add+del}')

  if [ -n "$branch" ]; then
    if [ -n "$changes" ] && [ "$changes" != "0" ]; then
      git_info=$(printf " | %s (+%d行)" "$branch" "$changes")
    else
      git_info=$(printf " | %s" "$branch")
    fi
  fi
fi

# Calculate execution time
end_time=$(date +%s)
exec_time=$((end_time - start_time))

# Output status line
printf "%s | %s%s | 実行時間: %ds" "$model" "$context_info" "$git_info" "$exec_time"
