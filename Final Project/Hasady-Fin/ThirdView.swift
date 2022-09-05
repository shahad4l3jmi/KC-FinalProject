//
//  ThirdView.swift
//  Hasady-Fin
//
//  Created by Shhooda on 04/09/2022.
//

import SwiftUI
import UserNotifications
//timer ViewModle
class TimerData: NSObject,UNUserNotificationCenterDelegate ,ObservableObject{
    
    @Published var time : Int = 0
    @Published var selecctedTime : Int = 0
    
    //animation properties
    @Published var buttonAnimation = false
    
    //data
    @Published var timerViewOffset: CGFloat = UIScreen.main.bounds.height
    @Published var timerHeightChange : CGFloat = 0
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping ( UNNotificationPresentationOptions)->Void) {
        
        //what to do
        completionHandler([.banner,.sound])
        
    }
}
