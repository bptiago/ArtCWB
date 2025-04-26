//
//  ArtesDataSource.swift
//  ArtCWB
//
//  Created by Tiago Prestes on 26/04/25.
//

struct ArtesDataSource {
    private static let obras: [ObraDeArte] = [
        ObraDeArte(titulo: "Monumento aos Tropeiros", artista: "Poty Lazzarotto", ano: 1966, estilo: "Modernismo Paranaense", imagemNome: "img1", descricao: "De autoria do artista curitibano, Napoleon Potyguara Lazarotto, a obra enaltece a história paranaense e foi declarada como patrimônio cultural do Estado com o seu tombamento em 17 de janeiro de 2013."),
        ObraDeArte(titulo: "Fundacao de Curitba", artista: "Theodoro de Bona", ano: 1948, estilo: "Paisagismo", imagemNome: "img2", descricao: "A foto mostra uma pintura que retrata o encontro entre colonizadores portugueses e indígenas da região onde Curitiba seria fundada."),
        ObraDeArte(titulo: "Luar do sertao", artista: "João Turin", ano: 1947, estilo: "Naturalismo", imagemNome: "img3", descricao: "Onca esculpida em posicao de ataque."),
        ObraDeArte(titulo: "Painel Imagens da Cidade", artista: "Poty Lazzarotto", ano: 1996, estilo: "Modernismo Regionalista", imagemNome: "img4", descricao: "A obra busca resumir a história da cidade através deste contraste entre o passado e a atualidade."),
        ObraDeArte(titulo: "Painel Evolução do Saneamento Básico", artista: "Poty Lazzarotto", ano: 1995, estilo: "Expressionismo", imagemNome: "img5", descricao: "Poty conta a história do abastecimento de água na capital. A obra retrata diferentes épocas, desde um indígena à beira do rio, uma mulher carregando uma lata d’água na cabeça, as tubulações do primeiro sistema, os pipeiros que distribuíam água para a população e a água encanada."),

    ]
    
    static func allObras() -> [ObraDeArte] {
        return Self.obras
    }
}

