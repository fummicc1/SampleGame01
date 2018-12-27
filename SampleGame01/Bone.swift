//
//  Bone.swift
//  SampleGame01
//
//  Created by Fumiya Tanaka on 2018/12/27.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import Foundation
import SpriteKit

class Bone: SKSpriteNode {
    
    var initalSize = CGSize(width: 50, height: 50)
    
    init() {
       let texture = SKTexture(imageNamed: "bone_ape")
        
        super.init(texture: texture, color: .clear, size: initalSize)
        
        let rotateAction = SKAction.rotate(byAngle: CGFloat.pi, duration: 1.0)
        
        self.run(SKAction.repeatForever(rotateAction))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
