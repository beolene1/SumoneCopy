//
//  DataModel.swift
//  SumoneCopy
//
//  Created by 김서현 on 2020/06/30.
//  Copyright © 2020 김서현. All rights reserved.
//

import Foundation
import UIKit

enum User {
    case me
    case you
}

enum BloodType {
    case a
    case b
    case ab
    case o
}



struct UserInfo {
    var type: User
    let name: String
    var birthday: DateComponents
    let bloodtype: BloodType
    
    
//    let Dday: DateComponents
//    디데이는 두 유저에게 모두 같은데 따로 이 structure에 넣을 필요 없어보임!
//    let coupleMember: String
//    let questionTime: Date 어떤 게 어울릴ㄹ지 고민~!AZ@
}


//struct UserRelations {
//    let dDay: Date
//    var today: Date = Date()
//}

struct Comment {
    var text: String
    let userName: String
    let commentedTime: DateComponents
}


struct Question {
    let idNumber: Int
    let question: String
    var meAnswer: Answer?
    var youAnswer: Answer?
    var comment: [Comment]?
}


struct Answer {
    var answer: String?
    var AnsweredTime: DateComponents?
}


let calendar = Calendar.current
let dateFormatter = DateFormatter()
//
// + me+you+dday를 합친 structure가 필요
let me = UserInfo(type: User.me, name: "늘",  birthday:DateComponents(calendar: calendar, year: 2001, month: 11, day: 24) , bloodtype: BloodType.o)

let you = UserInfo(type: User.you, name: "눙", birthday: DateComponents(calendar: calendar, year: 2001, month: 7, day: 9), bloodtype: BloodType.ab)

let ourDDay = DateComponents(calendar: calendar, year: 2020, month: 6, day: 30)

let today = Date()
let todayTime = calendar.dateComponents([.year,.month,.day], from: today)
let todayTime2 = calendar.dateComponents([.day], from: ourDDay, to: todayTime)


let ourQuestion: [Question] = [Question(idNumber: 3, question: "가장 좋아하는 색이 무엇인가요?"),Question(idNumber: 2, question: "토끼와 처음 마주쳤을 때의 감정을 표현해 보세요."),Question(idNumber: 1, question: "토끼의 첫인상은 어땠나요?")]

var ourAnswer: [Question] =
    [Question(idNumber: 3,
              question: "가장 좋아하는 색이 무엇인가요?",
              meAnswer: nil,
              youAnswer: nil,
              comment: nil),
Question(idNumber: 2,
         question: "토끼와 처음 마주쳤을 때의 감정을 표현해 보세요.",
         meAnswer: Answer(answer: "음청 좋았음", AnsweredTime: DateComponents(calendar: calendar, year: 2020, month: 7, day: 1, hour: 9, minute: 26, second: 38 )),
         youAnswer: nil,
         comment: [Comment(text: "하 넘나뤼 뻔해요ㅠ", userName: me.name, commentedTime: DateComponents(calendar: calendar, year: 2020, month: 7, day: 1, hour: 12, minute: 34, second: 23))]),
Question(idNumber: 1,
         question: "토끼의 첫인상은 어땠나요?",
         meAnswer: Answer(answer: "생각보다 그냥 그랬음...살짝 기괴하게 생겼다고 생각했었음", AnsweredTime:DateComponents(calendar: calendar, year: 2020, month: 6, day: 30, hour: 17, minute: 35, second: 17)),
         youAnswer: Answer(answer: "못생기고 통통하다", AnsweredTime: DateComponents(calendar: calendar, year: 2020, month: 6, day: 30, hour: 19, minute: 33, second: 28)),
         comment: nil)]

enum AlarmType {
    case messageReceived
    case youAnswered
    case youCommented
}

struct Alarm {
    let alarmType: AlarmType
    let questionNum: Int
    let actionTime: DateComponents
    let numOfComments: Int?
    
}

let ourAlarm: [Alarm] = [
        Alarm(alarmType: AlarmType.youCommented, questionNum: 3, actionTime: DateComponents(calendar: calendar, year: 2020, month: 7, day: 1, hour: 20, minute: 3), numOfComments: 3),
    Alarm(alarmType: AlarmType.messageReceived, questionNum: 2, actionTime: DateComponents(calendar: calendar,  year: 2020, month: 7, day: 1, hour: 20, minute: 0) , numOfComments: nil),
    Alarm(alarmType: AlarmType.youAnswered, questionNum: 1, actionTime: (ourAnswer[2].youAnswer?.AnsweredTime!)!, numOfComments: nil)]



