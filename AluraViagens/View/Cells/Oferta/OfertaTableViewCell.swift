//
//  OfertaTableViewCell.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 10/02/21.
//

import UIKit

class OfertaTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet var mainView: [UIView]!
    
    @IBOutlet var imagensViagem: [UIImageView]!
    @IBOutlet var titulosViagensLabels: [UILabel]!
    @IBOutlet var subtitulosViagensLabels: [UILabel]!
    
    // MARK: - Attributes

    static var identifier: String {
        return String(describing: self)
    }
    
    func setup(_ viagens: [Viagem]?) {
        
        guard let viagensList = viagens else { return }

        for i in 0..<viagensList.count {
            setOutlets(index: i, viagem: viagensList[i])
        }
        
        mainView.forEach({ view in
            addSombra(view)
        })
    }
    
    func setOutlets(index: Int, viagem: Viagem) {
        
        let imageOutlet = imagensViagem[index]
        imageOutlet.image = UIImage(named: viagem.asset)
    }
    
    func addSombra(_ backgroundView: UIView) {
        DispatchQueue.main.async {
            backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
            backgroundView.layer.shadowOpacity = 1
            backgroundView.layer.shadowOffset = .zero
            backgroundView.layer.shadowRadius = 10
            
            backgroundView.layer.shadowPath = UIBezierPath(rect: backgroundView.bounds).cgPath
            
            backgroundView.layer.shouldRasterize = true
            
            backgroundView.layer.rasterizationScale = UIScreen.main.scale
            
            backgroundView.layer.cornerRadius = 10
        }
    }
}
