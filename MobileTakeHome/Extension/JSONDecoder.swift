//
//  JSONDecoder.swift
//  MobileTakeHome
//
//  Created by André Alves on 09/09/22.
//

import Foundation
extension JSONDecoder {
    static func weatherDecoder() -> JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(.dateFormat())
        return jsonDecoder
    }
}
