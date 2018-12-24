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
    
    let _camera =  SKCameraNode()
    
    var player: Player!
    
    override func didMove(to view: SKView) {
        
        player = Player()
        
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        
        player.position = CGPoint(x: 0, y: 100)
        
        addChild(player)
        
        self.camera = _camera
        
        let groundNode = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 20000, height: 100))
        
        groundNode.physicsBody = SKPhysicsBody(rectangleOf: groundNode.frame.size)
        
        groundNode.physicsBody?.isDynamic = false
        
        addChild(groundNode)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        self.camera?.position = player.position // track the player's position
        
    }
}
