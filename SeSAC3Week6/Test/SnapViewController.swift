//
//  SnapViewController.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/23.
//

import UIKit
import SnapKit

/*
 addSubView
 superView
 offset inset
 RTL
*/

class SnapViewController: UIViewController {

    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()

    // 디바이스 정중앙에 위치, width height 200

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(150)
            $0.centerX.equalTo(view)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
//            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
//            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(200)
        }

        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints {
//            $0.centerX.centerY.equalToSuperview()
//            $0.width.height.equalTo(200)
            $0.center.equalToSuperview()
            $0.size.equalTo(200)
        }

        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints {
//            $0.size.equalTo(150)
//            $0.leading.top.equalToSuperview()
            $0.edges.equalTo(blueView).inset(50)
        }
    }

}
