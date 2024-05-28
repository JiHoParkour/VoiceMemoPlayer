//
//  AppHomeViewController.swift
//  VoiceMemoPlayer
//
//  Created by jiho park on 5/29/24.
//

import RIBs
import RxSwift
import UIKit

protocol AppHomePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AppHomeViewController: UIViewController, AppHomePresentable, AppHomeViewControllable {

    weak var listener: AppHomePresentableListener?
    
    override func viewDidLoad() {
        self.view.backgroundColor = .red
    }
}
