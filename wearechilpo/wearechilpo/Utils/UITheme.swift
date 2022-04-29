//
//  UITheme.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 27/04/22.
//

import Foundation
import SwiftUI

public struct UITheme{
    
    public static let Color1 = #colorLiteral(red: 0.8901960784, green: 0.6274509804, blue: 0.4, alpha: 1) //#E3A066
    public static let Color2 = #colorLiteral(red: 0.9411764706, green: 0.6117647059, blue: 0.5333333333, alpha: 1) //#F09C88
    public static let Color3 = #colorLiteral(red: 0.168627451, green: 0.1764705882, blue: 0.1882352941, alpha: 1) //#2B2D30
    public static let Color4 = #colorLiteral(red: 0.8549019608, green: 0.8509803922, blue: 0.8509803922, alpha: 1) //#DAD9D9
    public static let Color5 = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9843137255, alpha: 1) //#FAFAFB
    public static let Color6 = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9843137255, alpha: 0.7989186672) //#FAFAFB
    public static let Color7 = #colorLiteral(red: 0.8092250631, green: 0.5231785439, blue: 0.4622273294, alpha: 1) //#7E94FC
    public static let Color8 = #colorLiteral(red: 0.9411770701, green: 0.6133409142, blue: 0.5342553258, alpha: 1) //#8EC7FF
    public static let Color9 = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1) //#8EC7FF
    public static let Color10 = #colorLiteral(red: 0.9257417929, green: 0.5985087033, blue: 0.5287813936, alpha: 1) //#7E94FC
    public static let Color11 = #colorLiteral(red: 0.515625, green: 0.5140201655, blue: 0.5145192126, alpha: 0.5942932533) //#7E94FC

    
    public static func Regular(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Sora-Regular", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .medium)
    }
    
    public static func Light(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Sora-Light", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .medium)
    }
    
    public static func SemiBold(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Sora-SemiBold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .semibold)
    }
    
    public static func Bold(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Sora-Bold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .medium)
    }
    
    public static func XtraBold(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Sora-ExtraBold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize, weight: .semibold)
    }
    
    
}
