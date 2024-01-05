//
//  View+Extensions.swift
//  Instagram
//
//  Created by 김소혜 on 1/5/24.
//

import SwiftUI
import Foundation
import UIKit

extension UINavigationController{
    override open func viewDidLoad() {
        super.viewDidLoad()
        let appearnace = UINavigationBarAppearance()
        
        appearnace.configureWithOpaqueBackground()
        appearnace.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearnace.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        // appearnace.configureWithTransparentBackground() // 투명하게
        
        appearnace.largeTitleTextAttributes = [.font: UIFont(name: "Pretendard-Bold", size: 22)!]
        appearnace.titleTextAttributes = [.font: UIFont(name: "Pretendard-Bold", size: 16)!]
        appearnace.shadowColor = .white
        // appearnace.backButtonAppearance = backButtonAppearance
        navigationController?.hidesBarsOnSwipe = true // 스크롤 다운하면 숨겨지게
     
    
        navigationBar.standardAppearance = appearnace
        navigationBar.compactAppearance = appearnace
        navigationBar.scrollEdgeAppearance = appearnace
        // navigationBar.isTranslucent = false
        // navigationBar.tintColor = .white
        
    }
//    override open func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        let height = CGFloat(24)
//        navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
//    }
//    private var backButtonAppearance: UIBarButtonItemAppearance{
//        let backButtonAppearnce = UIBarButtonItemAppearance()
//        backButtonAppearnce.normal.titleTextAttributes = [.foregroundColor: UIColor.clear, .font: UIFont.systemFont(ofSize: 0.0)]
//        
//        return backButtonAppearnce
//    }
}





  
