//
//  PlayerTableViewCell.swift
//  Cricketers
//
//  Created by Aditya Raj on 05/01/25.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    private let avatarImageView = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let flagImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.cornerRadius = 25
        avatarImageView.clipsToBounds = true
        contentView.addSubview(avatarImageView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .boldSystemFont(ofSize: 16)
        contentView.addSubview(nameLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .gray
        contentView.addSubview(descriptionLabel)
        
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(flagImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            
            flagImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            flagImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagImageView.widthAnchor.constraint(equalToConstant: 30),
            flagImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(with player: Player) {
        nameLabel.text = player.name
        descriptionLabel.text = player.description
        
        if let avatarURLString = player.avatar, let avatarURL = URL(string: avatarURLString) {
            loadImage(from: avatarURL, into: avatarImageView)
        } else {
            avatarImageView.image = UIImage(systemName: "person.circle") // Placeholder
        }
        
        if let flagURLString = player.countryFlagURL, let flagURL = URL(string: flagURLString) {
            loadImage(from: flagURL, into: flagImageView)
        } else {
            flagImageView.image = nil
        }
    }

    
    private func loadImage(from url: URL, into imageView: UIImageView) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }
    }
}
