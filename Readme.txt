Please note: This version aims to show a possible VeraCrypt interface with improved usability. Even if it was possible to encrypt a Windows system, it should not be used for encrypting a real system.
Due to technical problems (https://sourceforge.net/p/veracrypt/discussion/technical/thread/8a3e66cd77/?limit=25#2581)
it is basen on VeraCrypt version 1.22. But since only few interface changes were made since them, it should be possible to integrate it into the current version. It should be noted that I am not an experienced C/C++ programmer. Therefore, before copy-pasting, I recommend checking the code carefully, especially since this is a security-related software.



How to run the VeraCrypt Format.exe:

As mentioned before, the executable file is basen on VC 1.22. If you want to try out the new interface, you have to deinstall your current VC version and install the version 1.22. 
You can use the original version from here (https://sourceforge.net/projects/veracrypt/files/VeraCrypt%201.22/VeraCrypt%20Setup%201.22.exe/download). Afterwards, you can start VeraCrypt Format.exe.
The txt files like password1000000.txt have to be located in the same folder as VeraCrypt Format.exe




Files in this folder:

*** data.txt: This file is sent when an email address is provided and the send button is clicked. It contains the rescue disk, the VeraCrypt-Pretest.txt and the VeraCrypt-Rescue.txt files (that are send as attachment) formated in base64.
*** emai-attachment-creater: This folder contains a script and a readme.txt file with instructions about how to create the data.txt file.
*** password1000000.txt: When the user selects a password, the password is checked against this password list with one million passwords. This file is loaded into memory when VC is started, it takes on a regular computer a few seconds. I first took a 10 million password list, but this took around 20 seconds. When choosing a password, I did not experience any time delay because the password list look ups.
*** VeraCrypt.Format.exe: The compiled Disk encryption wizard.
*** VeraCrypt-Pretest.txt: When using the wizard, two times a box is shown with information on what to do and how to use the rescue disk if something is broken. It is recommended to print this. In this wizard, these to infopages are sent as attachment by mail and also stored together with the rescue disk as a text fiel.
*** VeraCrypt-Rescue.txt:            "



Limitations:
For using the internal email sending functionallity, an smtp server is required. For the user testing I configured one on at jetmail.com. Since I did not want to
publish the credentials, this functionallity does not work here. Possessing credentials, it can be activated in the SendMail() function in Tcformat.c.

I focused on the system encryption. Therefore, this version can not configure a hidden OS encryption or a mulit-boot encryption. This functionallities can be added by
programming an advanced features window (similar to the one that allows selecting the encryption algorithm) in the intro page (the button is already there, but always disabled).

