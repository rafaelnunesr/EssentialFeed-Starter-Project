//
//  UIRefreshControl.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 22/03/25.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
