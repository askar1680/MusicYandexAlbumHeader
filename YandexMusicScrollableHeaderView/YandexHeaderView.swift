//
//  YandexHeaderView.swift
//  YandexMusicScrollableHeaderView
//
//  Created by Аскар on 3/2/19.
//  Copyright © 2019 askar.ulubayev168. All rights reserved.
//

import UIKit

class YandexHeaderView: UIView, ViewInstallation {
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    func setViewConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ]
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    func stylizeViews() {
        // self
        backgroundColor = .purple
        
        // imageView
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray
        
        // titleLabel
        titleLabel.textAlignment = .center
        titleLabel.text = "Дежавю"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 1
        
        // subtitleLabel
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "Собран для вас"
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.numberOfLines = 2
    }
}
