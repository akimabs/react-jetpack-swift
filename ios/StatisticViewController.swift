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

  let safeAreaView = UIView()
  let centeredText = UILabel()

  public override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupGesture()
  }
  
  func setupGesture(){
    let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
    swipeRecognizer.direction = .right
    view.addGestureRecognizer(swipeRecognizer)
  }
  
  func setupView(){
    view.backgroundColor = .white
    view.addSubview(safeAreaView)

    safeAreaView.snp.makeConstraints { make in
        make.edges.equalTo(view.safeAreaLayoutGuide)
    }
    safeAreaView.backgroundColor = .white
    centeredText.text = "Your Centered Text"
    centeredText.textColor = .black
    safeAreaView.addSubview(centeredText)

    centeredText.snp.makeConstraints { make in
        make.center.equalTo(view)
    }
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
