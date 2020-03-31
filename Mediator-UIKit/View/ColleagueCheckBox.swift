//
//  ColleagueCheckBox.swift
//  Mediator-UIKit
//
//  Created by Mikiya Abe on 2020/03/29.
//  Copyright © 2020 Mikiya Abe. All rights reserved.
//

import Foundation
import UIKit

final class ColleagueCheckBox: UIView {
    @IBOutlet private weak var checkBox: UIButton!
    @IBOutlet private weak var label: UILabel!
    private var mediator: BaseMediator!
    var labelText: String = "" {
        didSet {
            label.text = labelText
        }
    }
    var isChecked: Bool = false {
        didSet {
            checkBox.setImage(
                isChecked ? UIImage(named: "FilledCheckBox") : UIImage(named: "EmptyCheckBox"),
                for: .normal
            )
            mediator.colleagueChanged()
        }
    }
    lazy var isEnabled: Bool = {
        checkBox.isEnabled
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
}

extension ColleagueCheckBox: BaseColleague {
    /// Mediatorを保持
    func setMediator(mediator: BaseMediator) {
        self.mediator = mediator
    }

    /// Mediatorから有効/無効が指示される
    func setColleagueEnabled(enabled: Bool) {
        isChecked = enabled
    }
}

private extension ColleagueCheckBox {
    func configure() {
        let nib = UINib(nibName: "ColleagueCheckBox", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        checkBox.imageView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
