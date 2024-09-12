import SwiftUI

/// A view responsible for managing the main navigation stack of the application.
/// It initializes the necessary view models and coordinators using the provided factories.
struct MainNavigationView: View {
    var viewModelsFactory: AppViewModelFactory
    @ObservedObject var coordinator: MainCoordinator
        
    /// Initializes the MainNavigationView with a view model factory and a main coordinator.
    /// - Parameters:
    ///   - viewModelsFactory: The factory responsible for creating view models.
    ///   - coordinator: The main coordinator managing navigation.
    init(viewModelsFactory: AppViewModelFactory, coordinator: MainCoordinator) {
        self.viewModelsFactory = viewModelsFactory
        self.coordinator = coordinator
    }
    
    /// The content and behavior of the view.
    var body: some View {
        NavigationStack(path: $coordinator.appRouter.navPath) {
            destinationView
        }
    }
    
    /// A private view builder that defines the destination views based on the current navigation destination.
    @ViewBuilder
    private var destinationView: some View {
        HomeView(viewModel: viewModelsFactory.makeCharacterViewModel(), coordinator: coordinator)
        .navigationDestination(for: AppDestination.self) { destination in
            switch destination {
            case .home:
                HomeView(viewModel: viewModelsFactory.makeCharacterViewModel(), coordinator: coordinator)
                
            case .detail(let character):
                let _ = print("Char is: \(character)")
                DetailView(character: character, coordinator: coordinator)
            }
        }
    }
}

#if DEBUG
#Preview {
    MainNavigationView(
        viewModelsFactory: PreviewContent.viewModelsFactory,
        coordinator: PreviewContent.coordinator
    )
}
#endif
