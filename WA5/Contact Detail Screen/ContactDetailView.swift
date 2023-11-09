//
//  ContactDetailView.swift

import UIKit

class ContactDetailView: UIView {
    
    var imageContact: UIImageView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    var labelAddressTitle: UILabel!
    var labelAddress: UILabel!
    var labelCityAndState: UILabel!
    var labelZipCode: UILabel!
    //var imagePhoneType: UIImageView!
    
    
    //MARK: View initializer...
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color
        self.backgroundColor = .white
        
        setupimageContact()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhone()
        setupLabelAddressTitle()
        setupLabelAddress()
        setupLabelCityAndState()
        setupLabelZipCode()
        //setupImagePhoneType()
        
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupimageContact(){
        imageContact = UIImageView()
        imageContact.image = UIImage(systemName: "photo")
        imageContact.contentMode = .scaleToFill
        imageContact.clipsToBounds = true
        imageContact.layer.cornerRadius = 10
        imageContact.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageContact)
    }
    func setupLabelName() {
        labelName = UILabel()
        labelName.textAlignment = .left
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.font = UIFont.boldSystemFont(ofSize: 28)
        self.addSubview(labelName)
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.textAlignment = .left
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupLabelPhone() {
        labelPhone = UILabel()
        labelPhone.textAlignment = .left
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhone)
    }
    
    func setupLabelAddressTitle() {
        labelAddressTitle = UILabel()
        labelAddressTitle.text = "Address:"
        labelAddressTitle.font = UIFont.boldSystemFont(ofSize: 18)
        labelAddressTitle.textAlignment = .left
        labelAddressTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddressTitle)
    }
    
    func setupLabelAddress() {
        labelAddress = UILabel()
        labelAddress.textAlignment = .left
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddress)
    }
    
    func setupLabelCityAndState() {
        labelCityAndState = UILabel()
        labelCityAndState.textAlignment = .left
        labelCityAndState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelCityAndState)
    }
    
    func setupLabelZipCode() {
        labelZipCode = UILabel()
        labelZipCode.textAlignment = .left
        labelZipCode.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelZipCode)
    }
//    func setupImagePhoneType(){
//        imagePhoneType = UIImageView()
//        imagePhoneType.contentMode = .scaleAspectFit
//        imagePhoneType.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(imagePhoneType)
//    }
    
    
    //MARK: initializing the constraints...
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            imageContact.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 64),
            imageContact.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            //MARK: it is better to set the height and width of an ImageView with constraints...
            imageContact.heightAnchor.constraint(equalToConstant: 100),
            imageContact.widthAnchor.constraint(equalToConstant: 100),
            
            labelName.topAnchor.constraint(equalTo: imageContact.bottomAnchor, constant: 8),
            labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 32),
            labelEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 24),
            labelPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelAddressTitle.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 24),
            labelAddressTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelAddress.topAnchor.constraint(equalTo: labelAddressTitle.bottomAnchor, constant: 4),
            labelAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelCityAndState.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 4),
            labelCityAndState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelZipCode.topAnchor.constraint(equalTo: labelCityAndState.bottomAnchor, constant: 4),
            labelZipCode.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            //imagePhoneType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            //imagePhoneType.topAnchor.constraint(equalTo: labelZipCode.bottomAnchor, constant: 16),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
