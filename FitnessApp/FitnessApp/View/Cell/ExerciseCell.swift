//
//  ExerciseCell.swift
//  FitnessApp
//
//

import Foundation
import Foundation
import UIKit
import Kingfisher

class ExerciseTableCell: UITableViewCell {
    static let reuseableId:String = "ExerciseTableCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ExerciseTableCell.reuseableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    let orderImage : UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = color.grey
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerCurve = .continuous
        iv.layer.cornerRadius = 15
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = color.black
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        lb.scaleFont()
        return lb
    }()
    
    let detailContainer: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 5.0
        sv.alignment = .leading
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    
    func setupViews() {
        [orderImage,detailContainer].forEach {
            contentView.addSubview($0)
        }
        [titleLabel].forEach { item in
            detailContainer.addArrangedSubview(item)
        }
    }
    
    func setupConstraints(){
       
        NSLayoutConstraint.activate([
            
            orderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            orderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            orderImage.widthAnchor.constraint(equalToConstant: 68),
            orderImage.heightAnchor.constraint(equalTo: orderImage.widthAnchor),
            
            detailContainer.centerYAnchor.constraint(equalTo: orderImage.centerYAnchor),
            detailContainer.leadingAnchor.constraint(equalTo: orderImage.trailingAnchor, constant: 10),
   
        ])
    }
    
    func setupOrder(for item: ExerciseModel){
        orderImage.kf.setImage(with: URL(string: item.img))
        titleLabel.text = item.name
    }
    

}
