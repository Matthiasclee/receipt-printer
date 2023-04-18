text=""

while read -r line; do
  text="$text$line\0\n"
done

text="$text\n\n\n\n"

echo -e "$text" | lp -d $1
zenity --info --text="Press OK to cut paper" --no-wrap --title="Printer" --icon-name="edit-cut"
echo -e "\x1B@\x1DV1" | nc -q 0 $2 9100

