//
//  HomeRouter.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 27/04/22.
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterProtocolHome {
    
    
    
    weak var viewController:HomeView?
    
    static func createModule(status:Int?) -> HomeView{
        let view = HomeView(status:status)
        let presenter:ViewToPresenterProtocolHome & InteractorToPresenterProtocolHome = HomePresenter()
        let interactor:PresenterToInteractorProtocolHome = HomeInteractor()
        let router:PresenterToRouterProtocolHome = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func RouteToResults(actualVC: UINavigationController) {
        actualVC.pushViewController(ResultsRouter.createModule(status: 0), animated: true)
    }
}
