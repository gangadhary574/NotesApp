//
//  ViewController.swift
//  messagingapp
//
//  Created by student on 4/12/20.
//  Copyright © 2020 Gangadhar Yerramsetti. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var postData = [String]()
    
 
    @IBAction func writePost(_ sender: Any) {
        
        let postVC = self.storyboard?.instantiateViewController(withIdentifier: "composeVC")
        self.present(postVC!, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference!
    var databaseHandle:DatabaseHandle!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notes"
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        
        // Retrieve the posts and listen for changes
        databaseHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            // Code to execute when a child is added under "posts"
            // Take the value from the snapshot and add it to the PostData array
            
            let post = snapshot.value as? String
            
            if let actualPost = post{
            // Append the data to our postData Array
            self.postData.append(actualPost)
            
                // Reload the tableView
                self.tableView.reloadData()
            }
            
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         return postData.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")!
         
        let notesLBL = cell.viewWithTag(10) as! UILabel
        
        notesLBL.text = postData[indexPath.row]
        
         
         return cell
     }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let messageDetailVC = storyboard?.instantiateViewController(withIdentifier: "MessageDetailViewController") as! MessageViewController
       // excersiceDetailVC.exercise = Exercises.shared.getExercise(indexPath.row)
        
        ref = Database.database().reference()
        
        
        
        // Retrieve the posts and listen for changes
        databaseHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
            // Code to execute when a child is added under "posts"
            // Take the value from the snapshot and add it to the PostData array
            
          //  let post = snapshot.value as? String
            
            messageDetailVC.messageTextView.text = self.postData[indexPath.row]
            
            }
        
        )
        
        
        navigationController?.pushViewController(messageDetailVC, animated: true)
        
    }
    
    

}

