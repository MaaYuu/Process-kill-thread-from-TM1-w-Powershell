# Process-kill-thread-from-TM1-w-Powershell

This project help kill thread from TM1 process for a user without any OpsAdmin, or Admin authorization. A generic account is with that authorization used by Powershell script.
Also, it logs who are killed the process, and shows the explanation.

**Used languages and packages:**

* Powershell
* CredentialManager (A Powershell package)
* TM1 Developer Tools


**Process_Kill_Thread Installation**
1) First of all, the user:password:CAMNamespace information of an OpsAdmin or Admin authorized user needs to be encoded with Base64.
 
With this encoded output, we need to create a password in the form of CAMNamespace base64(user:password:namespace). According to the example, a password should be created as follows.
CAMNamespace YWRtaW5pc3RyYXRvcjpJQk1EZW0wczpIYXJtb255IExEQVA=

![image](https://user-images.githubusercontent.com/35421890/156769096-4768a4d0-88d6-4802-9fae-851379525f91.png)


2)  Windows Credential Manager will be used to not keep this password in plain text. A new generic credential can be created and the credential can be opened with the desired names, and the password should be saved as stated above. According to what is entered in the Internet or network address section, it will be necessary to update a part of the code in the next steps.

![image](https://user-images.githubusercontent.com/35421890/156769172-36d0db75-1c1d-4096-a9af-4169b24413c8.png)
![image](https://user-images.githubusercontent.com/35421890/156769186-c59fc819-fd9d-47fe-ad45-f4aba3504d6d.png)

 

3) After the above steps, a 3rd party module called CredentialManager needs to be installed. The installation files are in the current package, these files are downloaded from the link below, extracted, and some unnecessary files are deleted.
https://www.powershellgallery.com/packages/CredentialManager/2.0 
The downloaded files should be copied to C:\Program Files\WindowsPowerShell\Modules as in the screenshot.

![image](https://user-images.githubusercontent.com/35421890/156769214-6cb44364-5972-4db5-b137-f8c109030e6d.png)


4) The codes need to be edited according to the created credential and where the code files in the package are kept.
Editing the yellow part in the Process_Kill_Thread.ps1 file according to the name entered in the Internet or network address
 
![image](https://user-images.githubusercontent.com/35421890/156769223-a82d1b67-7a80-4acb-a931-64ddba66feae.png)

The yellow parts in the Process_Kill_Thread.bat file should be changed according to the directory of the Process_Kill_Thread.ps1 file.

 ![image](https://user-images.githubusercontent.com/35421890/156769244-bbc47715-5d15-4d68-87b8-81e57e3d037e.png)

In the Process_Kill_Thread process, the yellow parts should be changed according to the directory of the Process_Kill_Thread.bat file.

![image](https://user-images.githubusercontent.com/35421890/156769258-c0bc9e63-d7af-47d1-9a74-5621fff3a0d0.png)

5) This part may be optional, but it was necessary to make this change in the demo environment so that the process can find the bat file. So it might be better to skip this part and see if the process is working properly. If the process does not work correctly, it must be turned into an authorized admin user on the server in the Log On As section of the relevant TM1 server.
 ![image](https://user-images.githubusercontent.com/35421890/156769272-34b7c676-d47b-409d-9001-44933c9ef79e.png)

