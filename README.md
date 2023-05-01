# Apple Watch Weight App
*Apple Watch Weight App* is an iOS and watchOS app built for the purpose of displaying a person's weight. There are two components to this project, a software application and a hardware weight scale. The scale is currently in devleopment by engineering studens at FIU. The plan is to create a scale similar to the size of an Apple air-tag that can fit inside a users shoe. The device would then send data via bluetooth, for the weight application to collect and display via means of a graph. 

<img src="https://github.com/Senior-Project-Apple-Watch-Application/WeightApp/blob/main/Walkthrough.gif" width="600" />

A demonstration can be found here: https://www.youtube.com/embed/N6BcR5O69X4

# File Directory Structure
The Codebase will contain two main components, one for the WatchOS and iOS.
iOS:
* Image Assets
* Info.plist
* AppDelegate
* Modifiers
   * New Users
   * Login
   * Reusable Views (Buttons, text inputs, etc.)
   * Forgot password
* Home View (testing Firebase)
* Session Services
* Main Views
   * TabBar
      * Scale
      * Charts
      * History
      * Settings
   * Database
      * Signin
      * Register
      * Forgot Password

WatchOS:
* Image Assets
* App Delegate
* Models
  * Weight Data Model
  * Calorie Data Model
* Main View Model
* Views
    * Main
    * History
    * Settings
    * Statistics
    * Calorie
    * Chart


# How to get started
1. Download/install Xcode.
2. Configure a new Firebase authenication key. Follow steps [here](https://firebase.google.com/docs/ios/setup)
3. You'll need to link your GitHub account to Xcode. Follow steps 1 & 2 from [this article.](http://irenebosque.com/how-to-xcode-and-github/)
4. **Fork** this repository.   
   This will create a copy of this repository on your GitHub account. In order to stay organized, contributing to the main branch should be done through **pull requests.** (You should be able to merge your own pull requests.) We will definitely be discussing this further in future meetings.
   
   - [Creating a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)
   - [Merging a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/incorporating-changes-from-a-pull-request/merging-a-pull-request)
   
4. Open Xcode. You should see a screen that says *Welcome to Xcode.* (If not, go to the *Source Control* menu at the top of your screen and select *Clone.*)

   Click on *Clone an existing project.* Select **your fork** from the list (the one where **you** are the owner). Decide where you want the files to live on your system, and you should be good to go.
   
For guidance on how to commit changes and push to GitHub, refer again to [this article.](http://irenebosque.com/how-to-xcode-and-github/)
