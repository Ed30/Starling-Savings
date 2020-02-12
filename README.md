# Starling Savings

iOS application created as part of the Starling Bank technical challenge by Edward Danescu.

<p align="center">
  <img width="460" height="648" src="img/iPhones.png">
</p>

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for testing purposes.

### Prerequisites

First of all, clone this repository on your machine.

Then, If you have not already done so, please install cocoapods by running the following command in the terminal:

```
$ sudo gem install cocoapods
```

### Installing

Navigate to the repo directory locally and run:

```
pod install
```

This will add a pods folder to the directory, as well as the Starling Savings.xcworkspace file. Please only open this instead of he original Starling Savings.xcodeproj from now on.

## Running the app

<img align="right" width="433" height="700" src="img/Animation.gif">

Open Starling Savings.xcworkspace and hit run. If you encounter any code signing issues, these should be easily solvable from the "Signing and Capabilities" tab in Starling Savings, under TARGETS in the project inspector.

### Startup

Upon starting up the app, you will find yourself in the **Current Account** tab, and see the balance and roundups labels update with a counting animation.

If you navigate over to the **Savings** tab, you will find a card view there representing the Roundup Saving Goal. This view will update showing the total amount deposited into the goal so far, along with a progress view representing the percentage out of the target amount.

### Transfer

Explain what these tests test and why


## Design Decisions

Add additional notes about how to deploy this on a live system



## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

