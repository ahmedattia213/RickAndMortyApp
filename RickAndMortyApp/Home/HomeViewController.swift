import UIKit
import Combine

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var viewModel: CharacterViewModel
    var coordinator: MainCoordinator
    private var cancellables = Set<AnyCancellable>()

    private let tableView = UITableView()
    private let cellHeight: CGFloat = 124
    private let cellSpacing: CGFloat = 24

    init(viewModel: CharacterViewModel, coordinator: MainCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBindings()
        self.view.backgroundColor = .clear
    }

    private func setupBindings() {
        viewModel.$characters
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "CharacterCell")
        tableView.rowHeight = cellHeight + cellSpacing
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: cellSpacing / 2, left: 0, bottom: cellSpacing / 2, right: 0)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = viewModel.characters[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterTableViewCell
        cell.configure(with: character)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Haptics.impact(style: .soft)
        let character = viewModel.characters[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator.push(to: .detail(character))
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.size.height
        
        guard contentHeight > scrollViewHeight else { return }

        if position > (contentHeight - scrollViewHeight * 1.2) && !viewModel.isLoading {
            Task { await viewModel.fetchNextPage() }
        }
    }
}
