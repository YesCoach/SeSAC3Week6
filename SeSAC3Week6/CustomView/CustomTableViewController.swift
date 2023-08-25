//
//  CustomTableViewController.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/25.
//

import UIKit
import SnapKit

struct Sample {
    let text: String
    var isExpand: Bool
}

final class CustomTableViewController: UIViewController {

    private lazy var tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension
        view.delegate = self // 자기 자신의 인스턴스
        view.dataSource = self // 자기 자신의 인스턴스
        // uinib - xib
        // Meta Type: Cell.self
        view.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: CustomTableViewCell.identifier
        )
        return view
    }()

    let imageView = {
        let view = PosterImageView(frame: .zero)
        return view
    }()

    // var isExpand = false // false: 2, true: 0
    private var list = [
        Sample(text: "테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀", isExpand: false),
        Sample(text: "테스트 셀테스트 셀", isExpand: false),
        Sample(text: "테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀테스트 셀", isExpand: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
    }

}

extension CustomTableViewController {

    func configureUI() {
        view.addSubview(tableView)
        view.addSubview(imageView)
    }

    func configureLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.size.equalTo(200)
            $0.center.equalToSuperview()
        }
    }

}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier
        ) as? CustomTableViewCell
        else { return UITableViewCell() }

        let item = list[indexPath.row]
        cell.configure(data: item)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        list[indexPath.row].isExpand.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}
