//
//  ViagemTableViewCell.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 21/02/21.
//

import UIKit

class ViagemTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    
    @IBOutlet weak var mainView: UIView!
        
    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var diariaViagemLabel: UILabel!
    @IBOutlet weak var precoViagemLabel: UILabel!
    @IBOutlet weak var statusCancelamentoViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
        
        
    // MARK: - Attributes
        
    static var identifier: String {
        return String(describing: self)
    }
        
    func setup(_ viagem: Viagem?) {
        imagemViagem?.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        precoViagemLabel.text = "R$ \(viagem?.preco ?? 0)"
            
        let atributoString: NSMutableAttributedString =  NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        precoSemDescontoLabel.attributedText = atributoString
            
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"
            diariaViagemLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes)"
        }
            
        addSombra(mainView)
    }
        
    func addSombra(_ backgroundView: UIView) {
        DispatchQueue.main.async {
            backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
            backgroundView.layer.shadowOpacity = 1
            backgroundView.layer.shadowOffset = .zero
            backgroundView.layer.shadowRadius = 10
                
            backgroundView.layer.shadowPath = UIBezierPath(rect: self.mainView.bounds).cgPath
                
            backgroundView.layer.shouldRasterize = true
                
            backgroundView.layer.rasterizationScale = UIScreen.main.scale
                
            backgroundView.layer.cornerRadius = 10
        }
    }
}
