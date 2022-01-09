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
        lineChart.frame = CGRect (x: 0,
                                  y: 0,
                                  width: self.view.frame.size.width,
                                  height: self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        customizeLineChart()
        setData()
    }
    
    func setData() {
        let set = getSetFromTexfField()
        let data = LineChartData(dataSet: set)
        lineChart.data = data
    }
    
    func customizeLineChart() {
        lineChart.noDataText = "Добавьте данные о весе"
        lineChart.backgroundColor = .lightGray
        lineChart.rightAxis.enabled = false
        lineChart.animate(xAxisDuration: 2.5)
        
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.labelTextColor = .red
        lineChart.xAxis.axisLineColor = .blue
        
        let yAxis = lineChart.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(4, force: false)
        yAxis.labelTextColor = .red
        yAxis.axisLineColor = .blue
        yAxis.labelPosition = .outsideChart
    }
    
    // MARK: - Tutorial way
    func getHardcodeDataSet() -> LineChartDataSet  {
        let set = LineChartDataSet(entries: [
            ChartDataEntry(x: 1 , y: 7),
            ChartDataEntry(x: 2 , y: 3),
            ChartDataEntry(x: 4 , y: 10),
            ChartDataEntry(x: 7 , y: 11)
        ])
        return set
    }
    
    // MARK: - Another way with DataManager
    func getSetFromManager() -> LineChartDataSet {
        
        var entries = [ChartDataEntry] ()
        var day = 1
        for step in weigths {
            let weightY = Double(step.weight)
            day += 1
            let dateX = Double(day)
            entries.append(ChartDataEntry(x: dateX, y: weightY, data: step.date))
        }
        
        let secondSet = LineChartDataSet(entries: entries, label: "Another way")
        return secondSet
        
    }
    
    // MARK: - withSegueAndTextfield-screen way
    func getSetFromTexfField() -> LineChartDataSet {
        var entries2 = [ChartDataEntry] ()
        var days = 1
        for step in weightsFromTextField {
            days += 1
            let dateX = Double(days)
            entries2.append(ChartDataEntry(x: dateX, y: step))
        }
        
        let thirdSet = LineChartDataSet(entries: entries2, label: "withSegueAndTextfield way")
        return thirdSet
    }
    
}
