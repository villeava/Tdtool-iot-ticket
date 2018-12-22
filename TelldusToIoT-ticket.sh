## This is an example command set for fetching data from tdtool service and telldus USB 443 Mhz radio and put data to file for sending it to the IoT-ticket.com cloud with Wapice IoT-ticket python library

#sensor id of telldus protocol
sensorid=31

#Get data from telldus serivce and save to separated files
tdtool --list-sensors |grep id=$sensorid|sed 's/age=//' |awk '$9 < 100 {print $5}' |sed 's/temperature=//' > /home/pi/IoT-ticket/sensor"$sensorid"temp.data
tdtool --list-sensors |grep id=$sensorid|sed 's/age=//' |awk '$9 < 100 {print $6}' |sed 's/humidity=//' > /home/pi/IoT-ticket/sensor"$sensorid"hum.data

#Send datas to IoT-ticket
python3 /home/pi/IoTTicket-PythonLibrary/IoTTemperatureMeasurement/temperaturewritedata.py /home/pi/IoTTicket-PythonLibrary/IoTTemperatureMeasurement/write.json sensor"$sensorid"temp
python3 /home/pi/IoTTicket-PythonLibrary/IoTTemperatureMeasurement/temperaturewritedata.py /home/pi/IoTTicket-PythonLibrary/IoTTemperatureMeasurement/write.json sensor"$sensorid"hum
