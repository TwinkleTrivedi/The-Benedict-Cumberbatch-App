//
//  MovieDetailsView.swift
//  The Benedict Cumberbatch App
//
//  Created by Twinkle T on 2022-06-24.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var MovieDetails:CumberbatchMovies?
    let loadmovies = LoadCumberbatchMovies()
    let subview = subViews()
    var similardatacollection:UICollectionView?
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    private var similarMovies = [CumberbatchMovies]()

  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\(MovieDetails?.original_title ?? "")"
        view.backgroundColor = .white
        view.addSubview(subview.MovieImage)
        view.addSubview(subview.overviewtitle)
        view.addSubview(subview.overview)
        subview.MovieImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: subview.overviewtitle.topAnchor, right: view.rightAnchor, paddingTop:100, paddingLeft: 5, paddingBottom: 15, paddingRight: 0, width: 300, height: 300, enableInsets: false)
        subview.overviewtitle.anchor(top: nil, left: view.leftAnchor, bottom: subview.overview.topAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 5, width: 200, height: 30, enableInsets: false)
        subview.overview.anchor(top: subview.overviewtitle.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 50, paddingRight: 5, width: 200, height: 0, enableInsets: false)
        MovieData()
        addCollectionview()
        view.addSubview(similardatacollection ?? UICollectionView())
    }
    
    func MovieData(){
        loadmovies.loadImages("\(appdelegate.imageurl)\(MovieDetails?.poster_path ?? "")") {image  in
            self.subview.MovieImage.image = image
                    }
        subview.overviewtitle.text="Movie Synopsis:"
        subview.overview.text = "\(MovieDetails?.overview ?? "")"
        
        loadmovies.loadsimilarMovies("movie/\(MovieDetails?.id ?? Int())/similar"){ movies, error in
                if let movies = movies {
                    self.similarMovies=movies.results
                }
                else if error != nil{
                  
                }
            self.similardatacollection?.reloadData()
            }
    }
    
    func addCollectionview(){
       
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)
        layout.scrollDirection = .horizontal
        similardatacollection = UICollectionView(frame:CGRect(x: 10, y: view.frame.maxY-(view.frame.height/7)-30, width: view.frame.width, height: view.frame.height/7), collectionViewLayout: layout)
        similardatacollection?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        similardatacollection?.backgroundColor = UIColor.white
        similardatacollection?.dataSource = self
        similardatacollection?.delegate = self
    }
    
}

extension MovieDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.white
        
            let dataview = UIView()
            dataview.backgroundColor = .white
            dataview.layer.borderWidth = 1
            dataview.layer.borderColor = UIColor.black.cgColor
        myCell.addSubview(dataview)
        dataview.anchor(top: myCell.topAnchor, left:myCell.leftAnchor, bottom: myCell.bottomAnchor, right: myCell.rightAnchor, paddingTop: 1, paddingLeft: 1, paddingBottom: 1, paddingRight: 1, width: myCell.frame.width, height: myCell.frame.height, enableInsets: false)
     
        
        let lbl = UILabel()
        lbl.textColor = .blue
        lbl.font = UIFont.boldSystemFont(ofSize: 10)
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        dataview.addSubview(lbl)
        lbl.text="\(similarMovies[indexPath.row].title ?? "")"
        lbl.anchor(top: dataview.topAnchor, left:dataview.leftAnchor, bottom: nil, right: dataview.rightAnchor, paddingTop: 1, paddingLeft: 1, paddingBottom: 1, paddingRight: 1, width: dataview.frame.width-2, height: 15, enableInsets: false)
        
        let imgView = UIImageView(image: #imageLiteral(resourceName: "noimg"))
        loadmovies.loadImages("\(appdelegate.imageurl)\(similarMovies[indexPath.row].poster_path ?? "")") {image  in
            imgView.image = image
                    }
        imgView.contentMode = .scaleAspectFit
        dataview.addSubview(imgView)
        imgView.anchor(top: lbl.bottomAnchor, left:dataview.leftAnchor, bottom: dataview.bottomAnchor, right: dataview.rightAnchor, paddingTop: 1, paddingLeft: 1, paddingBottom: 1, paddingRight: 1, width:0, height: dataview.frame.height-30, enableInsets: false)
   
        
        return myCell
    }
 
}
extension MovieDetailsViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = MovieDetailsViewController()
        nextVC.MovieDetails = similarMovies[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
