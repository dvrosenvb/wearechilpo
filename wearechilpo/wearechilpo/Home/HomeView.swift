//
//  HomeView.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 27/04/22.
//

import Foundation
import UIKit
import SnapKit
import Lottie

class HomeView:UIViewController{
    //MARK: VIPER Elements
    var presenter : ViewToPresenterProtocolHome?
    
    //MARK: Value Elements
    var viewState:Int?
    //MARK: UIElements
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UITheme.Color2.cgColor,
            UITheme.Color1.cgColor
        ]
        gradient.locations = [0, 1.95]
        return gradient
    }()
    
    lazy var lblQuestion: UILabel = {
        let lbl = UILabel()
        lbl.font = UITheme.SemiBold(50)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .center
        lbl.text = "¿Cuál cree que debería ser la prioridad en la ciudad?"
        lbl.textColor = UITheme.Color5
        return lbl
    }()
    
    
    lazy var lblOptions: UILabel = {
        let lbl = UILabel()
        lbl.font = UITheme.SemiBold(30)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .left
        lbl.text = "a) Zocaleadas \nb) Agua potable \nc) Seguridad"
        lbl.textColor = UITheme.Color6
        return lbl
    }()
    
    lazy var lblVoted: UILabel = {
        let lbl = UILabel()
        lbl.font = UITheme.SemiBold(30)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.textAlignment = .center
        lbl.text = "Gracias por hacerte presente, tu voto permitirá dar visibilidad a las prioridades de la ciudad."
        lbl.textColor = UITheme.Color5
        return lbl
    }()
    
    
    lazy var viewContainerOptions: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.backgroundColor = UITheme.Color5.cgColor
        return view
    }()
    
    lazy var btnWant2BePart: UIButton = {
        let btn = UIButton()
        btn.layer.backgroundColor = UITheme.Color3.cgColor
        btn.layer.cornerRadius = 50
        btn.alpha = 1.0
        btn.titleLabel?.font = UITheme.SemiBold(30)
        btn.tintColor = UITheme.Color5
        btn.setTitle("Quiero votar", for: .normal)
        return btn
    }()
    
    lazy var btnResults: UIButton = {
        let btn = UIButton()
        btn.alpha = 1.0
        btn.titleLabel?.font = UITheme.SemiBold(14)
        btn.setTitleColor(UITheme.Color2, for: .normal)
        btn.setTitle("Ver resultados", for: .normal)
        return btn
    }()
    
    lazy var btnOptionA: UIButton = {
        let btn = UIButton()
        setupOption(btn: btn, caption: "A")
        return btn
    }()
    
    lazy var btnOptionB: UIButton = {
        let btn = UIButton()
        setupOption(btn: btn, caption: "B")
        return btn
    }()
    
    lazy var btnOptionC: UIButton = {
        let btn = UIButton()
        setupOption(btn: btn, caption: "C")
        return btn
    }()
    
    lazy var btnSendPoll: UIButton = {
        let btn = UIButton()
        setupBtnVoted(btn: btn, caption: "Enviar encuesta", ico: "paperplane.fill")
        return btn
    }()
    
    lazy var btnRate: UIButton = {
        let btn = UIButton()
        setupBtnVoted(btn: btn, caption: "Calificar App", ico: "star.fill")
        return btn
    }()
    
    lazy var viewAnimation: AnimationView = {
            let view = AnimationView(animation: Animation.named("voted"))
            view.contentMode = .scaleAspectFit
            view.play()
            view.loopMode = .autoReverse
            return view
    }()
    
    //MARK: Lifecycle
    init(status:Int?) {
        self.viewState = status
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        self.setupNavBar(titleTxt: "Somos Chilpo", tintColor: .white, backgroundColor: .white)
        print("WillAppear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload")
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        
        if viewState != 0 {
            setupViewVoted()
        }else{
            setupView()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("didappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("diSappear")
        title = ""
    }
    
    //MARK: Funcs
    func setupView() {
        
        view.addSubview(lblQuestion)
        lblQuestion.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        view.addSubview(lblOptions)
        lblOptions.snp.makeConstraints { make in
            make.leading.trailing.equalTo(lblQuestion)
            make.top.equalTo(lblQuestion.snp.bottom).offset(40)
            
        }
        
        view.addSubview(viewContainerOptions)
        viewContainerOptions.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(view.frame.height / 4)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        viewContainerOptions.addSubview(btnWant2BePart)
        btnWant2BePart.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width * 0.7)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
        }

        viewContainerOptions.addSubview(btnResults)
        btnResults.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(140)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-20)
            
        }
        
        btnWant2BePart.addTarget(self, action: #selector(showOptions), for: .touchUpInside)
        btnResults.addTarget(self, action: #selector(goToResults), for: .touchUpInside)
    }
    
    func setupViewVoted() {
        view.addSubview(viewAnimation)
        viewAnimation.play()
        viewAnimation.loopMode = .autoReverse
        viewAnimation.snp.makeConstraints { make in
            make.width.height.equalTo(300)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        
        view.addSubview(lblVoted)
        lblVoted.snp.makeConstraints { make in
            make.top.equalTo(viewAnimation.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        view.addSubview(btnSendPoll)
        btnSendPoll.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(52)
            make.top.equalTo(lblVoted.snp.bottom).offset(20)
        }
        
        view.addSubview(btnRate)
        btnRate.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(52)
            make.top.equalTo(btnSendPoll.snp.bottom).offset(20)
        }
    }
    
    func removeBigButton()  {
        btnWant2BePart.removeFromSuperview()
        
        viewContainerOptions.addSubview(btnOptionB)
        btnOptionB.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
            make.width.height.equalTo(100)
        }
        
        viewContainerOptions.addSubview(btnOptionA)
        btnOptionA.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-20)
            make.width.height.equalTo(100)
            make.trailing.equalTo(btnOptionB.snp.leading).offset(-20)
        }
        
        viewContainerOptions.addSubview(btnOptionC)
        btnOptionC.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-20)
            make.width.height.equalTo(100)
            make.leading.equalTo(btnOptionB.snp.trailing).offset(20)
        }
        
        btnOptionA.addTarget(self, action: #selector(pressedA), for: .touchUpInside)
        btnOptionB.addTarget(self, action: #selector(pressedB), for: .touchUpInside)
        btnOptionC.addTarget(self, action: #selector(pressedC), for: .touchUpInside)
        
    }
    
     
    func setupOption(btn:UIButton, caption:String){
        btn.alpha = 1.0
        btn.titleLabel?.font = UITheme.XtraBold(40)
        btn.layer.backgroundColor = UITheme.Color3.cgColor
        btn.layer.cornerRadius = 50
        btn.setTitleColor(UITheme.Color5, for: .normal)
        btn.setTitle(caption, for: .normal)
    }
    
    func setupBtnVoted(btn:UIButton, caption:String, ico:String)  {
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
    
    //MARK: Actions
    @objc func endEdition(){
        view.endEditing(true)
    }
    
    @objc func showOptions(){
        removeBigButton()
    }
    
    @objc func goToResults(){
        print("goToResults")
        guard let navC = self.navigationController else { return }
        presenter?.goToResults(actualVc: navC)
    }
    
    @objc func pressedA(){
        lblQuestion.removeFromSuperview()
        lblOptions.removeFromSuperview()
        viewContainerOptions.removeFromSuperview()
        setupViewVoted()
    }
    
    @objc func pressedB(){
        lblQuestion.removeFromSuperview()
        lblOptions.removeFromSuperview()
        viewContainerOptions.removeFromSuperview()
        setupViewVoted()
    }
    
    @objc func pressedC(){
        lblQuestion.removeFromSuperview()
        lblOptions.removeFromSuperview()
        viewContainerOptions.removeFromSuperview()
        setupViewVoted()
    }
    
}
 

extension HomeView:PresenterToViewProtocolHome{
    func HomeSucceded() {
            
    }
    
    func HomeFailed() {
        
    }
    
    
}
