//
//  ProfileViewController.swift
//  GreenLife
//
//  Created by Faye Alangi on 4/17/23.
//

import UIKit
import ParseSwift
import PhotosUI
import Alamofire
import AlamofireImage

class ProfileViewController: UIViewController {
   
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var usernameText: UITextField!

    @IBOutlet weak var emailAddressText: UITextField!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    private var pickedImage : UIImage?
    private var imageDataRequest: DataRequest?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hue: 0.3806, saturation: 0.13, brightness: 1, alpha: 1.0)

        
        // Do any additional setup after loading the view.
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        profileImage.backgroundColor = .gray
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showUserProfile()
    }
    //
    private func showUserProfile(){
        let user = User.current
        self.usernameText.text = user?.username
        self.emailAddressText.text = user?.email
        
       
//        if let userImageFile = user?.profileImageFile
//        {self.profileImage.image = UIImage(data: userImageFile.data!)}
     
        if let fisrtName = user?.firstName{
            self.firstNameText.text = fisrtName
        }
        if let lastName = user?.lastName{
            self.lastNameText.text = lastName
        }
        if let address = user?.address{
            self.addressText.text = address
        }
        
        // Image
        if let imageFile = user?.profileImageFile,
           let imageUrl = imageFile.url {

            // Use AlamofireImage helper to fetch remote image from URL
            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    // Set image view image with fetched image
                    self?.profileImage.image = image
                case .failure(let error):
                    print("❌ Error fetching image: \(error.localizedDescription)")
                    break
                }
            }
        }
    
        
        
    }
    @IBAction func onSaveTapped(_ sender : UIButton){
        //        guard let emailAddress = emailAddressText.text,
        //              let password = passwordText.text,
        //              !emailAddress.isEmpty,
        //              !password.isEmpty else{
        //            showMissingFieldsAlert()
        //            return
        //        }
        var user = User.current
        
        user?.firstName = firstNameText.text
        user?.lastName=lastNameText.text
        user?.address = addressText.text
        
        if let profileImage = pickedImage{
            // Create and compress image data (jpeg) from UIImage
            let imageData = profileImage.jpegData(compressionQuality: 0.1)!
            let imageFile = ParseFile(name: "image.jpg", data: imageData)
            user?.profileImageFile = imageFile}
        
        user?.save{[weak self] result in
            switch result{
            case .success(let user):
                print("user successfully saved\(user)")
                DispatchQueue.main.async {
                    
                    self?.saveButton.setTitle("Saved!", for: .normal)
                    self?.saveButton.backgroundColor = UIColor(hue: 0.4444, saturation: 0.29, brightness: 0.84, alpha: 1.0)
                }
                
                
            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }
        
        
        
        
        
    }
    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "email and password can not be empty.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    @IBAction func onTakePhotoTapped(_ sender: Any) {
        // TODO: Pt 2 - Present camera
        // Make sure the user's camera is available
        // NOTE: Camera only available on physical iOS device, not available on simulator.
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("❌📷 Camera not available")
            return
        }

        // Instantiate the image picker
        let imagePicker = UIImagePickerController()

        // Shows the camera (vs the photo library)
        imagePicker.sourceType = .camera

        // Allows user to edit image within image picker flow (i.e. crop, etc.)
        // If you don't want to allow editing, you can leave out this line as the default value of `allowsEditing` is false
        imagePicker.allowsEditing = true

        // The image picker (camera in this case) will return captured photos via it's delegate method to it's assigned delegate.
        // Delegate assignee must conform and implement both `UIImagePickerControllerDelegate` and `UINavigationControllerDelegate`
        imagePicker.delegate = self

        // Present the image picker (camera)
        present(imagePicker, animated: true)


    }
    
    
    
    
    @IBAction func onPickedImageTapped(_ sender: UIBarItem){
        var config = PHPickerConfiguration()
        
        config.filter = .images
        config.preferredAssetRepresentationMode = .current
        config.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


extension ProfileViewController : PHPickerViewControllerDelegate{

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)

        guard let provider = results.first?.itemProvider,
              provider.canLoadObject(ofClass: UIImage.self)else {return}
        provider.loadObject(ofClass: UIImage.self){ [weak self] object, error in
            guard let image = object as? UIImage else{
                self?.showAlert()
                return
            }
            if let error = error {
                self?.showAlert(description: error.localizedDescription)
                return
            }else{
                DispatchQueue.main.async {
                    self?.profileImage.image = image
                    self?.pickedImage = image
        
                    }

                }
            }
        }

    }


extension ProfileViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("❌📷 Unable to get image")
            return
        }

        // Set image on preview image view
        profileImage.image = image

        // Set image to use when saving post
        pickedImage = image
 }
    
}
