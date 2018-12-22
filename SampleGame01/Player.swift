//
//  Player.swift
//  SampleGame01
//
//  Created by Fumiya Tanaka on 2018/12/22.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode {
    
    let textureAtlas = SKTextureAtlas(named: "Player")
    
    let initialSize = CGSize(width: 100, height: 100)
    
    init() {
        
        let texture = textureAtlas.textureNamed("player_start")
        
        super.init(texture: texture, color: .clear, size: initialSize)
        
        let moveFrames: [SKTexture] = [
            textureAtlas.textureNamed("player_moving01"),
            textureAtlas.textureNamed("player_moving02")
        ]
        
        let moveAction = SKAction.animate(with: moveFrames, timePerFrame: 0.1)
        
        self.run(moveAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
