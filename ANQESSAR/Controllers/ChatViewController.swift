//
//  ChatViewController.swift
//  ANQESSAR
//
//  Created by Home on 9/24/21.
//

import UIKit
import Firebase
class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = "ANQESSAR"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendPressed(_ sender: Any) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        
        navigationController?.popToRootViewController(animated: true)
        
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
      
    }
    

}
