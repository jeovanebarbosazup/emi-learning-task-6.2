//
//  TransacaoTableViewCell.swift
//  LearningTask-6.2
//
//  Created by jeovane.barbosa on 09/11/22.
//

import UIKit

class TransacaoTableViewCell: UITableViewCell {

    @IBOutlet weak var transacaoImageView: TransacaoImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var interessadoLabel: UILabel!
    @IBOutlet weak var valorTransacaoLabel: UILabel!
    @IBOutlet weak var subtipoTransacaoLabel: UILabel!
    
    func setup(_ transacao: Transacao){
        transacaoImageView.tipoDeTransacao = transacao.tipo
        tituloLabel.text = transacao.tipo.titulo
        dataLabel.text = transacao.data.asDayPlusAbbreviatedMonth
        valorTransacaoLabel.text = transacao.valor.asCurrency
        
//        Se necessário ao tipo
        if let interessado = transacao.interessado {
            interessadoLabel.text = interessado
            interessadoLabel.isHidden = false
        }
        
//        Se necessário ao tipo
        if let subtipo = transacao.tipo.subtipo {
            subtipoTransacaoLabel.text = subtipo
            subtipoTransacaoLabel.isHidden = false
        }
    }
    
    override func prepareForReuse() {
        interessadoLabel.text = nil
        interessadoLabel.isHidden = true
        
        subtipoTransacaoLabel.text = nil
        subtipoTransacaoLabel.isHidden = true
    }
    
    
}
