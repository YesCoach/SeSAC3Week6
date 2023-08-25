//
//  CustomTableViewCell.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/25.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"

    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureLayout() // addSubView 이후에 constraints 설정
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CustomTableViewCell {

    func configureUI() {
        [ label, button ].forEach { contentView.addSubview($0) }
        label.backgroundColor = .yellow
        button.backgroundColor = .green
    }

    func configureLayout() {
        button.snp.makeConstraints {
            $0.size.equalTo(30)
            $0.centerY.trailingMargin.equalTo(contentView)
        }
        label.snp.makeConstraints {
            $0.top.leadingMargin.bottom.equalTo(contentView)
            $0.trailing.equalTo(button.snp.leading).inset(8)
        }
    }
}

extension CustomTableViewCell {

    func configure(data: Sample) {
        label.text = data.text
        label.numberOfLines = data.isExpand ? 0 : 2
    }
}
