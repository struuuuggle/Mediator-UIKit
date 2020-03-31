//
//  ColleagueTextField.swift
//  Mediator-UIKit
//
//  Created by Mikiya Abe on 2020/03/29.
//  Copyright © 2020 Mikiya Abe. All rights reserved.
//

import Foundation
import UIKit

final class ColleagueTextField: UIView {
    @IBOutlet weak var textField: UITextField!
    private var mediator: BaseMediator!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
}

extension ColleagueTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 文字列が変化したらMediatorに通知
        mediator.colleagueChanged()
        return true
    }
}

extension ColleagueTextField: BaseColleague {
    /// Mediatorを保持
    func setMediator(mediator: BaseMediator) {
        self.mediator = mediator
    }

    /// Mediatorから有効/無効が指示される
    func setColleagueEnabled(enabled: Bool) {
        textField.isEnabled = enabled
        backgroundColor = textField.isEnabled ? .white : .lightGray
    }
}

private extension ColleagueTextField {
    func configure() {
        let nib = UINib(nibName: "ColleagueTextField", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
