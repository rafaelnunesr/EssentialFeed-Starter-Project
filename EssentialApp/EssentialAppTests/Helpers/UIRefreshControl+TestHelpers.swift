//
//  UIRefreshControl+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Rafael Rios on 09/06/25.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
