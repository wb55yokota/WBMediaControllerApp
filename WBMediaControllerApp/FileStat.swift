//
//  FileStat.swift
//  WBMediaControllerApp
//
//  Created by YOKOTA, Kenji on 2015/03/01.
//  Copyright (c) 2015年 wb55. All rights reserved.
//

import Foundation

class FileStat {
    var name: String?
    var is_dir: Bool?
    var atime: NSDate?
    var mtime: NSDate?
    var ctime: NSDate?
    var size: Int?
    
    convenience init(hash: Dictionary<String, Any>) {
        self.init()
        name = hash["name"] as! String?
        is_dir = hash["is_dir"] as! Bool?
        atime = hash["atime"] as! NSDate?
        mtime = hash["mtime"] as! NSDate?
        ctime = hash["ctime"] as! NSDate?
        size = hash["size"] as! Int?
    }

    convenience init(json: JSON) {
        self.init()
        name = json["name"].string
        is_dir = json["is_dir"].bool
//        atime = json["atime"].string
//        mtime = json["mtime"].string
//        ctime = json["ctime"].string
        size = json["size"].int
    }
}