//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 24/03/25.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
