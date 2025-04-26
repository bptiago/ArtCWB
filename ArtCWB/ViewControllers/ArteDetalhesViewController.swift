//
//  ArteDetalhesViewController.swift
//  ArtCWB
//
//  Created by user277136 on 4/26/25.
//

import UIKit

class ArteDetalhesViewController: UIViewController {
    
    private let imagemView = UIImageView()
    private let tituloLabel = UILabel()
    private let artistaLabel = UILabel()
    private let anoLabel = UILabel()
    private let estiloLabel = UILabel()
    private let descricaoLabel = UILabel()
    private let botaoCompartilhar = UIButton(type: .system)
    
    private let obra: ObraDeArte
    
    init(obra: ObraDeArte) {
        self.obra = obra
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configurarConteudo()
    }
    
    private func setupViews() {
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        tituloLabel.translatesAutoresizingMaskIntoConstraints = false
        artistaLabel.translatesAutoresizingMaskIntoConstraints = false
        anoLabel.translatesAutoresizingMaskIntoConstraints = false
        estiloLabel.translatesAutoresizingMaskIntoConstraints = false
        descricaoLabel.translatesAutoresizingMaskIntoConstraints = false
        botaoCompartilhar.translatesAutoresizingMaskIntoConstraints = false
        
        imagemView.contentMode = .scaleAspectFit
        imagemView.clipsToBounds = true
        
        tituloLabel.font = UIFont.boldSystemFont(ofSize: 24)
        tituloLabel.textAlignment = .center
        tituloLabel.numberOfLines = 0
        
        artistaLabel.font = UIFont.systemFont(ofSize: 18)
        artistaLabel.textAlignment = .center
        artistaLabel.textColor = .darkGray
        
        anoLabel.font = UIFont.systemFont(ofSize: 16)
        anoLabel.textAlignment = .center
        
        estiloLabel.font = UIFont.systemFont(ofSize: 16)
        estiloLabel.textAlignment = .center
        estiloLabel.textColor = .gray
        
        descricaoLabel.font = UIFont.systemFont(ofSize: 16)
        descricaoLabel.numberOfLines = 0
        descricaoLabel.textAlignment = .natural
        
        botaoCompartilhar.setTitle("📤 Compartilhar", for: .normal) // Botão agora com ícone!
        botaoCompartilhar.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        botaoCompartilhar.addTarget(self, action: #selector(compartilharObra), for: .touchUpInside)
        
        // Adicionar views
        view.addSubview(imagemView)
        view.addSubview(tituloLabel)
        view.addSubview(artistaLabel)
        view.addSubview(anoLabel)
        view.addSubview(estiloLabel)
        view.addSubview(descricaoLabel)
        view.addSubview(botaoCompartilhar)
        
        // Auto layout com constraint
        NSLayoutConstraint.activate([
            imagemView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            imagemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imagemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imagemView.heightAnchor.constraint(equalTo: view.widthAnchor),
            
            tituloLabel.topAnchor.constraint(equalTo: imagemView.bottomAnchor, constant: 16),
            tituloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tituloLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            artistaLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 8),
            artistaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            artistaLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            anoLabel.topAnchor.constraint(equalTo: artistaLabel.bottomAnchor, constant: 8),
            anoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            anoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            estiloLabel.topAnchor.constraint(equalTo: anoLabel.bottomAnchor, constant: 8),
            estiloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            estiloLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descricaoLabel.topAnchor.constraint(equalTo: estiloLabel.bottomAnchor, constant: 16),
            descricaoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descricaoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            botaoCompartilhar.topAnchor.constraint(equalTo: descricaoLabel.bottomAnchor, constant: 24),
            botaoCompartilhar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            botaoCompartilhar.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    private func configurarConteudo() {
        // Atribuir obra recebida para os elementos da view
        imagemView.image = UIImage(named: obra.imagemNome)
        tituloLabel.text = obra.titulo
        artistaLabel.text = obra.artista
        anoLabel.text = "Ano: \(obra.ano)"
        estiloLabel.text = "Estilo: \(obra.estilo)"
        descricaoLabel.text = obra.descricao
    }
    
    @objc private func compartilharObra() {
        let mensagem = "Conheça '\(obra.titulo)' de \(obra.artista)! Descubra mais artistas curitibanos! 🎨"
        let activityVC = UIActivityViewController(activityItems: [mensagem], applicationActivities: nil)
        
        // compartilhar >> ipad
        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = self.view
            popover.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popover.permittedArrowDirections = []
        }
        
        present(activityVC, animated: true, completion: nil)
    }
}
