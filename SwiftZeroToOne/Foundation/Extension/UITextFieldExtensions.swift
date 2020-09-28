//
//  UITextFieldExtensions.swift
//  SwiftZeroToOne
//
//  Created by sckj on 2020/9/28.
//

import UIKit

extension UITextField {
    
    /// 检验textField的输入，如果没有输出，会弹出toast,内容为textFiled的placeholder
    /// - Parameter disableWhitespaces: 是否需要去掉首尾的空格再校验剩余内容
    /// - Returns: 是否有输入内容
    func validateText(disableWhitespaces: Bool = true) -> Bool {
        if disableWhitespaces {
            let text = self.text?.trimmingCharacters(in: NSCharacterSet.whitespaces)
            if text == nil {
//                Toast.showInfo(self.placeholder)
                return false
            }
        } else {
            if self.hasText == false {
//                Toast.showInfo(self.placeholder)
                return false
            }
        }
        return true
    }
}

