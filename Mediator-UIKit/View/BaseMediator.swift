//
//  BaseMediator.swift
//  DesignPatternsInSwift
//
//  Created by Mikiya Abe on 2020/03/29.
//  Copyright © 2020 Mikiya Abe. All rights reserved.
//

import Foundation

/// 相談役
protocol BaseMediator {
    /// Mediatorが管理するメンバーを生成する
    func createColleagues()
    
    /// 各メンバーであるColleaguesから呼び出されるメソッド
    ///
    /// ラジオボタンやテキストフィールドの値が変化したときに呼び出される
    func colleagueChanged()
}
