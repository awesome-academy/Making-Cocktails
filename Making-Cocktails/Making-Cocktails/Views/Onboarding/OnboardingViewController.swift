//
//  OnboardingViewController.swift
//  Making-Cocktails
//
//  Created by Quang Khánh on 14/12/2022.
//

import UIKit

final class OnboardingViewController: UIViewController {

    @IBOutlet private weak var nextBtn: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "WELCOME TO COCKTAIL", descrition: "A world full of recipes", image: #imageLiteral(resourceName: "slide3")),
            OnboardingSlide(title: "COCKTAIL RECIPES", descrition: "Hundreds of detailed cocktail recipes", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "CONVENIENT", descrition: "One-touch cocktail recipe is yours", image: #imageLiteral(resourceName: "slide2"))
        ]
    }
    
    @IBAction private func nextBtnClick(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally, .centeredVertically], animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let with = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / with)
        pageControl.currentPage = currentPage
    }
}

