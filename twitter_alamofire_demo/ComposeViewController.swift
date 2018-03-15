//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by David Tan on 3/14/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    var tweet: Tweet?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var characterLabel: UILabel!
    
    @IBAction func didTapTweet(_ sender: Any) {
        tweet?.text = textView.text
        APIManager.shared.compose(tweet!) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error composing tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully composed the following Tweet: \n\(tweet.text)")
                self.dismiss(animated: true, completion: nil)
                
            }
        }
    }
    
    @IBAction func didTapClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Allow or disallow new text based on character count
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Allow or disallow the new text
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // Update Character Count Label
        characterLabel.text = "\(newText.count)"
        
        // The new text should be allowed? True/False
        return newText.count < characterLimit
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
