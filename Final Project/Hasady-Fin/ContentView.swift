//
//  ContentView.swift
//  Hasady-Fin
//
//  Created by Shhooda on 29/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var hadaf1 = ""
    @State var hadaf2 = ""
    @State var hadaf3 = ""
    @State private var isDone = false
    var body: some View {
        NavigationView{
          
            
        ZStack{
            Image("BG")
                .resizable()
                .ignoresSafeArea()
                .frame(width: 425, height: 960)
                .padding(.bottom,80)
            Image("1")
                .resizable()
                .scaleEffect()
                .frame(width: 100, height: 100)
                .padding(.bottom,200)
                .padding(.leading,100)
                
            Image("2")
                .resizable()
                .scaleEffect()
                .frame(width: 100, height: 100)
                .padding(.bottom,690)
                .padding(.leading,250)
            
            Image("4")
                .resizable()
                .scaleEffect()
                .frame(width: 100, height: 100)
                .padding(.bottom,500)
                .padding(.trailing,250)
            VStack{
                Text("حديقة الأحلام")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top,60)
                Spacer()
                
                
                HStack {
                    
                   
                        
                       NavigationLink(destination: SecondView() ){ Image(systemName: "calendar")}
                       .font(.system(size: 50))
                       .foregroundColor(.white)
                       .padding(.bottom,190)
                        
                
                    Spacer()
                        
                      NavigationLink(destination: Home()){ Image(systemName: "stopwatch.fill")}
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .padding(.bottom,190)
                    
                }.frame(width: 400, height: 00)
                        .padding(.top,260)
                    
                
                    
                Text("أهدافي")
                    .font(.title)
                    .foregroundColor(.gray)
                    .bold()
                    .padding(.top,20)
                
                
                ScrollView{
                MyHadaf(Mine: $hadaf1)
                MyHadaf(Mine: $hadaf2)
                MyHadaf(Mine: $hadaf3)
                    
                
                }.frame(width: 900, height: 200)
                
    Text("( من جد وجد و من زرع حصد \nومن سار على الدرب وصل 🌱  )")
                     
                    .font(.title2)
                    //.shadow(color: .black, radius: 5)
                    .foregroundColor(.white)
                    .bold()
                    .padding(30)
                    .shadow(color: .black, radius: 5)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(20)
                    Spacer()
                
            
        }
    }
}
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyHadaf: View {
    @Binding var Mine : String
    @State var hadaf1 = ""
    @State private var isDone = false
    
    var body: some View {
        HStack {
            
            TextField("ما هو هدفك ؟\t\t",text: $Mine )
                .font(.title)
                .opacity(isDone ? 1.0 : 0.5)
                .frame(width: 200, height: 00)
                .padding()
            Image(systemName: isDone ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 40))
                .foregroundColor(.yellow)
                .padding()
                .onTapGesture {
                    withAnimation(.easeIn(duration: 1.0)){
                        isDone.toggle()
                        
                    }
                }
        }
    }
}
