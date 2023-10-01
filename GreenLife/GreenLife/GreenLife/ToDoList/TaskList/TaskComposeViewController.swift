//
//  TaskComposeViewController.swift
//  GreenLife
//
//  Created by Faye Alangi on 4/21/23.
//
import UIKit
import ParseSwift

class TaskComposeViewController: UIViewController {

        @IBOutlet weak var titleField: UITextField!
        @IBOutlet weak var descriptionField: UITextField!

        // When a new task is created, this closure is called, passing in the newly created task.
        var onComposeTask: ((Task) -> Void)? = nil

        override func viewDidLoad() {
            super.viewDidLoad()

        }

        @IBAction func didTapDoneButton(_ sender: Any) {

            guard let title = titleField.text,
                  let description = descriptionField.text,
                  !title.isEmpty,
                  !description.isEmpty else {
                presentEmptyFieldsAlert()
                return
            }

            let task = Task(username: (User.current?.username)!,title: title , description: description)
//            onComposeTask?(task)
            task.save{ [weak self] result in
                
                // Switch to the main thread for any UI updates
                DispatchQueue.main.async {
                    switch result {
                    case .success(let task):
                        print("✅ Task Saved! \(task)")

                    case .failure(let error):
                        self?.showAlert(description: error.localizedDescription)
                    }
                }
            }
            dismiss(animated: true)
        }

        
        @IBAction func didTapCancelButton(_ sender: Any) {
            dismiss(animated: true)
        }

        private func presentEmptyFieldsAlert() {
            let alertController = UIAlertController(
                title: "Oops...",
                message: "Both title and description fields must be filled out",
                preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okAction)

            present(alertController, animated: true)
        }
    }
