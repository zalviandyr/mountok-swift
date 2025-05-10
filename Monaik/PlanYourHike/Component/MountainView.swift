//
//  MountainView.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import SwiftUI

struct MountainView: View {
    @Binding var isShowMountainError: Bool
    @Binding var selectedMountain: Mountain?
    @Binding var mountainVo2: Double
    
    @State private var isShowMountainSheet: Bool = false
    
    func getVo2Mountain() -> Double {
        guard selectedMountain != nil else {
            return 0
        }
        
        let vo2Ref: Double = 30.0
        let minHeight: Double = 1500
        let height: Double = Double(selectedMountain!.elevation)
        let subtractHeight = height - minHeight
        
        let decrease = 1 - 0.01 * (subtractHeight / 100)
        let result = vo2Ref / decrease
        
        // factor medan sebesar 20%
        let factor: Double = 0.2
        let resultFactor: Double = result * factor
        return result + resultFactor
    }
    
    func getFormattedVo2() -> String {
        var label = "-"
        
        if mountainVo2 > 0 {
            label = String(format: "%.1f ml/min/kg", mountainVo2)
        }
        
        return label
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Mountain")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            
            Text("The list of mountain is limited to mountain that are less then 3000 mdpl and located in indonesia only")
                .font(.footnote)
            
            VStack(alignment: .leading, spacing: 10) {
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
                    
                    Text(getFormattedVo2())
                }
                .padding(.top, 5)
                
                if isShowMountainError {
                    Text("Please select a mountain")
                        .font(.caption)
                        .foregroundStyle(.red)
                }
            }
            .padding()
            .background(.white)
            .cornerRadius(12)
        }
        .sheet(isPresented: $isShowMountainSheet) {
            NavigationStack {
                MountainListView { mountain in
                    isShowMountainSheet = false
                    isShowMountainError = false
                    
                    selectedMountain = mountain
                    mountainVo2 = getVo2Mountain()
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
    }
}

#Preview {
    @Previewable @State var selectedMountain: Mountain? = nil
    @Previewable @State var mountainVo2: Double = 0
    @Previewable @State var isShowMountainError: Bool = false
    
    MountainView(
        isShowMountainError: $isShowMountainError,
        selectedMountain: $selectedMountain,
        mountainVo2: $mountainVo2
    )
}
