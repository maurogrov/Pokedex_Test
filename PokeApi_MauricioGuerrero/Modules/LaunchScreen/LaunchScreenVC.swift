//
//  LaunchScreenVC.swift
//  PokeApi_MauricioGuerrero
//
//  Created by Mauricio Guerrero on 29/10/22.
//

import UIKit

class LaunchScreenVC: UIViewController, Storyboarded {
    
    @IBOutlet weak var animationImg: UIImageView!
    @IBOutlet weak var logoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        animationImg.image = PokeImage.launch.image
        logoImg.image = PokeImage.header.image
        
        setupAnimation()
    }
    
    func setupAnimation(){
        animation {
            self.animation {
                self.goto()
            }
        }
    }
    
    func animation(_ closure: @escaping () -> Void) {
        let duration = 0.7
        
        UIView.animate(withDuration: duration, animations: {
            self.animationImg.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: {_ in
            UIView.animate(withDuration: duration, animations: {
                self.animationImg.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: {_ in
                closure()
            })
        })
    }
    
    func goto(){
        let vc = HomeWireFrame.createHomeModule()
        self.navigationController?.setViewControllers([vc], animated: false)
    }
    
}
