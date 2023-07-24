//
//  ViewController.swift
//  Movie List
//
//  Created by aljon antiola on 6/22/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var moviesViewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        moviesViewModel.populateData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    @IBAction func sortTapped(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Sort movies by", preferredStyle: UIAlertController.Style.alert)
        var title = "Title ascending"
        if self.moviesViewModel.currentSortType == .titleAscending {
            title = "Title ascending ✓"
        }

        alert.addAction(UIAlertAction(title: title, style: UIAlertAction.Style.default, handler: { action in
            _ = self.moviesViewModel.sortData(type: .titleAscending)
            self.tableView.reloadData()
        }))
        
        title = "Title descending"
        if self.moviesViewModel.currentSortType == .titleDescending {
            title = "Title descending ✓"
        }
        
        alert.addAction(UIAlertAction(title: title, style: UIAlertAction.Style.default, handler: { action in
            _ = self.moviesViewModel.sortData(type: .titleDescending)
            self.tableView.reloadData()
        }))
        
        title = "Released date(latest first)"
        if self.moviesViewModel.currentSortType == .releasedDateAscending {
            title = "Released date(latest first) ✓"
        }
        alert.addAction(UIAlertAction(title: title, style: UIAlertAction.Style.default, handler: { action in
            _ = self.moviesViewModel.sortData(type: .releasedDateAscending)
            self.tableView.reloadData()
        }))
        
        title = "Released date(latest last)"
        if self.moviesViewModel.currentSortType == .releasedDateDescending {
            title = "Released date(latest last) ✓"
        }
        alert.addAction(UIAlertAction(title: title, style: UIAlertAction.Style.default, handler: { action in
            _ = self.moviesViewModel.sortData(type: .releasedDateDescending)
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return moviesViewModel.tableView(tableView, cellForRowAt: indexPath)
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedMovie = moviesViewModel.movies[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.movie = selectedMovie
        self.navigationController?.pushViewController(vc!, animated: true)
 
    }
    
    
    
    
}

