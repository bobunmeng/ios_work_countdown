//
//  WorkCountDownViewController.swift
//  WorkCountdown
//
//  Created by Bo Bunmeng on 02.09.2020.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import UIKit

private let startTitle = "Start"
private let stopTitle = "Stop"

class WorkCountDownViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var countTimeButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let model = WorkCountViewModel()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(WorkCountTableViewCell.nib, forCellReuseIdentifier: WorkCountTableViewCell.reuseIdentifier)
    }
    
    @IBAction func startStopTime(_ sender: UIButton) {
        if isStartButton {
            self.startTime()
            return
        }
        self.stopTime()
    }
    
    func startTime() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        self.countTimeButton.setTitle(stopTitle, for: .normal)
    }
    
    @objc func updateTime() {
        model.updateTimer()
        self.timeLabel.text = model.timeDisplay
        self.incomeLabel.text = model.incomeDisplay
    }
    
    func stopTime() {
        timer?.invalidate()
        self.countTimeButton.setTitle(startTitle, for: .normal)
        self.model.save()
        self.tableView.reloadData()
    }
    
    var isStartButton: Bool {
        return self.countTimeButton.titleLabel?.text == "Start"
    }
    
}

extension WorkCountDownViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.workCounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkCountTableViewCell.reuseIdentifier) as? WorkCountTableViewCell else { return UITableViewCell()
        }
        let workcount = model.workCounts[indexPath.row]
        cell.configure(workcount)
        return cell
    }
}
