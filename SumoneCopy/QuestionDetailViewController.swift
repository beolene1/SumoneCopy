//
//  QuestionDetailViewController.swift
//  SumoneCopy
//
//  Created by 김서현 on 2020/07/06.
//  Copyright © 2020 김서현. All rights reserved.
//

import UIKit

class QuestionDetailViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionNumLabel: UILabel!
    @IBOutlet weak var questionTimeLabel: UILabel!
    @IBOutlet weak var meLabel: UILabel!
    @IBOutlet weak var youLabel: UILabel!
    @IBOutlet weak var meAnswerLabel: UILabel!
    @IBOutlet weak var youAnswerLabel: UILabel!
    @IBAction func dismissSelfViewController(_ sender:
        Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var questions : Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
    
        self.navigationItem.title = "Sumone"
        
        
    if let haveQuestion = questions {
        for question in ourAnswer.enumerated() {
            if haveQuestion.question == question.element.question {
                self.questions = question.element
            }
        }
    }

                questionLabel.text = "\(questions!.question)"
                questionNumLabel.text = "#\(questions!.idNumber)번째 질문"
                //질문이 도착한 날짜를 기준으로...?
        //        questionTimeLabel.text = "\(questions!.meAnswer?.AnsweredTime?.day)"
                
                meLabel.text = "\(me.name)"
                youLabel.text = "\(you.name)"
                
              
                    meAnswerLabel.text = "\(questions!.meAnswer?.answer! ?? "눌러서 답변을 입력해 주세요.")"
                
                    youAnswerLabel.text = "\(questions!.youAnswer?.answer! ?? "눌러서 답변을 입력해 주세요.")"
    }
    
    
//    var whichQuestionSelected
//    var whichComments : [Comment] = []
    
    @IBAction func commentBtnClicked(_ sender: UIButton) {
//        whichComments = questions!.comment!
        self.performSegue(withIdentifier: "commentDetail", sender: nil)
        self.performSegue(withIdentifier: "editDetail", sender: nil)
//        print("This is sender: \(sender.tag)")
        
   }



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let whichQuestionSelected = questions!
        
        if segue.identifier == "commentDetail" {
            let viaDestination = segue.destination as! UINavigationController
            let commentDestination = viaDestination.viewControllers[0] as! CommentViewController

            commentDestination.receivedQuestion = questions!.question
            
            //코멘트가 없으면 어떡할거..?
            if let comment = questions?.comment {
                commentDestination.whichComments = comment
            }
        }
        
        if segue.identifier == "editDetail" {
            let destination = segue.destination as! EditViewController

           destination.gotQuestion = questions
            

        }
        
    }

                                    

 




}
