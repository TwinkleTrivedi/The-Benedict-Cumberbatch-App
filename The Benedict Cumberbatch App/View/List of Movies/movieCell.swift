//
//  movieCell.swift
//  The Benedict Cumberbatch App
//
//  Created by Twinkle T on 2022-06-24.
//

import UIKit

let appdelegate = UIApplication.shared.delegate as! AppDelegate
let loadmovies = LoadCumberbatchMovies()

class movieCell : UITableViewCell {
    
    var movies : CumberbatchMovies? {
        didSet {
            loadmovies.loadImages("\(appdelegate.imageurl)\(movies?.poster_path ?? "")") {image  in
                self.MovieImage.image = image
                        }
            movieTitle.text = movies?.title
        }
        
    }
    
    
    private let movieTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let MovieImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "noimg"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    private let dataView : UIView = {
        let dataview = UIView()
        dataview.backgroundColor = .white
        dataview.layer.borderWidth = 2
        dataview.layer.borderColor = UIColor.black.cgColor
        return dataview
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        dataView.addSubview(MovieImage)
        dataView.addSubview(movieTitle)
        contentView.addSubview(dataView)
        dataView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 100, height: 100, enableInsets: false)
        MovieImage.anchor(top: dataView.topAnchor, left: dataView.leftAnchor, bottom: dataView.bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 100, height: 100, enableInsets: false)
        movieTitle.anchor(top: dataView.topAnchor, left: MovieImage.rightAnchor, bottom: nil, right: dataView.rightAnchor, paddingTop: 15, paddingLeft: 10, paddingBottom: 0, paddingRight: 5, width: dataView.frame.size.width, height: 0, enableInsets: false)
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

