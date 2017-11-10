//
//  ViewController.swift
//  TutorialMessageBubble
//
//  Created by Robert Kerr on 11/9/17.
//  Copyright © 2017 Robert Kerr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var bubbleImageView: UIImageView!
    
    @IBOutlet weak var bubbleHeight: UILabel!
    @IBOutlet weak var bubbleHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        bubbleHeight.text = "\(sender.value)"
        bubbleHeightConstraint.constant = CGFloat(sender.value)
    }

    @IBAction func sentButtonTapped(_ sender: UIButton) {
        changeImage("chat_bubble_sent")
        bubbleImageView.tintColor = UIColor(named: "chat_bubble_color_sent")
    }
    
    @IBAction func receivedButtonTapped(_ sender: UIButton) {
        changeImage("chat_bubble_received")
        bubbleImageView.tintColor = UIColor(named: "chat_bubble_color_received")
    }
    
    func changeImage(_ name: String) {
        guard let image = UIImage(named: name) else { return }
        bubbleImageView.image = image
            .resizableImage(withCapInsets: 
                UIEdgeInsetsMake(17, 21, 17, 21),
                                    resizingMode: .stretch)
            .withRenderingMode(.alwaysTemplate)
    }
    
    @IBAction func colorButtonTapped(_ sender: UIButton) {
        bubbleImageView.tintColor = sender.backgroundColor
    }
}
