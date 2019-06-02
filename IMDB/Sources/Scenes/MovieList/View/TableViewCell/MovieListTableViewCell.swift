//
//  MovieListTableViewCell.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import UIKit
import Kingfisher

/// MovieListTableViewCell
class MovieListTableViewCell: UITableViewCell {
    
    /// Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        posterImageView.layer.borderWidth = 5
        posterImageView.layer.borderColor = UIColor.posterBorderColor.cgColor
    }
    
    /// Methods
    func populateWithViewModel(cellViewModel: MovieListTableCellViewModel) {
        
        movieTitle.text = cellViewModel.movieTitleText
        movieReleaseDate.text = cellViewModel.movieReleaseDate 
        movieDescription.attributedText = cellViewModel.movieDescription.addSeeMore(maxLength: 80)
        let url = URL(string: cellViewModel.moviePosterUrl )
        posterImageView.kf.setImage(with: url)
    }

}
