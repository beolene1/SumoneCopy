//
//  alarmViewController.swift
//  SumoneCopy
//
//  Created by 김서현 on 2020/07/05.
//  Copyright © 2020 김서현. All rights reserved.
//

import UIKit

class alarmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var alarmTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alarmTableView.delegate = self
        alarmTableView.dataSource = self
        
        self.navigationItem.title = "Alarm"
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return ourAlarm.count
    }
    
    //그냥은 고정이 잘 안 되길래 그냥 코드로 row height를 정해쥼
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          var height : CGFloat
          height = 55.0
          return height
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell") as! alarmTableViewCell
        
       //알람 타입에 맞게 서로 다른 이미지와 문구를 표시하게 함
        if ourAlarm[indexPath.row].alarmType == AlarmType.messageReceived {
            cell.alarmImage.image = UIImage(named: "message")
            cell.alarmText.text = "\(you.name)님이 \(ourAlarm[indexPath.row].questionNum)번 질문을 받았습니다."
        } else if ourAlarm[indexPath.row].alarmType == AlarmType.youAnswered {
            cell.alarmImage.image = UIImage(named: "edit")
            cell.alarmText.text = "\(you.name)님이 \(ourAlarm[indexPath.row].questionNum)번 질문에 답을 남겼습니다."
        } else {
            cell.alarmImage.image = UIImage(named: "comment")
            cell.alarmText.text = "\(you.name)님이 \(ourAlarm[indexPath.row].questionNum)번 질문에 댓글을 \(ourAlarm[indexPath.row].numOfComments!)개 남겼습니다."
        }
        
        //분>시간>일 순서대로 표시되게 했음. 이건 alarmType별로 다 해주기에는 너무 길어서 따로 빼줌.
        if calendar.dateComponents([.minute], from: ourAlarm[indexPath.row].actionTime , to: todayTime).minute! < 60 {
            cell.alarmTime.text = "\(calendar.dateComponents([.minute], from: ourAlarm[indexPath.row].actionTime , to: todayTime).minute!)분 전"
        } else if calendar.dateComponents([.hour], from: ourAlarm[indexPath.row].actionTime , to: todayTime).hour! < 60 {
            cell.alarmTime.text = "\(calendar.dateComponents([.minute], from: ourAlarm[indexPath.row].actionTime , to: todayTime).hour!)시간 전"
        } else {
             cell.alarmTime.text = "\(calendar.dateComponents([.day], from: ourAlarm[indexPath.row].actionTime , to: todayTime).day!)일 전"
        }
        
         return cell
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
