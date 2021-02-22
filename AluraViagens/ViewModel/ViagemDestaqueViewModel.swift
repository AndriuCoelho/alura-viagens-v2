//
//  DestaqueViagemViewModel.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 07/02/21.
//

import Foundation

class ViagemDestaqueViewModel: ViagemViewModel {
    
    // MARK: - View Model Protocol
    
    var tituloSessao: String {
        return "Destaques"
    }
    
    var tipo: ViagemViewModelType {
        return .destaques
    }
    
    var numeroDeLinhas: Int {
        return viagens.count
    }
    
    var viagens: [Viagem]
    
    // MARK: - Inicializador
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
}
