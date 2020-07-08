The file "data.txt" has to be located in the folder, where the "VeraCrypt Format.exe" is stored. 
In "data.txt" the structure of the mail and its attachements is saved.
If a new zip file has to be created, run "cat newZipFile.zip | base64 > zipRescue64" before you run the bashZip.sh file.
Afterwards, the zip file and all other attachements are stored in base64 in data.txt

In Tcformat.c, in the email function an email of the sender has to be provided. This adress has to be verified over the smtp provider (in my case: mailjet).

Please note that this functionallity is rather a proof of concept. The email attachment is static so far. This means that always the same rescue disk is sent instead of
the individal (with the actual salt...). The data.txt field should be generated before sending the mail, every time the send button is clicked. Therefore, the path to the 
current rescue disk location has to be inserted in the script.