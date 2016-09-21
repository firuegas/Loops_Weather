#Scrip to get the highest temperature for each day in August for one year (data was only downloaded for month of August)
 
for day in {1..31} #For each day in the month (Always using August, so 31 is OK here, need to modify is not August)
do  
	if [ $day -lt 10 ]	#Add a "0" to the front of single digit days
	 then
	day=0$day
	fi
   
MaxTemp=`awk -F',' '{print $2}' /ufrc/zoo6927/share/PS1.3/data/1973/GNV_197308$day.txt | sort -n | tail -n1`
  
	echo The max temp for $day is $MaxTemp
  
done
