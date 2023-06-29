//
//  ViewController.swift
//  Flixster
//
//  Created by Faye Alangi on 3/5/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
    var movies : [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movies = Movie.mockMovies
        print(movies)
        tableView.dataSource=self
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView.backgroundColor = UIColor.clear
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // TODO: Pt 1 - Pass the selected movie to the detail view controller
            
            // Get the cell that triggered the segue
            if let cell = sender as? UITableViewCell,
               // Get the index path of the cell from the table view
               let indexPath = tableView.indexPath(for: cell),
               // Get the detail view controller
               let detailViewController = segue.destination as? DetailViewController {

                // Use the index path to get the associated track
                let movie = movies[indexPath.row]

                // Set the track on the detail view controller
                detailViewController.movie = movie
            }

        }

        // TODO: Pt 1 - Add table view data source methods
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Get the index path ofr the current selected table view row (if it exists)
        if let indexPath = tableView.indexPathForSelectedRow {
            
            // Deselect the row at the corresponding index path
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }


}

