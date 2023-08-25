//
//  GenericViewController.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/25.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {

    let sampleLabel = UILabel()
    let sampleButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown

        title = "네비게이션 타이틀"

        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .yellow
        configureBorder(view: sampleLabel)
        sampleLabel.text = "제네릭 테스트"
        sampleLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(100)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(50)
        }

        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .green
        configureBorder(view: sampleButton)
        sampleButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(100)
            $0.top.equalTo(sampleLabel.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }

        let value = sumInt(a: 3, b: 7)
        print(value)

        let value2 = sumDouble(a: 3.5, b: 7.7)
        print(value2)
    }

}
