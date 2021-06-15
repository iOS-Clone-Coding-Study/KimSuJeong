//
//  DMCVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/15.
//

import UIKit

class DMCVCell: UICollectionViewCell {
    
    static let identifier = "DMCVCell"

    @IBOutlet weak var idTableView: UITableView!
    
    var message: [DMessage] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.idTableView.register(DMTVCell.nib(), forCellReuseIdentifier: DMTVCell.identifier)
        idTableView.dataSource = self
        idTableView.delegate = self
        idTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DMCVCell", bundle: nil)
    }

}

extension DMCVCell: UITableViewDelegate {
    
}
extension DMCVCell: UITableViewDataSource {
    
    func updateCellWith(row: [DMessage]) {
        self.message = row
        self.idTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DMTVCell.identifier, for: indexPath) as? DMTVCell else{
            return UITableViewCell()
        }
        cell.setCell(message: message[indexPath.row])
        
        return cell
    }
    
    
}

