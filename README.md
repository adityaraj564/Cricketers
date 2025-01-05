iOS Cricketers List App

A simple iOS app built using UIKit with MVVM design pattern that displays a list of cricket players with details such as name, description, matches played, and country flag. The data is loaded from a local JSON file, and the UI is implemented with UITableView and a custom UITableViewCell.
Features

Features
📄 Displays a list of cricket players.

🖼️ Shows player avatars and country flags.

🏏 Player details include:

Name
Description (e.g., "India | Bowler")
Matches played
Country flag
🛠 Built with UIKit using:

UITableView
Custom UITableViewCell
⚙️ Follows MVVM Design Pattern:

Model: Data model for player information (Player.swift).

View: UI layer (PlayersViewController.swift, PlayerTableViewCell.swift).

ViewModel: Manages data logic and interacts with the model (PlayerViewModel.swift).

🗂️ Data is loaded from a local JSON file (players.json).

Tech Stack

Swift
UIKit
JSON Parsing with Codable


Xcode 14.0 or later
iOS 13.0 or later
Basic knowledge of UIKit and Swift
Setup Instructions

Clone the repository:
git clone https://github.com/adityaraj564/Cricketers.git
Open the project in Xcode:
cd ios-players-list
open PlayersListApp.xcodeproj
Build and run the app on a simulator or device.

Cricketers/
│
├── Model/
│   └── Player.swift       # Codable model for player data
│
├── Views/
│   ├── PlayerTableViewCell.swift   # Custom UITableViewCell
│   └── PlayersViewController.swift  # Main UITableViewController
│
├── ViewModel/
│   └── PlayerViewModel.swift  # Manages the data logic
│
├── APIServices/
    └── APIService.swift  # Handles API requests
│ 
├── Resources/
│   ├── players.json       # Local JSON file with player data
│   ├── Assets.xcassets    # App assets (icons, images, etc.)
│   └── Info.plist         # App configuration
│
├── AppDelegate.swift      # App entry point
├── SceneDelegate.swift    # Scene management
│
├── Preview.png
└── README.md              # This file

How to Use

Launch the app.
View the list of players in the table view.
Each cell contains:
Player name
Description (e.g., "India | Bowler")
Avatar image
Country flag
Number of matches played
