//
//  RatingVC.swift
//  CHALLENGE_1
//
//  Created by Aleksandr Kan on 10/02/23.
//

import UIKit
import RealmSwift

class RatingVC: UIViewController {
    private let localRealm = try! Realm()
    private var playersArray: Results<PlayerModel>! = nil
    
    private let cellId = "idCell"
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.showsVerticalScrollIndicator = false
        table.bounces = false
        table.separatorStyle = .none
        table.contentMode = .center
        //table.delaysContentTouches = true
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setDelegates()
        getPlayers()
    }
    
    private func setupViews() {
        view.addBackground()
        view.addSubview(tableView)
        tableView.register(RatingCustomCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        
        ])
        
    }

    private func getPlayers() {
        playersArray = localRealm.objects(PlayerModel.self)
        tableView.reloadData()
    }
    
    
}

extension RatingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RatingCustomCell
        let player = playersArray[indexPath.row]
        cell.setupInfo(for: player)
        return cell
    }
    
    
}

extension RatingVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
