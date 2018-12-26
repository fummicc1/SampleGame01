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
    
    var coinAnimation: SKAction!
    
    init() {
        
        let coinTexture = SKTexture(imageNamed: "coin")
        
        super.init(texture: coinTexture, color: .clear, size: initialSize)
        
        setAnimation()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAnimation() {
        
        let animationTextures: [SKTexture] = [
            SKTexture(imageNamed: "coin1"),
            SKTexture(imageNamed: "coin2"),
            SKTexture(imageNamed: "coin3"),
            SKTexture(imageNamed: "coin4"),
        ]
        
        let animation = SKAction.animate(with: animationTextures, timePerFrame: 1.0)
        
        self.coinAnimation = animation
        
    }
    
}
