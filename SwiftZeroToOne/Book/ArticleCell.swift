//
//  ChapterCell.swift
//  SwiftZeroToOne
//
//  Created by sckj on 2020/9/27.
//

import UIKit

class ArticleCell: XTableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(model:Article) {
        self.mainLabel.text = model.title
        self.descLabel.text = model.subTitle
    }
}
