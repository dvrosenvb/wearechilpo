//
//  EntryPoint.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 27/04/22.
//

import Foundation
import UIKit

public class EntryPoint {
    
    public static let bundle = Bundle(for: EntryPoint.self)
    public static let shared = EntryPoint()
    
    public static func startViperModule() -> UIViewController {
//        return HomeRouter.createModule(status: 0)
//        return ResultsRouter.createModule(status: 0)
        return LoginRouter.createModule()
    }
}
