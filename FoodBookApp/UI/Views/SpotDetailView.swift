//
//  SpotDetailView.swift
//  FoodBookApp
//
//  Created by Laura Restrepo on 26/02/24.
//

import Foundation
import SwiftUI
import GoogleMaps


struct SpotDetailView: View {
    let customGray = Color(red: 242/255, green: 242/255, blue: 242/255)
    let tags = ["Vegan", "Homemade", "Fast", "Colombian", "Dessert"] // FIXME: Should be fetched tags
    let ratings: [String: Double] = ["Cleanliness": 0.81, "Waiting time": 0.99, "Service": 0.36, "Food quality": 0.73]
        
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                // < Browse
               HStack {
                   backButton
               }.padding(.vertical, 1)
                   
                // Spot name
               HStack {
                   Text("MiCaserito") //FIXME: should be spot's name
                       .font(.system(size: 40))
                       .bold()
               }
            }.padding(.horizontal, 20)
            
            ScrollView(.vertical) {
                ZStack {
                    customGray
                    VStack {
                        // Tags
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(tags, id: \.self) { tag in
                                    Text(tag)
                                        .font(.system(size: 16))
                                        .bold()
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 10)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                }
                            }
                            .padding()
                        }
                        
                        // Reviews - See more
                        HStack {
                            Text("Reviews")
                                .font(.system(size: 30))
                                .bold()
                                .frame(alignment: .leading)
                            Spacer()
                            seeMoreButton
                        }.padding(.horizontal, 20)
                        
                        // Quality attributes
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(20)
                            VStack(spacing: 0) {
                                ForEach(ratings.keys.sorted(), id: \.self) { key in
                                    let rating = ratings[key] ?? 0
                                    HStack(spacing: 0) {
                                        VStack(alignment: .leading) {
                                            Text(key).font(.system(size: 22))
                                            HStack {
                                                Image(systemName: rating >= 0.5 ? "hand.thumbsup" : "hand.thumbsdown")
                                                    .font(.system(size: 17))
                                                    .foregroundColor(.gray)
                                                Text(String(format: "%.0f%%", rating * 100)).bold().foregroundColor(.gray)
                                            
                                            }
                                        }.frame(maxWidth: 200, alignment: .leading)
                                            .padding(.horizontal, 15)
                                        
                    
                                        ZStack {
                                            GeometryReader { geometry in
                                                Rectangle()
                                                    .fill(customGray)
                                                    .frame(width: geometry.size.width, height: 5)
                                                    .cornerRadius(5)
                                            }
                                            
                                            GeometryReader { geometry in
                                                Rectangle()
                                                    .fill(Color.blue)
                                                    .frame(width: CGFloat(rating) * geometry.size.width, height: 5)
                                                    .cornerRadius(5)
                                            }
                                        }.padding()
                                    }
                                    .padding(.vertical, 10)
                                }
                            }
  
                        }
                        .padding(.horizontal, 20)
                        .cornerRadius(12)
                        
                        // Leave a review
                        HStack {
                            leaveReviewButton
                        }
                    }
                }
            }
        }
    }
        
    var backButton: some View {
        Button(action: {
            print("Redirecting to browse...") // FIXME: Should actually redirect 
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
                .font(.system(size: 24))
            Text("Browse")
                .foregroundColor(.blue)
                .font(.system(size: 24))
        }
    }
    
    var seeMoreButton: some View {
        Button(action: {
            print("Redirecting to reviews...") // FIXME: Should actually redirect
        }) {
            Text("See more")
                .foregroundColor(.blue)
                .font(.system(size: 20))
        }
    }
    
    var leaveReviewButton: some View {
        Button(action: {
                print("Redirecting to new review...") // FIXME: Should actually redirect
            }, label: {
                Text("Leave a review")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .font(.system(size: 20))
            }).padding()
    }
}

#Preview {
    SpotDetailView()
}