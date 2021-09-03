//
//  ViewController.swift
//  SampleApp
//
//  Created by Nicolas Rostan on 5/8/21.
//

import UIKit
import DLDataCollectorSDK

class ViewController: UIViewController {
    @IBOutlet weak var sessionIdLabel: UILabel!
    @IBOutlet weak var startSessionBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startSession(_ sender: Any) {
        do {
            try DLCollector.shared.startSession()
        } catch {
            self.sessionIdLabel.text = "Error"
        }
    }

    @IBAction func getSessionId(_ sender: Any) {
        self.sessionIdLabel.text = DLCollector.shared.getSessionId() ?? "Not available"
    }
}
