//
//  MovieCollectionViewCell.swift
//  SkyTeste
//
//  Created by Vinicius Torres on 11/17/17.
//  Copyright © 2017 Vinicius Torres. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieIV: UIImageView!
    @IBOutlet weak var tituloLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func resetValues() {
        self.tituloLbl.text = ""
        self.movieIV.image = nil
    }
    
    func prepare(withMovie movie: Movie) {
    
        self.resetValues()
    
        self.movieIV.layer.cornerRadius = 4
        self.movieIV.kf.indicatorType = .activity
        self.movieIV.kf.indicator?.view.tintColor  = .white
        self.movieIV.kf.indicator?.startAnimatingView()
        let resource = ImageResource(downloadURL: URL(string: movie.cover_url)!, cacheKey: movie.cover_url)
        self.movieIV.kf.setImage(with: resource)

        self.tituloLbl.text = movie.title
    }
}
