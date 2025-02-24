//
//  Home.swift
//  Hasady-Fin
//
//  Created by Shhooda on 04/09/2022.
//

import SwiftUI
//THird View
//min9

//sending notification
import UserNotifications
struct Home: View {
    
    @EnvironmentObject var data: TimerData
    
    var body: some View {
        ZStack {
            
            Image("Timer")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding(.bottom,350)
            
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
                .offset( y: 130)
                .opacity(data.buttonAnimation ? 0 : 1)
                
                
                
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
                    preformNotifications()
                }, label: {
                    
                    
                        Image("button")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.7)
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
          
            Color.yellow
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
                           
                           if data.selecctedTime  == 0 {
                           //reset
                               data.resetView()
                
                       
                       }
                       }
            })
            .onAppear(perform:{
                //permission
                UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]){ (_,_) in
                    
                    
                }
                
                //in app not
                UNUserNotificationCenter.current().delegate = data
                
                
            } )
    }
    func preformNotifications(){
        
        let content = UNMutableNotificationContent()
        content.title = "Notification From Hasady🌱"
        content.body = "Time Is Up! You Did A Great Job ,Get A Break!<3"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(data.time), repeats: false)
        
        let request = UNNotificationRequest(identifier: "TIMER", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request){
            (err) in
            if err != nil{
                print(err!.localizedDescription)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
