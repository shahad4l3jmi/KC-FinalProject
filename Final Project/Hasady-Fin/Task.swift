//
//  Task.swift
//  Hasady-Fin
//
//  Created by Shhooda on 03/09/2022.
//

import SwiftUI

//Task Modle /Sample Task...
//tasl array
struct Task:Identifiable{
    var id=UUID().uuidString
    var title:String
    var time: Date = Date()
}
//total tasks
struct TaskMetaData:Identifiable{
    var id=UUID().uuidString
    var task:[Task]
    var taskDate: Date
}
//sample task
func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var tasks: [TaskMetaData] = [
    TaskMetaData(task:
    [
    Task(title: "مراجعة بعض الدروس"),
    Task(title: "ممارسة الرياضة💪🏼"),
    Task(title: "أنام بدريي!!")
    ], taskDate: getSampleDate (offset: 3)),
    TaskMetaData(task: [
        
    Task(title: "لازم آسلم ٬مشروع التخرج!🤩")
    ],
    taskDate: getSampleDate(offset: 1)),
    
    TaskMetaData(task: [
        
    Task(title: "🏃🏻‍♀️طلعة سريعة")
    ],
    taskDate: getSampleDate(offset: -3)),
    
    TaskMetaData(task: [
    Task(title: "أتعلم الطبخ")
    ],
    taskDate: getSampleDate (offset: -8)),
    TaskMetaData(task: [
        
        Task(title: "أرتب الغرفة🧹")
        ], taskDate: getSampleDate(offset: 10)),
        TaskMetaData(task: [
            
            Task(title: "حفل التخرج!!🎓")
            ], taskDate: getSampleDate (offset: 11)),
            
        
        
                        
        
]
