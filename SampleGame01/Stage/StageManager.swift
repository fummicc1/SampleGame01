//
//  EncounterManager.swift
//  SampleGame01
//
//  Created by Fumiya Tanaka on 2018/12/27.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import Foundation
import SpriteKit

class StageManager {
    
    static let shared = StageManager()
    
    private init() { }
    
    var currentStageIndex = 0
    var previousStageIndex = 0
    
    var allEncounters: [[SKNode]] = []
    
    var currentStageEncounters: [SKNode]? {
        
        get {
            
            if currentStageIndex - 1 >= allEncounters.count {
                
                return nil
                
            }
            
            return allEncounters[currentStageIndex]
        }
        
    }
    
    func decideNextStage() {
        
    }
    
    func setNewStageEncounters(nextIndex: Int) {
        
        var encounters: [SKNode] = []
        
        for i in 0...5 {
            
            if i % 2 == 0 {
                
                let coin = Coin()
                
                coin.position = CGPoint(x: i * 70, y: -(Int.random(in: 100...250)))
                
                encounters.append(coin)
                
            } else {
                
                let bone = Bone()
                
                bone.position = CGPoint(x: i * 70, y: 100 - Int(UIScreen.main.bounds.size.height))
                
                encounters.append(bone)
                
            }
            
        }
        
        allEncounters.append(encounters)
        
    }
    
    func showEncounters(parentNode: SKNode) {
        
        
        
        switch currentStageIndex % 3 {
        case 0:
            setNewStageEncounters(nextIndex: 0)
        case 1:
            setNewStageEncounters(nextIndex: 1)
        case 2:
            setNewStageEncounters(nextIndex: 2)
        default:
            break
        }
        
        for encounter in currentStageEncounters ?? [] {
            
            parentNode.addChild(encounter)
            
        }
        
        previousStageIndex = currentStageIndex
        
        currentStageIndex += 1
        
        
    }
    
}
