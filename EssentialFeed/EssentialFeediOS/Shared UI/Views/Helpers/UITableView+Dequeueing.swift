//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Rafael Rios on 09/06/25.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
