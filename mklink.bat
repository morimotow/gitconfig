if not exist %USERPROFILE%\.gitconfig (
  mklink %USERPROFILE%\.gitconfig %~dp0\.gitconfig.win
)
