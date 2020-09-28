//
//  UITableViewCell+XF.swift
//  XFoundation
//
//  Created by sckj on 2020/7/25.
//  Copyright © 2020 com.learn. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    /// 注册Cell
    /// - Parameters:
    ///   - tableView: 目标tableView
    ///   - identifier: 重用标志，不传，默认为不带命名空间的类名
    /// - Discussion
    /// 使用这个方法并没有传递xib的名字，因为默认xib的名字和cell的类名是一致的。
    /// 如果同名xib存在，会注册该xib，如果同名xib不存在，会注册class
    class func register(for tableView:UITableView, identifier:String? = nil) {
        var reuseIdentifier = identifier
        if reuseIdentifier == nil {
          reuseIdentifier = self.className
        }
        let classBundle = Bundle.init(for: self)
        let path = classBundle.path(forResource: className, ofType: "nib")
        if (path != nil) {
            let nib = UINib.init(nibName: className, bundle: classBundle)
            
            tableView.register(nib, forCellReuseIdentifier: reuseIdentifier!)
        } else {
            tableView.register(self, forCellReuseIdentifier: reuseIdentifier!)
        }
    }

    /// 获取重用cell
    /// - Parameters:
    ///   - tableView: 目标tableView
    ///   - identifier: cell 重用标志可以不传，默认为不带命名空间的类名
    /// - Returns: 获取到的重用cell
    class func cell(for tableView: UITableView, identifier:String? = nil) -> Self {
        var reuseIdentifier = identifier
        if reuseIdentifier == nil {
          reuseIdentifier = self.className
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier!)
        if cell == nil {
            register(for: tableView, identifier: reuseIdentifier!)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier!)
        }
        return cell! as! Self
    }
}
