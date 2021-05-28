//
//  SecondRecCVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/11.
//

import UIKit

class SecondRecCVCell: UICollectionViewCell {
    static let identifier = "SecondRecCVCell"
    @IBOutlet weak var AlbumImageView: UIImageView!
    @IBOutlet weak var FirstLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    
    func setCell(playlist: SecondRec){
        AlbumImageView.image = UIImage(named: playlist.AlbumName)
        FirstLabel.text = playlist.FirstLabelName
        SecondLabel.text = playlist.SecondLabelName
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SecondRecCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AlbumImageView.layer.cornerRadius = 3
        // Initialization code
    }

}
