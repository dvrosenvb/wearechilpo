//
//  UIVCExtension.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 28/04/22.
//

import Foundation
import UIKit

public extension UIViewController{
    func setupNavBar(titleTxt:String, tintColor:UIColor, backgroundColor:UIColor)  {
        let attrs = [NSAttributedString.Key.font: UITheme.SemiBold(24),
                     NSAttributedString.Key.foregroundColor: tintColor]
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = attrs
        self.navigationItem.backBarButtonItem?.tintColor = tintColor
        view.backgroundColor = backgroundColor
        title = titleTxt
    }
}
