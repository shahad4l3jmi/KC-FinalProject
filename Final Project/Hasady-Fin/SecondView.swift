//
//  SecondView.swift
//  Hasady-Fin
//
//  Created by Shhooda on 02/09/2022.
//

import SwiftUI

struct SecondView: View {
    
    @State var currentDate : Date = Date()
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing:20){
                 // Custom Date
                CustomDatePicker(currentDate: $currentDate)
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
