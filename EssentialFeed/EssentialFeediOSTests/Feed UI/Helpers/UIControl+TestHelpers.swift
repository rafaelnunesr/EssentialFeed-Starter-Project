//
//  UIControl+TestHelpers.swift
//  EssentialFeed
//
//  Created by Rafael Rios on 11/02/25.
//

import UIKit

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
