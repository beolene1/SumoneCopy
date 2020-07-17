//
//  EditViewController.swift
//  SumoneCopy
//
//  Created by 김서현 on 2020/07/14.
//  Copyright © 2020 김서현. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionNumLabel: UILabel!
    @IBOutlet weak var questionDateLabel: UILabel!
    @IBOutlet weak var editingSpaceView: UITextView!
    
    var gotQuestion : Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sumone"
        questionLabel.text = gotQuestion?.question
        questionNumLabel.text = "#\(gotQuestion!.idNumber)번째 질문"
//        questionDateLabel.text = "\(question?.meAnswer?.AnsweredTime?.year)"
        editingSpaceView.text = gotQuestion?.meAnswer?.answer
        
    }
    

    @IBAction func confirmButtonPressed(_ sender: Any) {
//        editingSpaceView.text = gotQuestion?.meAnswer?.answer
        
        for question in ourAnswer.enumerated() {
            if gotQuestion?.question == question.element.question {
                ourAnswer[question.offset].meAnswer?.answer = editingSpaceView.text
            }
        }
        
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
