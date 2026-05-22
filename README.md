# Little Lemon Dinner Menu

An iOS application built with SwiftUI that showcases a dynamic menu for the Little Lemon restaurant. Users can browse items categorised by Food, Drink, and Dessert, apply custom filters, sort the selection, and view specific dish details.

This project is part of the **Advanced Programming in Swift** course, which is a component of the **Meta iOS Developer Professional Certificate** program on Coursera.

---

## 📸 Screenshots

| Menu View | Filter Options | MenuItem Details |
| :---: | :---: | :---: |
| `MenuItemsView` | `MenuItemsOptionView` | `MenuItemDetailsView` |
| <img width="300" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-21 at 22 52 50" src="https://github.com/user-attachments/assets/da1069ed-0e20-414c-b30b-76c8d3f8f853" /> | <img width="300" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-21 at 22 52 53" src="https://github.com/user-attachments/assets/e50d7d42-9b17-4230-a4e2-c09accb237dd" /> | <img width="300" alt="Simulator Screenshot - iPhone 17 Pro - 2026-05-21 at 22 53 09" src="https://github.com/user-attachments/assets/d4242b15-daa5-405c-943a-ced6cb154b03" /> |
---

## 🛠 Features

- **Categorized Grid Menus**: View items grouped by **Food**, **Drinks**, and **Desserts** with clean visual grids using SwiftUI's `LazyVGrid`.
- **Advanced Filtering**: Enable or disable menu categories dynamically in the filter sheet.
- **Sorting Options**:
  - **Most Popular** (sorted by order count)
  - **Price** (sorted from lowest to highest)
  - **Alphabetical** (A-Z)
- **Detailed Dish Characteristic View**: Click on any menu item to see a detailed page listing:
  - Dish title
  - A stylized placeholder image
  - Price ($)
  - Order Count (Popularity)
  - Ingredients (e.g. Spinach, Broccoli, Carrot, Pasta, Tomato Sauce)

---

## 💻 Tech Stack & Architecture

- **Language**: Swift 5+
- **UI Framework**: SwiftUI
- **Architecture**: MVVM (Model-View-ViewModel)
  - **Model**: `MenuItem` representing the structured data of each dish, conforming to the custom `MenuItemProtocol`.
  - **View**: SwiftUI Views for the user interface (`MenuItemsView`, `MenuItemsOptionView`, `MenuItemDetailsView`).
  - **ViewModel**: `MenuViewViewModel` managing the state, mock data generation, filter applications, and sorting rules.
- **Reactive Updates**: Combine (`ObservableObject`, `@Published`) for seamless data binding between ViewModel and Views.

---

## 🚀 How to Run the App

Follow these steps to run the application in Xcode on your Mac:

### Prerequisites

- A Mac running macOS 13 (Ventura) or newer.
- **Xcode** 14.0 or newer installed (includes Swift compiler and iOS Simulators).

### Steps to Run

1. **Clone or Navigate to the Directory**:
   Ensure you are in the project folder containing `LemonMenu.xcodeproj`.
2. **Open the Project in Xcode**:
   Double-click the `LemonMenu.xcodeproj` file, or open Xcode and select **File > Open...** then choose the project folder.
3. **Select a Target & Simulator**:
   In the scheme selector at the top of the Xcode window, select the **LemonMenu** scheme and choose an iOS Simulator (e.g., iPhone 15 or 16).
4. **Build and Run**:
   Press `⌘ + R` (Command + R) or click the **Play** button in the toolbar. Xcode will compile the Swift files and launch the app in the simulator.

---

## 🧪 Running Unit & UI Tests

The project includes test targets to verify core functionality (such as sorting logic, initial model values, and filter updates).

- **Run all tests**: Press `⌘ + U` (Command + U) or select **Product > Test** from the Xcode menu.
- **View results**: Open the **Test Navigator** (`⌘ + 6`) in the Xcode sidebar to see detailed test reports.

---

## 📚 About the Course

This project demonstrates proficiency in Swift development, architectural design patterns (MVVM), protocol-oriented programming, data structures, and writing unit tests for SwiftUI applications. It was completed as part of Coursera's **Meta iOS Developer Professional Certificate** program.
