//
//  MoviesController.swift
//  SkyTeste
//
//  Created by Vinicius Torres on 11/17/17.
//  Copyright © 2017 Vinicius Torres. All rights reserved.
//

import UIKit
import SwiftyJSON

class MoviesController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!

    fileprivate let sectionInsets = UIEdgeInsets(top: 0, left: 16.0, bottom: 0, right: 16.0)
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate var listMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cine SKY"
        
        self.collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        self.collectionView.contentInset = sectionInsets
        carregarDados()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func carregarDados() {
        Services.getMovies(onComplete: { result in
            self.listMovies = result
            self.collectionView.reloadData()
        })
    }
    
    
}

extension MoviesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var viewSize = CGSize()
        
        viewSize.width = collectionView.frame.width/itemsPerRow - self.sectionInsets.left - self.sectionInsets.right/2
        viewSize.height = (viewSize.width/3) * 4 + 60
        
        return viewSize
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.prepare(withMovie: listMovies[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetailsController
        controller.movie = listMovies[indexPath.row]
        self.present(controller, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.collectionViewHeight.constant = self.collectionView.contentSize.height
    }
    
    
}

