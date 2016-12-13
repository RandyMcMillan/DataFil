//
//  FilterManager.swift
//  Accelerometer Graph
//
//  Created by Alex Gubbay on 09/12/2016.
//  Copyright © 2016 Alex Gubbay. All rights reserved.
//

import Foundation

struct notificationManager{
    static var nc = NotificationCenter.default
    static let newRawDataNotification = Notification.Name("newRawData")
}



class FilterManager{
    
    static let sharedInstance = FilterManager()
    
    var activeFilters = [FilteringProtocol]()
    var filteringAxis = "x"
    
    init(){
        print("adding observer")
        NotificationCenter.default.addObserver(self, selector: #selector(FilterManager.newRawData), name: Notification.Name("newRawData"), object: nil)

    }

    @objc func newRawData(notification: NSNotification){
        
        let data = notification.userInfo as! Dictionary<String,accelPoint>
        let accelData = data["data"]
        //let currentData = accelData?.getAxis(axis: "x")
        if activeFilters.count >= 1 {
            print("sending data to process")
            activeFilters[0].addDataPoint(dataPoint: accelData!)
        }else{ //no filters, direct input straight to output
            receiveData(data: [accelData!], id: -1)
        }
        
    }
    
    func addNewFilter(filterName: String){
        
        switch filterName {
        case "High Pass":
            print("Adding High Pass")
            let highPass = HighPass(alpha: 0.5)
            highPass.id = activeFilters.count
            
            let update = {(data: [accelPoint])->Void in
                
                self.receiveData(data: data, id: highPass.id)
            }
            
            highPass.addObserver(update: update)
            activeFilters.append(highPass)
        default:
            print("No match in FilterManager")
        }
        
    }
    func getFilterByName(name: String) -> FilteringProtocol?{
        for filter in activeFilters{
            if filter.filterName == name{
            return filter
            }
        }
        return nil
    }
    
    func receiveData(data: [accelPoint], id:Int){

        
        if(id == activeFilters.count-1){
            print("processing data")
            NotificationCenter.default.post(name: Notification.Name("newProcessedData"), object: nil, userInfo:["data":data])
        }else{
            for dataPoint in data{
                activeFilters[id+1].addDataPoint(dataPoint: dataPoint)
            }
        }
        
    }
}
