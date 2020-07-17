//
//  CommentViewController.swift
//  SumoneCopy
//
//  Created by 김서현 on 2020/07/07.
//  Copyright © 2020 김서현. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentButton: UIButton!
    @IBAction func dismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    var receivedQuestion = ""
    var whichComments : [Comment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "commentCell")
        
        self.navigationItem.title = "\(receivedQuestion)"
        
//        let button = UIButton(type: .custom)
        textField.rightView = commentButton
        textField.rightViewMode = .always

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        whichComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell") as! CommentTableViewCell
        
        cell.commentLabel.text = "\(whichComments[indexPath.row].text)"
        cell.userNameLabel.text = "\(whichComments[indexPath.row].userName)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height : CGFloat
        height = 75.0
        return height
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func enterButtonTapped(_ sender: Any) {
        textField.endEditing(true)
        textField.resignFirstResponder()
    
        let commentMade = Date()
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: commentMade as Date)
//        whichComments.append(Comment(text: textField.text!, userName: me.name, commentedTime: components))

        
        
        
        for question in ourAnswer.enumerated() {
            if receivedQuestion == question.element.question {
                let comment = Comment(text: textField.text ?? "", userName: me.name, commentedTime: components)
                ourAnswer[question.offset].comment?.append(comment)
                print(ourAnswer[question.offset].comment!)
                self.whichComments = ourAnswer[question.offset].comment!
            }
        }
        
        textField.text = nil
        tableView.reloadData()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
}
