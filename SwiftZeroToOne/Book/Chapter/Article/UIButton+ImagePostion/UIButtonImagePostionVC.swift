//
//  UIButtonImagePostionVC.swift
//  SwiftZeroToOne
//
//  Created by sckj on 2020/9/28.
//

import UIKit

class UIButtonImagePostionVC: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.firstButton.setImagePostion(.top, space: 8)
        self.secondButton.setImagePostion(.left, space: 8)
        self.thirdButton.setImagePostion(.bottom, space: 8)
        self.fourthButton.setImagePostion(.right, space: 8)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
