//
//  LoginRouter.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 28/04/22.
//

import Foundation
import UIKit

class LoginRouter: PresenterToRouterProtocolLogin {
    
    weak var viewController:LoginView?
    
    static func createModule() -> LoginView{
        let view = LoginView()
        let presenter:ViewToPresenterProtocolLogin & InteractorToPresenterProtocolLogin = LoginPresenter()
        let interactor:PresenterToInteractorProtocolLogin = LoginInteractor()
        let router:PresenterToRouterProtocolLogin = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func RouteToHome(actualVC: UINavigationController) {
        actualVC.pushViewController(HomeRouter.createModule(status: 0), animated: true)
    }
}
