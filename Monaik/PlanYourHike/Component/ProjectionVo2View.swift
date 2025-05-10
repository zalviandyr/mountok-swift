//
//  ProjectionVo2View.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import SwiftUI

struct ProjectionVo2View: View {
    @Binding var isShowProjectionError: Bool
    @Binding var selectedDate: Date
    @Binding var projectionVo2: Double
    
    private let calendar = Calendar.current
    
    // convert selected date to week
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
    
    func getVo2Prediction() -> Double {
        let isSameDay = calendar.isDate(selectedDate, inSameDayAs: Date())
        
        // validasi jika user belum memilih tanggal
        guard !isSameDay else {
            return 0
        }
        
        let weeks = getWeeks()
        let currentVo2 = 30.0
        // VO2Max meningkat 2.5% perminggu ketika melakukan HIT
        let r = 0.025
        let result = currentVo2 * (1 + r * Double(weeks))
        return result
    }
    
    func getFormattedLabel() -> String {
        var label = "-"
        
        if projectionVo2 > 0 {
            label = projectionVo2.toFormattedVo2
        }
        
        return label
    }
    
    var duration: Text {
        Text("2 months")
            .fontWeight(.bold)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Date")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            
            Text("Recommended training duration at least \(duration), but adjustable based on your goals")
                .font(.footnote)
            
            VStack(alignment: .leading, spacing: 10) {
                DatePicker("Date to go", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .onChange(of: selectedDate, { oldValue, newValue in
                        isShowProjectionError = false
                        
                        projectionVo2 = getVo2Prediction()
                    })
                
                HStack {
                    Text("VO2Max Projection")
                    Spacer()
                    Text(getFormattedLabel())
                }
                .padding(.top, 10)
                
                if isShowProjectionError {
                    Text("Please select a date to go")
                        .font(.caption)
                        .foregroundStyle(.red)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
        }
    }
}

#Preview {
    @Previewable @State var isShowProjectionError = false
    @Previewable @State var selectedDate = Date()
    @Previewable @State var projectionVo2 = 0.0
    
    ProjectionVo2View(
        isShowProjectionError: $isShowProjectionError,
        selectedDate: $selectedDate,
        projectionVo2: $projectionVo2
    )
}
