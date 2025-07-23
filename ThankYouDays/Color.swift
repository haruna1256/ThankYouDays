//
//  Color.swift
//  ThankYouDays
//
//  Created by 川岸遥奈 on 2025/07/23.
//

import SwiftUI

// 色の定義
extension Color {
    // 背景
    static let backgroundIvory = Color(red: 1.0, green: 0.976, blue: 0.957)   // #FFF974
    
    // 箱（Box）グラデーション用カラー
    static let boxOrangeStart = Color(red: 1.0, green: 0.435, blue: 0.314) // #FF6F50
    static let boxOrangeEnd = Color(red: 1.0, green: 0.604, blue: 0.439) // #FF9A70
    
    // ありがとう風船
    
    static let balloonOrange = Color(red: 1.0, green: 0.65, blue: 0.38)   // 橙色系 #FFA662
        static let balloonSkyBlue = Color(red: 0.4, green: 0.78, blue: 0.98)  // 水色系 #66C7FA
        static let balloonCoral = Color(red: 1.0, green: 0.53, blue: 0.48)    // コーラル系 #FF867A
        static let balloonMint = Color(red: 0.54, green: 0.85, blue: 0.79)    // ミント系 #8AD9C9
        static let balloonPeach = Color(red: 1.0, green: 0.82, blue: 0.71)    // ピーチ系 #FFD1B5
        static let balloonLavender = Color(red: 0.68, green: 0.56, blue: 0.91) // ラベンダー系 #AD8FFA
    
    // テキスト
    static let textDarkGray = Color(red: 0.2, green: 0.2, blue: 0.2) // #333333
    
    // ボタンの影など
    static let softOrange = Color(red: 1.0, green: 0.604, blue: 0.439) // #FF9A70
}
