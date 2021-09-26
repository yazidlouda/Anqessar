//
//  WelcomeViewController.swift
//  ANQESSAR
//
//  Created by Home on 9/24/21.
//

import UIKit
import CLTypingLabel
class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = K.title
        
        
//        titleLabel.text = ""
//        var charIndex = 0.0
//        let titleText = "ANQESSAR"
//        for letter in titleText{
//            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            charIndex += 1
//        }
    }
    


}
