//
//  LoginFrame.swift
//  Mediator-UIKit
//
//  Created by Mikiya Abe on 2020/03/29.
//  Copyright © 2020 Mikiya Abe. All rights reserved.
//

import Foundation
import UIKit

final class LoginFrame: UIView {
    @IBOutlet private weak var checkGuest: ColleagueCheckBox!
    @IBOutlet private weak var checkLogin: ColleagueCheckBox!
    @IBOutlet private weak var textUser: ColleagueTextField!
    @IBOutlet private weak var textPass: ColleagueTextField!
    @IBOutlet private weak var buttonOk: ColleagueButton!
    @IBOutlet private weak var buttonCancel: ColleagueButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        createColleagues()
        colleagueChanged()        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        createColleagues()
        colleagueChanged()
    }
}


extension LoginFrame: BaseMediator, UIGestureRecognizerDelegate {
    /// Mediatorが管理するメンバーを生成する
    func createColleagues() {
        checkGuest.setMediator(mediator: self)
        checkGuest.labelText = "Guest"
        checkGuest.isChecked = true
        let checkGuestTap = UITapGestureRecognizer(target: self, action: #selector(didTapCheckGuest(_:)))
        checkGuestTap.delegate = self
        checkGuest.addGestureRecognizer(checkGuestTap)

        checkLogin.setMediator(mediator: self)
        checkLogin.labelText = "Login"
        checkLogin.isChecked = false
        let checkLoginTap = UITapGestureRecognizer(target: self, action: #selector(didTapCheckLogin(_:)))
        checkLoginTap.delegate = self
        checkLogin.addGestureRecognizer(checkLoginTap)

        buttonOk.setMediator(mediator: self)
        buttonOk.label = "OK"

        buttonCancel.setMediator(mediator: self)
        buttonCancel.label = "Cancel"
    }

    /// 各メンバーであるColleaguesから呼び出されるメソッド
    ///
    /// ラジオボタンやテキストフィールドの値が変化したときに呼び出される
    func colleagueChanged() {
        if checkGuest.isEnabled {
            textUser.setColleagueEnabled(enabled: false)
            textPass.setColleagueEnabled(enabled: false)
            buttonOk.setColleagueEnabled(enabled: true)
        } else {
            textUser.setColleagueEnabled(enabled: true)
            userPassChanged()
        }
    }
}

private extension LoginFrame {
    func configure() {
        let nib = UINib(nibName: "LoginFrame", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }

    func userPassChanged() {
        guard
            let userText = textUser.textField.text,
            let passText = textPass.textField.text else { return }

        if !userText.isEmpty {
            textPass.setColleagueEnabled(enabled: true)
            buttonOk.setColleagueEnabled(enabled: !passText.isEmpty)
        } else {
            textPass.setColleagueEnabled(enabled: false)
            buttonOk.setColleagueEnabled(enabled: false)
        }
    }

    @objc func didTapCheckGuest(_ sender: UITapGestureRecognizer) {
        debugPrint("tap guest")
        checkGuest.isChecked = false
        checkLogin.isChecked = true
    }

    @objc func didTapCheckLogin(_ sender: UITapGestureRecognizer) {
        debugPrint("tap login")
        checkGuest.isChecked = true
        checkLogin.isChecked = false
    }
}
