//
//  TableViewController.swift
//  testSwifty
//
//  Created by Fukuchi Tsubasa on 2017/08/01.
//  Copyright © 2017年 Fukuchi Tsubasa. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyJSON

class MusicViewController: UITableViewController {
    
    var locationManager: CLLocationManager!
    
    //phpにpostするために一時的に位置情報を格納する変数
    var Lat: String = "35.443708";
    var Lng: String = "139.638026";
    
    var cellItems = NSMutableArray()
    let cellNum = 5
    var selectedInfo : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocationManager()
        
        makeTableData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cellNum
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        if self.cellItems.count > 0 {
            cell.textLabel?.text = self.cellItems[indexPath.row] as? String
        }
        return cell
    }
    
    // 非同期でAPIを叩いている
    func makeTableData() {
        let url = "http://XXXXXXXXXXXXXX/XXXXXXXXXXXXX/XXXXXXXXXXXXXXX?lat=\(self.Lat)&lng=\(self.Lng)"
        print(url)
        //let url = "http://itunes.apple.com/search?term=aiko&country=JP&lang=ja_jp&media=music&entity=song&attribute=artistTerm&limit=30"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("Error")
            } else {
                let json = JSON(data: data!)
                for i in 0 ..< self.cellNum {
                    let artistName = json["results"][i]["artistName"]
                    let trackName = json["results"][i]["trackName"]
                    let previewUrl = json["results"][i]["previewUrl"]
                    let info = "\(artistName), \(trackName), \(previewUrl)"
                    print(info)
                    self.cellItems[i] = info
                }
                self.tableView.reloadData()
            }
        }
        /*
        let task = URLSession.shared.dataTask(with: url as URL, completionHandler: {data, response, error in
            // リソースの取得が終わると、ここに書いた処理が実行される
            let json = JSON(data: data!)
            // 各セルに情報を突っ込む
            for i in 0 ..< self.cellNum {
                let artistName = json["results"][i]["artistName"]
                let trackName = json["results"][i]["trackName"]
                let previewUrl = json["results"][i]["previewUrl"]
                let info = "\(artistName), \(trackName), \(previewUrl)"
                print(info)
                self.cellItems[i] = info
            }
            self.tableView.reloadData()
        })*/
        task.resume()
    }
    
    //楽曲を自分のポケットに取り出す関数
    func pick(){
    }

}

//位置情報に関する拡張
extension MusicViewController: CLLocationManagerDelegate {
    func setupLocationManager() {
        locationManager = CLLocationManager()
        guard let locationManager = locationManager else { return }
        locationManager.requestWhenInUseAuthorization()
        
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last
        if let last = lastLocation {
            let eventDate = last.timestamp
            if abs(eventDate.timeIntervalSinceNow) < 15.0 {
                if let location = manager.location {
                    
                    //楽曲get時に使用するため変数に格納する
                    self.Lng = String(location.coordinate.longitude)
                    self.Lat = String(location.coordinate.latitude)
                }
            }
        }
    }
}
