//
//  UIButton+TestHelpers.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 11/02/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
