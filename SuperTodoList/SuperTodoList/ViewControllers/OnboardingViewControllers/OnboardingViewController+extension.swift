//
//  OnboardingViewController+extension.swift
//  SuperTodoList
//
//  Created by Decagon on 4/18/22.
//

import UIKit

extension OnboardingViewController {
    
    @objc func didTapGetstarted() {
        let MainScreenTabBarViewController = MainScreenTabBarViewController()
        MainScreenTabBarViewController.modalPresentationStyle = .fullScreen
        present(MainScreenTabBarViewController, animated: true)
    }
    
    func setupViews() {
        
        
        
        let subviewsList = [onboardingImage, welcomeLabel, getstartedButton, whatshappeningtodayLabel, skipButton]
        
        subviewsList.forEach { subview in
            view.addSubview(subview)
        }
        
        
        NSLayoutConstraint.activate([
            
            //MARK: - skip button
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            //MARK: - Image
            onboardingImage.topAnchor.constraint(equalTo: skipButton.bottomAnchor, constant: 30),
            onboardingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //MARK: - welcome label
            welcomeLabel.topAnchor.constraint(equalTo: onboardingImage.bottomAnchor, constant: 30),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            //MARK: - whatshappening label
            whatshappeningtodayLabel.bottomAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            whatshappeningtodayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            whatshappeningtodayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            //MARK: - get started button
            getstartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getstartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            getstartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            getstartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            getstartedButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    @objc func didTapSkip() {
        let MainScreenTabBarViewController = MainScreenTabBarViewController()
        MainScreenTabBarViewController.modalPresentationStyle = .fullScreen
        present(MainScreenTabBarViewController, animated: true)
    }
}
