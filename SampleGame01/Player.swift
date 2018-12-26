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
    
    let initialSize = CGSize(width: 100, height: 100)
    
    var initialPosition: CGPoint = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: 100)
    
    var playerProgress: CGFloat!
    
    init() {
        
        let texture = SKTexture(imageNamed: "player_moving01")
        
        super.init(texture: texture, color: .clear, size: initialSize)
        
        anchorPoint = CGPoint(x: 0, y: 1)
        
        let moveFrames: [SKTexture] = [
            SKTexture(imageNamed: "player_moving01"),
            SKTexture(imageNamed: "player_moving02"),
            SKTexture(imageNamed: "player_moving03")
        ]
        
        let moveAction = SKAction.animate(with: moveFrames, timePerFrame: 0.1)
        
        self.run(SKAction.repeatForever(moveAction))
        
        self.position = initialPosition
        
        self.zPosition = 1
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
//        self.init()
        
    }
    
    func move() {
        
        self.physicsBody?.velocity = CGVector(dx: 10, dy: 0)
        
    }
    
}
