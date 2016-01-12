//
//  ViewController.swift
//  NSTrackingArea
//
//  Created by Harry Ng on 12/1/2016.
//  Copyright © 2016 STAY REAL. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSTableViewDelegate {
    func tableViewSelectionDidChange(notification: NSNotification) {
        tableView.enumerateAvailableRowViewsUsingBlock { (rowView, row) -> Void in
            if let cellView = rowView.viewAtColumn(0) as? NSTableCellView {
                if rowView.selected {
                    cellView.textField?.stringValue = "Icon \(row)"
                    cellView.textField?.font = NSFont.boldSystemFontOfSize((cellView.textField?.font!.pointSize)!)
                } else {
                    
                }
            }
        }
    }
}

extension ViewController: NSTableViewDataSource {
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return 10
    }
    
    
}
