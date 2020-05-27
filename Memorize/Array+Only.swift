//
//  Array+Only.swift
//  Memorize
//
//  Created by Pablo Cornejo on 5/26/20.
//  Copyright © 2020 Pablo Cornejo Pierola. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
