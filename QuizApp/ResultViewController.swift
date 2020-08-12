//
//  ResultViewController.swift
//  QuizApp
//
//  Created by Rijo George on 8/11/20.
//  Copyright © 2020 Rijo George. All rights reserved.
//

import UIKit

protocol ResultViewControllerProtocol {
    func resultDialogDismissed()
}

class ResultViewController: UIViewController {

    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    var resultText = ""
    var feedbackText = ""
    var buttonText = ""
    
    var delegate : ResultViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dialogView.layer.cornerRadius = 20
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultLabel.text = resultText
        feedbackLabel.text = feedbackText
        dismissButton.setTitle(buttonText, for: .normal)
        
        //hide the view elements
        resultLabel.alpha = 0
        feedbackLabel.alpha = 0
        dimView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.dimView.alpha = 1
            self.resultLabel.alpha = 1
            self.feedbackLabel.alpha = 1
        }, completion: nil)
    }

    @IBAction func dismissTapped(_ sender: Any) {
        // dismiss the dialog
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.dimView.alpha = 1
        }) { (completed) in
            self.dismiss(animated: true, completion: nil)
            self.delegate?.resultDialogDismissed()
        }
        
    }
    
}
