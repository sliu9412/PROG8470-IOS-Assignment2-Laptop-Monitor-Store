//
//  LaptopViewController.swift
//  Assignment2_siyu
//
//  Created by user on 2023-03-20.
//

import UIKit

class LaptopViewController: UIViewController {
    @IBOutlet var LaptopTable: UITableView!

    @IBAction func AddNewLaptop(_ sender: UIBarButtonItem) {
        SetAlert()
    }

    var Laptops = [
        ["title": "Dell", "subtitle": "2.7Ghz", "price": 1299.99],
        ["title": "Apple", "subtitle": "2Ghz", "price": 2299.99],
        ["title": "HP", "subtitle": "2.3Ghz", "price": 299.99],
        ["title": "IBM Tablet(4)", "subtitle": "2.3Ghz", "price": 999.99],
    ] {
        didSet {
            LaptopTable.reloadData()
            defaults.set(Laptops, forKey: "Laptops")
        }
    }

    var defaults = UserDefaults()

    private func SetAlert() {
        let alert = UIAlertController(title: "Add a new laptop", message: "", preferredStyle: .alert)
        var alert_product_title_input = UITextField()
        var alert_product_subtitle_input = UITextField()
        var alert_product_price_input = UITextField()
        alert.addTextField(configurationHandler: {
            $0.placeholder = "Enter the name of the laptop"
            alert_product_title_input = $0
        })
        alert.addTextField(configurationHandler: {
            $0.placeholder = "Enter additional information of the laptop"
            alert_product_subtitle_input = $0
        })
        alert.addTextField(configurationHandler: {
            $0.placeholder = "Enter the price of the laptop"
            alert_product_price_input = $0
        })
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "add", style: .default, handler: { _ in
            if (alert_product_title_input.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "") && (alert_product_subtitle_input.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "") {
                if let price = Double(alert_product_price_input.text!) {
                    self.Laptops.append(["title": alert_product_title_input.text!, "subtitle": alert_product_subtitle_input.text!, "price": price])
                }
            }
        }))
        present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        LaptopTable.delegate = self
        LaptopTable.dataSource = self
        if let stored_laptops = defaults.array(forKey: "Laptops") {
            if stored_laptops.count > 0 {
                Laptops = stored_laptops as! Array
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "xmark.circle.fill"), style: .plain, target: nil, action: #selector(UINavigationController.popViewController(animated:)))
        backButton.tintColor = UIColor.lightGray
        navigationItem.leftBarButtonItem = backButton
    }
}

extension LaptopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Laptops.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LaptopCell", for: indexPath) as! laptopTableViewCell
        cell.TitleLabel.text = Laptops[indexPath.row]["title"] as? String
        cell.SubTitleLabel.text = Laptops[indexPath.row]["subtitle"] as? String
        cell.PriceLabel.text = "$\(Laptops[indexPath.row]["price"] as! Double)"
        return cell
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        Laptops.remove(at: indexPath.row)
    }
}
