//
//  Example2ViewController.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/22.
//

import UIKit

final class Example2ViewController: UIViewController {

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "tokyo_tower")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.opacity = 0.7
        return imageView
    }()

    private lazy var menuBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        return button
    }()

    private lazy var menuBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()

    private lazy var giftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "gift.circle"), for: .normal)
        button.tintColor = .white
        return button
    }()

    private lazy var moneyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "wonsign.circle"), for: .normal)
        button.tintColor = .white
        return button
    }()

    private lazy var settingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "gearshape.circle"), for: .normal)
        button.tintColor = .white
        return button
    }()

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "ph1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40.0
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "YesCoach"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        return label
    }()

    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private lazy var bottomView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 30.0
        return stackView
    }()

    private lazy var chatButton: BottomButtonView = {
        let buttonView = BottomButtonView(type: .chatMeSelf)
        return buttonView
    }()

    private lazy var editButton: BottomButtonView = {
        let buttonView = BottomButtonView(type: .editProfile)
        return buttonView
    }()

    private lazy var storyButton: BottomButtonView = {
        let buttonView = BottomButtonView(type: .story)
        return buttonView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

}

private extension Example2ViewController {

    func configureUI() {
        configureLayout()
    }

    func configureLayout() {
        [
            backgroundImageView,
            menuBarView,
            profileImageView,
            nameLabel,
            separatorView,
            bottomView
        ].forEach {
            view.addSubview($0)
        }

        [
            giftButton, moneyButton, settingButton
        ].forEach {
            menuBarStackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.width.height.equalTo(44)
            }
        }

        [
            dismissButton, menuBarStackView
        ].forEach {
            menuBarView.addSubview($0)
        }

        menuBarView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(80)
        }

        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        dismissButton.snp.makeConstraints {
            $0.width.height.equalTo(44)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }

        menuBarStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(120)
            $0.centerX.equalToSuperview()
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(separatorView.snp.top).offset(-40)
        }

        separatorView.snp.makeConstraints {
            $0.centerX.width.equalToSuperview()
            $0.bottom.equalTo(bottomView.snp.top)
            $0.height.equalTo(0.5)
        }

        // MARK: - Bottom View

        bottomView.addSubview(bottomStackView)
        bottomView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
        bottomStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        [
            chatButton, editButton, storyButton
        ].forEach { button in
            bottomStackView.addArrangedSubview(button)
            button.snp.makeConstraints {
                $0.height.equalToSuperview()
                $0.width.equalTo(button.snp.height)
            }
        }
    }
}
