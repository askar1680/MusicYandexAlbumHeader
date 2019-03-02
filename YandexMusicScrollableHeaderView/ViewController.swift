//
//  ViewController.swift
//  YandexMusicScrollableHeaderView
//
//  Created by Аскар on 3/2/19.
//  Copyright © 2019 askar.ulubayev168. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    let headerView = YandexHeaderView()
    
    let headerBarView = UIView()
    let mixButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension ViewController: ViewInstallation {
    func addSubviews() {
        view.addSubview(tableView)
        tableView.tableHeaderView = headerView
        headerView.addSubview(headerBarView)
        headerView.sendSubviewToBack(headerBarView)
        headerView.addSubview(mixButton)
    }
    
    func setViewConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()
        
        // tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ]
        
        // headerBarView
        headerBarView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            headerBarView.widthAnchor.constraint(equalTo: headerView.widthAnchor),
            headerBarView.heightAnchor.constraint(equalToConstant: Dim.LargeBarHeight),
            headerBarView.bottomAnchor.constraint(
                    greaterThanOrEqualTo: view.topAnchor,
                    constant: Dim.SmallBarHeight
                )
        ]
        let tableViewHeaderBarTopConstraint = headerBarView.topAnchor.constraint(equalTo: tableView.topAnchor)
        tableViewHeaderBarTopConstraint.priority = UILayoutPriority(rawValue: 999)
        
        layoutConstraints += [tableViewHeaderBarTopConstraint]
        
        // mixButton
        mixButton.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            mixButton.widthAnchor.constraint(equalToConstant: 200),
            mixButton.heightAnchor.constraint(equalToConstant: 40),
            mixButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
        ]
        let buttonTopConstraint = mixButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 200)
        buttonTopConstraint.priority = UILayoutPriority(rawValue: 998)
        
        let buttonCenterYConstraint = mixButton.centerYAnchor.constraint(greaterThanOrEqualTo: headerBarView.bottomAnchor, constant: 0)
        buttonCenterYConstraint.priority = UILayoutPriority(rawValue: 999)
        
        layoutConstraints += [buttonTopConstraint, buttonCenterYConstraint]
        
        // Activation
        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    func stylizeViews() {
        // tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.scrollIndicatorInsets.top = Dim.TableViewHeaderHeight
        
        // headerView
        headerView.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: Dim.TableViewHeaderHeight)
        
        // headerBarView
        headerBarView.backgroundColor = .orange
        
        // mixButton
        mixButton.setTitleColor(.black, for: .normal)
        mixButton.setTitle("Перемешать", for: .normal)
        mixButton.backgroundColor = .yellow
        
    }
    
    private struct Dim {
        static let TableViewHeaderHeight: CGFloat = 250
        static let LargeBarHeight: CGFloat = 200
        static let SmallBarHeight: CGFloat = 70
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = indexPath.row.description + " - blablabla"
        return cell
    }
}
