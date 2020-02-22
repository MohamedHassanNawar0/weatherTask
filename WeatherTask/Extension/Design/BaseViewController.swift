//
//  BaseViewController.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/20/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import UIKit
//MARK: - Base view controller to my view controller
class BaseViewController: UIViewController {

       override func viewDidAppear(_ animated: Bool) {
          self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
          self.navigationController?.navigationBar.shadowImage = UIImage()
          self.navigationController?.navigationBar.barTintColor = .clear
          self.navigationController?.navigationBar.backgroundColor = .clear
          self.navigationController?.navigationBar.barTintColor = .white
          self.navigationController?.navigationBar.tintColor = .white
          self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]

      }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
}

