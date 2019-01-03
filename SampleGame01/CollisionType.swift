//
//  CollisionType.swift
//  SampleGame01
//
//  Created by Fumiya Tanaka on 2018/12/29.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import Foundation
import SpriteKit

struct CollisionType {
    static let player: UInt32 = 0b00001 << 0
    static let background: UInt32 = 0b00001 << 1
    static let ground: UInt32 = 0b00001 << 2
    static let bone: UInt32 = 0b00001 << 3
    static let coin: UInt32 = 0b00001 << 4
}
