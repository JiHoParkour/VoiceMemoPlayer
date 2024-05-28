//
//  AppRootRouter.swift
//  VoiceMemoPlayer
//
//  Created by jiho park on 5/29/24.
//

import RIBs

protocol AppRootInteractable: Interactable,
                              AppHomeListener {
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {

    private let appHomeBuilder: AppHomeBuildable
    private var appHomeRouting: AppHomeRouting?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: AppRootInteractable,
                  viewController: AppRootViewControllable,
                  appHomeBuilder: AppHomeBuildable) {
        self.appHomeBuilder = appHomeBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToAppHome() {
        if appHomeRouting != nil { return }
        
        let router = appHomeBuilder.build(withListener: interactor)
        self.appHomeRouting = router
        attachChild(router)
        viewController.present(viewController: router.viewControllable)
    }
}
