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

struct MountainListView: View {
    var onSelected: ((Mountain) -> Void)
    let datum: Array<Province> = [
        Province(
            name: "North Sumatra",
            mountains: [
                Mountain(name: "Mount Sinabung", elevation: 2460),
            ]
        ),
        Province(
            name: "West Sumatra",
            mountains: [
                Mountain(name: "Mount Marapi", elevation: 2891),
            ]
        ),
        Province(
            name: "South Sumatra",
            mountains: [
                Mountain(name: "Mount Dempo", elevation: 3173),
            ]
        ),
        Province(
            name: "Aceh",
            mountains: [
                Mountain(name: "Mount Bandahara", elevation: 3030),
                Mountain(name: "Mount Kurik", elevation: 3085),
                Mountain(name: "Mount Mugajah", elevation: 3079),
                Mountain(name: "Mount Burni Telong", elevation: 2600),
                Mountain(name: "Mount Geureudong", elevation: 2885),
                Mountain(name: "Mount Bateekeubeu", elevation: 2756),
                Mountain(name: "Mount Ulumasen", elevation: 2390),
                Mountain(name: "Mount Kembar", elevation: 2245),
                Mountain(name: "Mount Perkison", elevation: 2828),
                Mountain(name: "Mount Peuet Sague", elevation: 2801),
                Mountain(name: "Mount Sembuang", elevation: 2040),
                Mountain(name: "Mount Seulawah Agam", elevation: 1726),
            ]
        ),
        Province(
            name: "East Jawa",
            mountains: [
                Mountain(name: "Mount Bromo", elevation: 2329),
                Mountain(name: "Mount Argopuro", elevation: 3088),
                Mountain(name: "Mount Anjasmoro", elevation: 2277),
                Mountain(name: "Mount Argowayang", elevation: 2162),
                Mountain(name: "Mount Baluran", elevation: 1247),
                Mountain(name: "Mount Berungkal", elevation: 1040),
                Mountain(name: "Mount Batok", elevation: 2440),
            ]
        ),
        Province(
            name: "West Jawa",
            mountains: [
                Mountain(name: "Mount Ciremai", elevation: 3078),
                Mountain(name: "Mount Papandayan", elevation: 2665),
                Mountain(name: "Mount Galunggung", elevation: 2240),
                Mountain(name: "Mount Tangkuban Perahu", elevation: 2084),
                Mountain(name: "Mount Salak", elevation: 2211),
            ]
        ),
        Province(
            name: "Middle Jawa",
            mountains: [
                Mountain(name: "Mount Ungaran", elevation: 2050),
                Mountain(name: "Mount Telomoyo", elevation: 1894),
                Mountain(name: "Mount Andong", elevation: 1726),
                Mountain(name: "Mount Ayamayam", elevation: 1022),
            ]
        ),
        Province(
            name: "Banten",
            mountains: [
                Mountain(name: "Mount Aseupan", elevation: 1174),
            ]
        ),
        Province(
            name: "East Kalimantan",
            mountains: [
                Mountain(name: "Mount Liangpran", elevation: 2240),
            ]
        ),
        Province(
            name: "West Kalimantan",
            mountains: [
                Mountain(name: "Mount Niut", elevation: 1701),
                Mountain(name: "Mount Saran", elevation: 1758),
                Mountain(name: "Mount Berumput", elevation: 1590),
                Mountain(name: "Mount Beturan", elevation: 1577),
                Mountain(name: "Mount Bawang", elevation: 1438),
                Mountain(name: "Mount Berangin", elevation: 1652),
                Mountain(name: "Mount Merdai", elevation: 1410),
                Mountain(name: "Mount Rangga", elevation: 1495),
                Mountain(name: "Mount Batutenobong", elevation: 1594),
                Mountain(name: "Mount Biwa", elevation: 1290),
                Mountain(name: "Mount Sebayan", elevation: 1368),
                Mountain(name: "Mount Ngaras", elevation: 1185),
            ]
        ),
        Province(
            name: "North Sulawesi",
            mountains: [
                Mountain(name: "Mount Soputan", elevation: 1784),
                Mountain(name: "Mount Lokon", elevation: 1580),
                Mountain(name: "Mount Tambora", elevation: 2850),
            ]
        ),

    ]
    
    @State private var searchText = ""
    
    var filteredProvinces: [Province] {
        if searchText.isEmpty {
            return datum
        } else {
            return datum.compactMap { province in
                let filteredMountains = province.mountains.filter {
                    $0.name.localizedCaseInsensitiveContains(searchText)
                }
                return filteredMountains.isEmpty ? nil :
                    Province(name: province.name, mountains: filteredMountains)
            }
        }
    }

    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProvinces, id: \.self.id) { province in
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
            .searchable(text: $searchText, prompt: "Search for a resort")
        }
    }
}

#Preview {
    MountainListView { mountain in
        print(mountain)
    }
}
