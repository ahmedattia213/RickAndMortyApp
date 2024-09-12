import SwiftUI

/// The home view displaying a list of characters.
/// Each cell is clickable and navigates to the detail view of the character.
struct HomeView: View {
    @StateObject var viewModel: CharacterViewModel
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        VStack(alignment: .leading, spacing: .padding3) {
            header
            ButtonSelectionView(viewModel: viewModel)
            HomeViewHelper(viewModel: viewModel, coordinator: coordinator)
        }
        .task {
            await viewModel.fetchCharacters()
        }
        .horizontalPadding()
    }
    
    private var header: some View {
        Text("Characters")
            .font(.system(size: 20, weight: .bold))
    }
}

struct ButtonSelectionView: View {
    @ObservedObject var viewModel: CharacterViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            selectionButton(for: "alive", label: "Alive")
            selectionButton(for: "dead", label: "Dead")
            selectionButton(for: "unknown", label: "Unknown")
        }
    }
    
    private func selectionButton(for status: String, label: String) -> some View {
        HapticButton(action: { toggleSelection(for: status) }) {
            Text(label)
                .padding(.all, spacing: .padding3)
                .background(viewModel.selectedStatus == status ? Color.textPrimary : Color.backgroundPrimary)
                .foregroundColor(viewModel.selectedStatus == status ? Color.backgroundPrimary : Color.textPrimary)
                .border(.gray.opacity(0.3), width: 1, cornerRadius: 12)
        }
    }
    
    private func toggleSelection(for status: String) {
        viewModel.selectedStatus = (viewModel.selectedStatus == status) ? nil : status
        Task { await viewModel.applyFilter(status: viewModel.selectedStatus) }
    }
}

struct HomeViewHelper: UIViewControllerRepresentable {
    @ObservedObject var viewModel: CharacterViewModel
    @ObservedObject var coordinator: MainCoordinator

    func makeUIViewController(context: Context) -> HomeViewController {
        HomeViewController(viewModel: viewModel, coordinator: coordinator)
    }

    func updateUIViewController(_ uiViewController: HomeViewController, context: Context) {}
}

#if DEBUG
#Preview {
    HomeView(viewModel: PreviewContent.characterViewModel, coordinator: PreviewContent.coordinator)
}
#endif
