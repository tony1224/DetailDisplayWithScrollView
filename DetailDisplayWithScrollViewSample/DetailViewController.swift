//
//  ViewController.swift
//  DetailDisplayWithScrollViewSample
//
//  Created by 森田　潤 on 2018/01/26.
//  Copyright © 2018年 test. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var baseScrollView: CustomScrollView!
    @IBOutlet private weak var detailSectionView: UIView!
    @IBOutlet private weak var contactSectionView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!
    
    // MARK: - Properties
    
    var isShownDetailSection: Bool = true
    
    
    // MARK: - LifeCycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "詳細画面"
        
        // MAP/カレンダーを表示したセクションの表示/非表示判定
        self.detailSectionView.isHidden = (self.isShownDetailSection)
        
        // タイトルラベル(背景だけ透過)
        let backgroundColor: UIColor = .darkGray
        let transmissionColor: UIColor = backgroundColor.withAlphaComponent(0.5)
        self.titleLabel.backgroundColor = transmissionColor
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(handleKeyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(handleKeyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Notification
    
    @objc func handleKeyboardWillShowNotification(_ notification: Notification) {
        guard let rect = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }
        guard let duration: Double = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        UIView.animate(withDuration: duration, animations: { () in
            let transform = CGAffineTransform(translationX: 0, y: -(rect.size.height))
            self.view.transform = transform
        })
    }
    
    @objc func handleKeyboardWillHideNotification(_ notification: Notification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Double else { return }
        
        UIView.animate(withDuration: duration, animations: { () in
            self.view.transform = CGAffineTransform.identity
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

