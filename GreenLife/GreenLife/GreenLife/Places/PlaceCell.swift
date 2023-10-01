//
//  PlaceCell.swift
//  GreenLife
//
//  Created by Faye Alangi on 4/20/23.
//

import UIKit
import Nuke

class PlaceCell : UITableViewCell{
    
    
    
    @IBOutlet weak var zipCode: UILabel!
    @IBOutlet weak var cityState: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var placePhoneNumber: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    
  
 
    
  
    @IBOutlet weak var placeTitleLabel: UILabel!
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

        /// Configures the cell's UI for the given track.
    func configure(with place: Place) {
        name.text = place.name
        address.text = place.address
        cityState.text = "\(place.city), \(place.state)"
       
        zipCode.text = place.zipCode
        placePhoneNumber.text = place.phoneNumber
        
        Nuke.loadImage(with: place.placeImageUrl, into : placeImageView)
   
        
//        placeAddressLabel.text = place.address
//        placePhoneNumber.text = place.phoneNumber
//
//        Nuke.loadImage(with: place.placeImageUrl, into : placeImageView)
//            trackNameLabel.text = track.trackName
//            artistNameLabel.text = track.artistName
//
//            // Load image async via Nuke library image loading helper method
//            Nuke.loadImage(with: track.artworkUrl100, into: trackImageView)
        }
}
