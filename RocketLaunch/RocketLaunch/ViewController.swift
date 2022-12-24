//
//  ViewController.swift
//  RocketLaunch
//
//  Created by MacBook on 21/12/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var rocketContentView: UIView!
    
    @IBOutlet weak var rocketImageView: UIImageView!
    
    @IBOutlet weak var successLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "launch", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        player = try? AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
    }

    @IBAction func powerButtonPressed(_ sender: Any) {
        rocketContentView.isHidden = false
        successLabel.isHidden = true
        let frame = rocketImageView.frame
        rocketImageView.frame.origin.y = 500
        print("Click")
        player.play()
        UIView.animate(withDuration: 3.5) {
            self.rocketImageView.frame = frame
        } completion: { _ in
            self.successLabel.isHidden = false
        }
    }
    
   

    
}

