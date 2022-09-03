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
                CustomDatePicker2(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        //safe area view
        .safeAreaInset(edge: .bottom){
            
            HStack{
                
                Button{
                    
                }label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth:.infinity)
                        .background(Color.green.opacity(0.7) ,in:Capsule())
                        .foregroundColor(.white)
                }
                Button{
                    
                }label: {
                    Text("Add Reminder")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth:.infinity)
                        .background(Color.green.opacity(0.7) ,in:Capsule())
                        .foregroundColor(.white)
                }
            }.padding(.horizontal)
                .padding(.top,10)
                
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
