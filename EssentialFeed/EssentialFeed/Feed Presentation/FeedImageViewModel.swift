//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 24/03/25.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
