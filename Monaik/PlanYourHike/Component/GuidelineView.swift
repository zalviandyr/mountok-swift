//
//  GuidelineView.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import SwiftUI

struct GuidelineView: View {
    @State private var isShowGuidelineSheet = false
    
    var body: some View {
        VStack{
            Text("Please consider to read our")
            Button("Guidelines") {
                self.isShowGuidelineSheet.toggle()
            }
        }
        .font(.caption)
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
    GuidelineView()
}
