//
//  ViewController.swift
//  Unit4Lesson2-Profile Picture Example
//
//  Created by Rick Bowen on 9/23/14.
//  Copyright (c) 2014 Rick Bowen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.alpha = 0.0
        
        let myProfilePicutreURL = NSURL(string: "http://graph.facebook.com/bobdylan/picture?type=square&width=640&height=640")
        
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        activityIndicatorView.center = self.view.center
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
            let imageData = NSData(contentsOfURL: myProfilePicutreURL)
            
            NSOperationQueue.mainQueue().addOperationWithBlock{
                self.imageView.image = UIImage(data: imageData)
                activityIndicatorView.stopAnimating()
                
                UIView.animateWithDuration(1.0, animations: {
                    self.imageView.alpha = 1.0
                    },
                    completion: {
                        (value: Bool) in println("Animation complete!")
                    }
                )
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

