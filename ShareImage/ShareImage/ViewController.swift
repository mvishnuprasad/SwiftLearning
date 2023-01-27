//
//  ViewController.swift
//  ShareImage
//
//  Created by vishnu  on 27/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func shareToIG(_ sender: UIButton) {
        
        
        if let instagramStoryURL = URL(string: "instagram-stories://share") {
          if UIApplication.shared.canOpenURL(instagramStoryURL) {
            guard let storyImage = UIImage(named: "book.jpg") else { return }
            guard let storyImageData = storyImage.pngData() else { return }
            let pasteboardItems: [String: Any] = [
            "com.instagram.sharedSticker.stickerImage": storyImageData
            ]
           let pasteboardOptions = [
           UIPasteboard.OptionsKey.expirationDate:
           Date().addingTimeInterval(100)
           ]
           UIPasteboard.general.setItems([pasteboardItems], options:
           pasteboardOptions)
           UIApplication.shared.open(instagramStoryURL, options: [:],
           completionHandler: nil)
           self.dismiss(animated: true, completion: nil)
         } else {
           print("App not found!")
         }
       }
    }
}

