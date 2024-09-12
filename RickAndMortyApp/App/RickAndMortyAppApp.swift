//
//  RickAndMortyAppApp.swift
//  RickAndMortyApp
//
//  Created by Ahmed Amr on 09/09/2024.
//

import SwiftUI

@main
struct RickAndMortyAppApp: App {
    static let diContainer = DIContainer.defaultContainer()
    static let viewModelsFactory = AppViewModelFactory(container: diContainer)
    static let appCoordinatorsFactory = AppCoordinatorsFactory(container: diContainer)
    
    var body: some Scene {
        WindowGroup {
            AppEntryView(
                viewModelsFactory: RickAndMortyAppApp.viewModelsFactory,
                appCoordinatorsFactory: RickAndMortyAppApp.appCoordinatorsFactory
            )
        }
    }
}
