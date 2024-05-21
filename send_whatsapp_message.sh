#!/bin/bash

# Define variables
CONTACT_NAME="Ritesh Prsnl Bro"  # Replace with the contact name as saved in your WhatsApp
MESSAGE="Hello,this is an automated message."

# Function to send WhatsApp message
send_whatsapp_message() {
    # Launch WhatsApp
    adb shell monkey -p com.whatsapp -c android.intent.category.LAUNCHER 1
    sleep 2

    # Click on the search icon
    adb shell input tap 940 2035  # Coordinates might vary based on screen size and resolution
    sleep 2

    
    #press search button
    # Click on the contact name from the search results
    adb shell input tap 877 217  # Adjust coordinates as necessary
    sleep 2

    # Type the contact name
    adb shell input text "$(echo $CONTACT_NAME | sed 's/ /%s/g')"
    sleep 2

    # Click on the contact name from the search results
    adb shell input tap 550 550 # Adjust coordinates as necessary
    sleep 1

    # Type the message
    adb shell input text "$(echo $MESSAGE | sed 's/ /%s/g')"
    sleep 1

    # Send the message
    adb shell input tap 1000 1430  # Adjust coordinates as necessary

    echo "Message sent successfully!"
}

# Check if ADB is connected
adb devices | grep -w "device" &> /dev/null
if [ $? -ne 0 ]; then
    echo "No device connected. Please connect your device and enable USB debugging."
    exit 1
fi

# Send the WhatsApp message
send_whatsapp_message
