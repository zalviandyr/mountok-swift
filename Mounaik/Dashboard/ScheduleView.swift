//
//  ScheduleView.swift
//  Mountok
//
//  Created by Fariz Ajy Putra on 08/05/25.
//

import SwiftUI
// untuk date ikuti format dari en_US_POSIX
struct Exercise: Identifiable{
    let id: UUID = UUID()
    let date: String
    let name: String
    let description: String
    let time: String
}

struct Week: Identifiable {
    let id: UUID = UUID()
    let week: String
    let exercises: Array<Exercise>
}

var todayString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM yyyy"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter.string(from: Date())
}

func getTodayString() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "d MMM yyyy"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter.string(from: Date())
}


struct ScheduleView: View {
    let datum: Array<Week> = [
        Week(
            week: "Week 1",
            exercises: [
                Exercise(
                    date: "06 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "07 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "08 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "09 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "10 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "11 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "12 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute")
            ]
        ),
        
        Week(
            week: "Week 2",
            exercises: [
                Exercise(
                    date: "06 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "07 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "08 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "09 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "10 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "11 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute"),
                Exercise(
                    date: "12 May 2025",
                    name: "Jogging",
                    description: "Jogging berjalan",
                    time: "10 minute")
            ]
        ),

        
    ]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(datum , id: \.self.id){ week in
                    Section(header: Text(week.week)){
                        ForEach(week.exercises, id: \.self.id ){ exercise in
                            HStack {
                                Image(systemName: "figure.run")
                                    .resizable()
                                    .frame(width: 15, height: 20)
                                    .padding(.trailing, 5)
                                
                                VStack(alignment: .leading){
                                    Text(exercise.date)
                                        .font(.headline)
                                    
                                    Text("\(exercise.name) - \(exercise.time)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                if exercise.date == todayString {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.green)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Exercise Schedule")
        }
    }
}

#Preview {
    ScheduleView()
}
