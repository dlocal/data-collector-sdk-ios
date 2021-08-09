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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var startSessionBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loading(false)
    }
    
    @IBAction func didTap(_ sender: Any) {
        loading(true)
        try? DLCollector.shared.startSession() {[weak self] result in
            // this callback might not be executed on main.
            DispatchQueue.main.async {
                self?.loading(false)
                switch result {
                case .success(let id):
                    self?.sessionIdLabel.text = id
                case .failure(_):
                    self?.sessionIdLabel.text = "Error"
                }
            }
            
        }
    }
    func loading(_ loading: Bool) {
        startSessionBtn.isHidden = loading
        activityIndicator.isHidden = !loading
        if loading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

