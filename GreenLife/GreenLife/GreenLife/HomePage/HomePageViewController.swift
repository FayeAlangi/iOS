//
//  ViewController.swift
//  GreenLife
//
//  Created by Faye Alangi on 4/14/23.
//

import UIKit
import ParseSwift
import Alamofire
import AlamofireImage

class HomePageViewController: UIViewController {


    @IBOutlet weak var profileImageIcon: UIBarButtonItem!
    @IBOutlet var shopLocalTapGesture: UITapGestureRecognizer!
    @IBOutlet var volunteerTapGesture: UITapGestureRecognizer!
    @IBOutlet var recycleTapGesture: UITapGestureRecognizer!
    @IBOutlet weak var shopLocalImageView: UIImageView!{
        didSet{
            shopLocalImageView.isUserInteractionEnabled = true
//            shopLocalImageView.alpha = 0.7
        }
    }
    @IBOutlet weak var volunteerImageView: UIImageView!{
        didSet{
            volunteerImageView.isUserInteractionEnabled = true
//            volunteerImageView.alpha = 0.7
        }
    }
    @IBOutlet weak var recycleImageView: UIImageView!{
        didSet{
            recycleImageView.isUserInteractionEnabled = true
//            recycleImageView.alpha=0.7
        }
    }
    private var imageDataRequest: DataRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(hue: 0.3806, saturation: 0.13, brightness: 1, alpha: 1.0)
       

        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        showUserProfileImage()
    }
    //this method is not used for now
    private func showUserProfileImage(){
        let user = User.current
        // Image
        if let imageFile = user?.profileImageFile,
           let imageUrl = imageFile.url {

            // Use AlamofireImage helper to fetch remote image from URL
            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    // Set image view image with fetched image
                    self?.profileImageIcon.image = image
                case .failure(let error):
                    print("❌ Error fetching image: \(error.localizedDescription)")
                    break
                }
            }
        }
    }
    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        print("did tap image view", sender)
        if sender == recycleTapGesture {
            self.performSegue(withIdentifier: "recycleViewController", sender: recycleTapGesture)}
        
        if sender == volunteerTapGesture {  self.performSegue(withIdentifier: "volunteerViewController", sender: volunteerTapGesture)
 
        }

        if sender == shopLocalTapGesture{
                    self.performSegue(withIdentifier: "shopLocalViewController", sender: shopLocalTapGesture)
        }
    }
    
    
  
    
    @IBAction func onLogOutTapped(_ sender: Any){
        showConfirmLogoutAlert()
    }
    
    private func showConfirmLogoutAlert() {
        let alertController = UIAlertController(title: "Log out of \(User.current?.username ?? "current account")?", message: nil, preferredStyle: .alert)
        let logOutAction = UIAlertAction(title: "Log out", style: .destructive) { _ in
            NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(logOutAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
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
