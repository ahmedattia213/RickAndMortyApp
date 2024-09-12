import SwiftUI

/// The entry view for the application.
/// It sets up the main navigation view with the necessary view models and coordinators.
struct AppEntryView: View {
    var viewModelsFactory: AppViewModelFactory
    var appCoordinatorsFactory: AppCoordinatorsFactory
    
    var body: some View {
        VStack {
            MainNavigationView(
                viewModelsFactory: viewModelsFactory,
                coordinator: appCoordinatorsFactory.mainCoordinator
            )
        }
        .onAppear {
            Appearance.setup()
        }
        .navigationBarHidden(false)
    }
}

#if DEBUG
#Preview {
    AppEntryView(
        viewModelsFactory: PreviewContent.viewModelsFactory,
        appCoordinatorsFactory: PreviewContent.appCoordinatorsFactory
    )
}
#endif
