//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Rafael Rios on 09/06/25.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
