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
        
        setCollision()
        
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
    
    func setCollision() {
        player.physicsBody?.categoryBitMask = CollisionType.player
        player.physicsBody?.collisionBitMask = ~(CollisionType.bone | CollisionType.coin)
        player.physicsBody?.contactTestBitMask = CollisionType.coin | CollisionType.bone
    }
    
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.categoryBitMask == CollisionType.player {
            switch contact.bodyB.categoryBitMask {
            case CollisionType.coin:
                let coin = contact.bodyB.node as! Coin
                
                let animate1 = SKAction.setTexture(SKTexture(imageNamed: "coin1"))
                let animate2 = SKAction.setTexture(SKTexture(imageNamed: "coin2"))
                let animate3 = SKAction.setTexture(SKTexture(imageNamed: "coin3"))
                let animate4 = SKAction.setTexture(SKTexture(imageNamed: "coin4"))
                
                let animations = SKAction.sequence([ animate1, animate2, animate3, animate4 ])
                
                coin.run(animations)
            case CollisionType.bone:
                break
            default:
                break
            }
        } else if contact.bodyB.categoryBitMask == CollisionType.player {
            switch contact.bodyA.categoryBitMask {
            case CollisionType.coin:
                let coin = contact.bodyA.node as! Coin
                
                let animate1 = SKAction.setTexture(SKTexture(imageNamed: "coin1"))
                let animate2 = SKAction.setTexture(SKTexture(imageNamed: "coin2"))
                let animate3 = SKAction.setTexture(SKTexture(imageNamed: "coin3"))
                let animate4 = SKAction.setTexture(SKTexture(imageNamed: "coin4"))
                
                let animations = SKAction.sequence([ animate1, animate2, animate3, animate4 ])
                
                coin.run(animations)
            case CollisionType.bone:
                break
            default:
                break
            }
        }
        
        
    }
    
}
