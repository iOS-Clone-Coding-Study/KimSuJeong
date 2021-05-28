//
//  RecomSongTVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/24.
//

import UIKit

class RecomSongTVCell: UITableViewCell {
    static let identifier = "RecomSongTVCell"
    @IBOutlet weak var SongLabel: UILabel!
    @IBOutlet weak var SingerLabel: UILabel!
    @IBOutlet weak var AlbumImageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "RecomSongTVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        AlbumImageView.layer.cornerRadius = 3
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        // Initialization code
    }

    // MARK: - Functions
    func setCell(recomSong: RecomSong){
        AlbumImageView.image = UIImage(named: recomSong.imageName)
        SongLabel.text = recomSong.songLabelName
        SingerLabel.text = recomSong.songLabelName
    }
}
