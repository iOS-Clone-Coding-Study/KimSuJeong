//
//  TabBarCVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/14.
//

import UIKit

class TabBarCVCell: UICollectionViewCell {
    
    static let identifier = "TabBarCVCell"

    @IBOutlet weak var tabLabel: UILabel!
    @IBOutlet weak var tabGesture: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareForReuse()

    }
    
    override var isSelected: Bool {
        willSet {
            if newValue {
                tabLabel.textColor = .black
            } else {
                tabLabel.textColor = .lightGray
            }
        }
    }
    
    override func prepareForReuse() {
        isSelected = false
    }





    
    // MARK: TableView에 뿌려줄 Collectionview Data
    func setCell(tab: Tab){
        tabLabel.text = tab.TabLabel
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "TabBarCVCell", bundle: nil)
    }
    
   

}
