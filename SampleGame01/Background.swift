//
//  Background.swift
//  SampleGame01
//
//  Created by Fumiya Tanaka on 2018/12/26.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import Foundation
import SpriteKit

class Background: SKSpriteNode {
    
    init() {
        
        let texture = SKTexture(imageNamed: "background_cloud")
        
        super.init(texture: texture, color: .blue, size: CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        
        anchorPoint = CGPoint(x: 0, y: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkPosition(playerPosition: CGPoint, progressCount: CGFloat) -> Bool {
        
        let maxWidth = progressCount * UIScreen.main.bounds.size.width
        
        if playerPosition.x > maxWidth - self.frame.width / 2 {
            
            return true
            
        }
        
        return false
        
    }
    
}
