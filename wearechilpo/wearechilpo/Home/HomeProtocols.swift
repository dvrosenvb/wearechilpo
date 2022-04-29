//
//  HomeProtocols.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 27/04/22.
//

import Foundation
import UIKit

//MARK: Router - PresenterToRouter
protocol PresenterToRouterProtocolHome: AnyObject {
    static func createModule(status:Int?) -> HomeView
    func RouteToResults(actualVC:UINavigationController)
}

//MARK: Presenter - ViewToPresenter
protocol ViewToPresenterProtocolHome: AnyObject {
    var view:PresenterToViewProtocolHome? { get set }
    var interactor:PresenterToInteractorProtocolHome? { get set }
    var router:PresenterToRouterProtocolHome? {get set}
    
    func goToResults(actualVc:UINavigationController)
    
}

//MARK: Interactor - InteractorToPresenter
protocol InteractorToPresenterProtocolHome: AnyObject {
    
}

//MARK: View - PresenterToView
protocol PresenterToViewProtocolHome: AnyObject {
    func HomeSucceded()
    func HomeFailed()
}

//MARK: PresenterToInteractorProtocol
protocol PresenterToInteractorProtocolHome:AnyObject{
    var presenter:InteractorToPresenterProtocolHome? {get set}   
}
