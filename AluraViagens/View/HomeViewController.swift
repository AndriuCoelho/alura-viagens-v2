//
//  HomeViewController.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 25/01/21.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var viagensTableView: UITableView!
    
    var sessao = sessaoDeViagens

    // MARK: - View life cycle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
    }

    // MARK: - Class methods
    
    private func configuraTableView() {
        viagensTableView.register(UINib(nibName: ViagemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ViagemTableViewCell.identifier)
        viagensTableView.register(UINib(nibName: OfertaTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OfertaTableViewCell.identifier)
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessao?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessao?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = sessao?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques, .internacionais:
            guard let destaqueCell = tableView.dequeueReusableCell(withIdentifier: ViagemTableViewCell.identifier) as? ViagemTableViewCell else {
                fatalError("error ao criar a célula de detalhe")
            }
            
            destaqueCell.setup(viewModel?.viagens[indexPath.row])
            
            return destaqueCell
            
        case .ofertas:
            guard let ofertaCell = tableView.dequeueReusableCell(withIdentifier: OfertaTableViewCell.identifier) as? OfertaTableViewCell else {
                fatalError("error ao criar a célula de detalhe")
            }
            
            ofertaCell.setup(viewModel?.viagens)
            
            return ofertaCell
            
        default:
            return UITableViewCell()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = Bundle.main.loadNibNamed(HomeTableViewHeader.identifier, owner: self, options: nil)?.first as? HomeTableViewHeader
            header?.setup()
            
            return header
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 300
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viagem = sessao?[indexPath.section]
        
        switch viagem?.tipo {
        case .ofertas:
            return 390
        default:
            return 400
        }
    }
}
