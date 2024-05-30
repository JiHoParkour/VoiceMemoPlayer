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
        super.viewDidLoad()
        
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        addButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: addButton)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func addButtonTapped() {
        self.presentActionSheet { folderName in
            print(folderName)
        }
    }
}
