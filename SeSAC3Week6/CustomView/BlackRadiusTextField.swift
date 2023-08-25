//
//  BlackRadiusTextField.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/25.
//

import UIKit

class BlackRadiusTextField: UITextField {

    // UIView
    // Interface Builder를 사용하지 않고, UIView를 상속 받은 Custom Class를 코드로 구성할 때 사용되는 초기화 구문
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    // NSCoding
    // XIB -> NIB 변환 과정에서 객체 생성시 필요한 init 구문(storyboard)
    // Interface Builder에서 생성된 뷰들이 초기화될 때 실행되는 구문!
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        textColor = .black
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15)
    }
}




// 프로토콜을 통해 init 강제
protocol ExampleProtocol {
    init(name: String)
}

class Mobile: ExampleProtocol {

    // required: 프로토콜에서 생성된 경우 사용하는 키워드
    // Required Initializer
    required init(name: String) {
        fatalError()
    }

}
