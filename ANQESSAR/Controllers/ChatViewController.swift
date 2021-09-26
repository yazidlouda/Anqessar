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
    
    let db = Firestore.firestore()
    var messages: [Message] = []
           
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = K.title
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
       
        tableView.register(UINib(nibName: K.cellNibName , bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
    }
    
    func loadMessages(){
        messages = []
        db.collection(K.FStore.collectionName).addSnapshotListener{ [self] (querySnapshot, error) in
            if let e = error{
                print ("The error is", "\(e)")
            }else {
                if let snapshotDocuments =  querySnapshot?.documents{
                    for doc in snapshotDocuments{
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String , let messageBody = data[K.FStore.bodyField] as? String {
                            
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                            
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        
        if let messageBody = messageTextField.text , let messageSender = Auth.auth().currentUser?.email{
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField : messageSender, K.FStore.bodyField : messageBody]) { (error) in
                if let e = error {
                    print("the error is", "\(e)")
                }else{
                    print("Data saved")
                }
            }
            
        }
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

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label?.text = messages[indexPath.row].body
        //cell.messageBubble.backgroundColor = .blue
        return cell
        
    }
    
    
}

extension ChatViewController: UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
