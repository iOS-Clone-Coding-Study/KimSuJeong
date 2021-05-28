//
//  FirstRecCVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/11.
//

import UIKit

class FirstRecCVCell: UICollectionViewCell {
    static let identifier = "FirstRecCVCell"
    @IBOutlet weak var CategoryLabel: UILabel!
    @IBOutlet weak var MusicTitleLabel: UILabel!
    @IBOutlet weak var SingerNameLabel: UILabel!
    @IBOutlet weak var AlbumImageView: UIImageView!
    
    func setCell(explore: FirstRec){
        AlbumImageView.image = UIImage(named: explore.ImageName)
        MusicTitleLabel.text = explore.MusicName
        SingerNameLabel.text = explore.SingerName
        CategoryLabel.text = explore.CategoryName
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "FirstRecCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AlbumImageView.layer.cornerRadius = 3
        // Initialization code
    }

}
