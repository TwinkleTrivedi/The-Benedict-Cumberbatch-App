//
//  subViews.swift
//  The Benedict Cumberbatch App
//
//  Created by Twinkle T on 2022-06-26.
//

import Foundation
import UIKit

class subViews: UIView {
     let overview : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
     let overviewtitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    let similarlbl : UILabel = {
       let lbl = UILabel()
       lbl.textColor = .blue
       lbl.font = UIFont.boldSystemFont(ofSize: 18)
       lbl.textAlignment = .left
       lbl.numberOfLines = 0
       return lbl
   }()
    
      let MovieImage : UIImageView = {
         let imgView = UIImageView(image: #imageLiteral(resourceName: "noimg"))
         imgView.contentMode = .scaleAspectFit
         imgView.clipsToBounds = true
         imgView.layer.shadowColor = UIColor.gray.cgColor
         imgView.layer.shadowOpacity = 1
         imgView.layer.shadowRadius = 8
         return imgView
     }()
    
}
