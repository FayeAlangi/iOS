//
//  PlacesViewController.swift
//  GreenLife
//
//  Created by Faye Alangi on 4/20/23.
//

import UIKit
import Foundation
class ClothingDonationCenterViewController: UIViewController, UITableViewDataSource {
    
    var zipcode : String?
    var places :[Place] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(zipcode!)
        
        let apiKey = "***"
        let url = URL(string: "https://api.yelp.com/v3/businesses/search?location=\(zipcode!)&term=clothing%20donation&sort_by=best_match&limit=20")!
        var request = URLRequest(url : url)
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "Get"
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                    // Handle any errors
                    if let error = error {
                        print("❌ Network error: \(error.localizedDescription)")
                    }

            
            do {
                         
                var placesList :[Place] = []
                let json = try JSONSerialization.jsonObject(with: data!, options: [])

                let response = json as? NSDictionary
                let businesses = response!.value(forKey: "businesses") as? [NSDictionary]
                print(businesses?.first as Any)
                
                for business in businesses! {
                    var place = Place (name: "", address: "",city: "",state: "", zipCode: "", phoneNumber: "", placeImageUrl: URL(string: "url")!)
                    place.name = (business.value(forKey: "name") as? String)!
                    let location = business.value(forKey: "location") as? NSDictionary
                    print(location!.value(forKey: "address1")!)
                    let address=(location!.value(forKey: "address1") as? String)!
                    place.address = address
                    
                    let city=(location!.value(forKey: "city") as? String)!
                    place.city = city
                    let state=(location!.value(forKey: "state") as? String)!
                    place.state = state
                    
                    let zipCode=(location!.value(forKey: "zip_code") as? String)!
                    place.zipCode = zipCode
                    
                    place.placeImageUrl = URL(string:(business.value(forKey:  "image_url") as? String)!)!
                    
                    place.phoneNumber =  (business.value(forKey: "display_phone") as? String)!
                   
                    print(business.value(forKey: "name") as? String as Any)
                    placesList.append(place)
                }
                            
 
                            DispatchQueue.main.async {
                                                
                            /// Set the ViewController's tracks property as this is the one the TableView references
                            self?.places = placesList
                                                
                            /// Make the TableView reload now that we have new data
                            self?.tableView.reloadData()
                            }
                        print("✅ \(placesList)")
                        } catch {
                            print("❌ Error parsing JSON: \(error.localizedDescription)")
                        }
                    }
                    

                    // Initiate the network request
                    task.resume()
                    print("\n\n👋 Below the closure\n\n")

                    tableView.dataSource = self
                    tableView.rowHeight = UITableView.automaticDimension

                    
                }

                override func viewWillAppear(_ animated: Bool) {
                    super.viewWillAppear(animated)

                    // TODO: Deselect any selected table view rows
                    // Get the index path for the current selected table view row (if exists)
                    if let indexPath = tableView.indexPathForSelectedRow {

                        // Deslect the row at the corresponding index path
                        tableView.deselectRow(at: indexPath, animated: true)
                    }
                }



                func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return places.count
                }

                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

                    // Get a cell with identifier, "TrackCell"
                    // the `dequeueReusableCell(withIdentifier:)` method just returns a generic UITableViewCell so it's necessary to cast it to our specific custom cell.
                    let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceCell

                    // Get the track that corresponds to the table view row
                    let place = places[indexPath.row]

                    // Configure the cell with it's associated track
                    cell.configure(with: place)

                    // return the cell for display in the table view
                    return cell
                }
                                           
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
