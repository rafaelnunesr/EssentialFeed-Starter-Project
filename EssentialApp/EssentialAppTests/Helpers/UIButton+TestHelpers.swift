//
//  UIButton+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Rafael Rios on 09/06/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
