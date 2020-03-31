//
//  ColleagueButton.swift
//  Mediator-UIKit
//
//  Created by Mikiya Abe on 2020/03/29.
//  Copyright © 2020 Mikiya Abe. All rights reserved.
//

import Foundation
import UIKit

final class ColleagueButton: UIView {
    @IBOutlet private weak var button: UIButton!
    private var mediator: BaseMediator!
    var label: String? = "" {
        didSet {
            button.setTitle(label, for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
}

extension ColleagueButton: BaseColleague {
    /// Mediatorを保持する
    func setMediator(mediator: BaseMediator) {
        self.mediator = mediator
    }

    /// Mediatorから有効/無効が指示される
    func setColleagueEnabled(enabled: Bool) {
        button.isEnabled = enabled
    }
}

private extension ColleagueButton {
    func configure() {
        let nib = UINib(nibName: "ColleagueButton", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
