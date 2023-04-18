text=""
eot=""

while read -r line; do
  text="$text$line\0\n"
done

if [ "$2" != "--nocut" ]; then
  eot="\n\x1B@\x1DV1"
fi

text="$text\n\n\n\n$eot"

echo -e "$text" | lp -o wait -d $1
while lpstat -p $1 | grep -q "printing"; do
  printf "\rWaiting for print job to complete"
done
echo -e "\nPrint job complete"
echo "Done"
