import UIKit

final class AdvertisementsListViewController: UIViewController {
    private let viewModel: AdvertisementsListViewModel
    
    private lazy var advertisementsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.unWhite
        collectionView.register(AdvertisementCell.self, forCellWithReuseIdentifier: AdvertisementCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    init(viewModel: AdvertisementsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        setupViews()
    }
    
    private func bind() {
        viewModel.observeProducts { [weak self] _ in
            guard let self = self else { return }
            self.advertisementsCollectionView.reloadData()
        }
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.unWhite

        view.addViewWithNoTAMIC(advertisementsCollectionView)
        
        NSLayoutConstraint.activate([
            advertisementsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            advertisementsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            advertisementsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            advertisementsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension AdvertisementsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.advertisements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementCell.reuseIdentifier, for: indexPath) as? AdvertisementCell else { return UICollectionViewCell() }
        let advertisement = viewModel.advertisements[indexPath.row]
        cell.configure(advertisement)
        return cell
    }
}

// MARK: - UICollectionViewFlowLayout
extension AdvertisementsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let configuration = CollectionViewConfiguration.defaultConfiguration
        let width = (collectionView.bounds.width - CGFloat(configuration.totalSpacing)) / CGFloat(configuration.numberOfItemsPerRow)
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        CollectionViewConfiguration.defaultConfiguration.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewConfiguration.defaultConfiguration.itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewConfiguration.defaultConfiguration.lineSpacing
    }
}
