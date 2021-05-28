//
//  CategoryTVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/18.
//

import UIKit

class CategoryTVCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    static let identifier = "CategoryTVCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(title: String){
        titleLabel.text = title
    }
    
}
