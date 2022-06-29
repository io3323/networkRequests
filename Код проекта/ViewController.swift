//
//  ViewController.swift
//  networkRequest
//
//  Created by Игорь Островский on 29.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView:UIImageView!
    @IBAction func pressButton(_ sender: UIButton){
        proverka = true
        updateUI()
        workWithURL()
    }
    var proverka = false
    var buttonPRV = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
}
    private func updateUI(){
        
        if  proverka{
            imageView.isHidden = false
        }else{
            imageView.isHidden = true
        }
    }
    private func workWithURL(){
        var string = "https://new-retail.ru/upload/iblock/e96/e96480fddad02329c813359c6531f344.jpg"
        guard var url = URL(string: string) else {return}
        var task = URLSession.shared.dataTask(with: url) { data, response, error in
            print("Done")
            DispatchQueue.main.async {
                guard var data = data else {
                    return
                }
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        }
        task.resume()
        
    }
}
