//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by 박태현 on 2023/08/23.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {

    //1.
    let picker = UIImagePickerController()

    lazy var photoImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemMint
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let titleTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(photoImageView)
        view.addSubview(titleTextField)

        [photoImageView, titleTextField].forEach {
            view.addSubview($0)
        }

        setupConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        //2. available
//        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
//        else {
//            print("갤러리 사용 불가, 사용자에게 토스트/얼럿")
//            return
//        }
//
//        picker.delegate = self
//        picker.sourceType = .camera // .photoLibrary
//        let picker = UIFontPickerViewController()
        let picker = UIColorPickerViewController()

        present(picker, animated: true)

    }

    func setupConstraints() {
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(photoImageView.snp.bottom).offset(20)
            $0.leadingMargin.equalTo(20)
            // $0.leading.equalTo(view).inset(20)
            $0.trailingMargin.equalTo(-20)
            $0.height.equalTo(50)
        }

        photoImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalToSuperview().multipliedBy(0.3)
        }
    }
}

extension TextViewController: UIImagePickerControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
        print(#function)
    }

    // 사진을 선택하거나 카메라 촬영 직후 호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.photoImageView.image = image
            dismiss(animated: true)
        }
    }
}

extension TextViewController: UINavigationControllerDelegate {

}
