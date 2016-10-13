//
//  TableDetailViewController.swift
//  savetrip2
//
//  Created by Rahul Chandrawanshi on 10/4/16.
//  Copyright © 2016 Rahul Chandrawanshi. All rights reserved.
//

import UIKit

class TableDetailViewController: UIViewController {
    
    
    //MARK: Properties
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var tripName: UILabel!

    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var information: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
