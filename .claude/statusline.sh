#!/bin/bash
# Read JSON input once
input=$(cat)

# Helper functions for common extractions
get_model_name()          { echo "$input" | jq -r '.model.display_name'; }
get_current_dir()         { echo "$input" | jq -r '.workspace.current_dir'; }

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
  local context_size=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')
  local usage=$(echo "$input" | jq -r '.context_window.current_usage // empty')

  if [ -z "$usage" ] || [ "$usage" = "null" ]; then
    echo "_ tkns. (_%)"
    return
  fi

  local total_tokens=$(echo "$usage" | jq '(.input_tokens // 0) + (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0) + (.output_tokens // 0)')
  total_tokens=${total_tokens:-0}

  local percentage=$((total_tokens * 100 / context_size))

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
GIT_BRANCH=$(get_git_branch)
TOKEN_COUNT=$(get_token_count)

# https://www.nerdfonts.com/cheat-sheet
echo "󰚩 ${MODEL} |  ${DIR##*/}${GIT_BRANCH} |  ${TOKEN_COUNT} "
