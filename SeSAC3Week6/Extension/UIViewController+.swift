//
//  UIViewController+.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/25.
//

import UIKit

extension UIViewController {

    enum TransitionStyle {
        case present    // 네비게이션 없이 present
        case presentNavigation  // 네비게이션 임베드 된 present
        case presentFullNavigation  // 네비게이션 임베드 된 fullscreen present
        case push
    }

    func transition<T: UIViewController>(viewController: T.Type, storyboard: String, style: TransitionStyle) {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = sb.instantiateViewController(
            withIdentifier: String(describing: viewController)
        ) as? T else { return }

        switch style {

        case .present:
            present(vc, animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    // Type Parameter: 타입의 종류는 알려주지 않지만, 모두 같은 타입이 들어갈 것을 암시. 플레이스 홀더와 같은 역할.
    // Type Constraints: 클래스 제약, 프로토콜 제약
    // UpperCased
    func configureBorder<T: UIView>(view: T) {
        view.layer.cornerRadius = 10.0
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 3.0
        view.layer.masksToBounds = true
    }

    // Generic: 타입에 유연하게 대응하기 위한 요소
    // 코드 중복과 재사용에 대응하기가 좋아서 추상적인 표현 가능
    func sumInt<T: AdditiveArithmetic>(a: T, b: T) -> T {
        return a + b
    }

    func sumInt(a: Int, b: Int) -> Int {
        return a + b
    }

    func sumDouble(a: Double, b: Double) -> Double {
        return a + b
    }

    func sumFloat(a: Float, b: Float) -> Float {
        return a + b
    }

}
