//
//  PlayerTableViewCell.swift
//  Basic-Storyboard
//
//  Created by Sahna Melly Marselina on 23/02/23.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var playerName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        playerImage.roundedImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
