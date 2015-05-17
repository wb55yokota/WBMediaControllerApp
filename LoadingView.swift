//
//  LoadingView.swift
//  WBMediaControllerApp
//
//  Created by YOKOTA, Kenji on 2015/03/08.
//  Copyright (c) 2015年 wb55. All rights reserved.
//

import Foundation

class LoadingView : UIView {
    let SIZE: CGFloat = 100
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    convenience init() {
        self.init()
        
        frame = CGRectMake((SCREEN_W-SIZE)/2, (SCREEN_H-STATUSBAR_H-NAVBAR_H-SIZE)/2, SIZE, SIZE)
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        layer.cornerRadius = 4
        clipsToBounds = true
        
        indicator.frame = CGRectMake(0, 0, SIZE, SIZE)
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        self.addSubview(indicator)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func start() {
        indicator.startAnimating()
    }

    func stop() {
        indicator.stopAnimating()
    }
}