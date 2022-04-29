//
//  LoginPresenter.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 28/04/22.
//

import Foundation
import UIKit

class LoginPresenter: ViewToPresenterProtocolLogin {
    
    
    var view:PresenterToViewProtocolLogin?
    var interactor: PresenterToInteractorProtocolLogin?
    var router: PresenterToRouterProtocolLogin?
    
    func goToHome(actualVC:UINavigationController) {
        router?.RouteToHome(actualVC: actualVC)
    }
}

extension LoginPresenter:InteractorToPresenterProtocolLogin{
    
}
