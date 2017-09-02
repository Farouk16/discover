//
//  ExploreCollectionViewCell.swift
//  Discover
//
//  Created by Farouk on 8/29/17.
//  Copyright © 2017 Farouk. All rights reserved.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var exploreTitleLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    
    var interest: Interest? {
        didSet {
            self.updateUI()
        }
    }
    private func updateUI() {
        if let interest = interest {
            featuredImageView.image = interest.featuredImage
            exploreTitleLabel.text = interest.title
            backgroundColorView.backgroundColor = interest.color
        }else{
          featuredImageView.image = nil
          exploreTitleLabel.text = nil
          backgroundColorView.backgroundColor = nil
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 2.5
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 10)
        
        self.clipsToBounds = false
        
    }
}

