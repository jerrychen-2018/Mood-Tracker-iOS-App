# Mood Flutter App for iOS

## A beta version of a mobile application written in Dart for tracking emotions and providing related verses in the Bible.


This project was built out of curiosity for learning Flutter and Dart while growing my skills in full-stack development. It is made up of several components or Widgets, including a welcome screen, onboarding screens, home screen, and settings screen, with smaller components, such as buttons and containers, embedded in each page. It utilizes an SQLite database with the sqflite Flutter package (https://pub.dev/packages/sqflite) to store entries the user adds and the shared_preferences flutter package (https://pub.dev/packages/shared_preferences) to store smaller data such as app color themes and if it's the first time the user is opening the app. 

The app uses a Flask/Python backend to call the ESV API that allows retrieval of Bible verses as well as the AWS services EC2 and Secrets Manager to run the web server and store secrets, such as API keys. 

# What I learned:
- Mobile App Development in Flutter/Dart
- SQlite
- Creating a REST API
- AWS EC2 and AWS Secrets Manager
- Shipping an app to iOS Testflight
- Light and Dark Mode (UI/UX)
- Push Notifications

