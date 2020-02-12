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

Back in the Current Account tab, by tapping on the **Transfer to Savings** button, you should see the labels update once more. The main account has now been charged with the roundups amount, and the funds have been transferred over to the saving goal.

On the right you can see a demonstration of the transfer procedure.

### Savings

Upon loading the Savings View Controller again, this will have been notified of the transfer, and will update the card view's elements accordingly.


## Design Decisions

Add additional notes about how to deploy this on a live system



## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

