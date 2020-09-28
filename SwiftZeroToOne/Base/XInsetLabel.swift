//
//  XInsetLabel.swift
//  SwiftZeroToOne
//
//  Created by sckj on 2020/9/27.
//

import UIKit

/// 可以设置内边距的Label，很多时候可以省去一个containerView
class XInsetLabel: UILabel {
    
    var insets : UIEdgeInsets = UIEdgeInsets.zero {
        didSet {
            // 设置需要重新绘制，在下一次刷新时重绘
            setNeedsDisplay()
            
            // UI显示
            // CPU: Layout Display Prepare Commit -> GPU
            // * Layout UI布局 文本计算
            // * Display drawRect
            // * Prepare 图片编解码
            // * Commit 提交位图
        }
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: self.insets))
    }
    
    /// sizeToFit() 会调用这个方法会设置自身的bounds，返回一个正确的值是有必要的
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let insetsWidth = self.insets.left + self.insets.right
        let inetsHeight = self.insets.top + self.insets.bottom
        let textWidth = size.width - insetsWidth
        let textHeight = size.height - inetsHeight
        let resultSize = super.sizeThatFits(CGSize(width: textWidth, height: textHeight))
        let width = resultSize.width + insetsWidth
        let height = resultSize.height + inetsHeight
        return CGSize(width: width, height: height)
    }
    
    /// AutoLayout 会调用这个方法来计算视图需要的大小，加了 insets，原本的计算方式就不对了，所以需要重写
    override var intrinsicContentSize: CGSize {
        var preferredMaxLayoutWidth = self.preferredMaxLayoutWidth
        if preferredMaxLayoutWidth <= 0 {
            preferredMaxLayoutWidth = CGFloat.greatestFiniteMagnitude
        }
        
        return sizeThatFits(CGSize(width: preferredMaxLayoutWidth, height: CGFloat.greatestFiniteMagnitude))
    }
}
