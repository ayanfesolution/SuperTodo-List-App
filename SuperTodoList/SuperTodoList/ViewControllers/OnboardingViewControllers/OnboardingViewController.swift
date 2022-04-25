//
//  OnboardingViewController.swift
//  SuperTodoList
//
//  Created by Decagon on 4/18/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSkip), for: .touchUpInside)
        return button
        
    }()
    
    let onboardingImage: UIImageView = {
        let onbardingImage = UIImageView()
        onbardingImage.backgroundColor = .white
        onbardingImage.image = UIImage(named: "OnboardingImage1")
        onbardingImage.clipsToBounds = true
        onbardingImage.translatesAutoresizingMaskIntoConstraints = false
        return onbardingImage
    }()
    
    let welcomeLabel: UILabel = {
        let welcomeText = UILabel()
        welcomeText.text = "Welcome to Superpower Organizer"
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        welcomeText.isEnabled = false
        welcomeText.textAlignment = .center
        welcomeText.font = UIFont.systemFont(ofSize: 20, weight: .black)
        return welcomeText
    }()
    
    
    let whatshappeningtodayLabel: UILabel = {
        let label = UILabel()
        label.text = "What are you doing today"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    let getstartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapGetstarted),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
    }
    
    
}
