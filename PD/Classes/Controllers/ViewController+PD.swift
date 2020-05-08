//
//  ViewController+Swift.swift
//  PD
//
//  Created by David on 5/8/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit
import Lottie

extension UIViewController {
    
    func showLoader() {
        let loaderTAG = 999999
        let animationView = AnimationView(name: "20871-search")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        animationView.tag = loaderTAG
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop

    }
    
    func hideLoader() {
        let loaderTAG = 999999
        view.viewWithTag(loaderTAG)?.removeFromSuperview()
    }
    
}
