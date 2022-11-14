# Study App

A new Flutter project.

## Getting Started

### Setup your own project

1. Create new project in firebase.
2. Open android stuido and create new flutter application.
3. Open terminal and type `firebase login` if you are already login to your account you can skip this step.
4. Inside terminal type `flutterfire configure` to configure our application with different devices. <br>
(Here all the google-services.json, googleservice-info.plist, etc automatically added to your project.)
5. Open build.gradle files *android/app/scr/buid.gradle*, *android/build.gradle*. Add any missing configurations between your and my build.gradle  files.<br>
(Do not change the application id for any reason)
6. Open AndroidManifest.xml and make sure internet permission was enabled. (*android/app/src/debug,main,profile*)
7. For IOS users you need to add *CFBundleURLTypes* to *iso/Runner/info.plist* (Line no 49-58). Inside the string tag you need to add your reverse client id (Found it is GoogleService-Info.plist).
8. Certifying your project and get sha1 and sha256 key and add it to the firebase.
(To do that you can run gradlew.bat file inside the android folder. Open terminal go to android folder `cd android` type `.\gradlew signingReport`)
9. Add all the dependencises and dev_dependencies as mine in pubspec.yaml. Update the dependnecies by Pub get then Pub upgrade or using terminal `flutter pub get` then `flutter pub upgrade`.
10. Finally you can run the project. If you encounter a problem follow below steps.
 
### Run the project

1. Clone the repositiority. `git clone https://github.com/Roni-Boiz/flutter-study-app.git` to new folder.
2. Open the project in android stuido.
3. Open `pubspec.yaml` and press **Pub get** then **Pub upgrade**.<br>
(If it is not working open terminal and type `flutter pub get` then `flutter pub upgrade`)
4. In case my database is clean (For the moment all the content is uploaded to my firebase firestore) you need to upload papers to firebase firestore to access them through study app. <br>
(Go to main.dart comment out the line as below and run the project. It will show the loading --> completed. If it completed you are good to go for next step)
![image](https://user-images.githubusercontent.com/84113874/201496133-174dbc42-d36a-44a1-9ad3-d039ca9e90bc.png)

5. Finally you have to uncomment the lines 19-36 in main.dart and comment out lines 39-44. Then run the project. The application should start on on your emulator.

*Keep in mind that all the testing is done in Android emulator and Google chrome browser.*

