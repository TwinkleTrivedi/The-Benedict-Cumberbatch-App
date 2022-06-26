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
    }
    
    func MovieData(){
        loadmovies.loadImages("\(appdelegate.imageurl)\(MovieDetails?.poster_path ?? "")") {image  in
            self.subview.MovieImage.image = image
                    }
        subview.overviewtitle.text="Movie Synopsis:"
        subview.overview.text = "\(MovieDetails?.overview ?? "")"
    }
    
}
