//
//  Coin.swift
//  SampleGame01
//
//  Created by Fumiya Tanaka on 2018/12/26.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import Foundation
import SpriteKit

class Coin: SKSpriteNode {
    
    var initialSize = CGSize(width: 50, height: 50)
    
    init() {
        
        let coinTexture = SKTexture(imageNamed: "coin1")
        
        super.init(texture: coinTexture, color: .clear, size: initialSize)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
