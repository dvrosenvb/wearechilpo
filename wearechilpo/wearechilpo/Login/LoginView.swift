//
//  LoginView.swift
//  wearechilpo
//
//  Created by Rosendo Vázquez on 28/04/22.
//

import Foundation
import UIKit
import SnapKit
import Lottie

class LoginView:UIViewController{

    //MARK: VIPER Elements
    var presenter : ViewToPresenterProtocolLogin?
    
    //MARK: Value Elements
    var viewState:Int?
    var separator = 16
    
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
    
    lazy var imgBg: UIImageView = {
        let img = UIImageView(image: UIImage(named: "bg"))
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var tfUsername: UITextField = {
        let txt = UITextField()
        setupTextFiedl(txt: txt,
                       icoName: "person.circle",
                       placeHolderText: "usuario")
        return txt
    }()
    
    lazy var tfPassword: UITextField = {
        let txt = UITextField()
        setupTextFiedl(txt: txt,
                       icoName: "lock.circle",
                       placeHolderText: "contraseña",
                       isPassword: true)
        return txt
    }()
    
    lazy var btnLogin: UIButton = {
        let btn = UIButton()
        setupBtnLogin(btn: btn,
                      title: "Iniciar sesión",
                      titleColor: UITheme.Color5,
                      backColor: UITheme.Color3,
                      sizeFont: 20)
        return btn
    }()
    
    lazy var btnLoginGoogle: UIButton = {
        let btn = UIButton()
        setupBtnLogin(btn: btn,
                      title: "Iniciar sesión con Google",
                      titleColor: UITheme.Color3,
                      backColor: UITheme.Color5,
                      sizeFont: 14)
        
        lazy var ico:UIImageView = {
            let img = UIImageView(image: UIImage(named: "googleIco"))
            img.contentMode = .scaleAspectFit
            img.clipsToBounds = true
            return img
        }()
        
        btn.addSubview(ico)
        ico.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        return btn
    }()
    
    lazy var logo:UIImageView = {
        let img = UIImageView(image: UIImage(named: "logo"))
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
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
        navigationItem.hidesBackButton = true
        print("WillAppear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload")
        setupView()
        
         
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("didappear")
    }
        
    //MARK: Funcs
    func setupView() {
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        
        
        view.addSubview(tfUsername)
        tfUsername.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width * 0.7)
            make.height.equalTo(52)
            make.centerX.centerY.equalToSuperview()
        }
        
        view.addSubview(tfPassword)
        tfPassword.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width * 0.7)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.top.equalTo(tfUsername.snp.bottom).offset(separator)
        }
        
        view.addSubview(btnLogin)
        btnLogin.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width * 0.68)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.top.equalTo(tfPassword.snp.bottom).offset(separator)
        }
        view.addSubview(btnLoginGoogle)
        btnLoginGoogle.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width * 0.68)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(tfUsername.snp.top).offset(-separator)
        }
        
        
        view.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(btnLoginGoogle.snp.top).offset(-separator)
            make.width.height.equalTo(140)
        }
        
        btnLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    
    func setupTextFiedl(txt:UITextField, icoName:String, placeHolderText:String, isPassword:Bool? = false)  {
        txt.backgroundColor = .clear
        txt.borderStyle = .none
        txt.font = UITheme.Regular(18)
        txt.isSecureTextEntry = isPassword!
        txt.tintColor = UITheme.Color3
        txt.textColor = UITheme.Color3
        txt.layer.borderWidth = 2
        txt.layer.cornerRadius = 26
        txt.layer.backgroundColor = UITheme.Color5.cgColor
        txt.layer.borderColor = UITheme.Color1.cgColor
        
        lazy var ico: UIImageView = {
            let img = UIImageView(image: UIImage(systemName: icoName))
            img.contentMode = .scaleAspectFill
            img.tintColor = UITheme.Color2
            return img
        }()
        
        lazy var viewLeft: UIView = {
            let view = UIView()
            return view
        }()
        
        txt.leftView = viewLeft
        viewLeft.addSubview(ico)
        ico.frame = CGRect(x: 8, y: 6, width: 30, height: 30)
        txt.leftView?.frame = CGRect(x: 0, y: 0, width: 42, height: 40)
        txt.leftViewMode = .always
        txt.attributedPlaceholder = NSAttributedString(
            string: placeHolderText,
            attributes: [NSAttributedString.Key.foregroundColor: UITheme.Color11,
                         NSAttributedString.Key.font: UITheme.Regular(18)]
        )
    }
    
    func setupBtnLogin(btn:UIButton, title:String, titleColor:UIColor, backColor:UIColor, sizeFont:CGFloat)  {
        btn.layer.cornerRadius = 26
        btn.layer.backgroundColor = backColor.cgColor
        btn.setTitleColor(titleColor, for: .normal)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UITheme.SemiBold(sizeFont)
    }
   
    //MARK: Actions
    @objc func endEdition(){
        view.endEditing(true)
    }
    
    @objc func login(){
        view.endEditing(true)
        guard let navC = self.navigationController else { return }
        presenter?.goToHome(actualVC: navC)
    }
    
}
 

extension LoginView:PresenterToViewProtocolLogin{
    func LoginSucceded() {
            
    }
    
    func LoginFailed() {
        
    }
    
    
}
