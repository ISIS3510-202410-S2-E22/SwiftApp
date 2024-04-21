//
//  BookmarksView.swift
//  FoodBookApp
//
//  Created by Juan Diego Yepes Parra on 21/02/24.
//

import SwiftUI
import LocalAuthentication

struct BookmarksView: View {
    

    @Environment(BookmarksService.self) private var bookmarksManager
    @State private var model = BookmarksViewModel()

    @State private var isFetching = false // Track fetching status

    
    var body: some View {
        
        if bookmarksManager.savedBookmarkIds.isEmpty {
            VStack {
                Image(systemName: "book")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 100))
                Text("You have no saved bookmarks.")
            }
        }
        else {
            ScrollView {
                if isFetching {
                    ProgressView()
                } else if model.spots.isEmpty {
                    Text("Hmm, nothing here.")
                } else {
                    ForEach(model.spots, id: \.self) {spot in
                        NavigationLink(destination: SpotDetailView(spotId: spot.id ?? "")){
                            SpotCard(
                                id: spot.id ?? "",
                                title: spot.name,
                                minTime: spot.waitTime.min,
                                maxTime: spot.waitTime.max,
                                distance: spot.distance ?? "-",
                                categories: Array(Utils.shared.highestCategories(spot: spot).prefix(5)),
                                imageLinks: spot.imageLinks ?? [],
                                price: spot.price,
                                spot: spot
                            )
                            .fixedSize(horizontal: false, vertical: true)
                            .accentColor(.black)
                        }
                    }
                }
            }
            .padding(8)
            .task {
                isFetching = true
                await model.fetchSpots(Array(bookmarksManager.savedBookmarkIds))
                isFetching = false
            }
            .onReceive(NetworkService.shared.$isOnline) { isOnline in
                if model.spots.isEmpty && isOnline {
                    print("Spots is empty but online, retrying...")
                    Task {
                        await model.fetchSpots(Array(bookmarksManager.savedBookmarkIds))
                    }
                }
                
            }
        }
    }
}

#Preview {
    BookmarksView()
}
