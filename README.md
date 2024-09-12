# RickAndMortyApp

## Overview

RickAndMortyApp is an iOS application designed to fetch and display characters from the Rick and Morty API. The app leverages both UIKit and SwiftUI to demonstrate modern iOS development techniques within a Model-View-ViewModel (MVVM) architectural framework. This organization ensures that the application is maintainable, scalable, and reusable.

## Features

- **Character Listing:** Displays a paginated list of characters, each showing details such as the character's name, image, and species.
- **Filtering Functionality:** Allows users to filter characters by their status (alive, dead, unknown).
- **Character Details:** Provides detailed information about a selected character, including name, image, species, status, and gender.

## Project Structure

### App

- **RickAndMortyAppApp.swift:** The main entry point of the application.
- **AppEntryView.swift:** Sets up the main navigation and initializes view models.

### Detail

- **DetailView.swift:** Displays detailed information about a selected character.

### Home

- **HomeView.swift:** Lists characters in a paginated format.
- **HomeViewController.swift:** Manages the presentation logic for the home view.

### Components

- **CharacterTableViewCell.swift:** Custom table view cell used in lists.
- **CharacterCellView.swift:** SwiftUI view for displaying character information in detail view.

### Networking

- **CharacterService.swift:** Manages all network calls to fetch character data from the API.
- **CharacterViewModel.swift:** Bridges the data from the CharacterService to the views.

### Core

- **Models:**
  - **Character.swift:** Data model for a character.
- **View Modifier:**
  - **BackgroundZStack.swift:** A custom view modifier for background layouts.
- **UI+Helper:**
  - **UINavigationOpGesture.swift** Extension to allow swiping back to pop a view controller.
  - **Stacks+Helper.swift** Extension to allow adding more attributes to Stack's Initializer.
  - **View+Border.swift** Extension function to allow adding rounded border to a View.
  - **View+Clickable.swift** Extension to for views to allow interactivity.

### Appearance

- **Spacing:** Defines standard spacing metrics.
- **Appearance:** Manages overall visual style.
- **Padding:** Handles standard padding.
- **Icons:** Contains icon assets used throughout the app.

### Components

- **HapticButton.swift:** A button that provides haptic feedback upon interaction.

### Utilities

- **Haptics.swift:** Manages haptic feedback generation.
- **PreviewContent.swift:** Provides mock data for previews.

### Navigation

- **MainNavigationView.swift:** Controls the navigation stack of the application.

### Supporting Files

- **Assets:** Stores images.
- **Colors:** Defines the color palette for the app.


### RickAndMortyAppTests

- **CharacterViewModelTests.swift:** Ensures that `CharacterViewModel` behaves as expected under different scenarios including successful data fetch, error handling, and pagination. It tests if the characters are properly loaded, handles errors, and fetches additional pages of characters.

## Design Principles and Patterns

### MVVM Architecture

- **Model:** Represents the data and business logic layer.
- **View:** Handles the presentation layer and user interaction.
- **ViewModel:** Provides a link between the model and the view components.

### Dependency Injection

- Implemented through constructors in ViewModels and Views to ensure modularity and ease of testing.

### Factory Pattern

- Used in the creation of ViewModels to encapsulate the instantiation logic, enhancing modularity and maintainability.

## Conclusion

The RickAndMortyApp showcases a sophisticated application structure that combines modern development techniques with rigorous software design principles to create a robust, scalable, and maintainable iOS application.
