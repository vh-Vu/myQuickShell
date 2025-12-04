CPU_JIFFIES=$(cat /proc/stat | grep "cpu " | awk '{print $2, $3, $4, $5, $6, $7, $8}')
TEMP_CPU=$(cat /sys/class/hwmon/hwmon3/temp1_input)
TEMP_CELSIUS=$(echo "scale=2; $TEMP_CPU / 1000" | bc)


echo $TEMP_CELSIUS

# echo "{"\
# "\"cpu_jiffies\": \"$CPU_JIFFIES\","\
# "\"temp_celsius\": \"$TEMP_CELSIUS\""\
# "}"