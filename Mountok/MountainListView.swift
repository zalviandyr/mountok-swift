//
//  MountainListView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI

struct Mountain: Identifiable {
    let id: UUID = UUID()
    let name: String
    let elevation: Int
}

struct Province: Identifiable {
    let id: UUID = UUID()
    let name: String
    let mountains: Array<Mountain>
}

struct Fruit: Identifiable {
    let id = UUID()
    let name: String
}

struct MountainListView: View {
    var onSelected: ((Mountain) -> Void)
    let datum: Array<Province> = [
        Province(
            name: "West Java",
            mountains: [
                Mountain(name: "Cikuray", elevation: 1300),
            ]
        ),
        Province(
            name: "Central Java",
            mountains: [
                Mountain(name: "Prau", elevation: 2300),
            ]
        ),
    ]
    
    @State private var search = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(datum, id: \.self.id) { province in
                    Section(header: Text(province.name)) {
                        ForEach(province.mountains, id: \.self.id) { mountain in
                            Button {
                                onSelected(mountain)
                            } label: {
                                HStack {
                                    Text(mountain.name)
                                        .font(.headline)
                                    Spacer()
                                    Text("\(mountain.elevation) mdpl")
                                }
                            }
                        }
                    }
                }
            }
            .searchable(text: $search, prompt: "Search for a resort")
        }
    }
}

#Preview {
    MountainListView { mountain in
        print(mountain)
    }
}
