//
//  ImageUploader.swift
//  TwitterClone_iOS
//
//  Created by SAURAV SUMAN on 30/08/23.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Debug: Failed to upload image with error: \(error.localizedDescription)")
            }
            
            ref.downloadURL{ imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
