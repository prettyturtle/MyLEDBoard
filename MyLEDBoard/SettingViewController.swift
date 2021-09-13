//
//  SettingViewController.swift
//  MyLEDBoard
//
//  Created by yc on 2021/09/12.
//

import UIKit

// MARK:- 프로토콜 선언
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
    
    // MARK:- Delegate 패턴, Delegate 변수 선언
    var settingDelegate: SettingLEDLabelDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
    // MARK:- Delegate 패턴, 이전 화면에서 데이터 전달 받기
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
        // 네비게이션 바 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    
    // MARK:- IBActions

    // 글자색상변경 버튼 눌렀을 때
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
    // 버튼의 alpha 값 변경
    private func changeTextColor(_ color: UIColor) {
        self.yellowBtn.alpha = color == .yellow ? 0.2 : 1
        self.purpleBtn.alpha = color == .purple ? 0.2 : 1
        self.greenBtn.alpha = color == .green ? 0.2 : 1
    }
    
    // 배경색상변경 버튼 눌렀을 때
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
    // 버튼의 alpha 값 변경
    private func changeBackgroundColor(_ color: UIColor) {
        self.blackBtn.alpha = color == .black ? 0.2 : 1
        self.blueBtn.alpha = color == .blue ? 0.2 : 1
        self.orangeBtn.alpha = color == .orange ? 0.2 : 1
    }
    
    // 폰트 사이즈 변경할 때 Label 값 변경
    @IBAction func tapFontSizeStepper(_ sender: UIStepper) {
        fontSizeLabel.text = String(Int(sender.value))
    }
    
    // 저장 버튼 눌렀을 때
    @IBAction func tapSaveButton(_ sender: UIButton) {
        // Delegate 패턴
        self.settingDelegate?.changeLEDLabel(text: changeTextField.text, textColor: textColor, backgroundColor: backgroundColor, fontSize: CGFloat(fontSizeStepper.value))
        
        // Pop
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
