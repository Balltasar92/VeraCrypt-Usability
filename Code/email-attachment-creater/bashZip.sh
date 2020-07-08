#!/bin/bash

rtmp_url="smtps://smtp.gmail.com:465"
rtmp_from="pius.ganter@gmail.com"
#rtmp_to="pius.ganter@gmx.de"
#rtmp_to="balltasar92@hotmail.com"
rtmp_to="Veracrypt-user@veracrypt.com"
rtmp_credentials="jesus.zu.nazareth@gmail.com:Password"

file_upload="data.txt"
echo "Dear VeraCrypt user,


in the attachment, you can find the VeraCrypt Rescue Disk. It is only needed, if your Windows does not start anymore. In this case follow the instructions provided in the attached text files. 
There are two possible cases, when you need the attachment of this email:

1. After the execution of the encryption pretest, Windows does not start normally. In This case follow the instructions in \"Pretest-Information.txt\".

2. After the encryption of the hard disk, Windows does not start normally. In this case follow the instruction in Rescue-Disk-Information.

Please make sure that you always have access to a copy if the attached rescue disc file. If you only store it locally on your encrypted hard drive, you will not have access to it in case of a damaged Windows operating system." > log.txt
message_base64=$(cat log.txt| base64)


echo "From: pius.ganter@gmail.com<$rtmp_from>
To: <$rtmp_to>
Subject: VeraCrypt Rescue Disk- DO NOT DELETE THIS MAIL
Reply-To:  <$rtmp_from>
Cc: 
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=\"MULTIPART-MIXED-BOUNDARY\"

--MULTIPART-MIXED-BOUNDARY
Content-Type: multipart/alternative; boundary=\"MULTIPART-ALTERNATIVE-BOUNDARY\"

--MULTIPART-ALTERNATIVE-BOUNDARY
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Content-Disposition: inline

$message_base64
--MULTIPART-ALTERNATIVE-BOUNDARY--
--MULTIPART-MIXED-BOUNDARY
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=\"RescueDisk\"" > "$file_upload"

# convert file.rar to base64 and append to the upload file
cat "zipRescue64"  >> "$file_upload"

echo "--MULTIPART-MIXED-BOUNDARY
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=\"VeraCrypt Rescue.txt\"" >> "$file_upload"

# convert file.zip to base64 and append to the upload file
cat "VeraCrypt Rescue.txt" | base64 >> "$file_upload"

#test
echo "--MULTIPART-MIXED-BOUNDARY
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=\"VeraCrypt Pretest.txt\"" >> "$file_upload"

# convert file.zip to base64 and append to the upload file
cat "VeraCrypt Pretest.txt" | base64 >> "$file_upload"
#endtest

# end of uploaded file
echo "--MULTIPART-MIXED-BOUNDARY--" >> "$file_upload"

# send email
echo "sending ...."
#curl -s "$rtmp_url" \
#     --mail-from "$rtmp_from" \
#     --mail-rcpt "$rtmp_to" \
#     --ssl -u "$rtmp_credentials" \
#     -T "data.txt" -k --anyauth
#res=$?
#if test "$res" != "0"; then
#   echo "sending failed with: $res"
#else
#    echo "OK"
#fi