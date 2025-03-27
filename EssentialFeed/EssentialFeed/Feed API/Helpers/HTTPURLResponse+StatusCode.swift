//
//  Untitled.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 27/03/25.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
