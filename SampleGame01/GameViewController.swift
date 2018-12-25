//
//  GameViewController.swift
//  SampleGame01
//
//  Created by Fumiya Tanaka on 2018/12/22.
//  Copyright © 2018 Fumiya Tanaka. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let skView = view as? SKView {
            
            let scene = SKScene(fileNamed: "GameScene") as! GameScene
            
            skView.presentScene(scene)
        }
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        return .landscape
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
