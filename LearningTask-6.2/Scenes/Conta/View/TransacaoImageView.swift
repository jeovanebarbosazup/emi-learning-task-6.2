//
//  TransactionImageView.swift
//  LearningTask-6.2
//
//  Created by rafael.rollo on 19/04/2022.
//

import UIKit

@IBDesignable class TransacaoImageView: UIView {
////     MARK: - Configuration support
//    
//    private static var baseDimension: CGFloat = 48
//    
//    private var baseColor: UIColor {
//        switch tipoDeTransacao {
//        case .transferenciaRecebida:
//            return .deepSea ?? .systemGreen
//        default:
//            return .label
//        }
//    }
//    
//    private var icon: UIImage? {
//        switch tipoDeTransacao {
//        case .transferenciaEnviada,
//                .transferenciaRecebida:
//            return .init(named: "Money")
//        
//        case .pagamentoEfetuado(let pagamento):
//            return pagamento.self == .boleto
//                ? .init(named: "Barcode")
//                : .init(named: "Money")
//        
//        case .pagamentoDaFatura:
//            return .init(named: "Card")
//        case .recargaDeCelular:
//            return .init(named: "Phone")
//        case .compraNoDebito:
//            return .init(named: "Account")
//        case .none:
//            return nil
//        }
//    }
//    // MARK: - Subviews
//    
//    private lazy var imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        imageView.tintColor = baseColor
//        
//        let dimension = Self.baseDimension / 2
//        NSLayoutConstraint.activate([
//            imageView.widthAnchor.constraint(equalToConstant: dimension),
//            imageView.heightAnchor.constraint(equalToConstant: dimension),
//        ])
//        return imageView
//    }()
//    // MARK: - Properties
//    
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: Self.baseDimension, height: Self.baseDimension)
//    }
//    
//    var tipoDeTransacao: TipoDeTransacao? {
//        didSet {
//            backgroundColor = baseColor.withAlphaComponent(0.1)
//            imageView.tintColor = baseColor
//            imageView.image = icon
//        }
//    }
//    // MARK: - Initialization
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setup()
//    }
//    
//    private func setup() {
//        applyTheme()
//        addViews()
//        addConstraints()
//    }
//    
//    private func applyTheme() {
//        backgroundColor = baseColor.withAlphaComponent(0.2)
//        layer.cornerRadius = Self.baseDimension / 2
//    }
//    
//    private func addViews() {
//        addSubview(imageView)
//    }
//    
//    private func addConstraints() {
//        NSLayoutConstraint.activate([
//            widthAnchor.constraint(equalToConstant: Self.baseDimension),
//            heightAnchor.constraint(equalToConstant: Self.baseDimension),
//        ])
//        
//        NSLayoutConstraint.activate([
//            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//        ])
//    }
}
