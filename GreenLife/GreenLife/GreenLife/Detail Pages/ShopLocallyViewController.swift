//
//  ShopLocallyViewController.swift
//  GreenLife
//
//  Created by Faye Alangi on 4/21/23.
//

import UIKit

class ShopLocallyViewController: UIViewController {
    
    @IBOutlet weak var searchTerm : UITextField!
    @IBOutlet weak var zipCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "findLocalBusinesses"){
            let vc = segue.destination as! LocalShopsViewController
            guard let searchTerm = searchTerm.text,
                  let zipCode = zipCode.text,
                  !searchTerm.isEmpty,
                  !zipCode.isEmpty
                  
            else {
            showMissingFieldsAlert()
            return}
            vc.searchTerm = searchTerm
            vc.zipCode = zipCode
          
            
        }
    }
    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "You need to enter business type and zip code", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

}
