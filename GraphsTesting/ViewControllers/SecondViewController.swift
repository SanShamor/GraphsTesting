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
        
        let set = LineChartDataSet(entries: [
            ChartDataEntry(x: 1 , y: 7),
            ChartDataEntry(x: 2 , y: 3),
            ChartDataEntry(x: 4 , y: 10),
            ChartDataEntry(x: 7 , y: 11)
        ])
        let data = LineChartData(dataSets: [set])
        lineChart.data = data
    }
    
}
