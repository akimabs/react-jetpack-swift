//
//  StatisticViewController.swift
//  sinaureact
//
//  Created by Abdul Hakim on 13/02/24.
//

import UIKit
import SnapKit

@objc(DetailViewController)
public class DetailViewController: UIViewController {
  
  private let mainView = UIView()
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupGesture()
  }

  private func setupGesture() {
    let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
    swipeRecognizer.direction = .right
    view.addGestureRecognizer(swipeRecognizer)
  }
  
  private func setupView() {
    setupMainView()
    setupNavigationBar()
  }
  
  private func setupMainView() {
    view.backgroundColor = .fromHex(0x212121)
    view.addSubview(mainView)
    
    mainView.backgroundColor = .fromHex(0x212121)
    
    mainView.snp.makeConstraints { make in
        make.top.equalToSuperview()
        make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        make.left.right.equalToSuperview()
    }
  }
  
  private func setupNavigationBar() {
    let backButton = UIBarButtonItem(image: UIImage(named: "icon.back"), style: .done, target: self, action: #selector(goBack))
    backButton.tintColor = .white
    
    let nextButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(navigateToNextPage))

    let buttonSize = CGSize(width: 100, height: 100)
    backButton.customView?.frame = CGRect(origin: .zero, size: buttonSize)

    self.navigationItem.leftBarButtonItem = backButton
    self.navigationItem.rightBarButtonItem = nextButton
    self.navigationItem.title = "Detail"
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }


  @objc func goBack() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc func navigateToNextPage() {
    let nextViewController = StatisticViewController()
    navigationController?.pushViewController(nextViewController, animated: true)
  }
  
  @objc func handleSwipe(_ gestureRecognizer: UISwipeGestureRecognizer) {
    if gestureRecognizer.state == .ended {
      goBack()
    }
  }
  
  @objc static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
}
