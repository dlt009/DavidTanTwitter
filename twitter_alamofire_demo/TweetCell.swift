//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by David Tan on 3/4/18.
//  Copyright © 2018 David Tan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var repliesImageView: UIImageView!
    @IBOutlet weak var repliesTextLabel: UILabel!
    
    @IBOutlet weak var retweetImageView: UIImageView!
    @IBOutlet weak var retweetTextLabel: UILabel!
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteTextLabel: UILabel!
    
    @IBOutlet weak var messageImageView: UIImageView!
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            repliesTextLabel.text = "140"
            retweetTextLabel.text = "360"
            favoriteTextLabel.text = "4"
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
