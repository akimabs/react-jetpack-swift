//
//  DetailViewController.swift
//  sinaureact
//
//  Created by Abdul Hakim on 13/02/24.
//

import UIKit
import SnapKit

@objc(DetailViewController)
public class DetailViewController: UIViewController {

    let mainView = UIView()
    let centeredText = UILabel()

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupGesture()
        setupNavigationBar()
    }

    func setupGesture() {
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRecognizer.direction = .right
        view.addGestureRecognizer(swipeRecognizer)
    }

    func setupView() {
        view.backgroundColor = .red

        mainView.backgroundColor = .white
        view.addSubview(mainView)

        mainView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }

    func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(goBack))
        self.navigationItem.leftBarButtonItem = backButton
    }
  
    @objc func goBack() {
      self.navigationController?.popViewController(animated: true)
    }

    @objc func handleSwipe(_ gestureRecognizer: UISwipeGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            dismiss(animated: true, completion: nil)
        }
    }

    @objc static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
