//
//  WeightViewController.swift
//  GraphsTesting
//
//  Created by Александр on 08.01.2022.
//

import UIKit

class WeightViewController: UIViewController {
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var goNextScreenButton: UIButton!
    
    private var weights = [Double] ()
    private var weightValue = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goNextScreenButton.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard !weights.isEmpty else { return }
        guard let secondVC = segue.destination as? SecondViewController else { return }
        secondVC.weightsFromTextField = weights
    }
    
    @IBAction func saveResultPressed(_ sender: Any) {
        weightValue = Double(weightTextField.text ?? "1") ?? 1.0
        weights.append(weightValue)
        goNextScreenButton.isHidden = false
        weightTextField.text = nil
    }

}
