//
//  LoginProtocols.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 28/04/22.
//

import Foundation
import UIKit

//MARK: Router - PresenterToRouter
protocol PresenterToRouterProtocolLogin: AnyObject {
    static func createModule() -> LoginView
    func RouteToHome(actualVC:UINavigationController)
}

//MARK: Presenter - ViewToPresenter
protocol ViewToPresenterProtocolLogin: AnyObject {
    var view:PresenterToViewProtocolLogin? { get set }
    var interactor:PresenterToInteractorProtocolLogin? { get set }
    var router:PresenterToRouterProtocolLogin? {get set}
    
    func goToHome(actualVC:UINavigationController)
}

//MARK: Interactor - InteractorToPresenter
protocol InteractorToPresenterProtocolLogin: AnyObject {
    
}

//MARK: View - PresenterToView
protocol PresenterToViewProtocolLogin: AnyObject {
    func LoginSucceded()
    func LoginFailed()
}

//MARK: PresenterToInteractorProtocol
protocol PresenterToInteractorProtocolLogin:AnyObject{
    var presenter:InteractorToPresenterProtocolLogin? {get set}
}
