//
//  UiTableViewCellExtension.swift
//  Advance Core Data
//
//  Created by Dhawal Mahajan on 16/12/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class var identifier: String {
        return String(describing: self)
    }
}
