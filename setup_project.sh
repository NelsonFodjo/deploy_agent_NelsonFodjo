#!/usr/bin/env bash

#Getting the project name from the user
read -p "Enter the project name: " name

#Creating the necessary directories
mkdir -p attendance_tracker_${name}
mkdir -p attendance_tracker_${name}/Helpers attendance_tracker_${name}/reports

#Moving reports.log and other files into their directory inside the project folder
mv reports.log attendance_tracker_${name}/reports
mv attendance_checker.py attendance_tracker_${name}
mv assets.csv config.json attendance_tracker_${name}/Helpers

#Trap SIGINT (Ctrl+C) - if the user cancels, archive the current project state and clean up
trap 'echo "Canceling ..."; zip -r attendance_tracker_${name}_archive attendance_tracker_${name}; rm -rf attendance_tracker_${name}; exit' SIGINT

#Asks the user if they want to update the attendance thresholds
read -p "Do you want to update the attendance thresholds? (y/n): " choice

if [ "$choice" = "y" ]; then
	#Capture new threshold values from the userrr
	read -p "Enter the new warning value: " warning
	read -p "Enter the new failure value: " failure

	#user sed to update the warning threshold in config.json in-place
	sed -i "s/\"warning\": [0-9]*/\"warning\": ${warning}/" attendance_tracker_${name}/Helpers/config.json
	sed -i "s/\"failure\": [0-9]*/\"failure\": ${failure}/" attendance_tracker_${name}/Helpers/config.json
else
	#User chose not to update - Keeping the original default values
	echo "Keeping the default thresholds (75% warning, 50% failure)."
fi

#Checking if python3 is installed on the system
if python3 --version; then
	echo "Python3 is installed"
else
	echo "Python3 is not installed"
fi
