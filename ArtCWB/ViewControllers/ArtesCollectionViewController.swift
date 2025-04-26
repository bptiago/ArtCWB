//
//  ArtesCollectionViewController.swift
//  ArtCWB
//
//  Created by Tiago Prestes on 26/04/25.
//

import UIKit

class ArtesCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let searchBar = UISearchBar()
    private var obras: [ObraDeArte] = ArtesDataSource.allObras()
    private var obrasFiltradas: [ObraDeArte] = []
    private var isSearching = false
    
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupCollectionView()
    }

    private func setupSearchBar() {
        searchBar.placeholder = "Buscar por título ou artista"
        searchBar.delegate = self
        searchBar.sizeToFit()
        
        // Aparência: fundo branco, texto preto
        searchBar.searchBarStyle = .minimal
        searchBar.backgroundColor = .white
        searchBar.barTintColor = .white
        searchBar.tintColor = .black
        searchBar.searchTextField.textColor = .black
        
        navigationItem.titleView = searchBar
    }
    
    private func setupCollectionView() {
        // Utilização de UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArtesCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        view.addSubview(collectionView)

        // Auto layout com constraint
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearching ? obrasFiltradas.count : obras.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ArtesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let obra = isSearching ? obrasFiltradas[indexPath.item] : obras[indexPath.item]
        cell.configure(with: obra)
        
        return cell
    }

    // MARK: - UICollectionViewDelegate
    // Navegação para tela de detalhes
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let obraSelecionada = isSearching ? obrasFiltradas[indexPath.item] : obras[indexPath.item]
        let detalhesVC = ArteDetalhesViewController(obra: obraSelecionada)
        navigationController?.pushViewController(detalhesVC, animated: true)
    }
    
    // Animações ao tocar na célula
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
        }
    }
    
    // Célula voltar ao tamanho original
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform.identity
            }
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let isIpad = UIDevice.current.userInterfaceIdiom == .pad
        
        let itemsPerRow: CGFloat = isIpad ? 4 : 2
        let spacing: CGFloat = 16
        let totalSpacing = (itemsPerRow + 1) * spacing
        let itemWidth = (screenWidth - totalSpacing) / itemsPerRow
        
        return CGSize(width: itemWidth, height: itemWidth + 100) // <<< altura aumentada para caber textos grandes
    }
}

// MARK: - UISearchBarDelegate
extension ArtesCollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            obrasFiltradas.removeAll()
        } else {
            isSearching = true
            obrasFiltradas = obras.filter {
                $0.titulo.lowercased().contains(searchText.lowercased()) ||
                $0.artista.lowercased().contains(searchText.lowercased())
            }
        }
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        obrasFiltradas.removeAll()
        collectionView.reloadData()
        searchBar.resignFirstResponder()
    }
}
