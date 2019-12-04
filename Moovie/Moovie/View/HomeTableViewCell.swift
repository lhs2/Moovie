//
//  HomeTableViewCell.swift
//  Moovie
//
//  Created by Luiz Henrique de Sousa on 04/12/19.
//  Copyright © 2019 Luiz Henrique. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

        
        @IBOutlet weak var posterImage: UIImageView!
        @IBOutlet weak var scoreLabel: UILabel!
        @IBOutlet weak var genreLabel: UILabel!
        @IBOutlet weak var releaseDateLabel: UILabel!
        @IBOutlet weak var titleLabel: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            selectionStyle = .none
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        
        func configureCell(model: Movie) {
            if let movieURL = URL(string: model.getPosterPath()) {
                let placeholderImage = #imageLiteral(resourceName: "poster_placeholder")
                posterImage.kf.setImage(with: movieURL, placeholder: placeholderImage)
            } else {
                posterImage.image = #imageLiteral(resourceName: "failed_image_download")
            }
            
            if let vote_average = model.vote_average {
                scoreLabel.text = "\(vote_average)"
            }
            
            if let release_date = model.release_date {
                releaseDateLabel.text = release_date
            }
            
            if let title = model.title {
                titleLabel.text = title
            }
            
            genreLabel.text = model.getFirstGenreId()
            
        }
    

    }
