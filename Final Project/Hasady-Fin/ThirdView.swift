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
    
    //ontap..
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive Response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping() ->Void) {
        
        //restes View
        completionHandler()
        
}
    
    func resetView(){
        withAnimation(.default){
            time = 0
            selecctedTime = 0
            timerHeightChange = 0
            timerViewOffset = UIScreen.main.bounds.height
            buttonAnimation = false
    }
    
    }
}
