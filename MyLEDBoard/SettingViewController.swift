//
//  SettingViewController.swift
//  MyLEDBoard
//
//  Created by yc on 2021/09/12.
//

import UIKit

protocol SettingLEDLabelDelegate: AnyObject {
    func changeLEDLabel(text: String?, textColor: UIColor, backgroundColor: UIColor, fontSize: CGFloat)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var changeTextField: UITextField!
    
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var purpleBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var orangeBtn: UIButton!
    
    @IBOutlet weak var fontSizeStepper: UIStepper!
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    
    var changedText: String?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    var fontSize: Int?
    
    
    var settingDelegate: SettingLEDLabelDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
    private func configureView() {
        if let changedText = changedText {
            changeTextField.text = changedText
        }
        changeTextColor(textColor)
        changeBackgroundColor(backgroundColor)
        if let fontSize = fontSize {
            fontSizeStepper.value = Double(fontSize)
            fontSizeLabel.text = String(fontSize)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    

    @IBAction func tapChangeTextColorButton(_ sender: UIButton) {
        if sender == yellowBtn {
            changeTextColor(.yellow)
            textColor = .yellow
        } else if sender == purpleBtn {
            changeTextColor(.purple)
            textColor = .purple
        }else if sender == greenBtn {
            changeTextColor(.green)
            textColor = .green
        }
    }
    
    private func changeTextColor(_ color: UIColor) {
        self.yellowBtn.alpha = color == .yellow ? 0.2 : 1
        self.purpleBtn.alpha = color == .purple ? 0.2 : 1
        self.greenBtn.alpha = color == .green ? 0.2 : 1
    }
    
    @IBAction func tapChangeBackgroundColorButton(_ sender: UIButton) {
        if sender == blackBtn {
            changeBackgroundColor(.black)
            backgroundColor = .black
        } else if sender == blueBtn {
            changeBackgroundColor(.blue)
            backgroundColor = .blue
        }else if sender == orangeBtn {
            changeBackgroundColor(.orange)
            backgroundColor = .orange
        }
    }
    
    private func changeBackgroundColor(_ color: UIColor) {
        self.blackBtn.alpha = color == .black ? 0.2 : 1
        self.blueBtn.alpha = color == .blue ? 0.2 : 1
        self.orangeBtn.alpha = color == .orange ? 0.2 : 1
    }
    
    
    
    @IBAction func tapFontSizeStepper(_ sender: UIStepper) {
        fontSizeLabel.text = String(Int(sender.value))
    }
    
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.settingDelegate?.changeLEDLabel(text: changeTextField.text, textColor: textColor, backgroundColor: backgroundColor, fontSize: CGFloat(fontSizeStepper.value))
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
