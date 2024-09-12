import UIKit
import SwiftUI

class CharacterTableViewCell: UITableViewCell {
    
    private var hostingController: UIHostingController<CharacterCellView>?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        hostingController?.view.removeFromSuperview()
        hostingController = nil
    }

    func configure(with character: Character) {
        let swiftUIView = CharacterCellView(character: character)
        
        if hostingController == nil {
            hostingController = UIHostingController(rootView: swiftUIView)
            hostingController?.view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(hostingController!.view)
            
            NSLayoutConstraint.activate([
                hostingController!.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                hostingController!.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                hostingController!.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                hostingController!.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        } else {
            hostingController?.rootView = swiftUIView
        }
    }
}
