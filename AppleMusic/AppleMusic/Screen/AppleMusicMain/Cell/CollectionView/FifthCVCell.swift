//
//  FifthCVCell.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/24.
//

import UIKit

class FifthCVCell: UICollectionViewCell {
    static let identifier = "FifthCVCell"
    @IBOutlet weak var SongTableView: UITableView!
    
    var song: [RecomSong] = []
    
    static func nib() -> UINib {
        return UINib(nibName: "FifthCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.SongTableView.register(RecomSongTVCell.nib(), forCellReuseIdentifier: RecomSongTVCell.identifier)
        SongTableView.dataSource = self
        SongTableView.delegate = self
        // Initialization code
    }
    
}

extension FifthCVCell: UITableViewDelegate {
    
}
extension FifthCVCell: UITableViewDataSource {
    func updateCellWith(row: [RecomSong]) {
        self.song = row
        self.SongTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return song.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecomSongTVCell.identifier, for: indexPath) as? RecomSongTVCell else{
            return UITableViewCell()
        }
        cell.setCell(recomSong: song[indexPath.row])
        
        return cell
    }
    
    
}
