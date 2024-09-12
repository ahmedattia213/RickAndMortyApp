import Combine
import SwiftUI

/// A generic coordinator for handling navigation within the app.
class GenericCoordinator<Destination: Hashable>: ObservableObject {
    @Published var navPath = NavigationPath()
    private var cancellables = Set<AnyCancellable>()

    var appRouter: AppRouter

    /// Initializes the coordinator with a given app router.
    /// - Parameter appRouter: The router responsible for managing the navigation stack.
    init(with appRouter: AppRouter) {
        self.appRouter = appRouter

        appRouter.$navPath
            .receive(on: RunLoop.main)
            .assign(to: \.navPath, on: self)
            .store(in: &cancellables)
    }

    /// Pushes a destination onto the navigation stack.
    /// - Parameter destination: The destination to navigate to.
    func push(to destination: Destination) {
        appRouter.push(to: destination)
    }

    /// Pops a number of destinations from the navigation stack.
    /// - Parameter count: The number of destinations to pop. Default is 1.
    func pop(_ count: Int = 1) {
        appRouter.pop(count)
    }

    /// Pops all destinations to return to the root of the navigation stack.
    func popToRoot() {
        appRouter.popToRoot()
    }
}
