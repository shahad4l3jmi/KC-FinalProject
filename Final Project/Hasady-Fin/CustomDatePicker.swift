//
//  CustomDatePicker.swift
//  Hasady-Fin
//
//  Created by Shhooda on 02/09/2022.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Binding var currentDate : Date
    
    //month update
    @State var currentMonth: Int = 0
    
    var body: some View {
        
        
        VStack(spacing:35){
            //Days...
            let Days : [String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            
            HStack(spacing:20){
                
                VStack(alignment: .leading , spacing: 10){
                    
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraDate()[0])
                        .font(.title.bold())
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
                    Text("\(value.day)")
                        .font(.title3.bold())
                }
            }
            
        }
        .onChange(of: currentMonth){newValue in
            //UpdateMonth
            currentDate = getCurrenttMonth()
            
        }
    }
    
    //display year and month
    func extraDate()->[String]{
//STOP POINT⚠️
        let fotmatter = DateFormatter()
        Formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(From:currentDate)
        
        return date.components(separatedBy: "  ")
    }
    
    
    func getCurrenttMonth()->Date{
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
            
            let Days = currentMonth.getAllDates().compactMap{date -> DateValue
                in
            //getting day...
                let day = calender.component(.day, from: date)
                 
                return DateValue(day: day, date: date)
                
            }
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
        
        var range = calender.range(of: .day, in: .month, for: startDate)!
        range.removeLast()
        //gettingdate
        return range.compactMap{ day -> Date in
            return calender.date(byAdding: .day,value: day == 1 ? 0:day ,to:startDate )!
        }
        
    }
}
