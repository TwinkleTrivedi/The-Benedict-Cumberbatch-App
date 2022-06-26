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
    
    private let overview : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    private let overviewtitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private let MovieImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "noimg"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\(MovieDetails?.original_title ?? "")"
        view.backgroundColor = .white
        view.addSubview(MovieImage)
        view.addSubview(overviewtitle)
        view.addSubview(overview)
        MovieImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop:100, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 300, height: 300, enableInsets: false)
        overviewtitle.anchor(top: MovieImage.bottomAnchor, left: view.leftAnchor, bottom: overview.topAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 5, width: 200, height: 20, enableInsets: false)
        overview.anchor(top: overviewtitle.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 50, paddingRight: 5, width: 200, height: 300, enableInsets: false)
        MovieData()
    }
    
    func MovieData(){
        loadmovies.loadImages("\(appdelegate.imageurl)\(MovieDetails?.poster_path ?? "")") {image  in
            self.MovieImage.image = image
                    }
        overviewtitle.text="Movie Overview:"
        overview.text = "\(MovieDetails?.overview ?? "")"
    }
    
}
