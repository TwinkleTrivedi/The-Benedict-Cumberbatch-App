//
//  LoadCumberbatchMovies.swift
//  The Benedict Cumberbatch App
//
//  Created by Twinkle T on 2022-06-24.
//

import Foundation
import UIKit

class LoadCumberbatchMovies {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let apikey="?api_key=0d8ec3e33976d97a6c12cd02ecad0d15"
    
    func loadMovies(_ suburl:String?,completed: @escaping (MovieCast?, Error?) -> ()) {
    
        let url = URL(string: "\(delegate.url)\(suburl ?? "")\(apikey)")
   
    URLSession.shared.dataTask(with: url!) { (data,response,error) in
        if error == nil {
            do {
                let movieCast = try JSONDecoder().decode(MovieCast.self, from: data!)
                print("cumberbath cast:\(movieCast)")
                DispatchQueue.main.async {
                    completed(movieCast,error)
                }
            }
            catch{
                DispatchQueue.main.async {
                    completed(nil,error)
                }
            }
        }
        
    }.resume()
}
    
    
    func loadsimilarMovies(_ suburl:String?,completed: @escaping (MoviesResults?, Error?) -> ()) {
    

        let url = URL(string: "\(delegate.url)\(suburl ?? "")\(apikey)")
   
    URLSession.shared.dataTask(with: url!) { (data,response,error) in
        if error == nil {
            do {
                let movieCast = try JSONDecoder().decode(MoviesResults.self, from: data!)
                print("cumberbath cast:\(movieCast)")
                DispatchQueue.main.async {
                    completed(movieCast,error)
                }
            }
            catch{
                DispatchQueue.main.async {
                    completed(nil,error)
                }
            }
        }
        
    }.resume()
}
    func loadImages(_ urlstr: String?, completed: @escaping (UIImage?) -> ()) {
        
        if let img = URL(string: urlstr ?? "") {
            do {
                let imageData = try Data(contentsOf: img)
                completed(UIImage(data: imageData))
            } catch {
                completed(#imageLiteral(resourceName: "noimg"))
                print("Unable to load image")
            }
        }
    }
    
}
