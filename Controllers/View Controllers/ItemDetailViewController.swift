//
//  ItemDetailViewController.swift
//  Restaurant
//
//  Created by Evgeniy Ryshkov on 19/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit
import SDWebImage

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var addToOrderButton: UIButton!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    
    var itemSelected: MenuItem!
    
    var itemQuantity: Int = 1
    
    var totalPrice: Double {
        return itemSelected.price * Double(itemQuantity)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateView(with: itemSelected)
    }

    func updateView(with menuItem:MenuItem) {
        
        itemImageView.sd_setImage(with: menuItem.imageURL, placeholderImage: UIImage(named: "image_file.pdf"))
        itemImageView.makeCornered(with: 20)
        
        itemNameLabel.text = menuItem.name
        itemDescriptionLabel.text = menuItem.detailText
        itemPriceLabel.text = "Price $\(menuItem.price) for one"
        
        updateQuantityAndPrice(with: self.itemQuantity)
        
        addToOrderButton.layer.cornerRadius = 5.0
        addToOrderButton.clipsToBounds = true
    }
    
    func updateQuantityAndPrice(with quantity: Int) {
        itemQuantityLabel.text = "Quantity \(quantity)"
        navigationItem.title =  "Total $\(totalPrice)"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - IBActions
    
    @IBAction func itemQuantityChanged(_ sender: UIStepper) {
        self.itemQuantity = Int(sender.value)
        updateQuantityAndPrice(with: self.itemQuantity)
    }
    
    @IBAction func addToOrderPressed(_ sender: UIButton) {
        
    }
    
}
