export PATH="$PATH:/c/ProgramData/chocolatey/bin"
alias ls='ls -A --color=auto'
# Open a folder or file in Explorer (relative or absolute)
function o {
  local target="${1:-.}"

  # Make relative paths absolute; leave C:\..., /..., and //server/share as-is
  if [[ "$target" != /* && ! "$target" =~ ^[A-Za-z]:[\\/].* && ! "$target" =~ ^// ]]; then
    target="$PWD/$target"
  fi

  # Bail if it doesn't exist
  if [[ ! -e "$target" ]]; then
    echo "Path not found: $target" >&2
    return 1
  fi

  # Absolute Windows path
  local win
  win=$(cygpath -w -a "$target")

  if [[ -d "$target" ]]; then
    explorer.exe "$win"
  else
    explorer.exe /select,"$win"
  fi
}

# Open files in an existing GVIM instance (new tab), or start it if needed.
function gvim {
  local gvim_exe="/c/Program Files/Vim/vim91/gvim.exe"
  local vim_exe="/c/Program Files/Vim/vim91/vim.exe"
  local gvim_win
  local servername="GVIM"
  local args=()
  local argv=("$@")

  # If a path has no slashes and doesn't exist, the caller likely used
  # unquoted backslashes, which Bash strips. Try to reconstruct from history.
  local need_raw=false
  for a in "$@"; do
    if [[ "$a" == -* ]]; then
      continue
    fi
    if [[ "$a" != */* && ! -e "$a" ]]; then
      need_raw=true
      break
    fi
  done

  if $need_raw && [[ -o history ]]; then
    local line
    local raw=()
    line=$(history 1 | sed -E 's/^[ ]*[0-9]+[ ]+//')
    read -r -a raw <<< "$line"
    if [[ "${raw[0]}" == "gvim" ]]; then
      argv=("${raw[@]:1}")
    fi
  fi

  for a in "${argv[@]}"; do
    if [[ "$a" == -* ]]; then
      args+=("$a")
    else
      # Normalize Windows-style backslashes (when quoted) to slashes for cygpath.
      a="${a//\\//}"
      args+=("$(cygpath -w "$a")")
    fi
  done

  gvim_win=$(cygpath -w "$gvim_exe")

  "$gvim_exe" --servername "$servername" --remote-tab-silent "${args[@]}" >/dev/null 2>&1 &
  disown
}


