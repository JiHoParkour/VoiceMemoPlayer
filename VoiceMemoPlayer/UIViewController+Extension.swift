//
//  UIViewController+Extension.swift
//  VoiceMemoPlayer
//
//  Created by jiho park on 5/30/24.
//

import UIKit

extension UIViewController {
    func presentActionSheet(completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let addFolder = UIAlertAction(title: "폴더 추가", style: .default) { [weak self] _ in
            self?.presentTextFiledAlert(completionHandler: { folderName in
                completionHandler(folderName)
            })
        }
        let addVoiceMemo = UIAlertAction(title: "음성메모 가져오기", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        alert.addAction(addFolder)
        alert.addAction(addVoiceMemo)
        alert.addAction(cancel)

        self.present(alert, animated: true)
    }
    
    func presentTextFiledAlert(completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "폴더 추가", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "폴더명"
        }
        
        let create = UIAlertAction(title: "생성", style: .default) { _ in
            if let textfield = alert.textFields?[safe: 0], let folderName = textfield.text {
                completionHandler(folderName)
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .destructive)
        
        alert.addAction(create)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
}

