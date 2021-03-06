//
//  UIViewExtension.swift
//  Core
//
//  Created by patchara_suk on 19/3/2562 BE.
//  Copyright © 2562 mdc. All rights reserved.
//

import Foundation

import UIKit

public extension UIView {
    
    public func addConstraints(with format: String, to views: UIView..., topPadding: CGFloat = 0, leftPadding: CGFloat = 0, bottomPadding: CGFloat = 0, rightPadding: CGFloat = 0, constraintCollector: inout [NSLayoutConstraint]) {
        
        var metrics = [String: Any]()
        
        if #available(iOS 11.0, *) {
            
            metrics = [
                "top": safeAreaInsets.top + topPadding,
                "bottom": safeAreaInsets.bottom + bottomPadding,
                "left": safeAreaInsets.left + leftPadding,
                "right": safeAreaInsets.right + rightPadding,
            ]
            
        } else {
            
            metrics = [
                "top": topPadding,
                "bottom": bottomPadding,
                "left": leftPadding,
                "right": rightPadding,
            ]
        }
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            
            let key = "v\(index)"
            
            viewsDictionary[key] = view
            
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let constraint = NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: metrics, views: viewsDictionary)
        
        addConstraints(constraint)
        
        constraintCollector.append(contentsOf: constraint)
    }

}
