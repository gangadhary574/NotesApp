//
//  ComposedViewController.swift
//  messagingapp
//
//  Created by student on 4/12/20.
//  Copyright © 2020 Gangadhar Yerramsetti. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var ref: DatabaseReference!
    
    
    @objc func addPost() {
        ref?.child("Posts").childByAutoId().setValue(textView.text)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func cancelPost() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ref = FIRDatbase.database()
        ref = Database.database().reference()
        
        
        navigationItem.title = "Compose Here"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancelPost", style: .done, target: self, action: #selector(cancelPost))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "addPost", style: .done
            , target: self, action: #selector(addPost))
        // Do any additional setup after loading the view.
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
