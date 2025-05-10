//
//  MountainListView.swift
//  Mountok
//
//  Created by Zukron Alviandy on 06/05/25.
//

import SwiftUI

struct MountainListView: View {
    var onSelected: ((Mountain) -> Void)
    let datum: Array<Province> = [
        Province(
            name: "North Sumatra",
            mountains: [
                Mountain(name: "Mt. Sinabung", elevation: 2460),
                Mountain(name: "Mt. Sibayak", elevation: 2212),
                Mountain(name: "Mt. Imun", elevation: 1505),
                Mountain(name: "Mt. Sibualbuali", elevation: 1819),
            ]
        ),
        Province(
            name: "West Sumatra",
            mountains: [
                Mountain(name: "Mt. Marapi", elevation: 2891),
                Mountain(name: "Mt. Talang", elevation: 2597),
                Mountain(name: "Mt. Tandikat", elevation: 2438),
                Mountain(name: "Mt. Sago", elevation: 2262),
            ]
        ),
        Province(
            name: "Aceh",
            mountains: [
                Mountain(name: "Mt. Burni Telong", elevation: 2600),
                Mountain(name: "Mt. Geureudong", elevation: 2885),
                Mountain(name: "Mt. Bateekeubeu", elevation: 2756),
                Mountain(name: "Mt. Ulumasen", elevation: 2390),
                Mountain(name: "Mt. Kembar", elevation: 2245),
                Mountain(name: "Mt. Perkison", elevation: 2828),
                Mountain(name: "Mt. Peuet Sague", elevation: 2801),
                Mountain(name: "Mt. Sembuang", elevation: 2040),
                Mountain(name: "Mt. Seulawah Agam", elevation: 1726),
                Mountain(name: "Mt. Abong-Abong", elevation: 2985),
            ]
        ),
        Province(
            name: "East Java",
            mountains: [
                Mountain(name: "Mt. Bromo", elevation: 2329),
                Mountain(name: "Mt. Anjasmoro", elevation: 2277),
                Mountain(name: "Mt. Argowayang", elevation: 2162),
                Mountain(name: "Mt. Baluran", elevation: 1247),
                Mountain(name: "Mt. Berungkal", elevation: 1040),
                Mountain(name: "Mt. Batok", elevation: 2440),
            ]
        ),
        Province(
            name: "West Java",
            mountains: [
                Mountain(name: "Mt. Gede", elevation: 2958),
                Mountain(name: "Mt. Malabar", elevation: 2329),
                Mountain(name: "Mt. Papandayan", elevation: 2665),
                Mountain(name: "Mt. Galunggung", elevation: 2240),
                Mountain(name: "Mt. Tangkuban Perahu", elevation: 2084),
                Mountain(name: "Mt. Salak", elevation: 2211),
                Mountain(name: "Mt. Cikuray", elevation: 2821),
                Mountain(name: "Mt. Kendang", elevation: 2617),
                Mountain(name: "Mt. Puntang", elevation: 2223),
                Mountain(name: "Mt. Patuha", elevation: 2440),
                Mountain(name: "Mt. Puncak Besar", elevation: 2341),
            ]
        ),
        Province(
            name: "Bengkulu",
            mountains: [
                Mountain(name: "Mt. Patah", elevation: 2852),
            ]
        ),
        Province(
            name: "Central Java",
            mountains: [
                Mountain(name: "Mt. Ungaran", elevation: 2050),
                Mountain(name: "Mt. Telomoyo", elevation: 1894),
                Mountain(name: "Mt. Andong", elevation: 1726),
                Mountain(name: "Mt. Ayamayam", elevation: 1022),
                Mountain(name: "Mt. Muria", elevation: 1602),
                Mountain(name: "Mt. Prau", elevation: 2565),
            ]
        ),
        Province(
            name: "Banten",
            mountains: [
                Mountain(name: "Mt. Aseupan", elevation: 1174),
                Mountain(name: "Mt. Pulosari", elevation: 1346),
                Mountain(name: "Mt. Karang", elevation: 1778),
            ]
        ),
        Province(
            name: "East Borneo",
            mountains: [
                Mountain(name: "Mt. Liangpran", elevation: 2240),
            ]
        ),
        Province(
            name: "West Borneo",
            mountains: [
                Mountain(name: "Mt. Niut", elevation: 1701),
                Mountain(name: "Mt. Saran", elevation: 1758),
                Mountain(name: "Mt. Berumput", elevation: 1590),
                Mountain(name: "Mt. Bawang", elevation: 1438),
                Mountain(name: "Mt. Berangin", elevation: 1652),
                Mountain(name: "Mt. Merdai", elevation: 1410),
                Mountain(name: "Mt. Batutenobong", elevation: 1594),
                Mountain(name: "Mt. Biwa", elevation: 1290),
                Mountain(name: "Mt. Sebayan", elevation: 1368),
            ]
        ),
        Province(
            name: "North Sulawesi",
            mountains: [
                Mountain(name: "Mt. Soputan", elevation: 1784),
                Mountain(name: "Mt. Lokon", elevation: 1580),
                Mountain(name: "Mt. Klabat", elevation: 1995),
            ]
        ),
        Province(
            name: "Central Sulawesi",
            mountains: [
                Mountain(name: "Mt. Torompupu", elevation: 2479),
                Mountain(name: "Mt. Nokilalaki", elevation: 2355),
                Mountain(name: "Mt. Gawalise", elevation: 2200),
                Mountain(name: "Mt. Torenali", elevation: 2507),
                Mountain(name: "Mt. Bitea", elevation: 2240),
                Mountain(name: "Mt. Pompangeo", elevation: 2590),
                Mountain(name: "Mt. Tambusisi", elevation: 2390),
            ]
        ),
        Province(
            name: "Southeast Sulawesi",
            mountains: [
                Mountain(name: "Mt. Mekongga", elevation: 2620),
                Mountain(name: "Mt. Osu Nondoto", elevation: 2421),
                Mountain(name: "Mt. Porema", elevation: 2242),
                Mountain(name: "Mt. Mopeaanooleo", elevation: 2223),
                Mountain(name: "Mt. Batubulawan", elevation: 1970),
                Mountain(name: "Mt. Gambuta", elevation: 1954),
                Mountain(name: "Mt. Poniki", elevation: 1817),
                Mountain(name: "Mt. Paupau", elevation: 1815),
                Mountain(name: "Mt. Moayat", elevation: 1780),
                Mountain(name: "Mt. Sinandaka", elevation: 1770),
                Mountain(name: "Mt. Kabila", elevation: 1732),
                Mountain(name: "Mt. Ambang", elevation: 1689),
                Mountain(name: "Mt. Simbalang", elevation: 1521),
                Mountain(name: "Mt. Bumbungon", elevation: 1420),
                Mountain(name: "Mt. Bilohulangan", elevation: 1420),
                Mountain(name: "Mt. Ulutelagomoat", elevation: 1370),
                Mountain(name: "Mt. Kapoya", elevation: 1112),
            ]
        ),
        Province(
            name: "South Sulawesi",
            mountains: [
                Mountain(name: "Mt. Lompobattang", elevation: 2874),
                Mountain(name: "Mt. Bawakaraeng", elevation: 2845),
                Mountain(name: "Mt. Bulu Baria", elevation: 2730),
                Mountain(name: "Mt. Karua", elevation: 2670),
                Mountain(name: "Mt. BuluSaraung", elevation: 1353),
            ]
        ),
        Province(
            name: "West Sulawesi",
            mountains: [
                Mountain(name: "Mt. Pelatang", elevation: 2925),
                Mountain(name: "Mt. Mambuliling", elevation: 2843),
                Mountain(name: "Mt. Tonggo", elevation: 2710),
                Mountain(name: "Mt. Tapeanlima", elevation: 2670),
            ]
        ),
        Province(
            name: "Bali",
            mountains: [
                Mountain(name: "Mt. Abang", elevation: 2151),
                Mountain(name: "Mt. Adeng", elevation: 1826),
                Mountain(name: "Mt. Batukaru", elevation: 2276),
                Mountain(name: "Mt. Batur", elevation: 1717),
                Mountain(name: "Mt. Catur", elevation: 2096),
                Mountain(name: "Mt. Lesong", elevation: 1865),
                Mountain(name: "Mt. Lempuyang", elevation: 1058),
                Mountain(name: "Mt. Pohon", elevation: 2063),
                Mountain(name: "Mt. Sengayang", elevation: 2087),
                Mountain(name: "Mt. Merbuk", elevation: 1359),
            ]
        ),
        Province(
            name: "West Nusa Tenggara",
            mountains: [
                Mountain(name: "Mt. Tambora", elevation: 2850),
                Mountain(name: "Mt. Doro Peti", elevation: 2150),
            ]
        ),
        Province(
            name: "East Nusa Tenggara",
            mountains: [
                Mountain(name: "Mt. Egon", elevation: 1703),
                Mountain(name: "Mt. Lewotobi", elevation: 1584),
                Mountain(name: "Mt. Inerie", elevation: 2245),
                Mountain(name: "Mt. Mutis", elevation: 2427),
            ]
        ),
        Province(
            name: "Maluku",
            mountains: [
                Mountain(name: "Mt. Gamalama", elevation: 1715),
                Mountain(name: "Mt. Dukono", elevation: 1335),
                Mountain(name: "Mt. Ibu", elevation: 1325),
                Mountain(name: "Mt. Gamkonora", elevation: 1635),
            ]
        ),
        Province(
            name: "West Papua",
            mountains: [
                Mountain(name: "Mt. Umsini", elevation: 2950),
                Mountain(name: "Mt. Wasada", elevation: 1070),
            ]
        ),
        Province(
            name: "Papua",
            mountains: [
                Mountain(name: "Mt. Foja", elevation: 2193),
                Mountain(name: "Mt. Angemuk", elevation: 2949),
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
        NavigationStack {
            List {
                ForEach(filteredProvinces, id: \.self.name) { province in
                    Section(header: Text(province.name)) {
                        ForEach(province.mountains, id: \.self.name) { mountain in
                            Button {
                                onSelected(mountain)
                            } label: {
                                HStack {
                                    Text(mountain.name)
                                        .font(.headline)
                                    Spacer()
                                    Text("\(mountain.elevation) mdpl")
                                }
                                .foregroundStyle(.black)
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
