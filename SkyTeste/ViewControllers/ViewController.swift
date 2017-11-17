//
//  ViewController.swift
//  SkyTeste
//
//  Created by Vinicius Torres on 11/17/17.
//  Copyright © 2017 Vinicius Torres. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate var listMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cine SKY"
        //self.navigationController?.navigationBar.titleTextAttributes = UIFont(name: "", size: <#T##CGFloat#>)
        
        self.collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
        
        carregarDados()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func carregarDados() {
        
        
        REST.getMovies(callback: { result in
            
            if result.response!.statusCode != 200 {
                print("Erro httpRequest")
            } else {
                
                let jsonObject = JSON(data: result.data!)
                
                if let arrayMovies = jsonObject.arrayObject {
                    for movieObject in arrayMovies {
                        
                        let movie = Movie(json: JSON(movieObject))
                        self.listMovies.append(movie)
                        
                        self.collectionView.reloadData()
                        
                    }
                    
                }
                
            }
            
        })
        
        
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var viewSize = CGSize()
        
        if let width = collectionViewLayout.collectionView?.bounds.size.width {
            viewSize.width = width/2 - 10
            viewSize.height = 260
            
        }else {
            viewSize.width = 128; viewSize.height = 128
            
        }
        
        return viewSize
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return listMovies.count
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.movieIV.layer.cornerRadius = 2
        
        REST.downloadImage(url: listMovies[indexPath.row].cover_url!, callback: { response in
            
            let image = UIImage(data: response.data!)
            
            cell.movieIV.image = image
            
        })
        
        cell.tituloLbl.text = listMovies[indexPath.row].title
        
        return cell
    }
    
    
}

