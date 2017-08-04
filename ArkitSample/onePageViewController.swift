//
//  onePageViewController.swift
//  ArkitSample
//
//  Created by omar arenas landgrave on 8/1/17.
//  Copyright © 2017 omar arenas landgrave. All rights reserved.
//

import UIKit
import ARKit

class onePageViewController: UIViewController   {

    var arkitview:ARSCNView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting the view and the constraints
        self.arkitview = ARSCNView.init()
        self.arkitview?.showsStatistics = true
        self.arkitview?.autoenablesDefaultLighting = true
        
        self.arkitview?.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.arkitview!)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[arkitView]|", options: NSLayoutFormatOptions.directionLeadingToTrailing , metrics: nil, views: ["arkitView":self.arkitview!]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[arkitView]|", options: NSLayoutFormatOptions.directionLeadingToTrailing , metrics: nil, views: ["arkitView":self.arkitview!]))
        
        // Do any additional setup after loading the view.
        
        let box = SCNBox(width: 1.0 , height: 1.0 , length: 1.0, chamferRadius: 1.0 )
        let nodeToAdd = SCNNode(geometry: box)
        let scene = SCNScene()
        
        nodeToAdd.position = SCNVector3.init( 0.0 , 0.0 , -4.0)
        scene.rootNode.addChildNode(nodeToAdd)
        
        arkitview?.scene = scene
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        
        self.view=UIView.init(frame: UIScreen.main.bounds)
        self.view.backgroundColor=UIColor.red
        
        self.tabBarItem?.title = "Swift"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let conf = ARWorldTrackingSessionConfiguration()
        self.arkitview?.session.run(conf)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.arkitview?.session.pause()
    }


}
