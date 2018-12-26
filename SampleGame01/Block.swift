//
//  Background.swift
//  SampleGame01
//
//  Created by Fumiya Tanaka on 2018/12/22.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import Foundation
import SpriteKit

class Block: SKSpriteNode {
    
    let initialSize = CGSize(width: 50, height: 50)
    
    init() {
        
        let texture =  SKTexture(imageNamed: "block")
        
        super.init(texture: texture, color: .clear, size: initialSize)
        
        anchorPoint = .zero
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func judgeColluision(with: CGRect) {
        
        if self.frame.intersects(with) {
            
            print("GameOver")
            
        }
        
    }
    
}
