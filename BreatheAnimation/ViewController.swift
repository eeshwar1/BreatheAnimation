//
//  ViewController.swift
//  BreatheAnimation
//
//  Created by Venkateswaran Venkatakrishnan on 9/25/21.
//

import Cocoa

class ViewController: NSViewController {

    var timer = Timer()

    
    @IBOutlet var breathView: BreathView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @objc func animateScene() {
        
        self.breathView.nextFrame()
        self.breathView.needsDisplay = true
        
    }
    
    func startTimer()
    {
        
        timer = Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(ViewController.animateScene), userInfo: nil, repeats: true)
        
    }
    
    func stopTimer()
    {
        
        timer.invalidate()
    }


}

