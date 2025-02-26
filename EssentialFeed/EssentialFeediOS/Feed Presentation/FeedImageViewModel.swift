//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 13/02/25.
//

import Foundation
import EssentialFeed

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
