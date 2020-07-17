//
//  mainViewController.swift
//  SumoneCopy
//
//  Created by 김서현 on 2020/06/30.
//  Copyright © 2020 김서현. All rights reserved.
//

import UIKit


class mainViewController: UIViewController {

    @IBOutlet weak var dDayLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var newQuestionLabel: UILabel!
    
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Sumone"
        
        nameLabel.text = me.name + " ❤️ " + you.name
      
        dDayLabel.text =   "사랑한 지 \(todayTime2.day!)일째"
        
        if ourAnswer.count > 10 {
            imageView.image = UIImage(named: "3")
        } else if ourAnswer.count > 3 {
            imageView.image = UIImage(named: "2")
        } else {
            imageView.image = UIImage(named: "1")
        }
        
        newQuestionLabel.text = ourAnswer[0].question
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
