//
//  HelperButton.swift
//  CHALLENGE_1
//
//  Created by Vladimir Vdovchenko on 08.02.2023.
//

import UIKit
import Foundation

final class HelperButton: UIButton {
    private var nameOffImage:String = ""
    private var nameOnImage:String = ""
    private var _imageView = UIImageView()
    
    convenience init(frame:CGRect, text:String) {
        self.init()
        nameOffImage=""
    }
    convenience init(_ imageName: String, _ imageNameOff: String) {
        self.init()
        nameOnImage = imageName
        nameOffImage = imageNameOff
        
        setImageView()
//        imageOff = imageNameOff
//        var button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(UIImage(named: imageName), for: .normal)
    }
    
    private func setImageView() {
        let image = UIImage(named: nameOnImage)
        _imageView = UIImageView(image: image)
        var aspectR: CGFloat = 0.0
        aspectR = (image?.size.width ?? 0.1) / (image?.size.height ?? 0.1)
        _imageView.contentMode = .scaleAspectFit
        self.addSubview(_imageView)
        //image.contentMode = .scaleToFill
        _imageView.translatesAutoresizingMaskIntoConstraints = false
        _imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        _imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        _imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        _imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        _imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        _imageView.heightAnchor.constraint(equalTo: _imageView.widthAnchor, multiplier: 1/aspectR).isActive = true
    }
    
    func setDisableImage() {
        _imageView.image = UIImage(named: nameOffImage)
        self.isEnabled = false
    }
}
