//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Rafael Rios on 09/06/25.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
