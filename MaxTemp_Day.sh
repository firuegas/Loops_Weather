#!/bin/bash
#Scrip to get the highest temperature for each day in August for one year (data was only downloaded for month of August)

month=08
mkdir years
for year in {1973..2016} #For each year between 1943 and 2016
do
		
	for day in {1..31} #For each day in the month (Always using August, so 31 is OK here, need to modify is not August)
	do  	
		if [ $day -lt 10 ]	#Add a "0" to the front of single digit days
		then
		day=0$day
		fi

	Date=$year$month$day
	MaxTemp=`awk -F',' '{print $2}' /ufrc/zoo6927/share/PS1.3/data/$year/GNV_$Date.txt | sort -n | tail -n1`

	echo $year,$MaxTemp >>years/maxtemp$year.txt
  
	done

done

for mtyear in {1973..2016}
do

MaxAnual=`awk -F',' '{print $2}' /ufrc/zoo6927/firuegas/MaxTemp/years/maxtemp$mtyear.txt | sort -n | tail -n1`

echo $mtyear,$MaxAnual >>MaxYear.txt
done

echo The five years with hoter temperatures were
sort -k2 -t"," -n /ufrc/zoo6927/firuegas/MaxTemp/MaxYear.txt | tail -n5

echo The five years with lower temperatures were $Min
sort -k2 -t"," -n /ufrc/zoo6927/firuegas/MaxTemp/MaxYear.txt | head -n5

