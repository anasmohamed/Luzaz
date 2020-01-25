//
//  StringError.swift
//  Luzaz
//
//  Created by Anas Mohamed on 1/25/20.
//  Copyright © 2020 Luzaz. All rights reserved.
//

import Foundation
extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
