//
//  ArtesCollectionViewCell.swift
//  ArtCWB
//
//  Created by Tiago Prestes on 26/04/25.
//

import UIKit

class ArtesCollectionViewCell: UICollectionViewCell {
    
    let imagem = UIImageView()
    let titulo = UILabel()
    let artista = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        imagem.translatesAutoresizingMaskIntoConstraints = false
        titulo.translatesAutoresizingMaskIntoConstraints = false
        artista.translatesAutoresizingMaskIntoConstraints = false
        
        // Adicionar views
        contentView.addSubview(imagem)
        contentView.addSubview(titulo)
        contentView.addSubview(artista)
        
        // Configurações visuais básicas
        imagem.contentMode = .scaleAspectFill
        imagem.clipsToBounds = true
        
        titulo.font = UIFont.boldSystemFont(ofSize: 16)
        titulo.textAlignment = .center
        titulo.numberOfLines = 2
        
        artista.font = UIFont.systemFont(ofSize: 14)
        artista.textAlignment = .center
        artista.textColor = .gray
        artista.numberOfLines = 2
        
        // Auto layout com constraint
        NSLayoutConstraint.activate([
            imagem.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagem.heightAnchor.constraint(equalTo: contentView.widthAnchor), // imagem quadrada

            titulo.topAnchor.constraint(equalTo: imagem.bottomAnchor, constant: 8),
            titulo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titulo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            artista.topAnchor.constraint(equalTo: titulo.bottomAnchor, constant: 4),
            artista.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            artista.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            artista.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    func configure(with obra: ObraDeArte) {
        imagem.image = UIImage(named: obra.imagemNome)
        titulo.text = obra.titulo
        artista.text = obra.artista
    }
}
