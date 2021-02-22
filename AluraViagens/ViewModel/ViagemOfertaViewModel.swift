//
//  ViagemOfertaViewModel.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 16/02/21.
//

import Foundation

class ViagemOfertaViewModel: ViagemViewModel {
    
    // MARK: - View Model Protocol
    
    var tituloSessao: String {
        return "Ofertas"
    }
    
    var tipo: ViagemViewModelType {
        return .ofertas
    }
    
    var numeroDeLinhas: Int {
        return 1
    }
    
    var viagens: [Viagem]
    
    // MARK: - Inicializador
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
}
