//
//  NextActivityVIew.swift
//  Monaik
//
//  Created by Zukron Alviandy on 10/05/25.
//

import SwiftUI

struct NextActivityView: View {
    var exerciseDate1: ExerciseDate?
    var exerciseDate2: ExerciseDate?
    var exerciseDate3: ExerciseDate?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Next Activity")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 10) {
                if exerciseDate1 != nil {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(exerciseDate1!.exercise.name)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        
                        if exerciseDate1!.exercise.duration != nil {
                            HStack(spacing: 5) {
                                Image(systemName: "timer")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                
                                Text((exerciseDate1?.exercise.duration)!)
                                    .font(.caption2)
                            }
                        }
                        
                        HStack(alignment: .bottom) {
                            Text("Tomorrow")
                                .font(.footnote)
                            
                            Spacer()
                            
                            Image("Icons/Cycling")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .padding(.all, 10)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 1)
                }
                
                VStack(spacing: 10) {
                    if exerciseDate2 != nil {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(exerciseDate2!.exercise.name)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Text(exerciseDate2!.date.toLongDateString)
                                .font(.caption2)
                        }
                        .padding(.all, 5)
                        .padding(.horizontal, 6)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                    }
                    
                    if exerciseDate3 != nil {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(exerciseDate3!.exercise.name)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Text(exerciseDate3!.date.toLongDateString)
                                .font(.caption2)
                        }
                        .padding(.all, 5)
                        .padding(.horizontal, 6)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                    }
                }
            }
            .frame(height: 120)
        }
    }
}

#Preview {
    NextActivityView(
        exerciseDate1: ExerciseDate(date: Date(), exercise: .enjoying),
        exerciseDate2: ExerciseDate(date: Date(), exercise: .briskWalking),
        exerciseDate3: ExerciseDate(date: Date(), exercise: .shortHiit)
    )
}
