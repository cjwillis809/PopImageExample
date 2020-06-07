//
//  ViewController.swift
//  PopImageExample
//
//  Created by CJ Willis on 6/6/20.
//  Copyright © 2020 CJ Willis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var chosenPhotoView: UIImageView! // Be sure to have User Interaction enabled
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add interaction to the photo view.
        let interaction = UIContextMenuInteraction(delegate: self)
        chosenPhotoView.addInteraction(interaction)
    }
    
    /// Creates the action to remove the image from the screen
    func makeRemoveAction() -> UIAction {
        let removeAttributes = UIMenuElement.Attributes.destructive
        let deleteImage = UIImage(systemName: "delete.left")
        
        return UIAction(title: "Delete", image: deleteImage, identifier: nil, attributes: removeAttributes) { _ in
            
            // Add alert to confirm the deletion.
            let alert = UIAlertController(title: "Delete Image", message: "Are you sure you want to remove this image?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default) { _ in
                self.chosenPhotoView.image = nil
            })
            alert.addAction(UIAlertAction(title: "No", style: .destructive))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /// Action when choose button is pressed
    @IBAction func chooseButtonPressed(_ sender: Any) {
        // Open the default photo library picker.
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
}

// MARK: UIImagePickerController Delegate Methods
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /// Set the image view to the image the user has chosen.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            chosenPhotoView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UIContextMenuInteractionDelegate
extension ViewController: UIContextMenuInteractionDelegate {
    
    /// Configures the context menu
    func contextMenuInteraction(
    _ interaction: UIContextMenuInteraction,
    configurationForMenuAtLocation location: CGPoint)
      -> UIContextMenuConfiguration? {
        
        // If no image is present, no need to show context menu.
        guard chosenPhotoView.image != nil else { return nil}
        
        // Build and return context menu configuration
        return UIContextMenuConfiguration(
          identifier: nil,
          previewProvider: nil,
          actionProvider: { _ in
            let removeFunction = self.makeRemoveAction()
            let children: [UIMenuElement] = [removeFunction]
            return UIMenu(title: "", children: children)
        })
    }
}
