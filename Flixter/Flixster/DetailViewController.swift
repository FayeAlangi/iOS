//
//  DetailViewController.swift
//  Flixster
//
//  Created by Faye Alangi on 3/5/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    var movie: Movie!
    
    @IBOutlet weak var movieBackdrop: UIImageView!
    
    @IBOutlet weak var votesCountLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        popularityLabel.text = String(movie.popularity)
        voteAverageLabel.text = String(movie.voteAverage)
        votesCountLabel.text = String(movie.voteCount)
        Nuke.loadImage(with: movie.backdropURL, into: movieBackdrop)
        
    }
}

