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
                Mountain(name: "Mount Sinabung", elevation: 2460),
                Mountain(name: "Mount Sibayak", elevation: 2212),
                Mountain(name: "Mount Imun", elevation: 1505),
                Mountain(name: "Mount Sibualbuali", elevation: 1819),
            ]
        ),
        Province(
            name: "West Sumatra",
            mountains: [
                Mountain(name: "Mount Marapi", elevation: 2891),
                Mountain(name: "Mount Talang", elevation: 2597),
                Mountain(name: "Mount Tandikat", elevation: 2438),
                Mountain(name: "Mount Sago", elevation: 2262),
            ]
        ),
        Province(
            name: "Aceh",
            mountains: [
                Mountain(name: "Mount Burni Telong", elevation: 2600),
                Mountain(name: "Mount Geureudong", elevation: 2885),
                Mountain(name: "Mount Bateekeubeu", elevation: 2756),
                Mountain(name: "Mount Ulumasen", elevation: 2390),
                Mountain(name: "Mount Kembar", elevation: 2245),
                Mountain(name: "Mount Perkison", elevation: 2828),
                Mountain(name: "Mount Peuet Sague", elevation: 2801),
                Mountain(name: "Mount Sembuang", elevation: 2040),
                Mountain(name: "Mount Seulawah Agam", elevation: 1726),
                Mountain(name: "Mount Abong-Abong", elevation: 2985),
            ]
        ),
        Province(
            name: "East Jawa",
            mountains: [
                Mountain(name: "Mount Bromo", elevation: 2329),
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
                Mountain(name: "Mount Gede", elevation: 2958),
                Mountain(name: "Mount Malabar", elevation: 2329),
                Mountain(name: "Mount Papandayan", elevation: 2665),
                Mountain(name: "Mount Galunggung", elevation: 2240),
                Mountain(name: "Mount Tangkuban Perahu", elevation: 2084),
                Mountain(name: "Mount Salak", elevation: 2211),
                Mountain(name: "Mount Cikuray", elevation: 2821),
                Mountain(name: "Mount Kendang", elevation: 2617),
                Mountain(name: "Mount Puntang", elevation: 2223),
                Mountain(name: "Mount Patuha", elevation: 2440),
                Mountain(name: "Mount Puncak Besar", elevation: 2341),
            ]
        ),
        Province(
            name: "Bengkulu",
            mountains: [
                Mountain(name: "Mount Patah", elevation: 2852),
            ]
        ),
        Province(
            name: "Middle Jawa",
            mountains: [
                Mountain(name: "Mount Ungaran", elevation: 2050),
                Mountain(name: "Mount Telomoyo", elevation: 1894),
                Mountain(name: "Mount Andong", elevation: 1726),
                Mountain(name: "Mount Ayamayam", elevation: 1022),
                Mountain(name: "Mount Muria", elevation: 1602),
                Mountain(name: "Mount Prau", elevation: 2565),
            ]
        ),
        Province(
            name: "Banten",
            mountains: [
                Mountain(name: "Mount Aseupan", elevation: 1174),
                Mountain(name: "Mount Pulosari", elevation: 1346),
                Mountain(name: "Mount Karang", elevation: 1778),
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
                Mountain(name: "Mount Klabat", elevation: 1995),
            ]
        ),
        Province(
            name: "Central Sulawesi",
            mountains: [
                Mountain(name: "Mount Torompupu", elevation: 2479),
                Mountain(name: "Mount Nokilalaki", elevation: 2355),
                Mountain(name: "Mount Gawalise", elevation: 2200),
                Mountain(name: "Mount Indoro", elevation: 2513),
                Mountain(name: "Mount Torenali", elevation: 2507),
                Mountain(name: "Mount Bitea", elevation: 2240),
                Mountain(name: "Mount Pompangeo", elevation: 2590),
                Mountain(name: "Mount Tambusisi", elevation: 2390),
            ]
        ),
        Province(
            name: "Southeast Sulawesi",
            mountains: [
                Mountain(name: "Mount Mekongga", elevation: 2620),
                Mountain(name: "Mount Osu Nondoto", elevation: 2421),
                Mountain(name: "Mount Porema", elevation: 2242),
                Mountain(name: "Mount Mopeaanooleo", elevation: 2223),
                Mountain(name: "Mount Batubulawan", elevation: 1970),
                Mountain(name: "Mount Gambuta", elevation: 1954),
                Mountain(name: "Mount Poniki", elevation: 1817),
                Mountain(name: "Mount Paupau", elevation: 1815),
                Mountain(name: "Mount Moayat", elevation: 1780),
                Mountain(name: "Mount Sinandaka", elevation: 1770),
                Mountain(name: "Mount Kabila", elevation: 1732),
                Mountain(name: "Mount Ambang", elevation: 1689),
                Mountain(name: "Mount Limibut", elevation: 1568),
                Mountain(name: "Mount Simbalang", elevation: 1521),
                Mountain(name: "Mount Bumbungon I", elevation: 1496),
                Mountain(name: "Mount Osiusing", elevation: 1461),
                Mountain(name: "Mount Bumbungon", elevation: 1420),
                Mountain(name: "Mount Bilohulangan", elevation: 1420),
                Mountain(name: "Mount Ulutelagomoat", elevation: 1370),
                Mountain(name: "Mount Kapoya", elevation: 1112),
            ]
        ),
        Province(
            name: "South Sulawesi",
            mountains: [
                Mountain(name: "Mount Lompobattang", elevation: 2874),
                Mountain(name: "Mount Bawakaraeng", elevation: 2845),
                Mountain(name: "Mount Bulu Baria", elevation: 2730),
                Mountain(name: "Mount Karua", elevation: 2670),
                Mountain(name: "Mount BuluSaraung", elevation: 1353),
            ]
        ),
        Province(
            name: "West Sulawesi",
            mountains: [
                Mountain(name: "Mount Pelatang", elevation: 2925),
                Mountain(name: "Mount Mambuliling", elevation: 2843),
                Mountain(name: "Mount Tonggo", elevation: 2710),
                Mountain(name: "Mount Tapeanlima", elevation: 2670),
            ]
        ),
        Province(
            name: "Bali",
            mountains: [
                Mountain(name: "Mount Abang", elevation: 2151),
                Mountain(name: "Mount Adeng", elevation: 1826),
                Mountain(name: "Mount Batukaru", elevation: 2276),
                Mountain(name: "Mount Batur", elevation: 1717),
                Mountain(name: "Mount Catur", elevation: 2096),
                Mountain(name: "Mount Lesong", elevation: 1865),
                Mountain(name: "Mount Lempuyang", elevation: 1058),
                Mountain(name: "Mount Pohon", elevation: 2063),
                Mountain(name: "Mount Sengayang", elevation: 2087),
                Mountain(name: "Mount Merbuk", elevation: 1359),
            ]
        ),
        Province(
            name: "West Nusa Tenggara",
            mountains: [
                Mountain(name: "Mount Tambora", elevation: 2850),
                Mountain(name: "Mount Doro Peti", elevation: 2150),
            ]
        ),
        Province(
            name: "East Nusa Tenggara",
            mountains: [
                Mountain(name: "Mount Egon", elevation: 1703),
                Mountain(name: "Mount Lewotobi", elevation: 1584),
                Mountain(name: "Mount Inerie", elevation: 2245),
                Mountain(name: "Mount Mutis", elevation: 2427),
            ]
        ),
        Province(
            name: "Maluku",
            mountains: [
                Mountain(name: "Mount Gamalama", elevation: 1715),
                Mountain(name: "Mount Dukono", elevation: 1335),
                Mountain(name: "Mount Ibu", elevation: 1325),
                Mountain(name: "Mount Gamkonora", elevation: 1635),
            ]
        ),
        Province(
            name: "West Papua",
            mountains: [
                Mountain(name: "Mount Kwoka", elevation: 3000),
                Mountain(name: "Mount Umsini", elevation: 2950),
                Mountain(name: "Mount Wasada", elevation: 1070),
            ]
        ),
        Province(
            name: "Papua",
            mountains: [
                Mountain(name: "Mount Foja", elevation: 2193),
                Mountain(name: "Mount Angemuk", elevation: 2949),
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
