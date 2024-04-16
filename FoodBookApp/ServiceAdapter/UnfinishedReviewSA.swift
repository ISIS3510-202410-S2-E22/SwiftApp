//
//  UnfinishedReviewSA.swift
//  FoodBookApp
//
//  Created by Laura Restrepo on 16/04/24.
//

import Foundation

protocol UnfinishedReviewSA {
    static var shared: UnfinishedReviewSA { get }
    func increaseUnfinishedReviewCount(user: String) async throws
}