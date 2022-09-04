//
//  ThirdView.swift
//  Hasady-Fin
//
//  Created by Shhooda on 04/09/2022.
//

import SwiftUI
//timer ViewModle
class TimerData: ObservableObject{
    
    @Published var time : Int = 0
    @Published var selecctedTime : Int = 0
    
    //animation properties
    @Published var buttonAnimation = false
    
    //data
    @Published var timerViewOffset: CGFloat = UIScreen.main.bounds.height
    @Published var timerHeightChange : CGFloat = 0
}
