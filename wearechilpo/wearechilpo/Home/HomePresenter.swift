//
//  LoginPresenter.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 27/04/22.
//

import Foundation
import UIKit

class HomePresenter: ViewToPresenterProtocolHome {
   
    var view:PresenterToViewProtocolHome?
    var interactor: PresenterToInteractorProtocolHome?
    var router: PresenterToRouterProtocolHome?
    
    func goToResults(actualVc: UINavigationController) {
        router?.RouteToResults(actualVC: actualVc)
    }
    
}

extension HomePresenter:InteractorToPresenterProtocolHome{
    
}
