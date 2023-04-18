echo "Sending cut signal"
echo -e "\x1B@\x1DV1" | lp -d $1
