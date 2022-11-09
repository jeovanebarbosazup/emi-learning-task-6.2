//
//  ContasAPI.swift
//  LearningTask-6.2
//
//  Created by rafael.rollo on 19/04/2022.
//

import Foundation

class ContasAPI {
    
    func carregaHistorico(para conta: Conta) -> [Transacao] {
        return [
            Transacao(tipo: .transferenciaRecebida(.pix), valor: 50, interessado: "Alberto Souza"),
            Transacao(tipo: .compraNoDebito, valor: 250, data: Calendar.current.date(byAdding: .day, value: -5, to: .now)!, interessado: "Zup Store Ltda"),
            Transacao(tipo: .transferenciaRecebida(.ted), valor: 50, data: Calendar.current.date(byAdding: .day, value: -10, to: .now)!, interessado: "Vitor Passarela"),
            Transacao(tipo: .compraNoDebito, valor: 250, data: Calendar.current.date(byAdding: .day, value: -15, to: .now)!, interessado: "Zup Store Ltda"),
            Transacao(tipo: .transferenciaEnviada(.pix), valor: 50, data: Calendar.current.date(byAdding: .day, value: -20, to: .now)!, interessado: "Yuri Matheus"),
            Transacao(tipo: .pagamentoEfetuado(.boleto), valor: 250, data: Calendar.current.date(byAdding: .day, value: -25, to: .now)!, interessado: "Zup Cartões"),
            Transacao(tipo: .transferenciaEnviada(.ted), valor: 50, data: Calendar.current.date(byAdding: .day, value: -30, to: .now)!, interessado: "Alberto Souza"),
            Transacao(tipo: .pagamentoEfetuado(.pix), valor: 250, data: Calendar.current.date(byAdding: .day, value: -35, to: .now)!, interessado: "zFood Ltda"),
            Transacao(tipo: .pagamentoDaFatura, valor: 3200, data: Calendar.current.date(byAdding: .day, value: -40, to: .now)!),
            Transacao(tipo: .recargaDeCelular, valor: 25, data: Calendar.current.date(byAdding: .day, value: -45, to: .now)!, interessado: "(11) 99999-9999"),
            Transacao(tipo: .transferenciaRecebida(.pix), valor: 50, data: Calendar.current.date(byAdding: .day, value: -50, to: .now)!, interessado: "Alberto Souza"),
            Transacao(tipo: .compraNoDebito, valor: 250, data: Calendar.current.date(byAdding: .day, value: -55, to: .now)!, interessado: "Zup Store Ltda"),
            Transacao(tipo: .transferenciaRecebida(.ted), valor: 50, data: Calendar.current.date(byAdding: .day, value: -60, to: .now)!, interessado: "Vitor Passarela"),
            Transacao(tipo: .compraNoDebito, valor: 250, data: Calendar.current.date(byAdding: .day, value: -65, to: .now)!, interessado: "Zup Store Ltda"),
            Transacao(tipo: .transferenciaEnviada(.pix), valor: 50, data: Calendar.current.date(byAdding: .day, value: -70, to: .now)!, interessado: "Yuri Matheus"),
            Transacao(tipo: .pagamentoEfetuado(.boleto), valor: 250, data: Calendar.current.date(byAdding: .day, value: -75, to: .now)!, interessado: "Zup Cartões"),
            Transacao(tipo: .transferenciaEnviada(.ted), valor: 50, data: Calendar.current.date(byAdding: .day, value: -80, to: .now)!, interessado: "Alberto Souza"),
            Transacao(tipo: .pagamentoEfetuado(.pix), valor: 250, data: Calendar.current.date(byAdding: .day, value: -85, to: .now)!, interessado: "zFood Ltda"),
            Transacao(tipo: .pagamentoDaFatura, valor: 3200, data: Calendar.current.date(byAdding: .day, value: -90, to: .now)!),
            Transacao(tipo: .compraNoDebito, valor: 250, data: Calendar.current.date(byAdding: .day, value: -95, to: .now)!, interessado: "Zup Store Ltda"),
        ]
    }
}
