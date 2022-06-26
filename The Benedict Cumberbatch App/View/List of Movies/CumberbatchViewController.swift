//
//  ViewController.swift
//  The Benedict Cumberbatch App
//
//  Created by Twinkle T on 2022-06-24.
//

import UIKit

class CumberbatchViewController: UIViewController {
    
    let cellId = "movieCell"
    let delegate = UIApplication.shared.delegate as! AppDelegate
    private let tableView = UITableView()
    private var cumberbatchMovies = [CumberbatchMovies]()
    let loadmovies = LoadCumberbatchMovies()
    private let loadingIndicator = UIActivityIndicatorView()
    let cache = NSCache<NSString, MovieCast>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "The Benedict Cumberbatch Movies"
        setupTableView()
        if let cachedVersion = cache.object(forKey: "CachedObject") {
            // use the cached version
            self.cumberbatchMovies = cachedVersion.cast
        } else {
            loadmovies.loadMovies(){ movies, error in
                if let movies = movies {
                    self.cumberbatchMovies=movies.cast
                    self.cache.setObject(movies, forKey: "CachedObject")
                }
                else if error != nil{
                    self.showErrorAlert()
                }
                self.tableView.reloadData()
            }
           
        }
        
       
    }
    
    private func setupTableView() {
        tableView.separatorColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = 100
        tableView.register(movieCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Something went wrong", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension CumberbatchViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cumberbatchMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! movieCell
        let currentLastItem = cumberbatchMovies[indexPath.row]
        cell.movies = currentLastItem
        cell.layer.cornerRadius = 2
        cell.clipsToBounds = true
        return cell

    }
    
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        let nextVC = MovieDetailsViewController()
        nextVC.MovieDetails = cumberbatchMovies[indexPath.row]
//        nextVC.selectedImage = pictures[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true
        )
        print("row tapped \(cumberbatchMovies[indexPath.row])")
    }
}
