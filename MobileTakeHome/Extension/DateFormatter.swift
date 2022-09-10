//
//  DateFormatter.swift
//  MobileTakeHome
//
//  Created by André Alves on 09/09/22.
//

import Foundation

extension DateFormatter {
    static func dateFormat() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
}
