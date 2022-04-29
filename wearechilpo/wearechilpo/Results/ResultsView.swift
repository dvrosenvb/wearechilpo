//
//  ResultsView.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 28/04/22.
//

import Foundation
import UIKit
import SnapKit
import Lottie

class ResultsView:UIViewController{
    
    //MARK: VIPER Elements
    var presenter : ViewToPresenterProtocolResults?
    
    //MARK: Value Elements
    
    
    //MARK: UIElements
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UITheme.Color7.cgColor,
            UITheme.Color8.cgColor
        ]
        gradient.locations = [0, 1.95]
        return gradient
    }()
    
    lazy var viewGraphContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 3
        view.layer.borderColor = UITheme.Color10.cgColor
        return view
    }()
    
    lazy var lblQuestion: UILabel = {
        let lbl = UILabel()
        lbl.font = UITheme.SemiBold(24)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        lbl.text = "¿Cuál cree que debería ser la prioridad en la ciudad?"
        lbl.textColor = UITheme.Color5
        return lbl
    }()
    
    //Progress
    lazy var pbOptionA: UIProgressView = {
        let pb = UIProgressView()
        setupProgressBar(pb: pb, color: UITheme.Color3)
        return pb
    }()
    
    lazy var pbOptionB: UIProgressView = {
        let pb = UIProgressView()
        setupProgressBar(pb: pb, color: UITheme.Color8)
        return pb
    }()
    
    lazy var pbOptionC: UIProgressView = {
        let pb = UIProgressView()
        setupProgressBar(pb: pb, color: UITheme.Color9)
        return pb
    }()
    
    lazy var btnShareResult: UIButton = {
        let btn = UIButton()
        setupBtn(btn: btn, caption: "Compartir", ico: "square.and.arrow.up")
        return btn
    }()
    
    lazy var lblA: UILabel = {
        let label = UILabel()
        setupOptionLabel(label: label,
                         text: "Zocaleadas",
                         optionText: "A",
                         backgroundColor: UITheme.Color3)
        return label
    }()
    
    lazy var lblB: UILabel = {
        let label = UILabel()
        setupOptionLabel(label: label,
                         text: "Agua potable",
                         optionText: "B",
                         backgroundColor: UITheme.Color8)
        return label
    }()
    
    lazy var lblC: UILabel = {
        let label = UILabel()
        setupOptionLabel(label: label,
                         text: "Seguridad",
                         optionText: "C",
                         backgroundColor: UITheme.Color9)
        return label
    }()
    
    
    //MARK: Lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backButtonTitle = ""
        navigationItem.hidesBackButton = true
        self.setupNavBar(titleTxt: "Resultados", tintColor: UITheme.Color5, backgroundColor: .white)
        print("WillAppear ResultsView")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload ResultsView")
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        setupView()
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        print("didappear ResultsView")
        navigationItem.hidesBackButton = false
        navigationItem.backButtonTitle = ""
    }
    
    
    //MARK: Funcs
    func setupView() {
        
        view.addSubview(lblQuestion)
        lblQuestion.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        view.addSubview(viewGraphContainer)
        viewGraphContainer.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(view.frame.width * 0.90)
            make.width.equalTo(view.frame.width * 0.68)
            make.top.equalTo(lblQuestion.snp.bottom)
        }
        
        viewGraphContainer.addSubview(pbOptionB)
        pbOptionB.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(66)
            make.width.equalToSuperview().offset(-32)
        }
        
        viewGraphContainer.addSubview(pbOptionA)
        pbOptionA.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(66)
            make.width.equalToSuperview().offset(-32)
            make.bottom.equalTo(pbOptionB.snp.top).offset(-32)
        }
        
        viewGraphContainer.addSubview(pbOptionC)
        pbOptionC.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(66)
            make.width.equalToSuperview().offset(-32)
            make.top.equalTo(pbOptionB.snp.bottom).offset(32)
        }
        
        
        
        viewGraphContainer.transform = CGAffineTransform(rotationAngle: .pi / -2)
        
        pbOptionA.layoutIfNeeded()
        pbOptionB.layoutIfNeeded()
        pbOptionC.layoutIfNeeded()
        
        self.pbOptionA.progress = 1
        self.pbOptionB.progress = 0.94
        self.pbOptionC.progress = 0.76
        
        UIView.animate(withDuration: 0.5) {
            self.pbOptionA.layoutIfNeeded()
            self.pbOptionB.layoutIfNeeded()
            self.pbOptionC.layoutIfNeeded()
        }
        
        view.addSubview(lblA)
        lblA.snp.makeConstraints { make in
            make.leading.equalTo(80)
            make.top.equalTo(viewGraphContainer.snp.bottom).offset(-20)
        }
        
        view.addSubview(lblB)
        lblB.snp.makeConstraints { make in
            make.leading.equalTo(80)
            make.top.equalTo(lblA.snp.bottom).offset(20)
        }
        
        view.addSubview(lblC)
        lblC.snp.makeConstraints { make in
            make.leading.equalTo(80)
            make.top.equalTo(lblB.snp.bottom).offset(20)
        }
        
        view.addSubview(btnShareResult)
        btnShareResult.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width * 0.6)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-60)
            make.height.equalTo(52)
        }
    }
    
    
    func setupProgressBar(pb:UIProgressView, color:UIColor){
        pb.progress = 0.0
        pb.layer.cornerRadius = 33
        pb.clipsToBounds = true
        pb.layer.sublayers![1].cornerRadius = 33
        pb.subviews[1].clipsToBounds = true
        pb.progressTintColor  = color
        pb.trackTintColor = .clear
    }
    
    func setupBtn(btn:UIButton, caption:String, ico:String)  {
        btn.alpha = 1.0
        btn.titleLabel?.font = UITheme.Regular(23)
        btn.layer.cornerRadius = 26
        btn.layer.borderColor = UITheme.Color5.cgColor
        btn.layer.borderWidth = 2
        btn.setTitleColor(UITheme.Color5, for: .normal)
        btn.setTitle(caption, for: .normal)
        
        
        lazy var imgIco:UIImageView = {
            let image = UIImageView(image: UIImage(systemName: ico))
            image.tintColor = UITheme.Color5
            return image
        }()
        
        btn.addSubview(imgIco)
        imgIco.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(28)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupOptionLabel(label:UILabel, text:String, optionText:String, backgroundColor:UIColor)  {
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UITheme.Regular(22)
        label.textColor = UITheme.Color5
        label.textAlignment = .center
        label.text = text
        
        lazy var labelOption: UILabel = {
            let lbl = UILabel()
            lbl.text = optionText.uppercased()
            lbl.textColor = UITheme.Color5
            lbl.layer.backgroundColor = backgroundColor.cgColor
            lbl.layer.cornerRadius = 20
            lbl.textAlignment = .center
            lbl.font = UITheme.SemiBold(20)
            return lbl
        }()
        
        label.addSubview(labelOption)
        labelOption.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(-48)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
    }
    
    //MARK: Actions
    @objc func endEdition(){
        view.endEditing(true)
    }
    
    
    
}


extension ResultsView:PresenterToViewProtocolResults{
    func ResultsSucceded() {
        
    }
    
    func ResultsFailed() {
        
    }
    
    
}
