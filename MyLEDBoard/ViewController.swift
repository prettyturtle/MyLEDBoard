//
//  ViewController.swift
//  MyLEDBoard
//
//  Created by yc on 2021/09/12.
//

import UIKit

class ViewController: UIViewController, SettingLEDLabelDelegate {

    
    @IBOutlet weak var LEDLabel: UILabel!
    @IBOutlet weak var settingIcon: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LEDLabel.text = "안녕하세요"
        LEDLabel.textColor = .yellow
        LEDLabel.font = UIFont.systemFont(ofSize: 50)
        view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.settingDelegate = self
            
            settingViewController.changedText = self.LEDLabel.text
            settingViewController.textColor = self.LEDLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
            settingViewController.fontSize = Int(self.LEDLabel.font.pointSize)
        }
    }
    
    
    func changeLEDLabel(text: String?, textColor: UIColor, backgroundColor: UIColor, fontSize: CGFloat) {
        if let text = text {
            LEDLabel.text = text
        }
        LEDLabel.textColor = textColor
        view.backgroundColor = backgroundColor
        LEDLabel.font = UIFont.systemFont(ofSize: fontSize)
        
        settingIcon.tintColor = textColor
    }
    
}

