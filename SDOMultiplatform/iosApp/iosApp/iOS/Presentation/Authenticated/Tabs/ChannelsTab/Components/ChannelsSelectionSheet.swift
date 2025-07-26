//
//  ChannelsSelectionSheet.swift
//  SDO (iOS)
//
//  Created by Joel Kingsley on 12/10/2022.
//

import SwiftUI
import MapKit

struct ChannelsSelectionSheet: View {
    @ObservedObject var channelsTabViewModel: ChannelsTabViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                            .frame(width: 20)
                        Text("channelsSelectionSheetFilterByRegionLabel")
                        Picker("Regions", selection: $channelsTabViewModel.selectedRegion) {
                            ForEach($channelsTabViewModel.listOfRegions, id: \.self) { option in
                                Text(Locale.current.localizedString(
                                    forRegionCode: option.wrappedValue.identifier
                                ) ?? "N/A")
                            }
                        }
                        .pickerStyle(.automatic)
                        Spacer()
                    }
                    Divider()
                    ForEach($channelsTabViewModel.filteredChannels) { channel in
                        Button {
                            channelsTabViewModel.setCenter(with: channel.wrappedValue.coordinate)
                            dismiss()
                        } label: {
                            VStack {
                                HStack {
                                    Text(channel.wrappedValue.channelName)
                                        .padding(.horizontal, 20)
                                        .font(.sdoBody)
                                    Spacer()
                                }
                                Divider()
                            }
                        }
                    }
                }
            }
            .searchable(
                text: $channelsTabViewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "channelsSelectionSheetSearchPlaceholderLabel"
            )
            .textInputAutocapitalization(.never)
            .navigationTitle("channelsSelectionSheetNavigationTitle")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChannelsSelectionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsSelectionSheet(
            channelsTabViewModel: ChannelsTabViewModel()
        )
    }
}
