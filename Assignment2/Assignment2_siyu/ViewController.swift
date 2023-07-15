//
//  ViewController.swift
//  Assignment2_siyu
//
//  Created by user on 2023-03-20.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func ClickMonitorButton(_ sender: UIButton) {
        present(alert, animated: true)
    }

    let alert = UIAlertController(title: "", message: "No monitors yet. Check back later!", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
    }
}
