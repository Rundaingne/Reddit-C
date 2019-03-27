//
//  EKKPostTableViewCell.swift
//  Reddit-C
//
//  Created by Brooke Kumpunen on 3/27/19.
//  Copyright © 2019 Rund LLC. All rights reserved.
//

import UIKit

class EKKPostTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upvotesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    var post: EKKPost? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Methods
    func updateViews() {
        guard let post = post else {return}
        titleLabel.text = post.title
        upvotesLabel.text = "\(post.ups)"
        commentsLabel.text = "\(post.commentCount)"
    }

}
