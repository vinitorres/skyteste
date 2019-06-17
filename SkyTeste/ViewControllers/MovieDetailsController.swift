//
//  MovieDetailsController.swift
//  SkyTeste
//
//  Created by André Vinícius Torres Conrado on 17/06/19.
//  Copyright © 2019 Vinicius Torres. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailsController: UIViewController {

    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var coverIV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var overviewLbl: UILabel!

    var movie = Movie()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.closeBtn.layer.cornerRadius = self.closeBtn.frame.size.height/2
        
        self.titleLbl.text = movie.title
        self.yearLbl.text = movie.release_year
        self.durationLbl.text = movie.duration
        self.overviewLbl.text = movie.overview

        self.coverIV.kf.indicatorType = .activity
        self.coverIV.kf.indicator?.view.tintColor  = .white
        self.coverIV.kf.indicator?.startAnimatingView()
        let resource = ImageResource(downloadURL: URL(string: movie.cover_url)!, cacheKey: movie.cover_url)
        self.coverIV.kf.setImage(with: resource)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
