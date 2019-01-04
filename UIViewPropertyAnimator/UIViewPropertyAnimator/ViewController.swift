//
//  ViewController.swift
//  UIViewPropertyAnimator
//
//  Created by Ujjwal Verma on 4/1/19.
//  Copyright © 2019 Ujjwal Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "girl"))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc fileprivate func handleTap() {
        UIView.animate(withDuration: 1.0) {
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
    }

    fileprivate func setupImageView() {
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.centerInSuperview(size: .init(width: 150, height: 150))
    }

}

