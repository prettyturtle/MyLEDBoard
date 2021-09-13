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
        
        // MARK:- 초깃값 설정
        LEDLabel.text = "안녕하세요"
        LEDLabel.textColor = .yellow
        LEDLabel.font = UIFont.systemFont(ofSize: 50)
        view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // MARK:- 네비게이션 바 지우기
        navigationController?.navigationBar.isHidden = true
    }

    
    // MARK:- 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            
            // 이전 화면(SettingViewController)에서 데이터 전달 받기 : Delegate패턴
            settingViewController.settingDelegate = self
            
            // 다음 화면(SettingViewController)으로 데이터 전달 받기
            settingViewController.changedText = self.LEDLabel.text
            settingViewController.textColor = self.LEDLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
            settingViewController.fontSize = Int(self.LEDLabel.font.pointSize)
        }
    }
    
    
    // MARK:- SettingLEDLabelDelegate - changeLEDLabel
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

