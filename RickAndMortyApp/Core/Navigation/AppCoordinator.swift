import Foundation

/// Defines the navigation actions that can be performed.
protocol AppCoordinator {
    var appRouter: AppRouter { get }

    func push(to destination: any Hashable)
    func pop(_ count: Int)
    func popToRoot()
}

/// Provides default implementations for navigation actions.
extension AppCoordinator {
    func push(to destination: any Hashable) {
        appRouter.push(to: destination)
    }

    func pop(_ count: Int = 1) {
        appRouter.pop(count)
    }

    func popToRoot() {
        appRouter.popToRoot()
    }
}
