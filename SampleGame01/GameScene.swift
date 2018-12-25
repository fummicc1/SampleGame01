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
        
        let backGroundNode = SKSpriteNode(color: UIColor.blue, size: view.frame.size)
        
        addChild(backGroundNode)
        
        player = Player()
        
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        
        player.position = CGPoint(x: 0, y: 100)
        
        addChild(player)
        
        self.camera = _camera
        
        let groundNode = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 20000, height: 50))
        
        groundNode.position = CGPoint(x: 0, y: -size.height / 2)
        
        groundNode.physicsBody = SKPhysicsBody(rectangleOf: groundNode.size)
        
        groundNode.physicsBody?.isDynamic = false
        
        addChild(groundNode)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        player.physicsBody?.velocity = CGVector(dx: 0, dy: 400)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        self.camera?.position.x = player.position.x // track the player's position
        
    }
}
