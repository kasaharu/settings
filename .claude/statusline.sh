#!/bin/bash
# Read JSON input once
input=$(cat)

# Helper functions for common extractions
get_model_name()          { echo "$input" | jq -r '.model.display_name'; }
get_current_dir()         { echo "$input" | jq -r '.workspace.current_dir'; }
get_project_dir()         { echo "$input" | jq -r '.workspace.project_dir'; }
get_version()             { echo "$input" | jq -r '.version'; }
get_cost()                { echo "$input" | jq -r '.cost.total_cost_usd'; }
get_duration()            { echo "$input" | jq -r '.cost.total_duration_ms'; }
get_lines_added()         { echo "$input" | jq -r '.cost.total_lines_added'; }
get_lines_removed()       { echo "$input" | jq -r '.cost.total_lines_removed'; }
get_transcript_path()     { echo "$input" | jq -r '.transcript_path'; }

get_git_branch() {
  git rev-parse &>/dev/null || return
  local branch=$(git branch --show-current)
  if [ -n "$branch" ]; then
    echo "  $branch"
  else
    local hash=$(git rev-parse --short HEAD 2>/dev/null)
    [ -n "$hash" ] && echo "  HEAD ($hash)"
  fi
}

get_token_count() {
  local transcript_path=$1
  if [ -z "$transcript_path" ] || [ ! -f "$transcript_path" ]; then
    echo "_ tkns. (_%)"
    return
  fi

  local total_tokens=$(tail -n 100 "$transcript_path" 2>/dev/null | \
    jq -s 'map(select(.type == "assistant" and .message.usage)) |
      last | .message.usage |
      (.input_tokens // 0) + (.output_tokens // 0) +
      (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0)' 2>/dev/null)
  total_tokens=${total_tokens:-0}

  # context window size: 200k, compaction threshold: 80% (160k)
  local threshold=160000
  local percentage=$((total_tokens * 100 / threshold))

  # Format display
  local token_display
  if [ "$total_tokens" -ge 1000 ]; then
    token_display=$(printf "%.1fK" "$(echo "scale=1; $total_tokens/1000" | bc)")
  else
    token_display="$total_tokens"
  fi

  # Color by percentage
  local color
  if [ "$percentage" -ge 90 ]; then color="\033[31m"
  elif [ "$percentage" -ge 70 ]; then color="\033[33m"
  else color="\033[32m"
  fi

  echo -e "${token_display} tkns. (${color}${percentage}%\033[0m)"
}

# Use the helpers
MODEL=$(get_model_name)
DIR=$(get_current_dir)
TRANSCRIPT_PATH=$(get_transcript_path)
GIT_BRANCH=$(get_git_branch)
TOKEN_COUNT=$(get_token_count "$TRANSCRIPT_PATH")

# https://www.nerdfonts.com/cheat-sheet
echo "󰚩 ${MODEL} |  ${DIR##*/}${GIT_BRANCH} |  ${TOKEN_COUNT} "
