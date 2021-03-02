# SmartInvesting!

## Background

This is a simple list app that allows users to see a list of their achievements.  
The app written in Swift downloads the data and shows the achievements list in a simple, smooth scroll. 

### Current Application

#### App Description
 
The app contains two screens which display 
-  home screen
- achievement list for the user 
    

### Additional Features

- The app contains a placeholder loading screen for when the app first starts and is seeking data
- All image data is cached for easy retrieval
- Theme support for changing the color based on the marketing team's requirements
- The app contains a placeholder loading screen for when no data could be fetched

### Technical Design

The app currently uses a simple VIPER design pattern with the following grouping. A simple use of ViperGen and Sourcery was used to aid in creating the modules and hooking up the dependencies within protocols.  

The app also uses the new build system to aid in XCode 11's ability to load the needed Test runners. 
If the tests fail to run (due to the missing bundle/resources error), please select Legacy Build System for project settings in Xcode.

1) Utilities 

    - 1.a) Networking - These classes are used to fetch data, parse into the required object type and returned. The app will need an SSL certificate from the backend to improve security and stop MITM attacks.The class currently has a placeholder where SSL pinning can be implemented.
    - 1.b) Data Sync - Used by data models to retrieve data using the Networking utilities 
    - 1.c) File Utility - A utility used to retrieve, read and pass JSON files in the app bundle
    - 1.d) Cache - A caching utility for images

2) VIPER - As requested, the VIPER design pattern has been used for achieving the required functionality

3) Data Models - The models adhere to the Codable protocol. We can extend these data models to be based on NSManagedObject and conform to Codable protocols. 

4) View Controllers - The two view controllers are used to only display the models and capture user interactions; whilst the presenter take cares of the business logic 

5) Extensions - The app uses a number of extensions that enhance the ability of basic Apple classes. These extensions help in reducing code whilst ensuring consistency across the app.

### App Demo
<img src="https://github.com/manjukiran/SmartInvesting/blob/feature/TicketRef-Implement-Coach-Feature/SmartInvesting%20Demo.gif" alt="drawing" width="300"/>


