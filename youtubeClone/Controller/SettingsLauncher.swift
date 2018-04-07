//
//  SettingsLauncher.swift
//  youtubeClone
//
//  Created by Arvids Gargurnis on 07/04/2018.
//  Copyright © 2018 Arvids Gargurnis. All rights reserved.
//

import UIKit

class SettingsLauncher: NSObject {
    
    let blackView = UIView()
    let settingsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    @objc func showSettings() {
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(settingsCollectionView)
            
            let height: CGFloat = 200
            let y = window.frame.height - height
            
            settingsCollectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                
                self.settingsCollectionView.frame = CGRect(x: 0, y: y, width: self.settingsCollectionView.frame.width, height: self.settingsCollectionView.frame.height)
            }, completion: nil)
            
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                self.settingsCollectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.settingsCollectionView.frame.width, height: self.settingsCollectionView.frame.height)
            }
            
        }
    }
    
    override init() {
        super.init()
        // start doing something
    }
}
