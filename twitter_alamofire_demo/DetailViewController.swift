//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by David Tan on 3/14/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {

    var tweet: Tweet?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameTextLabel: UILabel!
    @IBOutlet weak var screenNameTextLabel: UILabel!
    
    @IBOutlet weak var dateTextLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var repliesButton: UIButton!
    //@IBOutlet weak var repliesTextLabel: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetTextLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let tweet = tweet {
            tweetTextLabel.text = tweet.text
            
            usernameTextLabel.text = tweet.name
            screenNameTextLabel.text = "@\(tweet.screenName)"
            
            profileImageView.af_setImage(withURL: tweet.authorProfilePicURL)
            profileImageView.layer.cornerRadius = 5
            profileImageView.clipsToBounds = true
            
            dateTextLabel.text = tweet.createdAtString
            
            retweetTextLabel.text = "\(tweet.retweetCount)"
            favoriteTextLabel.text = "\(tweet.favoriteCount)"
        }
    }
    
    @IBAction func didTapRetweet(_ sender: Any) {
        
        // If we did not retweet the post yet
        if tweet?.retweeted == false {
            tweet?.retweeted = true
            tweet?.retweetCount += 1
            retweetTextLabel.text = "\(tweet?.retweetCount ?? 0)"
            
            APIManager.shared.retweet(tweet!) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error retweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully retweeted the following Tweet: \n\(tweet.text)")
                }
            }
        }
            // If we already retweeted it, we untweet the post
        else {
            tweet?.retweeted = false
            tweet?.retweetCount -= 1
            retweetTextLabel.text = "\(tweet?.retweetCount ?? 0)"
            
            APIManager.shared.unretweet(tweet!) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unretweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unretweeted the following Tweet: \n\(tweet.text)")
                    
                }
            }
            
        }
        
    }
    
    @IBAction func didTapFavorite(_ sender: Any) {
        
        print("Testing: fav status is: \(tweet?.favorited)")
        // If we did not favorite yet
        if tweet?.favorited == false {
            tweet?.favorited = true
            tweet?.favoriteCount += 1
            favoriteTextLabel.text = "\(tweet?.favoriteCount)"
            
            APIManager.shared.favorite(tweet!) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
            // If we favorited already, unfavorite it
        else {
            tweet?.favorited = false
            tweet?.favoriteCount -= 1
            favoriteTextLabel.text = "\(tweet?.favoriteCount)"
            
            APIManager.shared.unfavorite(tweet!) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        
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
