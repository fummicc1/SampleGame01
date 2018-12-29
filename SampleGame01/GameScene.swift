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
    
    var progressCount: CGFloat = 1
    
    var backgrounds: [Background] = []
    
//    var playerJumping: Bool {
//
//        get {
//
//            if player.intersects(groundNode) {
//                return false
//            }
//
//            return true
//
//        }
//
//    }
    
    let _camera =  SKCameraNode()
    
    var player: Player!
    
    var backgroundNode: Background!
    
    var groundNode: SKSpriteNode!
    
    var coinArray: [Coin] = []
    
    override func didMove(to view: SKView) {
        
        scaleMode = .aspectFill
        
        anchorPoint = .zero
        
        self.physicsWorld.contactDelegate = self
        
        setBackground()
        
        setPlayer()
        
        setCamera()
        
        setGroundNode()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
//        if playerJumping { return }
//
        player.physicsBody?.velocity = CGVector(dx: 0, dy: 400)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        self.camera?.position.x = player.position.x // track the player's position
        
        constantlyMove()
        
        if backgroundNode.checkPosition(playerPosition: player.position, progressCount: progressCount) {
            
            progressCount += 1
            
            setBackground()
            
            setGroundNode()
            
        }
        
    }
    
    func setPlayer() {
        
        player = Player()
        
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        
        player.physicsBody?.categoryBitMask = CollisionType.player
        player.physicsBody?.collisionBitMask = CollisionType.bone
        player.physicsBody?.contactTestBitMask = CollisionType.bone
        
        addChild(player)
        
    }
    
    func constantlyMove() {
        
        player.physicsBody?.velocity.dx = 200
        
    }
    
    func setBackground() {
        
        backgroundNode = Background()
        
        backgroundNode.position = CGPoint(x: (progressCount - 1) * self.size.width, y: self.size.height)
        
        addChild(backgroundNode)
     
        backgrounds.append(backgroundNode)
        
        if backgrounds.count == 4 {
            
            backgrounds.removeFirst()
            
        }
        
    }
    
    func setCamera() {
        
        self.camera = _camera
        
        self.camera?.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
    }
    
    func setGroundNode() {
        
        groundNode = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 20000, height: 50))
        
        groundNode.anchorPoint = CGPoint(x: 0, y: 1)
        
        groundNode.position = CGPoint(x: 0, y: -(backgroundNode.frame.height - 50))
        
        groundNode.physicsBody = SKPhysicsBody(rectangleOf: groundNode.size)
        groundNode.physicsBody?.isDynamic = false
        
        backgroundNode.addChild(groundNode)
    }
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        print(contact.bodyA.node is Bone)
        print(contact.bodyB.node is Bone)
    }
    
}
