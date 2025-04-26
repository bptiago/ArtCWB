//
//  ArtesDataSource.swift
//  ArtCWB
//
//  Created by Tiago Prestes on 26/04/25.
//

struct ArtesDataSource {
    private static let obras: [ObraDeArte] = [
        ObraDeArte(titulo: "Peixinho", artista: "Tiago", ano: 2003, estilo: "Shitpost", imagemNome: "ArtPlaceholder", descricao: "Tralalero tralala, tung tung tung sahur"),
        ObraDeArte(titulo: "Peixinho", artista: "Tiago", ano: 2003, estilo: "Shitpost", imagemNome: "ArtPlaceholder", descricao: "Tralalero tralala, tung tung tung sahur"),
        ObraDeArte(titulo: "Peixinho", artista: "Tiago", ano: 2003, estilo: "Shitpost", imagemNome: "ArtPlaceholder", descricao: "Tralalero tralala, tung tung tung sahur")
    ]
    
    static func allObras() -> [ObraDeArte] {
        return Self.obras
    }
}

