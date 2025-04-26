//
//  LoginViewController.swift
//  ArtCWB
//
//  Created by Tiago Prestes on 26/04/25.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // Cor de fundo
        // Adiciona as subviews à view principal
        view.addSubview(usuarioTextField)
        view.addSubview(senhaTextField)
        view.addSubview(loginButton)
        view.addSubview(mensagemLabel)
        // Configurar as constraints (Auto Layout)
        configurarConstraints()
        // Do any additional setup after loading the view.
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for:
        .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
    print("Botão de login tocado!")
    // Aqui você colocaria a lógica de autenticação
    }
    
    func configurarConstraints() {
        // Constraints para o usuárioTextField
        NSLayoutConstraint.activate([
            usuarioTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Centralizado horizontalmente
            usuarioTextField.topAnchor.constraint(equalTo:
            view.safeAreaLayoutGuide.topAnchor, constant: 50), // Distância do topo
            usuarioTextField.widthAnchor.constraint(equalTo: view.widthAnchor,
            multiplier: 0.8), // Largura (80% da tela)
            usuarioTextField.heightAnchor.constraint(equalToConstant: 40) // Altura fixa
        ])
        
        // Constraints para o senhaTextField
        NSLayoutConstraint.activate([
            senhaTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            senhaTextField.topAnchor.constraint(equalTo: usuarioTextField.bottomAnchor,
            constant: 20),
            senhaTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:
            0.8),
            senhaTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Constraints para o loginButton
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: senhaTextField.bottomAnchor,
            constant: 30),
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier:
            0.5),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Constraints para o mensagemLabel
        NSLayoutConstraint.activate([
            mensagemLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mensagemLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor,
            constant: 20),
            mensagemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
            constant: 20),
            mensagemLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
            constant: 20) // Margens laterais
        ])
    }
    
    private let usuarioTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome de usuário"
        textField.borderStyle = .roundedRect // Estilo da borda
        textField.translatesAutoresizingMaskIntoConstraints = false // Importante para auto layout
        return textField
    }()
    
    private let senhaTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true // Esconde a senha
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system) // Usa o estilo System para o botão
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8 // Arredonda as bordas
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let mensagemLabel: UILabel = {
        let label = UILabel()
        label.text = "Por favor, insira suas credenciais."
        label.textAlignment = .center
        label.numberOfLines = 0 // Permite múltiplas linhas
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
