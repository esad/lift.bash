get_abs_filename() {
  # $1 : relative filename
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

lift() {
  for f in "$@"
  do
    echo "$(get_abs_filename $f)" >> ~/.lift
    echo "Lifted $f"
  done
  echo -e "$(sort ~/.lift | uniq )" > ~/.lift
}

drop() {
  for line in $(cat ~/.lift)
  do
    cp -v $line .
  done
  echo > ~/.lift
}