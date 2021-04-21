//
//  UITableViewExtension.swift
//  WeatherTask
//
//  Created by Mohamed Nawar on 2/21/20.
//  Copyright © 2020 Mohamed Hassan Nawar. All rights reserved.
//

import UIKit

//MARK: - Register and dequeue UITableViewCell of specific type
extension UITableView {
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        let name = String(describing: cellType)
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as? T else {
            fatalError("\(T.self) is expected to have reusable identifier: \(String(describing: cellType))")
        }
        
        return cell
    }
}

