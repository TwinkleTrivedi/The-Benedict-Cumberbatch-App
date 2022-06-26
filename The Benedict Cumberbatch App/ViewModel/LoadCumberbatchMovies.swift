//
//  LoadCumberbatchMovies.swift
//  The Benedict Cumberbatch App
//
//  Created by Twinkle T on 2022-06-24.
//

import Foundation
import UIKit

class LoadCumberbatchMovies {
    
func loadMovies(completed: @escaping (MovieCast?, Error?) -> ()) {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let url = URL(string: delegate.url)
   
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
