//
//  BrowseScreenVC.swift
//  AzureOverall
//
//  Created by Angela Garrovillas on 3/27/20.
//  Copyright © 2020 Angela Garrovillas. All rights reserved.
//

import UIKit

class BrowseScreenVC: UIViewController {
    //MARK: - UIObjects
    private var searchBar: UISearchBar = {
        let bar = UISearchBar()
        return bar
    }()
    private lazy var browseCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.register(BrowseCell.self, forCellWithReuseIdentifier: "browseCell")
        collection.backgroundColor = .clear
        return collection
    }()
    
    //MARK: - Properties
    private var searchString: String? = nil {
        didSet {
            if let unwrappedSearch = searchString {
                loadRecipeResults(from: unwrappedSearch)
            }
        }
    }
    private var browseRecipeResults: RecipeResults = RecipeResults(results: [], baseUri: "") {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.browseCollectionView.reloadData()
            }
        }
    }
    
    
    //MARK: - Constraints
    private func addAllConstraints() {
        addSearchBarConstraints()
        addCollectionViewConstraints()
    }
    private func addSearchBarConstraints() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    private func addCollectionViewConstraints() {
        view.addSubview(browseCollectionView)
        browseCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            browseCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            browseCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            browseCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            browseCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    //MARK: - Methods
    private func setDelegates() {
        browseCollectionView.delegate = self
        browseCollectionView.dataSource = self
        
        searchBar.delegate = self
    }
    private func loadRecipeResults(from query: String) {
        DispatchQueue.main.async { [weak self] in
            getRecipes(with: query) { [weak self] (results) in
                switch results {
                case .failure(let error):
                    print(error)
                case .success(let recipeResults):
                    self?.browseRecipeResults = recipeResults
                }
            }
        }
    }
    private func loadImageFor(cell: BrowseCell, urlString: String) {
            getImage(withUrlString: urlString) { (imageResults) in
                switch imageResults {
                case .failure(let error):
                    print(error)
                case .success(let image):
                    DispatchQueue.main.async {
                        cell.spinner.stopAnimating()
                        cell.recipeImage.image = image
                    }
                }
            }
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        addAllConstraints()
        setDelegates()
        
        

    }

}

//MARK: - CollectionViewDelegates
extension BrowseScreenVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return browseRecipeResults.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "browseCell", for: indexPath) as? BrowseCell else {
            return UICollectionViewCell()
        }
        cell.recipeImage.backgroundColor = .gray
        cell.spinner.startAnimating()
        let recipe = browseRecipeResults.results[indexPath.row]
        cell.titleLabel.text = recipe.title
        cell.servingLabel.text = "Serving size: \(recipe.servings)"
        cell.prepTimeLabel.text = "Prep Time(min): \(recipe.readyInMinutes)"
       
        loadImageFor(cell: cell, urlString: "\(browseRecipeResults.baseUri)\(recipe.image)")
     
        
        return cell
    }
    
    
}

extension BrowseScreenVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailScreenVC()
        detailVC.recipe = browseRecipeResults.results[indexPath.row]
        detailVC.segueFrom = .browse
        detailVC.baseUrl = browseRecipeResults.baseUri
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension BrowseScreenVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sideLength = view.frame.width * 0.48
        return CGSize(width: sideLength , height: sideLength )
    }
}

//MARK: - SearchBar Delegate
extension BrowseScreenVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchString = searchBar.text?.lowercased()
    }
}
