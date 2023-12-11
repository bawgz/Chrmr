//
//  ChrmCell.swift
//  Chrmr MessagesExtension
//
//  Created by Luke Boggs on 10/1/20.
//  Copyright © 2020 Charms Co. All rights reserved.
//

import UIKit
import AVFoundation

class ChrmCell: UITableViewCell {
        
    var fileFetcher = FileFetcher()
    var chrmPlayer: ChrmPlayer?
    var player: AVAudioPlayer?
    var audioUrl: String!
    var chrmId: String!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var chrmImage: UIImageView!
    
    
    @IBAction func playButton(_ sender: UIButton) {
        print("play da music " + audioUrl)
        
        let completionHandler: (URL) -> Void = { fileUrl in
//            do {
//                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//                try AVAudioSession.sharedInstance().setActive(true)

                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
//                self.player = try AVAudioPlayer(contentsOf: fileUrl, fileTypeHint: AVFileType.mp3.rawValue)

                /* iOS 10 and earlier require the following line:
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

//                guard let player = self.player else { return }
//
//                player.play()

//            } catch let error {
//                print(error.localizedDescription)
//            }
            
            self.chrmPlayer?.playFile(fileUrl: fileUrl)
        }
        
        fileFetcher.fetchFile(audioUrl: audioUrl, id: chrmId, completionHandler: completionHandler)
    }
    //    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        // Initialization code
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: "collectionItemCollectionViewCell", bundle: bundle)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
//        view.frame = bounds
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
