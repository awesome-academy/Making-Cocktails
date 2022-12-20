//
//  ViewController.swift
//  Making-Cocktails
//
//  Created by Quang Khanh on 14/12/2022.
//

import UIKit

final class TarbarViewController: UIViewController {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var tabbarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designableTabBar()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { [weak self] (time) in
            self?.toHome()
        }
    }
    
    private func toHome() {
        guard let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
        contentView.addSubview(homeView.view)
        homeView.didMove(toParent: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func designableTabBar() {
        tabbarView.layer.cornerRadius = tabbarView.frame.size.height / 2
        tabbarView.clipsToBounds = true
    }
    
    @IBAction private func oneClickTabBar(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            toHome()
        case 2:
            guard let randomView = self.storyboard?.instantiateViewController(withIdentifier: "RandomViewController") as? RandomViewController else { return }
            contentView.addSubview(randomView.view)
            randomView.didMove(toParent: self)
        case 3:
            guard let searchView = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else { return }
            contentView.addSubview(searchView.view)
            searchView.didMove(toParent: self)
        case 4:
            guard let favouriteView = self.storyboard?.instantiateViewController(withIdentifier: "FavouriteViewController") as? FavouriteViewController else { return }
            contentView.addSubview(favouriteView.view)
            favouriteView.didMove(toParent: self)
        default:
            break
        }
     }
}

