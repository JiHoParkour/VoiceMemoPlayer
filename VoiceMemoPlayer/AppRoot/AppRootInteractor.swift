//
//  AppRootInteractor.swift
//  VoiceMemoPlayer
//
//  Created by jiho park on 5/29/24.
//

import RIBs
import RxSwift

protocol AppRootRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToAppHome()
}

protocol AppRootPresentable: Presentable {
    var listener: AppRootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AppRootListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class AppRootInteractor: PresentableInteractor<AppRootPresentable>, AppRootInteractable, AppRootPresentableListener {

    weak var router: AppRootRouting?
    weak var listener: AppRootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: AppRootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        router?.routeToAppHome()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
