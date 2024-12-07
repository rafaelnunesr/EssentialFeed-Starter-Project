//
//  HTTPClientResult.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 07/12/24.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
