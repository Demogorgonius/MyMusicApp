//
//  OnboardingScreen.swift
//  MyMusicApp
//
//  Created by Иван Станкин on 13.06.2023.
//

import UIKit

class OnboardingScreen: UIViewController {
    
    let imageArray = [UIImage(named: "onb_1.png"), UIImage(named: "onb_2.png"), UIImage(named: "onb_3.png")]
    let textArray = ["Your personal source of good music", "Create your own playlists", "Download tracks to stay tuned everywhere"]
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupViews()
        SetupConstraints()
        
    }
    
    lazy var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = imageArray[0]
        
        return imageView
    }()
    
    lazy var upperLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = UICatalog.Colors.brandBlack
        view.alpha = 0.6
        
        return view
    }()
    
    lazy var upperLabel: UILabel = {
        let label = UILabel()
        label.text = "WELCOME TO \n MusicApp"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UICatalog.Colors.lightGray
        label.font = UICatalog.Fonts.bold28
        
        return label
    }()
    
    lazy var bottomLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = UICatalog.Colors.brandBlack
        view.alpha = 0.6
        
        return view
    }()
    
    lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.font = UICatalog.Fonts.medium14
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UICatalog.Colors.lightGray
        label.text = textArray[0]
        
        return label
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = currentIndex
        pageControl.pageIndicatorTintColor = UICatalog.Colors.lightGray
        pageControl.currentPageIndicatorTintColor = UICatalog.Colors.brandLime
//        pageControl.backgroundColor = UIColor.init(displayP3Red: 0.055, green: 0.043, blue: 0.122, alpha: 0.6)
        
        return pageControl
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.backgroundColor = UICatalog.Colors.brandLime
        button.titleLabel?.font = UICatalog.Fonts.bold16
        button.setTitleColor(UICatalog.Colors.brandBlack, for: .normal)
        button.setTitleColor(UICatalog.Colors.darkGray, for: .highlighted)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc func startButtonTapped() {
        
        switch currentIndex {
        case 0:
            currentIndex += 1
            self.pageControl.currentPage = currentIndex
            UIView.transition(with: bgImage, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.upperLabel.alpha = 0
                self.upperLabelView.alpha = 0
                self.bottomLabel.text = self.textArray[self.currentIndex]
            }, completion: nil)
            self.animateBackgroundImage()
        case 1:
            currentIndex += 1
            self.pageControl.currentPage = currentIndex
            UIView.transition(with: bgImage, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.bottomLabel.text = self.textArray[self.currentIndex]
            }, completion: nil)
            self.animateBackgroundImage()
        case 2:
            
            // MARK: Поменять на SingInScreen
            
            let vc = TabOneTempController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
        default:
            print("Error")
        }
        
//        animateBackgroundImage()
        
    }
    
    func animateBackgroundImage() {
        
        UIView.transition(with: bgImage, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.bgImage.image = self.imageArray[self.currentIndex]
        }, completion: nil)
        
    }
    
    private func SetupViews() {
        view.backgroundColor = UICatalog.Colors.brandBlack
        
        view.addSubview(bgImage)
        view.addSubview(startButton)
        view.addSubview(upperLabelView)
        view.addSubview(upperLabel)
        view.addSubview(bottomLabelView)
        view.addSubview(bottomLabel)
        view.addSubview(pageControl)
    }
    
    private func SetupConstraints() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            startButton.widthAnchor.constraint(equalToConstant: 295),
            startButton.heightAnchor.constraint(equalToConstant: 46)
        ])
        
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bgImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bgImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bgImage.topAnchor.constraint(equalTo: view.topAnchor),
            bgImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgImage.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        upperLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            upperLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upperLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        ])
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomLabel.topAnchor.constraint(equalTo: upperLabel.bottomAnchor, constant: 50)
        ])
        
        upperLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            upperLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            upperLabelView.centerYAnchor.constraint(equalTo: upperLabel.centerYAnchor),
            upperLabelView.widthAnchor.constraint(equalTo: view.widthAnchor),
            upperLabelView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        bottomLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomLabelView.centerYAnchor.constraint(equalTo: bottomLabel.centerYAnchor),
            bottomLabelView.heightAnchor.constraint(equalToConstant: 40),
            bottomLabelView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: bottomLabelView.bottomAnchor, constant: 20)
        ])
        
    }
    
}
