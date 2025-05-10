//
//  ExerciseTabView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 08/05/25.
//

import SwiftUI
import SwiftData

struct ExerciseTabView: View {
    @Binding var path: NavigationPath
    
    @Query var persons: [PersonModel]
    
    private var person: PersonModel {
        persons.first ?? PersonModel.empty()
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // alert
                if person.targetVo2 < person.mountainVo2 {
                    AlertChangePlanView(person: person)
                        .padding(.bottom, 10)
                }
                
                CurrentView(person: person)
                    .padding(.bottom, 10)
                
                // today activity
                TodayActivityView()
                    .padding(.bottom, 10)
                
                // next activity
                NextActivityView()
                
                Divider()
                    .padding(.vertical, 20)
                    .padding(.horizontal, -2)
                
                Text("You can change your target by hit the button below, to change the Mountain or Depart Date.")
                    .font(.caption)
                
                Button {
                    path.append(AppScreen.plan)
                } label: {
                    Text("Change your plan")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.red)
                .padding(.top)
                .padding(.bottom)
            }
            .padding()
        }
        .background(Color("Colors/BgScreen"))
    }
}

#Preview {
    @Previewable @State var path: NavigationPath = .init()

    ExerciseTabView(
        path: $path
    )
}
