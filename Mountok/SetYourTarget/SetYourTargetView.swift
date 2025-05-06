//
//  ContentView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI

struct SetYourTargetView: View {
    @State var text: String = ""
    @State private var selectedDate: Date = Date()
    @State private var mountain: Mountain?
    @State private var isShowMountainSheet = false

    let options = ["Apple", "Banana", "Orange", "Strawberry", "Grape", "Pineapple"]
    
    @State private var selectedDetent: PresentationDetent = .height(100)

    
    var body: some View {
        NavigationView {
            VStack {
                Text("Set your target")
                    .font(.title)
                    .padding()
                
                Spacer()
                
                HStack {
                    Text("Current VO2Max")
                    Spacer()
                    Text("30 ml/kg/min")
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 30) {
                    HStack{
                        Text("Mountain")
                        Spacer()
                        Button(mountain == nil ? "Pick a mountain" : mountain!.name ) {
                            isShowMountainSheet = true
                        }
                        .buttonStyle(.bordered)
                    }
                    
                    HStack {
                        Text("Mountain VO2Max")
                        Spacer()
                        Text("30 ml/kg/min")
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)
                
                VStack(alignment: .leading, spacing: 30) {
                    DatePicker("Date to go", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                    
                    HStack {
                        Text("Prediction of VO2Max")
                        Spacer()
                        Text("40 ml/kg/min")
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)
                
                Text("*The date you are choosing is not reccomended, Please refer to Guidelines")
                    .font(.caption)
                    .foregroundStyle(.red)
                    .padding(.top)
                
                
                Spacer()
                
                VStack{
                    Text("Please consider to read our")
                    Button("Guidelines") {
                        
                    }
                }
                .padding(.bottom)
                .font(.caption)
                
                Button("Start") {}
                    .buttonStyle(.bordered)
            }
            .padding()
            .sheet(isPresented: $isShowMountainSheet) {
                MountainListView { selectedMountain in
                    isShowMountainSheet = false
                    mountain = selectedMountain
                }
            }
        }
    }
}

#Preview {
    SetYourTargetView()
}
