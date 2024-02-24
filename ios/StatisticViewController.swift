//
//  StatisticViewController.swift
//  sinaureact
//
//  Created by Abdul Hakim on 13/02/24.
//

import UIKit
import SnapKit

@objc(StatisticViewController)
public class StatisticViewController: UIViewController {
  
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
    
    mainView.backgroundColor = .white
    
    mainView.snp.makeConstraints { make in
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        make.left.right.equalToSuperview()
    }
  }
  
  private func setupNavigationBar() {
    let nextButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(navigateToNextPage))
    self.navigationItem.rightBarButtonItem  = nextButton

    let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(goBack))
    self.navigationItem.leftBarButtonItem = backButton
    self.navigationItem.backButtonTitle = ""
  }

  @objc func goBack() {
    dismiss(animated: true, completion: nil)
  }
  
  @objc func navigateToNextPage() {
    let nextViewController = DetailViewController()
    navigationController?.pushViewController(nextViewController, animated: true)
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

extension UIColor {
    static func fromHex(_ hex: UInt32, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
