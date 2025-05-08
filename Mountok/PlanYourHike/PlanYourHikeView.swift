//
//  ContentView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI

struct SetYourTargetView: View {
    @State private var text: String = ""
    @State private var selectedDate: Date = Date()
    @State private var selectedMountain: Mountain?
    @State private var isShowMountainSheet = false
    @State private var isShowGuidelineSheet = false
    private let calendar = Calendar.current
    
    func getVo2Mountain() -> String {
        guard selectedMountain != nil else {
            return "-"
        }
        
        let vo2Ref: Double = 30.0
        let minHeight: Double = 1500
        let height: Double = Double(selectedMountain!.elevation)
        let subtractHeight = height - minHeight
    
        let result = vo2Ref / 1 - 0.01 * (subtractHeight / 100)
        
        return String(format: "%.1f ml/min/kg", result)
    }
    
    func getWeeks() -> Int {
        let oneMonthAhead = calendar.date(byAdding: .month, value: 1, to: Date())!
        let isMoreThanOneMonthAhead = selectedDate >= oneMonthAhead
        
        // validasi jika user tidak memilih 1 bulan lebih
        if (!isMoreThanOneMonthAhead) {
            return 1
        }
        
        let days = calendar.dateComponents([.day], from: Date(), to: selectedDate).day ?? 0
        // jika user hanya memilih 10 hari, maka dibulatin menjadi 2 minggu
        var weeks = Int(ceil(Double(days) / 7.0))
        
        // jika user memilih esok hari, tetep hitung menjadi 1 minggu
        weeks = max(1, weeks)
        
        return weeks
    }
    
    func getVo2Prediction() -> String {
        let isSameDay = calendar.isDate(selectedDate, inSameDayAs: Date())
        
        // validasi jika user belum memilih tanggal
        guard !isSameDay else {
            return "-"
        }
        
        let weeks = getWeeks()
        let currentVo2 = 30.0
        // VO2Max meningkat 2.5% perminggu ketika melakukan HIT
        let r = 0.025
        let result = currentVo2 * (1 + r * Double(weeks))
        return String(format: "%.1f ml/min/kg", result)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Plan Your Hike")
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
                        Button(selectedMountain == nil ? "Pick a mountain" : selectedMountain!.name ) {
                            self.isShowMountainSheet.toggle()
                        }
                        .buttonStyle(.bordered)
                    }
                    
                    HStack {
                        Text("Mountain VO2Max")
                        Spacer()
                        Text(getVo2Mountain())
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)
                
                VStack(alignment: .leading, spacing: 30) {
                    DatePicker("Date to go", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(.compact)
                    
                    HStack {
                        Text("Prediction of VO2Max")
                        Spacer()
                        Text(getVo2Prediction())
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)
                
                
                Spacer()
                
                VStack{
                    Text("Please consider to read our")
                    Button("Guidelines") {
                        self.isShowGuidelineSheet.toggle()
                    }
                }
                .padding(.bottom)
                .font(.caption)
                
                NavigationLink {
                    DashboardView()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $isShowMountainSheet) {
            NavigationStack {
                MountainListView { mountain in
                    isShowMountainSheet = false
                    selectedMountain = mountain
                }
                .navigationTitle("Indonesian Mountains")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Back") {
                            self.isShowMountainSheet.toggle()
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isShowGuidelineSheet) {
            NavigationStack {
                VStack {
                    Text("""
                        The reccomended duration is 2 months program of physical excercise, We recommend you to adjust your plan

                        We offer 2 months of physical preparation reccomendation which consist of:

                        - 1 Month of Exercise to adapt to cardiovascular change
                        - 1 Month of High Intensity Interval Training to Increase your VO2Max significanly
                        """)
                    
                    Spacer()
                }
                .padding()
                .presentationDetents(.init([.medium]))
                .navigationTitle("Guideline")
                .navigationBarTitleDisplayMode(.inline)
                .presentationDragIndicator(.visible)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Back") {
                            self.isShowGuidelineSheet.toggle()
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    SetYourTargetView()
}
