//
//  SectionTitle.swift
//  LearningTask-6.2
//
//  Created by jeovane.barbosa on 09/11/22.
//

import UIKit

class SectionTitle: UITableViewHeaderFooterView {
    
    var titulo: String? {
        didSet {
            label.text = titulo
        }
    }
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    static var heightConstant: CGFloat = 72
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addViews()
        addContraints()
    }
    
    private func addViews() {
        addSubview(label)
    }
    
    private func addContraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Self.heightConstant)
        ])
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 24),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
        ])
    }

}
