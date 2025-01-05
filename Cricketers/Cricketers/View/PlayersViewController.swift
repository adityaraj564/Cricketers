//
//  PlayersViewController.swift
//  Cricketers
//
//  Created by Aditya Raj on 05/01/25.
//

import UIKit

class PlayersViewController: UIViewController {
    private var viewModel = PlayersViewModel()
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchPlayers()
    }
    
    private func setupUI() {
        title = "Cricket Players"
        view.backgroundColor = .white
        
        tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: "PlayerCell")
        tableView.dataSource = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func bindViewModel() {
        viewModel.onPlayersUpdated = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension PlayersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        let player = viewModel.players[indexPath.row]
        cell.configure(with: player)
        return cell
    }
}
