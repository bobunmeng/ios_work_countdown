//
//  WorkCountTableViewCell.swift
//  WorkCountdown
//
//  Created by Bo Bunmeng on 02.09.2020.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import UIKit

class WorkCountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!

    static var reuseIdentifier: String {
        return "WorkCountCell"
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
    
    func configure(_ workcount: WorkCount) {
        self.dateLabel.text = workcount.dateDisp
        self.timeLabel.text = workcount.timeDisp
        self.incomeLabel.text = workcount.incomeDisp
    }
    
}
