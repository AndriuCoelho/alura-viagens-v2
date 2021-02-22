//
//  ViagemInternacionalViewModel.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 07/02/21.
//

import Foundation

class ViagemInternacionalViewModel: ViagemViewModel {

    // MARK: - View Model Protocol
    
    var tituloSessao: String {
        return "Internacionais"
    }
    
    var tipo: ViagemViewModelType {
        return .internacionais
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
