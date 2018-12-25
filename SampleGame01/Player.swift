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
    
    init() {
        
        let texture = SKTexture(imageNamed: "player_moving01")
        
        super.init(texture: texture, color: .clear, size: initialSize)
        
        let moveFrames: [SKTexture] = [
            SKTexture(imageNamed: "player_moving01"),
            SKTexture(imageNamed: "player_moving02"),
            SKTexture(imageNamed: "player_moving03")
        ]
        
        let moveAction = SKAction.animate(with: moveFrames, timePerFrame: 0.1)
        
        self.run(SKAction.repeatForever(moveAction))
        
        addMoveAction()
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
//        self.init()
        
    }
    
    func addMoveAction() {
        
        let goMove = SKAction.move(by: CGVector(dx: 300, dy: 0), duration: 3.0)
        
        self.run(SKAction.repeatForever(goMove))
        
    }
    
    
}
