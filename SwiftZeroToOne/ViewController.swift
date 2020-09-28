//
//  ViewController.swift
//  SwiftZeroToOne
//
//  Created by sckj on 2020/9/27.
//

import UIKit

class ViewController: XTableVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.rowHeight = UITableView.automaticDimension
    }

    lazy var chapters : [Chapter] = {
        
        let start = Chapter.init(name: "第一章 基本数据类型", articles: [
            Article(title: "String", subTitle: "字符串", content: {
                
            }),
            Article(title: "Float", subTitle: "浮点数", content: {
                
            }),
            Article(title: "XInsetLabel", subTitle: "可以设置内边距的Label", content: {
                self.navigationController?.pushViewController(XInsetLabelVC(), animated: true)
            }),
            Article(title: "UIButtonImagePostion", subTitle: "简单的设置按钮图片的位置", content: {
                self.navigationController?.pushViewController(UIButtonImagePostionVC(), animated: true)
            })
        ])
        
        
        return [start]
    }()
    
    lazy var book = Book(name: "Swift 从零到一", chapters: self.chapters)
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.book.chapters.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.book.chapters[section].articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ArticleCell.cell(for: tableView)
        cell.config(model: self.book.chapters[indexPath.section].articles[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = self.book.chapters[indexPath.section].articles[indexPath.row]
        
        if article.content != nil {
            article.content!()
        }
    }
}

