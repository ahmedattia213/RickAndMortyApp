import SwiftUI

/// A view representing a single cell in the list of characters.
struct CharacterCellView: View {
    let character: Character
    
    private let imageHeight: CGFloat = 100
    private let cornerRadius: CGFloat = 10

    var body: some View {
        HStack(alignment: .top, spacing: .padding3) {
            imageView
            VStack(alignment: .leading, spacing: .padding3) {
                titleView
                speciesView
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, spacing: .padding3)
        .horizontalPadding()
        .background(.backgroundPrimary)
        .border(.gray.opacity(0.3), width: 1, cornerRadius: cornerRadius)
    }
    
    private var imageView: some View {
        AsyncImage(url: URL(string: character.image)) { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
            
        } placeholder: {
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: imageHeight, height: imageHeight)
        .cornerRadius(cornerRadius)
    }
    
    private var titleView: some View {
        Text(character.name)
            .font(.headline)
            .foregroundColor(.textPrimary)
            .multilineTextAlignment(.leading)
    }
    
    private var speciesView: some View {
        Text(character.species)
            .font(.subheadline)
            .foregroundColor(.textPrimary)
            .multilineTextAlignment(.leading)
    }
}

#if DEBUG
#Preview {
    VStack {
        CharacterCellView(character: PreviewContent.dummyCharacter1)
        CharacterCellView(character: PreviewContent.dummyCharacter2)
        CharacterCellView(character: PreviewContent.dummyCharacter3)
    }
    .backgroundZStack()
}
#endif
