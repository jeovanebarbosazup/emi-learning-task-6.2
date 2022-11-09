//
//  TableHeaderView.swift
//  LearningTask-6.2
//
//  Created by rafael.rollo on 18/04/2022.
//

import UIKit

class TableHeaderView: UIView {
    
    private static var borderHeightConstant: CGFloat = 1
    private static var heightConstant: CGFloat = 280 + borderHeightConstant
    
    static func constroi(para conta: Conta) -> TableHeaderView {
        let frame = CGRect(x: 0, y: 0, width: 0, height: heightConstant)
        return TableHeaderView(frame: frame, conta: conta)
    }
    
    fileprivate static var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
    
    private lazy var balanceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "Saldo disponível"
        return label
    }()
    
    private lazy var balanceValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.text = Self.currencyFormatter.string(from: conta.saldo as NSDecimalNumber)!
        return label
    }()
    
    private lazy var balanceStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            balanceTitleLabel,
            balanceValueLabel
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    private lazy var investedControl: HeaderControl = {
        let view = HeaderControl()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.icon = UIImage(named: "Dollar")
        view.title = "Dinheiro investido"
        view.value = Self.currencyFormatter.string(from: conta.montanteInvestido as NSDecimalNumber)!
        return view
    }()
    
    private lazy var incomesControl: HeaderControl = {
        let view = HeaderControl()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.icon = UIImage(named: "Chart")
        view.title = "Rendimento total mensal"
        view.attributedValue = HeaderControl.buildIncomesAttributedValue(conta.rendimentoMensalAtual)
        return view
    }()
    
    private lazy var controlsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            investedControl,
            incomesControl
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20
        return stack
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            balanceStackView,
            controlsStackView
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 32
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 32, left: 24, bottom: 32, right: 24)
        return stack
    }()
    
    private lazy var bottomDividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .quaternaryLabel
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: Self.borderHeightConstant)
        ])
        return view
    }()
    
    private var conta: Conta
    
    init(frame: CGRect, conta: Conta) {
        self.conta = conta
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Este componente não suporta carregamento através de arquivos de interface builder. Utilize-o apenas como código.")
    }
    
    private func setup() {
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        addSubview(containerStackView)
        addSubview(bottomDividerView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Self.heightConstant)
        ])
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bottomDividerView.topAnchor.constraint(equalTo: containerStackView.bottomAnchor),
            bottomDividerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomDividerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomDividerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}

fileprivate class HeaderControl: UIView {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .label
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 24),
            imageView.heightAnchor.constraint(equalToConstant: 24),
        ])
        return imageView
    }()
    
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            titlelabel,
            valueLabel
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()
    
    private lazy var navigationIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondaryLabel
        imageView.image = .init(systemName: "arrow.forward")
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
        ])
        return imageView
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            iconImageView, contentStackView, navigationIconImageView
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 16
        return stack
    }()
    
    var icon: UIImage? {
        didSet {
            iconImageView.image = icon
        }
    }
    
    var title: String? {
        didSet {
            titlelabel.text = title
        }
    }
    
    var value: String? {
        didSet {
            valueLabel.text = value
        }
    }
    
    var attributedValue: NSAttributedString? {
        didSet {
            valueLabel.attributedText = attributedValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        addSubview(containerStackView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    static func buildIncomesAttributedValue(_ incomes: Decimal) -> NSAttributedString {
        let templateString = "%@ este mês"
        let featuredString = "+\(TableHeaderView.currencyFormatter.string(from: incomes as NSDecimalNumber)!)"
        
        let string = String(format: templateString, featuredString)
        let range = (string as NSString).range(of: featuredString)
        
        let attributedString = NSMutableAttributedString(
            string: string,
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .light)]
        )
        
        let boldAndColoredFontAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.deepSea ?? UIColor.systemGreen
        ]
        
        attributedString.addAttributes(boldAndColoredFontAttributes, range: range)
        return attributedString
    }
}
