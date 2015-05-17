//
//  ViewController.swift
//  WBMediaControllerApp
//
//  Created by YOKOTA, Kenji on 2015/03/01.
//  Copyright (c) 2015年 wb55. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    var pwd: String = "/"
    var files: Array<FileStat> = []
    var titleLabel: UILabel = UILabel()
    var loadingView: LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView = LoadingView()
        var stopButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Stop, target: self, action: "stop")
        var pauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "toggle_pause")
        var reloadButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: "reload")

        self.navigationItem.rightBarButtonItems = [stopButton, pauseButton, reloadButton];

        setTitleBarFont()
        loadDirectory()
    }

    func setTitleBarFont() {
        titleLabel = UILabel(frame: CGRectMake(0, 0, SCREEN_W, 44))
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.font = UIFont.systemFontOfSize(13)
        titleLabel.textAlignment = NSTextAlignment.Left
        titleLabel.textColor = UIColor.blackColor()
        self.navigationItem.titleView = titleLabel;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadDirectory() {
        start_loading()
        var params = Dictionary<String, String>()
        params["dir"] = pwd.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        ApiRequest.GET("list",
            params: params,
            success: {(json: JSON) in
                self.stop_loading()
                self.titleLabel.text = self.pwd
                self.files = self.parseJson(json["files"])
                self.tableView.reloadData()
                self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: false)
            },
            failure: {
                self.stop_loading()
                self.upperDir()
            }
        )
    }

    func parseJson(jsonArray: JSON) -> Array<FileStat> {
        var fileStats = Array<FileStat>()
        for (key, json) in jsonArray {
            fileStats.append(FileStat(json: json))
        }
        return fileStats
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = FileTableViewCell(file: files[indexPath.row], identifier: "Cell")
        cell.render()
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var file = files[indexPath.row]
        if(file.is_dir!) {
            if(file.name! == ".") {
                return
            } else if(file.name! == "..") {
                upperDir()
            } else {
                pwd = pwd + file.name! + "/"
            }
            loadDirectory()
        } else {
            var params = Dictionary<String, String>()
            params["dir"] = pwd
            params["filename"] = file.name!
            ApiRequest.POST("play",
                params: params,
                success: {(json: JSON) in
                },
                failure: {
                }
            )
        }
    }
    
    func start_loading() {
        self.view.addSubview(loadingView!)
        loadingView!.start()
    }
    
    func stop_loading() {
        loadingView!.stop()
        loadingView!.removeFromSuperview()
    }
    
    func send_command(command: String) {
        var params = Dictionary<String, String>()
        params["command"] = command
        ApiRequest.POST("command",
            params: params,
            success: {(json: JSON) in
            },
            failure: {
                println("error")
            }
        )
    }
    
    func stop() {
        send_command("q")
    }
    
    func toggle_pause() {
        send_command("p")
    }
    
    func reload() {
        loadDirectory()
    }
    
    func upperDir() {
        pwd = pwd.stringByReplacingOccurrencesOfString("/[^/]+/$", withString:"/", options:NSStringCompareOptions.RegularExpressionSearch, range: nil)
    }
}

