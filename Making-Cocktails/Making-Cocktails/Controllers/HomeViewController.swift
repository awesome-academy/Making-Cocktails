//
//  HomeViewController.swift
//  Making-Cocktails
//
//  Created by Quang Khanh on 16/12/2022.
//

import UIKit

final class HomeViewController: UIViewController{

    @IBOutlet private weak var tableView: UITableView!
    private var listDrink = [Drink]()
    private let drinkRepository = DrinkRepository()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDrinks()
        config()
    }
    private func config() {
        tableView.register(UINib(nibName: "CocktailInfoTableViewCell", bundle: nibBundle), forCellReuseIdentifier: "CocktailInfoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    private func fetchDrinks() {
        drinkRepository.getAllDrinks(urlAPi: urlSections.urlString) { [weak self] (data, error) -> Void in
            guard let self = self else { return }
            if let error = error {
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    self.listDrink = data
                    self.tableView.reloadData()
                }
            }
        }
    }
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDrink.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailInfoTableViewCell", for: indexPath) as? CocktailInfoTableViewCell else {
            return UITableViewCell()
        }
        let drink = listDrink[indexPath.row]
        cell.configuge(title: Drink(strDrink: drink.strDrink, strCategory: drink.strCategory, strDrinkThumb: drink.strDrinkThumb))
        return cell
    }
}
