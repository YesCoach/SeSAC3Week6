//
//  BottomButtonView.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/22.
//

import UIKit

final class BottomButtonView: UIView {

    enum ButtonType {
        case chatMeSelf
        case editProfile
        case story

        var image: UIImage? {
            switch self {
            case .chatMeSelf: return .init(systemName: "message.fill")
            case .editProfile: return .init(systemName: "pencil")
            case .story: return .init(systemName: "quote.bubble.fill")
            }
        }

        var text: String {
            switch self {
            case .chatMeSelf: return "나와의 채팅"
            case .editProfile: return "프로필 편집"
            case .story: return "카카오스토리"
            }
        }
    }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        return imageView
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()

    init(type: ButtonType) {
        super.init(frame: .zero)
        configure(with: type)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BottomButtonView {

    func configure(with type: ButtonType) {
        imageView.image = type.image
        textLabel.text = type.text
    }

    func configureUI() {
        [
            imageView, textLabel
        ].forEach {
            addSubview($0)
        }

        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(24)
            $0.height.equalTo(imageView.snp.width)
        }
        textLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }

    }
}
