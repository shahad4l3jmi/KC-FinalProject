//
//  ContentView.swift
//  Hasady-Fin
//
//  Created by Shhooda on 29/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("BG")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("حديقة الأحلام")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                Text("أهدافي")
                    .font(.title)
                    .foregroundColor(.gray)
                    .bold()
                    .padding(.top,80)
                Spacer()
                
                //Text("من جد وجد ومن زرع حصد ومن سار على الدرب وصل")
                 ///   .font(.title2)
                  //  .foregroundColor(.gray)
//.bold()////
                  //  .padding(.top,250)
                //
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
