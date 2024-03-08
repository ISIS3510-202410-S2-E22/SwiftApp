//
//  CreateReview2View.swift
//  FoodBookApp
//
//  Created by Laura Restrepo on 28/02/24.
//

import Foundation
import SwiftUI
import PhotosUI

struct CreateReview2View: View {
    let categories: [String]
    @State private var selectedImage: UIImage?
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var imageIsSelected: Bool = false
    @State private var cleanliness: Int = 0
    @State private var waitingTime: Int = 0
    @State private var service: Int = 0
    @State private var foodQuality: Int = 0
    @State private var reviewTitle: String = ""
    @FocusState private var reviewTitleIsFocused: Bool
    @State private var reviewBody: String = ""
    @FocusState private var reviewBodyIsFocused: Bool
    @Binding var isNewReviewSheetPresented: Bool
    
    let customGray = Color(red: 242/255, green: 242/255, blue: 242/255)
    let customGray2 = Color(red: 242/255, green: 242/255, blue: 247/255)
    
    var body: some View {
        VStack(alignment: .leading) {
            // Header
//            HStack{
//                TextButton(text: "Cancel", txtSize: 20, hPadding: 0) // FIXME: should redirect
//                Spacer()
//                Text("Review")
//                    .bold()
//                    .font(.system(size: 20))
//                Spacer()
//                BoldTextButton(text: "Done", txtSize: 20) { print("Done") } // FIXME: should verify inputs and send them to DB
//                
//            }.padding(.horizontal).padding(.top)
//            
//            Separator()
            
            ScrollView(.vertical) {
                // Quality attributes
                ZStack(){
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Cleanliness")
                            Spacer()
                            HStack(spacing: 0) {
                                ForEach(1..<6) { index in
                                    Button(action: {
                                        cleanliness = index
                                    }) {
                                        Image(systemName: cleanliness < index ? "star" : "star.fill")
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        }.padding(.bottom, 5)
                        HStack {
                            Text("Waiting time")
                            Spacer()
                            HStack(spacing: 0) {
                                ForEach(1..<6) { index in
                                    Button(action: {
                                        waitingTime = index
                                    }) {
                                        Image(systemName: waitingTime < index ? "star" : "star.fill")
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        }.padding(.bottom, 5)
                        HStack {
                            Text("Service")
                            Spacer()
                            HStack(spacing: 0) {
                                ForEach(1..<6) { index in
                                    Button(action: {
                                        service = index
                                    }) {
                                        Image(systemName: service < index ? "star" : "star.fill")
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        }.padding(.bottom, 5)
                        HStack {
                            Text("Food quality")
                            Spacer()
                            HStack(spacing: 0) {
                                ForEach(1..<6) { index in
                                    Button(action: {
                                        foodQuality = index
                                    }) {
                                        Image(systemName: foodQuality < index ? "star" : "star.fill")
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                        }
                    }.padding().background(customGray2).cornerRadius(10)
                }.padding(.horizontal).padding(.top)
                .navigationTitle("Review")
                .toolbar{
                    Button(action: {
                        // Step 1: Uplad review
                        print("Uploads this review!")
                        // Very Nice To Have, but that the "Done" turns into the loading indicator while the review is uploaded, idk how complex it could be though.
                        
                        // Step 2: Close sheet
                        isNewReviewSheetPresented.toggle()
                        
                    }, label: {
                        Text("Done")
                            .frame(maxWidth: .infinity)
                            .padding()
                    })
                           
                }
                
                
                // Photo
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .padding(.top)
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(customGray)
                        .frame(height: 150)
                        .padding(.horizontal).padding(.top)
                }
                
                // Add or remove photo button
                if !imageIsSelected {
                    addPhotoButton.padding()
                }
                else { // FIXME: confirm message (?)
                    LargeButtont(text: "Remove photo", bgColor: customGray, txtColor: Color.red, txtSize: 20){ selectedImage = nil }
                }
                
                // Leave a comment
                VStack(alignment: .leading) {
                    Text("Leave a comment").bold().font(.system(size: 25))
                        .padding(.horizontal).padding(.bottom)
                    
                    // Review title
                    HStack {
                        Text("Title").font(.system(size: 20))
                        TextField("Optional", text: $reviewTitle)
                            .focused($reviewTitleIsFocused)
                            .padding(.leading)
                        Spacer()
                        if reviewTitleIsFocused {
                            ClearButton(){
                                reviewTitle = ""
                                reviewTitleIsFocused = false}
                        }
                    }.padding(.horizontal)
                    
                    Separator().padding(.horizontal)
                    
                    // Review body
                    HStack {
                        Text("Body").font(.system(size: 20))
                        TextField("Value", text: $reviewBody)
                            .focused($reviewBodyIsFocused)
                            .padding(.leading)
                        Spacer()
                        if reviewBodyIsFocused {
                            ClearButton(){
                                reviewBody = ""
                                reviewBodyIsFocused = false}
                        }
                    }.padding(.horizontal)
                }.padding(.horizontal, 15)
                
                Spacer()
            }
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$selectedImage, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }.onChange(of: selectedImage) {
            Task {
                if imageIsSelected {
                    imageIsSelected = false
                }
                else {
                    imageIsSelected = true
                }
            }
        }
    }
    
    var addPhotoButton: some View { // FIXME: should be component (yes!)
        
        Button(action : {
            self.showSheet = true
        }) {
            Text("Add a photo..")
                .frame(maxWidth: .infinity)
                .padding()
                .background(customGray)
                .cornerRadius(12)
                .font(.system(size: 20))
        }.actionSheet(isPresented: $showSheet) {
            ActionSheet(title: Text("Select an option"), buttons: [
                .default(Text("Photo Library")) {
                    self.showImagePicker = true
                    self.sourceType = .photoLibrary
                },
                .default(Text("Camera")) {
                    self.showImagePicker = true
                    self.sourceType = .camera
                },
                .cancel()
            ])
        }
    }
}

#Preview {
    CreateReview2View(categories: ["Homemade", "Colombian"], isNewReviewSheetPresented: .constant(true))
}
