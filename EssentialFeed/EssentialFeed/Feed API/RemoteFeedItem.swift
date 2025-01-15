//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 28/12/24.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
