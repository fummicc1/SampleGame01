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
    
    override func didMove(to view: SKView) {
        
        for i in 0...10 {
            
            let block = Block()
            
            block.position.y = [50, 100, 150, 200].randomElement()!
            
            if i % 3 == 0 {
                block.position.x = CGFloat(i * 30)
                self.addChild(block)
            }
        }
        
        let player = Player()
        
        self.addChild(player)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
        
    }
    
    func addCameraNode() {
        
        let cameraNode = SCNNode()
        
        cameraNode.camera = SCNCamera()
        
        
        
    }
    
}
