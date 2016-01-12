//
//  HoverTableRowView.swift
//  NSTrackingArea
//
//  Created by Harry Ng on 12/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class HoverTableRowView: NSTableRowView {
    
    var trackingArea: NSTrackingArea?
    var mouseInside: Bool = false {
        didSet {
            needsDisplay = true
        }
    }

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
    override func drawBackgroundInRect(dirtyRect: NSRect) {
        backgroundColor.setFill()
        NSRectFill(bounds)
        
        if mouseInside {
            let gradient = HoverTableRowView.gradientWithTargetColor(NSColor.whiteColor())
            gradient?.drawInRect(bounds, angle: 0)
        }
    }
    
    override func drawSelectionInRect(dirtyRect: NSRect) {
        Swift.print("select")
    }
    
    override func drawSeparatorInRect(dirtyRect: NSRect) {
        Swift.print("separator")
    }
    
    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        ensureTrackingArea()
        if !trackingAreas.contains(trackingArea!) {
            addTrackingArea(trackingArea!)
        }
    }
    
    func ensureTrackingArea() {
        if trackingArea == nil {
            trackingArea = NSTrackingArea(rect: NSZeroRect, options: [.InVisibleRect, .ActiveAlways, .MouseEnteredAndExited], owner: self, userInfo: nil)
        }
    }
    
    override func mouseEntered(theEvent: NSEvent) {
        mouseInside = true
    }
    
    override func mouseExited(theEvent: NSEvent) {
        mouseInside = false
    }
    
    override var interiorBackgroundStyle: NSBackgroundStyle {
        return .Light
    }
    
    class func gradientWithTargetColor(targetColor: NSColor) -> NSGradient? {
        let colors = [targetColor.colorWithAlphaComponent(0), targetColor, targetColor, targetColor]
        let locations: [CGFloat] = [0.0, 0.35, 0.65, 1.0]
        
        return NSGradient(colors: colors, atLocations: locations, colorSpace: NSColorSpace.sRGBColorSpace())
    }
    
}
