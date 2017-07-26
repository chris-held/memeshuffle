//
//  ViewController.swift
//  memeshuffle
//
//  Created by Chris Held on 7/16/17.
//  Copyright © 2017 Chris Held. All rights reserved.
//

import UIKit
import Material
import Kingfisher

class ViewController: UIViewController, UITextFieldDelegate {
    
    var svc: DankMemeService? = nil

    @IBOutlet weak var textMemeCriteria: TextField!
    @IBOutlet weak var memeButton: FlatButton!
    @IBOutlet weak var memeImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        svc = DankMemeService()
        textMemeCriteria.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        memeImage.isUserInteractionEnabled = true
        memeImage.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let activityViewController = UIActivityViewController(activityItems: [tappedImage.image], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        present(activityViewController, animated: true, completion: nil)
        // Your action
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    @IBAction func getMemes(_ sender: FlatButton) {
        if let criteria = textMemeCriteria.text {
            SwiftSpinner.show("Getting dank memes...")
            let url = URL(string: (svc?.getMemeImageUrl(criteria))!)
            memeImage.kf_setImage(with: url)
            //make the spinner show for a little bit so it doesn't flash
            let when = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: when) {
                SwiftSpinner.hide()
            }
            
        }
    }

}

