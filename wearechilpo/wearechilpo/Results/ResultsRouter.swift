//
//  ResultsRouter.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 28/04/22.
//

import Foundation
import UIKit

class ResultsRouter: PresenterToRouterProtocolResults {
    
    
    
    weak var viewController:ResultsView?
    
    static func createModule(status:Int?) -> ResultsView{
        let view = ResultsView()
        let presenter:ViewToPresenterProtocolResults & InteractorToPresenterProtocolResults = ResultsPresenter()
        let interactor:PresenterToInteractorProtocolResults = ResultsInteractor()
        let router:PresenterToRouterProtocolResults = ResultsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func RouteToResults(actualVC: UINavigationController) {
        
    }
}
