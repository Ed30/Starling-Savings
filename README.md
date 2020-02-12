# Starling Savings

iOS application created as part of the Starling Bank technical challenge by Edward Danescu.

<p align="center">
  <img width="460" height="648" src="img/iPhones.png">
</p>

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for testing purposes.

### Prerequisites

First of all, clone this repository on your machine.

Then, if you have not already done so, please install **cocoapods** by running the following command in the terminal:

```
$ sudo gem install cocoapods
```

### Installing

Navigate to the repo directory locally and run:

```
pod install
```

This will add a pods folder to the directory, as well as the Starling Savings.xcworkspace file. Please only use this rather than the original Starling Savings.xcodeproj file from now on.

## Running the app

Open **Starling Savings.xcworkspace** and hit run. If you encounter any code signing issues, these should be easily solvable from the Signing and Capabilities tab in Starling Savings, under TARGETS in the project inspector.

### Startup

<img align="right" width="433" height="700" src="img/Animation.gif">

Upon starting up the app, you will find yourself in the **Current Account** tab, and you will see the balance and roundups labels update with a counting animation.

If you navigate over to the **Savings** tab, you will find a card view there representing the Roundup Saving Goal. This view will update showing the total amount deposited into the goal so far, along with a progress view representing the percentage out of the target amount.

### Transfer

Back in the Current Account tab, by tapping on the **Transfer to Savings** button, you should see the labels update once more, provided there were no errors.

The main account has now been charged with the roundups amount, and the funds have been transferred over to the saving goal.

On the right you can see a demonstration of the transfer procedure.

### Savings

After the transfer, the Savings View Controller will be notified it needs to update (through a global flag rather than the Notification Center).

Upon loading the Savings View Controller again, it will update the card view's elements accordingly to take into account the last transfer made.


## Design Decisions

### General Structure

* Two separate view controllers rather than just one, to better distinguish the main account from the saving goals.
* Focus on the main functionality required for the challenge, thus:
    * API calls only where necessary, such as for retrieving transactions, balance, transferring funds etc...
    * Assumptions were made, such as one account and one saving goal only per client.
    * Hardcoded goal id and target to cut down on API calls.

### User Interface

* The icon was obtained by inverting the colors of the original Staling app icon, to suggest a companion app.
* Designs were achieved by following Apple's Human Interface Guidelines, while keeping Starling's purple color for highlights.

### Code


## Acknowledgments

* Date class extension by Sandeep: https://stackoverflow.com/a/33397770
