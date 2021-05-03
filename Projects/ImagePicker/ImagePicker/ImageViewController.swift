//
//  ViewController.swift
//  ImagePicker
//
//  Created by Angela Garrovillas on 10/1/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit
import Photos


class ImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        askForPermission()
        
    }
    func openImagePicker() {
        DispatchQueue.main.async {
            //open up that image picker thing, add it
            let imagePickerViewController = UIImagePickerController()
            imagePickerViewController.delegate = self
            //but this delegate needs both UIImagePickerControllerDelegate and UINavigationControllerDelegate
            self.present(imagePickerViewController, animated: true, completion: nil)
        }
        
    }
    func askForCameraAccess() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return
        case .denied:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    return
                }
            }
//            let alert = UIAlertController(title: "Cannot access Camera", message: "User did not give access to Camera, go to settings to change that", preferredStyle: .alert)
//
//            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
//                self.dismiss(animated: true, completion: nil)
//            }
//            alert.addAction(okAction)
//            self.present(alert, animated: true, completion: nil)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    return
                }
            }
        case .restricted:
            return
        @unknown default:
            return
        }
        
        
    }
    func askForPermission() {
        PHPhotoLibrary.requestAuthorization { (authorizationStatus) in
            switch authorizationStatus {
            case .authorized:
                self.openImagePicker()
            case .notDetermined:
                return
            case .restricted:
                return
            case .denied:
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Cannot access PhotoLibrary", message: "User did not give access to PhotoLibrary, or give access", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                        self.dismiss(animated: true, completion: nil)
                    }
                    let giveAccess = UIAlertAction(title: "Give Access", style: .default) { _ in
                        self.openImagePicker()
                        return
                    }
                    alert.addAction(okAction)
                    alert.addAction(giveAccess)
                    self.present(alert, animated: true, completion: nil)
                }
                
            @unknown default:
                return
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askForCameraAccess()
    }


}

extension ImageViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //info is a dictionary
        guard let image = info[.originalImage] as? UIImage else {
            //couldn't get image :<
            return
        }
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }
}
