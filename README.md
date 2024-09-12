# RickAndMortyApp

## Overview

RickAndMortyApp is an iOS application designed to fetch and display characters from the Rick and Morty API. The app combines the use of UIKit and SwiftUI to showcase modern iOS development techniques, adhering to the Model-View-ViewModel (MVVM) architecture. This structure ensures the application is maintainable, scalable, and reusable, with a strong emphasis on good coding practices.

## Features

- **Character Listing:** Displays a paginated list of characters, loading 20 characters at a time. Each entry shows the character's name, image, and species.
- **Filtering Functionality:** Users can filter characters based on their status (alive, dead, unknown).
- **Character Details:** Tapping a character opens a detailed view displaying the character's name, image, species, status, and gender.

## Project Structure

### App

- **RickAndMortyAppApp.swift:** Main entry point of the application, setting up the environment for the app.
- **AppEntryView.swift:** Initializes the main navigation flow and view models.

### Views

- **HomeView.swift:** The home screen where characters are listed. Integrates SwiftUI for reactive updates.
- **DetailView.swift:** Displays detailed information about a selected character.

### ViewModels

- **CharacterViewModel.swift:** Manages the presentation logic for the character listing and filtering.

### Models

- **Character.swift:** Represents the character data model, including properties like name, image URL, species, status, and gender.

### Networking

- **CharacterService.swift:** Handles fetching character data from the Rick and Morty API.

### Components

- **CharacterTableViewCell.swift:** A UITableViewCell subclass displaying a character's name, image, and species.
- **CharacterCellView.swift:** A SwiftUI view used in the detailed character screen, showing more detailed information.

### Navigation

- **MainNavigationView.swift:** Manages navigation within the app, utilizing SwiftUI for seamless transitions between views.

### Utilities

- **Haptics.swift:** Provides haptic feedback functionality.
- **PreviewContent.swift:** Supplies preview data for SwiftUI previews.

### Core

- **ViewModifier/BackgroundZStack.swift:** Custom view modifier for background styling.

## Design Principles and Patterns

### MVVM Architecture

- **Model:** Contains the data essentials like character attributes.
- **View:** SwiftUI views for dynamic user interfaces and UIKit views for complex lists.
- **ViewModel:** Handles fetching data from the network and updating the UI state.

### Modular Design

- Ensures components like `CharacterTableViewCell` and `CharacterCellView` are reusable and maintainable.

### Integration of UIKit and SwiftUI

- Combines the robustness of UIKit for table views with the modern reactivity of SwiftUI for other components.

### Dependency Injection

- Utilizes a simple form of dependency injection by constructing view models and services in the `AppEntryView` or using a `DIContainer`. This practice allows for better testability and reduces the dependency coupling across the application.

### Factory Pattern

- Implements the Factory pattern to encapsulate the creation of view models and services. This centralization makes modifications more manageable and supports the expansion of the application with new features without substantial changes to existing code.

### SOLID Principles

- **Single Responsibility Principle (SRP):** Each class and component is responsible for a single part of the functionality, e.g., `CharacterService` only handles API communication.
- **Open/Closed Principle (OCP):** The application is open for extension but closed for modification. New functionality can be added with minimal changes to existing code.
- **Liskov Substitution Principle (LSP):** Interchangeable objects confirm to a common interface, which is particularly evident in how view models manage the views.
- **Interface Segregation Principle (ISP):** Interfaces are client-specific; classes are not forced to implement interfaces they do not use.
- **Dependency Inversion Principle (DIP):** High-level modules do not depend on low-level modules. Both depend on abstractions. Abstractions are not dependent on details. Details depend on abstractions, seen in how dependencies are injected into the view models.

## Code Quality

- **Maintainability:** Clean code practices and separation of concerns facilitate easy updates and modifications.
- **Scalability:** Designed to efficiently handle an increase in data volume or complexity.
- **Reusability:** Components are built to be reusable across different parts of the app without modification.

## Testing

- **Unit Tests:** Focus on robustness in `CharacterViewModel` and `CharacterService` to ensure data integrity and error handling.

## Conclusion

RickAndMortyApp exemplifies a hybrid approach using both UIKit and SwiftUI to create a responsive and maintainable iOS application. It adheres to modern design patterns and coding practices, making it a scalable and robust solution for displaying and managing complex character data.
