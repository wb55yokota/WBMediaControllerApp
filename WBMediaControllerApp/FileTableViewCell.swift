//
//  FileTableViewCell.swift
//  WBMediaControllerApp
//
//  Created by YOKOTA, Kenji on 2015/02/12.
//  Copyright (c) 2015年 wb55. All rights reserved.
//

import Foundation

class FileTableViewCell: UITableViewCell {

    var file: FileStat? = nil

    var nameLabel: UILabel = UILabel()
    
    convenience init(file: FileStat, identifier:NSString) {
        self.init()
        self.file = file
        
        backgroundColor = UIColor.clearColor()
        //selectionStyle = UITableViewCellSelectionStyle.None
        
        nameLabel = UILabel(frame: CGRectMake(10+16+10, 0, SCREEN_W-20-26, 44))
        nameLabel.backgroundColor = UIColor.clearColor()
        nameLabel.font = UIFont.systemFontOfSize(13)
        nameLabel.textColor = UIColor.hexStr("#333333", alpha: 1)
        nameLabel.numberOfLines = 2
        contentView.addSubview(nameLabel)
    }
    
    func resetRect() {
    }
    
    func render() {
        var name = ""
        if(file!.is_dir!) {
            if(file!.name! == "..") {
                contentView.addSubview(upperImage())
            } else {
                contentView.addSubview(directoryImage())
            }
            //nameLabel.frame = CGRectMake(10+16+10, 0, SCREEN_W-20-26, 40)
        }
        nameLabel.text = name + file!.name!
    }
    
    func directoryImage() -> UIImageView {
        var iv = UIImageView(frame: CGRectMake(10, 14, 16, 16))
        iv.image = UIImage(named: "folder")
        return iv
    }

    func upperImage() -> UIImageView {
        var iv = UIImageView(frame: CGRectMake(10, 14, 16, 16))
        iv.image = UIImage(named: "arrow-up-2")
        return iv
    }
}