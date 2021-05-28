//
//  FourthCVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/11.
//

import UIKit

class FourthCVCell: UICollectionViewCell {
    static let identifier = "FourthCVCell"
    @IBOutlet weak var AlbumImage: UIImageView!
    @IBOutlet weak var MusicName: UILabel!
    @IBOutlet weak var SingerName: UILabel!
    
    func setCell(songs: FifthRec){
        AlbumImage.image = UIImage(named: songs.ImageName)
        MusicName.text = songs.MusicLabelName
        SingerName.text = songs.SingerLabelName
    }

    static func nib() -> UINib {
        return UINib(nibName: "FourthCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AlbumImage.layer.cornerRadius = 3
    }

}

