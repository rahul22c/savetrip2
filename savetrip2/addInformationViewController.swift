//
//  addInformationViewController.swift
//  savetrip2
//
//  Created by Rahul Chandrawanshi on 10/2/16.
//  Copyright © 2016 Rahul Chandrawanshi. All rights reserved.
//

import UIKit

class addInformationViewController: UIViewController {
    
    
    //MARK: Properties
    
    
    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var information: UITextView!
    
    var tripimage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
    self.images.image = tripimage
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
