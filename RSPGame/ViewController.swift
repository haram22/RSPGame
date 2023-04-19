//
//  ViewController.swift
//  RSPGame
//
//  Created by 김하람 on 2023/04/19.
//

import UIKit

class ViewController: UIViewController {
    
    //변수, 속성
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // Rps타입을 갖는 변수에 초기값으로 rock 저장하기
    var myChoice: Rps = Rps.rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    //함수, 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        //1. 두 이미지뷰에 '준비' 이미지 띄우기
        comImageView.image = #imageLiteral(resourceName: "ready")
        //2. 두 Label에 '준비'라고 문자열 띄우기
        myImageView.image = #imageLiteral(resourceName: "ready")
        
        comChoiceLabel.text = "Ready"
        myChoiceLabel.text = "Ready"
    }

    
    @IBAction func rpsButtonPressed(_ sender: UIButton) {
        // 가위, 바위, 보 선택해서 그 정보 저장하기.
        
        // 만약, 현재 버튼이름이 존재한다면, title이라는 변수에 저장하겠다.
        let title = sender.currentTitle!
        print(title)
        switch title {
        case "✌🏻":
            myChoice = Rps.scissor
        case "👊🏻":
            myChoice = Rps.rock
        case "✋🏻":
            myChoice = Rps.paper
        default:
            break
        }
        print(myChoice)
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
    comChoice=Rps(rawValue: Int.random(in: 0...2))!;
        // 컴퓨터가 랜덤 선택한 것 이미지뷰에 표시
        // 컴퓨터가 랜덤 선택한 것 레이블에 표시
        switch comChoice {
        case .rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "Rock"
        case .paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "Paper"
        case .scissor:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "Scissor"
        }
        
        
        // 내가 선택한 것 이미지뷰에 표시
        // 내가 선택한 것 레이블에 표시
        switch myChoice {
        case .rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "Rock"
        case .paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "Paper"
        case .scissor:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "Scissor"
        }
 
        
        // 저장한 정보를 컴퓨터가 선택한 것과 내가 선태한 것 비교
        if (myChoiceLabel.text == "Paper" && comChoiceLabel.text == "Rock" || myChoiceLabel.text == "Scissor" && comChoiceLabel.text == "Paper" || myChoiceLabel.text == "Rock" && comChoiceLabel.text == "Scissor"
        ){
            mainLabel.text = "👏🏻 You Win 👏🏻"
        }
        else if (myChoiceLabel.text == comChoiceLabel.text) {
            mainLabel.text = "== SAME =="
        }
        else {
            mainLabel.text = "😭 You Lose 😭"
        }
        // 이김,짐,비김을 판단하고 표시
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 메인 레이블에 '선택하세요' 표시
        mainLabel.text = "선택하세요^!^"
        
        // 다시 준비 이미지뷰에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        
        // 컴퓨터가 다시 준비 레이블에 표시
        comChoiceLabel.text = "Ready"
        // 내 화면에 다시 준비 레이블에 표시
        myChoiceLabel.text = "Ready"
        
        myChoice = Rps.rock
        // 컴퓨터가 다시 랜덤 가위바위보 선택하고 저장
//        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
}


