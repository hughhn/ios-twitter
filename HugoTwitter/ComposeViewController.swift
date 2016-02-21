//
//  ComposeViewController.swift
//  HugoTwitter
//
//  Created by Hieu Nguyen on 2/20/16.
//  Copyright © 2016 Hugo Nguyen. All rights reserved.
//

import UIKit

@objc protocol ComposeViewControllerDelegate {
    optional func onComposeViewClosed(composeViewController: ComposeViewController)
}

class ComposeViewController: UIViewController {

    weak var delegate: ComposeViewControllerDelegate?
    
    var user: User?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetTextField: UITextField!
    @IBOutlet weak var closeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileImageView.layer.cornerRadius = 5
        profileImageView.clipsToBounds = true
        if user != nil {
            profileImageView.setImageWithURL(NSURL(string: user!.profileImageUrl!)!)
        }
        
        let closeImage = UIImage(named: "icon_close")
        closeBtn.setImage(closeImage!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: UIControlState.Normal)
        closeBtn.tintColor = twitterColor
        
        tweetTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClose(sender: AnyObject) {
        delegate?.onComposeViewClosed?(self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
