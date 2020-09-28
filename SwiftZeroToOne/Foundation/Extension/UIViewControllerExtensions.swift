//
//  UIViewControllerExtensions.swift
//  SwiftZeroToOne
//
//  Created by sckj on 2020/9/28.
//

import UIKit

extension UIViewController {
    
    /// 防止自动调整scrollView的adjustContentInset
    /// - Parameter scrollView: 需要控制的scrollView
    func disableAutoAdjustsScrollViewInsets(scrollView:UIScrollView) {
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
}
