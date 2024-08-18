set csvFile to choose file with prompt "Select the CSV file containing phone numbers:"
set messageText to "message"

set phoneNumbers to {}
set csvData to read csvFile
set csvLines to paragraphs of csvData

repeat with i from 1 to count csvLines
	set csvLine to item i of csvLines
	set phoneNumber to csvLine
	set end of phoneNumbers to phoneNumber
end repeat

repeat with i from 1 to count phoneNumbers
	set phoneNumber to item i of phoneNumbers
	
	tell application "Messages"
		set targetService to (1st account whose service type = SMS)
		set targetBuddy to participant phoneNumber of targetService
		send messageText to targetBuddy
	end tell
	
	delay 1 -- Add a delay of 1 second between each message
end repeat

display dialog "Messages sent successfully!" buttons {"OK"} default button "OK"
