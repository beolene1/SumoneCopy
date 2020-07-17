//
//  listViewController.swift
//  SumoneCopy
//
//  Created by 김서현 on 2020/07/02.
//  Copyright © 2020 김서현. All rights reserved.
//

import UIKit

class listViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listTableView.delegate = self
        listTableView.dataSource = self
        
        self.navigationItem.title = "List"
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return ourQuestion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! listTableViewCell
        
//question number가 10 이상이면 앞에 0을 빼도록 함
        if ourQuestion[indexPath.row].idNumber < 10 {
            cell.questionNumLabel.text = "#0" + (String(ourQuestion[indexPath.row].idNumber))}
        else { cell.questionNumLabel.text = "#" + (String(ourQuestion[indexPath.row].idNumber))}
        
        cell.questionLabel.text = "\(ourQuestion[indexPath.row].question)"
        
        return cell
    }
    
    //segue 연결
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataToSend = ourAnswer[indexPath.row]
        self.performSegue(withIdentifier: "questionDetail", sender: dataToSend)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "questionDetail" {
            let destination = segue.destination as! UINavigationController
            let detailViewController = destination.viewControllers[0] as! QuestionDetailViewController
            if let ourAnswer = sender as? Question {
                detailViewController.questions = ourAnswer
            }
        }

    }
    
    }

extension listViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height : CGFloat
        height = 60.0
        return height
    }
}
  


