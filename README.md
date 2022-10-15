# Flutter Security Preview
#### AES and Fernet Algorithm Implementation in Dart
For the Mobile Systems Security I had to make an Mobile app which had to Demonsrate an Encryption Algorithm .So I decided to implement 

 - [Advanced Encryption Standard
   (AES)](https://www.geeksforgeeks.org/aes-full-form/) which is a
   specification for the encryption of electronic data established by
   the U.S National Institute of Standards and Technology (NIST) in
 - [Fernet Algorithm](https://cryptography.io/en/latest/fernet/) is a
   ***symmetric encryption method*** which makes sure that the message encrypted cannot be manipulated/read without the key.
#### Step 1: Create a new flutter Propject
I will spare you the details on how to start with a blank canvas.

> Visit this link if necessary

[Starting a new flutter project on Android Studio](https://docs.flutter.dev/development/tools/android-studio)

#### Step 2: start with a blank canvas
After playing along a bit you will end up with a skeleton - project.
Delete everything from lib/main.dart
#### Step 3: Copy everything
Copy everything in main.dart from this repository
Create a new first_encryption.dart file and paste 
#### Step 4: Turn on android Emulator from device manager in Android Studio
#### Step 5 : Run the code
In android studio look for terminal and type

``
flutter run --no-sound-null-safety
``

>  **Note** : This Encryption library is old so there is a problem with NUll safety SO you have to run it with this command.

IF everything goes well..you will see something like this:
![image](https://user-images.githubusercontent.com/56122633/196009769-5252aebc-d807-4f13-89cd-37bd9c929558.png)

#### Step 6 : Type Something and Check AES encryption

![image](https://user-images.githubusercontent.com/56122633/196009820-bb1960d1-3648-4837-bc5d-8f14d55ef82c.png)
![image](https://user-images.githubusercontent.com/56122633/196009836-2c7ac596-fc1f-4083-b419-da541bd2def2.png)

#### Step 7 : Check AES decryption

Click the Decrypt Button to decrypt
![image](https://user-images.githubusercontent.com/56122633/196009862-da1665f1-97e9-4dfa-8aef-4b4ef1a8a095.png)

#### Step 8 : Try same with fernet Encryption
![image](https://user-images.githubusercontent.com/56122633/196009893-80f64052-4cda-4fef-a1c2-96fafd08396c.png)
![image](https://user-images.githubusercontent.com/56122633/196009900-365b76df-c872-431f-abd1-f2401236e760.png)


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
