//
//  ResultsPresenter.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 28/04/22.
//

import Foundation
import UIKit

class ResultsPresenter: ViewToPresenterProtocolResults {
   
    var view:PresenterToViewProtocolResults?
    var interactor: PresenterToInteractorProtocolResults?
    var router: PresenterToRouterProtocolResults?
    
}

extension ResultsPresenter:InteractorToPresenterProtocolResults{
    
}
