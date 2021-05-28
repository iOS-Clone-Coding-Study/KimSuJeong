//
//  ThirdCVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/11.
//

import UIKit

class ThirdCVCell: UICollectionViewCell {
    static let identifier = "ThirdCVCell"
    @IBOutlet weak var CategoryLabel: UILabel!
    @IBOutlet weak var AlbumImageView: UIImageView!
    
    func setCell(mood: ThirdRec){
        AlbumImageView.image = UIImage(named: mood.AlbumName)
        CategoryLabel.text = mood.CategoryLabelName
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ThirdCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AlbumImageView.layer.cornerRadius = 3
        // Initialization code
    }

}
