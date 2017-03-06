//
//  LSBaseViewController.swift
//  LSPDouYuTV
//
//  Created by lishaopeng on 17/3/6.
//  Copyright © 2017年 lishaopeng. All rights reserved.
//

import UIKit

class LSBaseViewController: UIViewController {

    
    var contentView : UIView?
    
    
    //MARK:-懒加载属性
    fileprivate lazy var animImageView : UIImageView = { [unowned self] in
        let imageView = UIImageView(image: UIImage(named: "img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named: "img_loading_1")!,UIImage(named: "img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin, . flexibleBottomMargin]
        return imageView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension LSBaseViewController {
    func setupUI(){
        //1.隐藏内容的View
        contentView?.isHidden = true
        
        //2.添加执行动画的UIImageView
        view.addSubview(animImageView)
        
        //3.执行动画
        animImageView.startAnimating()
        
        //4.设置view的背景颜色
        view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
    }
    
    func loadDataFinished() {
        //1.停止动画
        animImageView.stopAnimating()
        
        //2.隐藏animImageView
        animImageView.isHidden = true
        
        //3.显示内容的View
        contentView?.isHidden = false
    }
}
