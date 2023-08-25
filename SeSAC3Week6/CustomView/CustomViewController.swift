//
//  CustomViewController.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/25.
//

import UIKit

final class CustomViewController: UIViewController {

    let idTextField = {
        let view = BlackRadiusTextField()
        view.placeholder = "아이디를 입력해주세요"
        return view
    }()

    let passwordTextField = {
        let view = BlackRadiusTextField()
        view.placeholder = "비밀번호를 입력해주세요"
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }

        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(100)
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
    }

}
