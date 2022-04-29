//
//  ResultsProtocols.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 28/04/22.
//

import Foundation
import UIKit

//MARK: Router - PresenterToRouter
protocol PresenterToRouterProtocolResults: AnyObject {
    static func createModule(status:Int?) -> ResultsView
    func RouteToResults(actualVC:UINavigationController)
}

//MARK: Presenter - ViewToPresenter
protocol ViewToPresenterProtocolResults: AnyObject {
    var view:PresenterToViewProtocolResults? { get set }
    var interactor:PresenterToInteractorProtocolResults? { get set }
    var router:PresenterToRouterProtocolResults? {get set}
    
}

//MARK: Interactor - InteractorToPresenter
protocol InteractorToPresenterProtocolResults: AnyObject {
    
}

//MARK: View - PresenterToView
protocol PresenterToViewProtocolResults: AnyObject {
    func ResultsSucceded()
    func ResultsFailed()
}

//MARK: PresenterToInteractorProtocol
protocol PresenterToInteractorProtocolResults:AnyObject{
    var presenter:InteractorToPresenterProtocolResults? {get set}
}
