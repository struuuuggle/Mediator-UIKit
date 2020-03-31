//
//  BaseColleague.swift
//  DesignPatternsInSwift
//
//  Created by Mikiya Abe on 2020/03/29.
//  Copyright © 2020 Mikiya Abe. All rights reserved.
//

import Foundation

/// 相談役に相談をもちかけるメンバーを表す
protocol BaseColleague {
    /// Mediatorを実装したLoginFrameクラスが最初に呼び出すメソッド
    ///
    /// - Parameter mediator: colleagueChangedを呼び出すときに使う
    func setMediator(mediator: BaseMediator)
    
    /// 相談役からやってくる「指示」を表す
    ///
    /// Parameter enabled: trueなら自分自身を「有効」にし、falseなら「無効」にする
    func setColleagueEnabled(enabled: Bool)
}
