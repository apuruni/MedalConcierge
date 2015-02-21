//
//  GameViewController.swift
//  YokaiMedal
//
//  Created by Apurune on 2015/02/02.
//  Copyright (c) 2015年 Apurune. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var gameScene:GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if gameScene == nil {
            initGameScene()
        }
    }
    
    private func initGameScene(){
        
        GameScene.loadSceneAssetsWithCompletionHandler(self.view.bounds.size) { loadedScene in
            self.gameScene = loadedScene
            
            // Configure the view.
            let skView = self.view as! SKView
            
            self.gameScene.scaleMode = .AspectFill
            
            skView.showsDrawCount = true
            skView.showsFPS = true
            
            skView.presentScene(self.gameScene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
