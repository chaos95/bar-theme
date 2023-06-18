#
# Origin: https://github.com/anki-code/zsh-bar-theme
#

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[250]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

_PATH="%{$fg_bold[white]%}%~%{$reset_color%}"

if [[ $EUID -eq 0 ]]; then
  _LIBERTY="%{$FG[255]%}#"
else
  _LIBERTY="%{$FG[250]%}$"
fi

print_spaced () {
  local left=$1
  local right=$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTHL=${#${(S%%)left//$~zero/}}
  local LENGTHR=${#${(S%%)right//$~zero/}}
  local LENGTH=0
  local SPACER_LENGTH
  (( SPACER_LENGTH = $LENGTHL + $LENGTHR ))

  if [[ $SPACER_LENGTH -ge $COLUMNS ]]; then
      (( LENGTH = ${COLUMNS} - $LENGTHR - 1))

      print -rP $left
      print -rP $right
  else
      local SPACES="%{$BG[234]%}"
      (( LENGTH = ${COLUMNS} - $LENGTHR - $LENGTHL - 1))
      for i in {0..$LENGTH}
      do
          SPACES="$SPACES "
      done

      print -rP $left$SPACES$right
  fi
}

export ZSH_FIRST=1

precmd () {
  git=$(git_prompt_info)
  _git_=`[[ "$git" == ''  ]] && V="" || V=" %{$FG[254]%}%{$BG[236]%}$git%{$BG[236]%} %{$reset_color%}"; echo $V`

  _condaenv_=`[[ $CONDA_DEFAULT_ENV == 'base' || $CONDA_DEFAULT_ENV == '' ]] && V="" || V=" %{$FG[254]%}%{$BG[236]%} $CONDA_DEFAULT_ENV %{$reset_color%}"; echo $V`

  _venv_=`[[ "$name" == '' ]] && V="" || V=" %{$FG[254]%}%{$BG[236]%} $name %{$reset_color%}"; echo $V`

  _venv2_=`[[ "$VIRTUAL_ENV" == '' ]] && V="" || V=" %{$FG[254]%}%{$BG[236]%} $VIRTUAL_ENV %{$reset_color%}"; echo $V`

  _datetime_="%{$FG[244]%} $( gdate +"%Y-%m-%d %H:%M:%S" )%{$reset_color%}"

  # Run `spectrum_ls` to search colors
  [[ $ZSH_THEME_BAR_HOSTCOLOR == '' ]] && bhc=244 || bhc=$ZSH_THEME_BAR_HOSTCOLOR

  # bar
  _1LEFT="%{$BG[234]%}%{$FG[$bhc]%}%n %m%{$reset_color%}%{$BG[234]%} %{$FG[253]%}%~%{$reset_color%}"

  _1RIGHT=""
  for comp in $_venv_ $_venv2_ $_git_ $_condaenv_ $_datetime_; do
      _1RIGHT="${_1RIGHT}%{$BG[234]%}%{$FG[250]%}${comp}"
  done

  print_spaced "$_1LEFT" "$_1RIGHT"
}

zle_highlight=( default:fg=white,bold )
PROMPT='$_LIBERTY '
