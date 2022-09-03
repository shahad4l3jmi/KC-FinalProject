//
//  CustomDatePicker.swift
//  Hasady-Fin
//
//  Created by Shhooda on 02/09/2022.
//

import SwiftUI

struct CustomDatePicker2: View {
    
    @Binding var currentDate : Date
    
    //month update
    @State var currentMonth: Int = 0
    
    var body: some View {
        
        
        VStack(spacing:35){
            //Days...
            let Days : [String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            
            HStack(spacing:20){
                
                VStack(alignment: .leading , spacing: 10){
                    
                   // Text(extraDate()[0])
                      //  .font(.caption)
                    //   .fontWeight(.semibold)
                    
                    Text(extraDate()[0])
                        .font(.title.bold())
                        .padding(.top)
                }
                Spacer(minLength: 0)
                    
                Button{
                    withAnimation{
                        currentMonth -= 1}
                    
                } label:{
                    Image(systemName: "chevron.left")
                        .font(.title2)
                    
                }
                
                Button{
                    withAnimation{
                        currentMonth -= 1}
                    
                } label:{
                    Image(systemName: "chevron.right")
                        .font(.title2)
                    
                }
            }.padding(.horizontal)
            
            //DayView
            HStack(spacing:0){
                
                ForEach(Days,id:\.self){
                    Day in
                    Text(Day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            //Dates
            //LazyGrid..
            
            let columens = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columens, spacing: 15){
                ForEach(extractDate()){
                    value in
                    
                    CardView(value: value)
                        .background(
                        Capsule()
                            .fill(.green.opacity(0.7))
                            .padding(.horizontal,8)
                            .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
            
            VStack(spacing: 15){
                Text("Tasks")
                    .font(.title2.bold())
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding(.vertical,20)
                
                if let task = tasks.first(where:{ task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                    
                }){
                    
                    ForEach(task.task){task in
                        VStack(alignment: .leading, spacing: 10){
                            
                            //for custom time...
                            Text(task.time.addingTimeInterval(CGFloat
                                .random(in: 0...5000)),style: .time)
                            
                            Text(task.title)
                                .font(.title2.bold())
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity,alignment:.leading)
                        .background(
                            Color.pink
                                .opacity(0.3)
                                .cornerRadius(20)
                        )
                        
                    }
                    
                }
                else{
                    Text("No Task Found")
                        .foregroundColor(.gray)
                    
                }
            }
            .padding()
            
        }
        .onChange(of: currentMonth){newValue in
            //UpdateMonth
            currentDate = getCurrenttMonth()
            
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue)->some View{
        
        VStack{
            if value.day != -1{
             
                if let task = tasks.first(where: {task in
                    
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white:.primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : (.pink))
                        .frame(width: 8, height: 8)
                    
                } else{
                        Text("\(value.day)")
                            .font(.title3.bold())
                            .foregroundColor(isSameDay(date1: value.date , date2: currentDate) ? .white : .primary)
                            .frame(maxWidth: .infinity)
                        Spacer()
                    }
                }
        }
        .padding(.vertical,8)
        .frame(height: 60,alignment: .top)
        
    }
        //checkDate
        func isSameDay(date1:Date,date2:Date)->Bool{
            let calender = Calendar.current
            
            return calender.isDate(date1, inSameDayAs: date2 )
        }
    
    //display year and month
    func extraDate()->[String]{
//STOP POINT⚠️
        let fotmatter = DateFormatter()
        fotmatter.dateFormat = "MMMM YYYY"
        let date = fotmatter.string(from: currentDate)
        
        return date.components(separatedBy: "  ")
    }
    
    
    func getCurrenttMonth()->Date{
        let calender = Calendar.current

        //getting current date month
     
        guard let currentMonth = calender.date(byAdding: .month,value: self.currentMonth, to: Date()) else{
            return Date()
        }
        return currentMonth
        
    }
        
        func extractDate()->[DateValue]{
            
            let calender = Calendar.current
            
            //getting current date month
              let currentMonth = getCurrenttMonth()
            
            var days = currentMonth.getAllDates().compactMap{date -> DateValue in
            //getting day...
                let day = calender.component(.day, from: date)
                 
                return DateValue(day: day, date: date)
                
            }
            let firstWeekday = calender.component(.weekday, from: days.first?.date ?? Date())
            
            for _ in 0..<firstWeekday - 1{
                days.insert(DateValue(day: -1, date: Date()), at: 0)
            }
            return days
        }
    }


struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

//Extend Date
extension Date {
    
    func getAllDates()->[Date]{
        
        let calender = Calendar.current
        
        //StartDate
        let startDate = calender.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        
        let range = calender.range(of: .day, in: .month, for: startDate)!
       
        //gettingdate
        return range.compactMap{ day -> Date in
            return calender.date(byAdding: .day,value: day - 1 ,to: startDate )!
        }
        
    }
}
