//
//  TableViewContactCell.swift

import UIKit

class TableViewContactCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    var imageContact: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupimageContact()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhone()
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.layer.borderColor = UIColor.lightGray.cgColor
        wrapperCellView.layer.borderWidth = 2
        wrapperCellView.layer.cornerRadius = 20
        self.addSubview(wrapperCellView)
    }
    func setupimageContact(){
        imageContact = UIImageView()
        imageContact.image = UIImage(systemName: "photo")
        imageContact.contentMode = .scaleToFill
        imageContact.clipsToBounds = true
        imageContact.layer.cornerRadius = 10
        imageContact.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageContact)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.font = UIFont.boldSystemFont(ofSize: 24)
        wrapperCellView.addSubview(labelName)
    }
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelEmail)
    }
    func setupLabelPhone(){
        labelPhone = UILabel()
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPhone)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            imageContact.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 13),
            imageContact.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            //MARK: it is better to set the height and width of an ImageView with constraints...
            imageContact.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -26),
            imageContact.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -26),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 12),
            labelName.leadingAnchor.constraint(equalTo: imageContact.trailingAnchor, constant: 16),
            labelName.heightAnchor.constraint(equalToConstant: 26),
            
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            labelEmail.leadingAnchor.constraint(equalTo: imageContact.trailingAnchor, constant: 16),
            labelEmail.heightAnchor.constraint(equalToConstant: 20),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 4),
            labelPhone.leadingAnchor.constraint(equalTo: imageContact.trailingAnchor, constant: 16),
            labelPhone.heightAnchor.constraint(equalToConstant: 20),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 104)
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
