//
//  ViewController.swift
//  PopImageExample
//
//  Created by CJ Willis on 6/6/20.
//  Copyright © 2020 CJ Willis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var chosenPhotoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func chooseButtonPressed(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
    
    // MARK: UIImagePickerController Delegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            chosenPhotoView.image = image
        } else {
            print("No image found.")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    // TODO: Read up on UIContextMenuInteraction for the long press behavior.
    
}

