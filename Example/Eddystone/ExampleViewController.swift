//
//  ExampleViewController.swift
//  Eddystone
//
//  Created by Tanner Nelson on 07/24/2015.
//  Copyright (c) 2015 Tanner Nelson. All rights reserved.
//

import UIKit
import Eddystone

class ExampleViewController: UIViewController {

    //MARK: Interface
    @IBOutlet weak var mainTableView: UITableView!
    
    //MARK: Properties
    var urls = Eddystone.Scanner.nearbyUrls
    var previousUrls: [Eddystone.Url] = []

    var uids = Eddystone.Scanner.nearbyUids
    var previousUids: [Eddystone.Uid] = []
    

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Eddystone.logging = true
        Eddystone.Scanner.start(self)
        
        self.mainTableView.rowHeight = UITableViewAutomaticDimension
        self.mainTableView.estimatedRowHeight = 100
    }

}

extension ExampleViewController: Eddystone.ScannerDelegate {
    
    func eddystoneNearbyDidChange() {
        self.previousUrls = self.urls
        self.urls = Eddystone.Scanner.nearbyUrls
        
        self.previousUids = self.uids
        self.uids = Eddystone.Scanner.nearbyUids

        if self.urls.count > 0 {
            self.mainTableView.switchDataSourceFrom(oldData: self.previousUrls, to: self.urls, withAnimation: .top)
        }
        else {
            self.mainTableView.switchDataSourceFrom(oldData: self.previousUids, to: self.uids, withAnimation: .top)
        }
    }
    
}


extension ExampleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.urls.count > 0 ? self.urls.count : self.uids.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleTableViewCell") as! ExampleTableViewCell
        
        if (self.urls.count > 0) {
            let url = self.urls[indexPath.row]
            
            cell.mainLabel.text = url.url.absoluteString
            self.detailText(object: url, cell: cell)
        }
        else if self.uids.count > 0 {
            cell.detailLabel.text = "No telemetry data"
            let uid = self.uids[indexPath.row]
            
            cell.mainLabel.text = uid.uid
            self.detailText(object: uid, cell: cell)
        }
        else {
            
        }
        

        return cell
    }
    
    func detailText(object: Object, cell: ExampleTableViewCell) {
        if  let battery = object.battery,
            let temp = object.temperature,
            let advCount = object.advertisementCount,
            let onTime = object.onTime {
            cell.detailLabel.text = "Battery: \(battery)% \nTemp: \(temp)˚C \nPackets Sent: \(advCount) \nUptime: \(onTime.readable)"
        } else {
            cell.detailLabel.text = "No telemetry data"
        }
        
        switch object.signalStrength {
            case .excellent: cell.signalStrengthView.signal = .excellent
            case .veryGood: cell.signalStrengthView.signal = .veryGood
            case .good: cell.signalStrengthView.signal = .good
            case .low: cell.signalStrengthView.signal = .low
            case .veryLow: cell.signalStrengthView.signal = .veryLow
            case .noSignal: cell.signalStrengthView.signal = .noSignal
            default: cell.signalStrengthView.signal = .unknown
        }
    }

}

extension ExampleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
