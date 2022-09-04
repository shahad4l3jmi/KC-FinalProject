//
//  Home.swift
//  Hasady-Fin
//
//  Created by Shhooda on 04/09/2022.
//

import SwiftUI
//THird View
//min9
struct Home: View {
    
    @StateObject var data = TimerData()
    
    var body: some View {
        ZStack {
            VStack{
                
                Spacer()
                
                ScrollView(.horizontal,showsIndicators: false,content: {
                    
                    //timer Buttons
                    HStack(spacing:20){
                        
                        ForEach(1...8,id: \.self){ index in
                            //multiples 60
                            let time = index * 30
                            
                            Text("\(time)min")
                                .font(.system(size: 30, weight: .heavy))
                                .frame(width: 130, height: 130)
                            //change selected color
                                .background(data.time == time ? Color.pink.opacity(0.5) : Color.green.opacity(0.5))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .shadow(color: .gray, radius: 5)
                                .onTapGesture {
                                    withAnimation {
                                        data.time = time
                                        data.selecctedTime = time
                                    }
                                }
                            
                        }
                    }
                    .padding()
                    
                })
                //setting to center
                .offset( y: 90)
                
                
                
                Spacer()
                
                //start button
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.65 )){
                        data.buttonAnimation.toggle()
                    }
                    //delay
                    //button down
                    withAnimation(Animation.easeIn.delay(0.6)){
                        data.timerViewOffset = 0
                        
                    }
                    
                }, label: {
                    
                    
                        Capsule()
                        .fill(Color.pink.opacity(0.3))
                        .shadow(color: .pink, radius: 5)
                        .frame(width: 100, height: 90)
                        
                    
                    
                })
                .padding(.bottom,100)
                //desable if not selected
                .disabled(data.time == 0)
                .opacity(data.time == 0 ? 0.6 : 1)
                //moving down smooth
                .offset( y: data.buttonAnimation ? 300 : 0)
                
            }
          
            Color.yellow.opacity(0.5)
            //decrease height
                .frame(height: UIScreen.main.bounds.height - data.timerHeightChange)
                .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(.all,edges: .all)
                .overlay(
                
                    Text("\(data.selecctedTime)")
                        .font(.system(size: 55, weight: .heavy))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 10)
                
                )
                .offset( y: data.timerViewOffset)
            
       //Z
               }.frame( maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.1)).ignoresSafeArea(.all,edges: .all)
        //timer func
            .onReceive(Timer.publish(every: 60, on: .main, in: .common).autoconnect(), perform:{ _  in
            
            //condition
                       if data.time != 0{
               //counting Timer
                data.selecctedTime -= 1
                           
                           //height update
                           let ProgressHeight = UIScreen.main.bounds.height / CGFloat(data.time)
                           
                           let diff = data.time - data.selecctedTime
                           withAnimation(.default){
                               data.timerHeightChange = CGFloat(diff) * ProgressHeight
                           }
                
            }
                       
                       
                       
            })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
