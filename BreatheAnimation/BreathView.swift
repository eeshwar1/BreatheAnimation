//
//  BreatheView.swift
//  BreatheAnimation
//
//  Created by Venkateswaran Venkatakrishnan on 9/25/21.
//

import AppKit

class BreathView: NSView {
    
    var frameNumber = 2
    var grow: Bool = true
    
 
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        animate()
        
    }
    
    func nextFrame() {
        
        
        self.frameNumber = self.frameNumber + (self.grow == true ? 2 : -2)
        
        if self.frameNumber >= 100 || self.frameNumber <= 2 {
            
            grow = !grow
        }
    }

    
    func animate() {
        

        self.drawBreatheGraphic(self.frameNumber)
        
        
    }
    
    
    fileprivate func drawBreatheGraphic(_ i: Int) {
        
        NSColor.black.setFill()
        bounds.fill()
        
        let bigRadius: CGFloat = 5 + 0.3 * CGFloat(i)
        let radius: CGFloat = CGFloat(10 + CGFloat(i) * 0.7)
        
        for j in 1...6 {
            
            let centerX = 200 + bigRadius * cos(( CGFloat(j * 60) * Double.pi/180.0))
            let centerY = 200 + bigRadius * sin(( CGFloat(j * 60) * Double.pi/180.0))
            drawCircle(centerX: centerX, centerY: centerY, radius: radius)
            
        }
    }
    
    
    func drawCircle(centerX: CGFloat, centerY: CGFloat, radius: CGFloat) {
        
        
        let rect = NSRect(x: centerX - radius, y: centerY - radius, width: 2 * radius, height: 2 * radius)
        let path = NSBezierPath(ovalIn: rect)
        NSColor.init(red: 0, green: 1, blue: 1, alpha: 0.6).set()
        
        path.fill()
        
    }
    
    
}
