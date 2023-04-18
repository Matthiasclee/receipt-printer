text=""

while read -r line; do
  text="$text$line\0\n"
done

text="$text\n\n\n\n"

echo -e "$text" | lp -o wait -d $1
while lpstat -p $1 | grep -q "printing"; do
  printf "\rWaiting for print job to complete"
done
echo "\nPrint job complete"
echo "Sending signal to cut paper"
echo -e "\x1B@\x1DV1" | nc -q 0 $2 9100
echo "Done"
