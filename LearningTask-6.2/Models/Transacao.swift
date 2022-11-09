//
//  Transacao.swift
//  LearningTask-6.2
//
//  Created by jeovane.barbosa on 09/11/22.
//

import Foundation

struct Transacao {
    let data: Date
    let tipo: TipoDeTransacao
    let interessado: String?
    let valor: Decimal
    
    init( tipo: TipoDeTransacao, valor: Decimal, data: Date = .now, interessado: String? = nil ) {
        self.data = data
        self.tipo = tipo
        self.interessado = interessado
        self.valor = valor
    }
}

enum TipoDeTransacao {
    case transferenciaEnviada(Transferencia)
    case transferenciaRecebida(Transferencia)
    case pagamentoEfetuado(Pagamento)
    case pagamentoDaFatura
    case recargaDeCelular
    case compraNoDebito
    
    var titulo: String {
        switch self {
        case .transferenciaEnviada:
            return "Transferência enviada"
        case .transferenciaRecebida:
            return "Transferência Recebida"
        case .pagamentoEfetuado:
            return "Pagamento efetuado"
        case .pagamentoDaFatura:
            return "Pagamento da fatura"
        case .recargaDeCelular:
            return "Recarga de celular"
        case .compraNoDebito:
            return "Compra no débito"
        }
    }
    
    var subtipo: String?  {
        switch self {
        case .transferenciaEnviada(let tipoDeTransferencia):
            return tipoDeTransferencia.rawValue.capitalized
        case .transferenciaRecebida(let tipoDeTransferencia):
            return tipoDeTransferencia.rawValue.capitalized
        case .pagamentoEfetuado(let tipoDePagamento):
            return tipoDePagamento.rawValue.capitalized
        default:
            return nil
        }
    }
    
}

enum Transferencia: String {
    case doc, ted, pix
}

enum Pagamento: String {
    case boleto, pix
}

