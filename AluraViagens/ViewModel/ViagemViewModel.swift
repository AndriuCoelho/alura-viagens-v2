//
//  ViagemViewModel.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 07/02/21.
//

import Foundation

enum ViagemViewModelType: String {
   case destaques
   case ofertas
   case internacionais
}

protocol ViagemViewModel {
    var tituloSessao: String  { get }
    var tipo: ViagemViewModelType { get }
    var viagens: [Viagem] { get set }
    var numeroDeLinhas: Int { get }
}
