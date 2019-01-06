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
    let slider = UISlider()
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear, animations: nil)
    let visualEffectView = UIVisualEffectView(effect: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        setupVisualBlurEffectView()
        setupSlider()
        setupTargets()
        
        animator.addAnimations {
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.visualEffectView.effect = UIBlurEffect(style: .light)
        }
    }
    
    @objc fileprivate func handleSliderChange(slider: UISlider) {
        animator.fractionComplete = CGFloat(slider.value)
    }
    
    @objc fileprivate func handleTap() {
        UIView.animate(withDuration: 1.0) {
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
    }

    fileprivate func setupVisualBlurEffectView() {
        //let blurEffect = UIBlurEffect(style: .dark)
        
        view.addSubview(visualEffectView)
        visualEffectView.fillSuperview()
    }
    
    fileprivate func setupTargets() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
    }
    
    fileprivate func setupSlider() {
        view.addSubview(slider)
        slider.anchor(top: imageView.bottomAnchor, leading: imageView.leadingAnchor, bottom: nil, trailing: imageView.trailingAnchor)
    }

    fileprivate func setupImageView() {
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.centerInSuperview(size: .init(width: 150, height: 150))
    }

}

