//
//  MainWeatherViewController.swift
//  WeatherTask
//
//  Created by Mohamed Hassan Nawar  on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import UIKit
class MainViewController: BaseViewController {
    
    //MARK: - OUTLETS AND VARIABLES
    @IBOutlet weak var suggestionTableViewView: UIView!
    @IBOutlet weak var viewTapTODismisssuggestionTableViewView: UIView!
    @IBOutlet weak var citiesTableView : UITableView!
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var suggestionTableView: UITableView!
    private(set) var presenter: MainVCPresenter!
    //MARK: - Screen Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView(tableView: suggestionTableView)
        setupTableView(tableView: citiesTableView)
        setupTableViewCells()
        addEgyptForTheFirstTime()
        setupSearchBar()
        userTapInsuggestionTableViewView()
        self.title = "Weather"
    }
    override func viewWillAppear(_ animated: Bool) {
        searchBar.text = ""
        presenter.loadCities()
    }
    //MARK: - Helper methods

    func inject(presenter: MainVCPresenter) {
        self.presenter = presenter
    }
    
    func setupTableViewCells() {
        suggestionTableView?.register(SuggestionTableViewCell.self)
        citiesTableView?.register(CitiesTableViewCell.self)
    }
    // Add user tap gesture when user click out of suggested cities table view to dismiss it
    func userTapInsuggestionTableViewView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewTapTODismisssuggestionTableViewView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        suggestionTableViewView.isHidden = true
      }
    // Add egypt in my saved cities in the first time of using application
    func addEgyptForTheFirstTime() {
        let firstTime = UserDefaults.standard.value(forKey: "firstUse")
        if firstTime == nil {
            UserDefaults.standard.set("false", forKey: "firstUse");            presenter.didTapRegisterAction(name: "Cairo, EG", tempreture: "")
        }
    }
}

