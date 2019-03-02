//
//  ViewInstallation.swift
//  YandexMusicScrollableHeaderView
//
//  Created by Аскар on 3/2/19.
//  Copyright © 2019 askar.ulubayev168. All rights reserved.
//

protocol ViewInstallation {
    func setupViews()
    func addSubviews()
    func setViewConstraints()
    func stylizeViews()
    func doSomethingExtra()
}

extension ViewInstallation {
    func setupViews() {
        addSubviews()
        setViewConstraints()
        stylizeViews()
        doSomethingExtra()
    }
    
    func doSomethingExtra() {}
}
