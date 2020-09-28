//
//  UILabelExtensions.swift
//  SwiftZeroToOne
//
//  Created by sckj on 2020/9/28.
//

import UIKit


extension UILabel {

    /// 使UILabel两端对齐，常用于字数不同宽度相同的Label需要对齐的情况，eg： "价格：" 和 "总销量："
    func setLeftAndRightAlign() {
        if self.text?.count ?? 0 <= 0 {
            return
        }
        let textSize = (self.text! as NSString).boundingRect(with: CGSize(width: self.bounds.size.width, height: 1000), options: [.usesLineFragmentOrigin,.truncatesLastVisibleLine], attributes: [NSAttributedString.Key.font : self.font!], context: nil)
                   
        let lastChar = String(self.text!.last!)
        
        var length = self.text!.count - 1
        if String(lastChar).elementsEqual(":") || String(lastChar).elementsEqual("：") {
            length = (self.text!.count-2)
        }

        let margin = (self.bounds.size.width - textSize.width)/CGFloat(length)
        let m1 = NSMutableAttributedString.init(string: self.text!)
        m1.addAttributes([NSAttributedString.Key.font : self.font!,NSAttributedString.Key.kern:margin], range: NSRange(location: 0, length: length))
        self.attributedText = m1
    }
}

