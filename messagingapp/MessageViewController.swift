//
//  MessageViewController.swift
//  messagingapp
//
//  Created by student on 4/12/20.
//  Copyright © 2020 Gangadhar Yerramsetti. All rights reserved.
//

import UIKit
import Firebase
class MessageViewController: UIViewController {

    
    @IBOutlet weak var messageTextView: UITextView!
  
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //Ask Rogers how to top left align labels while giving them enough space for lots of text
        //explanationLBL.numberOfLines = 30
        //explanationLBL.sizeToFit()
        //exerciseName.text = exercise.name.uppercased()
        //explanationLBL.text = exercise.explanation
    
        ref?.child("Posts").childByAutoId().setValue(messageTextView.text)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
