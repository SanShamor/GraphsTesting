//
//  SecondViewController.swift
//  GraphsTesting
//
//  Created by Александр on 07.01.2022.
//

import Charts
import UIKit

class SecondViewController: UIViewController, ChartViewDelegate {
    
    private let lineChart = LineChartView()
    private let weigths = DataManager.shared.createTestData()
    var weightsFromTextField = [Double] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lineChart.frame = CGRect (x: 0, y: 0,
                                  width: self.view.frame.size.width,
                                  height: self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        // MARK: - Tutorial way
        let set = LineChartDataSet(entries: [
            ChartDataEntry(x: 1 , y: 7),
            ChartDataEntry(x: 2 , y: 3),
            ChartDataEntry(x: 4 , y: 10),
            ChartDataEntry(x: 7 , y: 11)
        ])
        
        let data = LineChartData(dataSets: [set])
        //lineChart.data = data
        
        // MARK: - Another way with DataManager
        
        var entries = [ChartDataEntry] ()
        var day = 1
        for step in weigths {
            let weightY = Double(step.weight)
            day += 1
            let dateX = Double(day)
            entries.append(ChartDataEntry(x: dateX, y: weightY, data: step.date))
        }
        
        let secondSet = LineChartDataSet(entries: entries, label: "Another way")
        let secondData = LineChartData(dataSet: secondSet)
        //lineChart.data = secondData
        
        // MARK: - withSegueAndTextfield-screen way
        var entries2 = [ChartDataEntry] ()
        var days = 1
        for step in weightsFromTextField {
            days += 1
            let dateX = Double(days)
            entries2.append(ChartDataEntry(x: dateX, y: step))
        }
        
        let thirdSet = LineChartDataSet(entries: entries2, label: "withSegueAndTextfield way")
        let thirdData = LineChartData(dataSet: thirdSet)
        
        lineChart.data = thirdData
        
    }
    
}
