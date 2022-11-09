# Expense Tracker

Expenses Tracker app helps to track incomes & expenses.

## Getting Started

This app is built using [Flutter](https://flutter.dev/) with modular structure and clean architecture. 

Used [Getx](https://github.com/jonataslaw/getx) for Sate Maangement, Navigation Management and Dependency Management

This application is using [Firebase Auth](https://firebase.google.com/products/auth) for user registration and login. Using [Firebase Realtime DateBase](https://firebase.google.com/products/realtime-database) for saving the user's incomes and expenses and to track them.

In acces Firsebase Auth and Realtime Database add your project in Firebase console. Once you add your project make sure update the firebase details in [firebase_options.dart](https://github.com/rjkolli7/flutter_expenses_track/blob/master/firebase_integration/lib/src/commons/firebase_options.dart) file.

```bash
      apiKey: 'API KEY',
      appId: "APP ID",
      messagingSenderId: "SENSDER ID",
      projectId: "Android PROJECT ID",
      databaseURL: "DATABASE URL"
```

Below is the tables using in Firebase Realtime Database

```users, expenses, incomes, categories, categorieTypes and countries```

Here are the rules to access the Realtime Database data

```bash
{
  "rules": {
    "categorieTypes": {
      ".read": true,      
    },
    "categories": {
      ".read": true,
      ".write": "auth != null"
    },
    "countries": {
      ".read": true
    },
    "users": {
      "$uid": {
      	".read": "auth != null && $uid === auth.uid",
      	".write": "auth != null && $uid === auth.uid"
      }
    },
    "expenses": {
      "$uid": {
      	".read": "auth != null && $uid === auth.uid",
      	".write": "auth != null && $uid === auth.uid"
      }
    },
    "incomes": {
      "$uid": {
      	".read": "auth != null && $uid === auth.uid",
      	".write": "auth != null && $uid === auth.uid"
      }
    }      
  }
}
```
