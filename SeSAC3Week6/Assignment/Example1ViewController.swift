//
//  Example1ViewController.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/22.
//

import UIKit
import SnapKit

final class Example1ViewController: UIViewController {

    private let spacing = 16.0

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset = .init(
            top: spacing,
            left: spacing,
            bottom: spacing,
            right: spacing
        )
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = spacing
        return stackView
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()

    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요"
        textField.textAlignment = .center
        textField.setupBorder()
        return textField
    }()

    private lazy var dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "날짜를 입력해주세요"
        textField.textAlignment = .center
        textField.setupBorder()
        return textField
    }()

    private lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.setupBorder()
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

}

private extension Example1ViewController {

    func configureUI() {
        configureLayout()
    }

    func configureLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        [
            imageView, titleTextField, dateTextField, contentTextView
        ].forEach {
            stackView.addArrangedSubview($0)
        }

        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
        }
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view).offset(-spacing * 2)
        }
        imageView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(imageView.snp.width).multipliedBy(0.8)
        }
        [
            titleTextField, dateTextField
        ].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }

        contentTextView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(contentTextView.snp.width).multipliedBy(1.1)
        }

    }
}
