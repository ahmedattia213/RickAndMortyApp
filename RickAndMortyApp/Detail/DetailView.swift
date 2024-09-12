import SwiftUI

/// A detailed view of a selected character.
struct DetailView: View {
    let character: Character
    @ObservedObject var coordinator: MainCoordinator
    
    private let backButtonSize: CGFloat = 50.0
    private let imageCornerRadius: CGFloat = 30.0
    private let imageHeight: CGFloat = 400
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .top) {
                characterImage
                headerWithBackButton
                    .horizontalPadding()
            }
            
            HStack(alignment: .top) {
                characterInfo
                Spacer()
                statusIndicator
            }
            .horizontalPadding()
            
            Spacer()
        }
        .ignoresSafeArea()
        .backgroundZStack()
    }
    
    private var headerWithBackButton: some View {
        HStack {
            HapticButton(action: { coordinator.pop() }) {
                Icons.back.size(.medium, color: .textPrimary)
            }
            .frame(width: backButtonSize, height: backButtonSize)
            .background(Color.backgroundPrimary)
            .clipShape(Circle())
            .padding(.top, spacing: .padding10)

            Spacer()
        }
    }
    
    private var characterImage: some View {
        AsyncImage(url: URL(string: character.image)) { phase in
            ZStack {
                switch phase {
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: imageCornerRadius, style: .continuous))
                case .failure:
                    Image(systemName: "photo")
                        .foregroundColor(.secondary)
                case .empty:
                    ProgressView()
                @unknown default:
                    fatalError("Couldn't load image")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: imageHeight)
            .clipShape(RoundedRectangle(cornerRadius: imageCornerRadius, style: .continuous))
        }
    }

    private var characterInfo: some View {
        VStack(alignment: .leading, spacing: .padding1) {
            Text(character.name)
                .font(.title)
                .fontWeight(.bold)
            
            HStack {
                Text("\(character.species) •")
                    .font(.subheadline)
                    .foregroundStyle(Color.textPrimary)
                Text(character.gender)
                    .font(.subheadline)
                    .foregroundStyle(Color.textPrimary.opacity(0.5))
            }
            
            HStack {
                Text("Location: ")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.textPrimary)
                Text(character.location.name)
                    .font(.caption)
                    .foregroundStyle(Color.textPrimary.opacity(0.8))
            }
            .padding(.top, spacing: .padding3)
        }
    }
    
    private var statusIndicator: some View {
        Text(character.status)
            .padding(.vertical, spacing: .padding1)
            .padding(.horizontal, spacing: .padding2)
            .bold()
            .background(statusColor(character.status))
            .foregroundColor(.textPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    private func statusColor(_ status: String) -> Color {
        switch status.lowercased() {
        case "alive": return Color.green
        case "dead": return Color.red
        default: return Color.gray
        }
    }
}

#if DEBUG
#Preview {
    DetailView(character: PreviewContent.dummyCharacter1, coordinator: PreviewContent.coordinator)
}
#endif
