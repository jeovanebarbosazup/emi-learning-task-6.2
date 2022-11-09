//
//  ViewController.swift
//  LearningTask-6.2
//
//  Created by rafael.rollo on 20/04/2022.
//

import UIKit

class ContaViewController: UITableViewController {

    var contasAPI: ContasAPI?
    var conta: Conta!{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        carregaHistorico()
    }
    
    func setupViews(){
        tableView.tableHeaderView = TableHeaderView.constroi(para: conta)
        tableView.register(SectionTitle.self, forHeaderFooterViewReuseIdentifier: SectionTitle.reuseId)
        tableView.sectionHeaderHeight = SectionTitle.heightConstant
    }
    
    func carregaHistorico(){
        if let contasAPI = contasAPI {
            conta.historico = contasAPI.carregaHistorico(para: conta)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conta.historico.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransacaoCell", for: indexPath) as? TransacaoTableViewCell else{
            fatalError("Não foi possível obter célula para a tabela")
        }
        
        let transacao = conta.historico[indexPath.row]
        cell.setup(transacao)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionTitle.reuseId) as? SectionTitle else{
            fatalError("Não foi possível recuperar header view para a tabela")
        }
        headerView.titulo = "Histórico"
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
