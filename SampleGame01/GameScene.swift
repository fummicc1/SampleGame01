//
//  GameScene.swift
//  SampleGame01
//
//  Created by Fumiya Tanaka on 2018/12/22.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let block = Block()
        
        block.position.y = 250
        
        self.addChild(block)
        
        let player = Player()
        
        self.addChild(player)
        
    }
    
}
