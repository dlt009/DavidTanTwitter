//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by David Tan on 3/4/18.
//  Copyright © 2018 David Tan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameTextLabel: UILabel!
    @IBOutlet weak var screenNameTextLabel: UILabel!
    
    @IBOutlet weak var dateTextLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var repliesButton: UIButton!
    @IBOutlet weak var repliesTextLabel: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetTextLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteTextLabel: UILabel!
    
    @IBOutlet weak var messageButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            
            usernameTextLabel.text = tweet.name
            screenNameTextLabel.text = "@\(tweet.screenName)"
            
            dateTextLabel.text = tweet.createdAtString
            
            repliesTextLabel.text = "\(tweet.replyCount ?? 0)"
            retweetTextLabel.text = "\(tweet.retweetCount)"
            favoriteTextLabel.text = "\(tweet.favoriteCount ?? 0)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
