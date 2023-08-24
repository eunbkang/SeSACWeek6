//
//  UIViewController+Extension.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/24.
//

import UIKit

extension UIViewController {
    // T - Type Parameter: 타입의 종류는 알려주지 않지만, 모두 같은 타입이 들어갈 것을 암시. 플레이스홀더와 같은 역할
    // U - Uppercased
    // Type Constraints: 클래스 제약, 프로토콜 제약
    
    // 사실 UIView는 제네릭 안써도 되는데 학습차원에서 한 것..
    func configureBorder<T: UIView>(view: T) {
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.clipsToBounds = true
    }
    
//    func configureBorder(view: UILabel) {
//
//    }
//
//    func configureBorder(view: UIButton) {
//
//    }
//
//    func configureBorder(view: UIImageView) {
//
//    }
    
    enum TransitionStyle {
        case present                // 네비게이션 없이 present
        case presentNavigation      // 네비게이션 임베드 된 present
        case presentFullNavigation  // 네비게이션 임베드 된 fullscreen present
        case push                   // 네비게이션 push
    }
    
    /*
     "고래밥" > String
     String.self > String.Type
     */
    
    func transition<T: UIViewController>(viewController: T.Type, storyboard: String, style: TransitionStyle) {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: viewController)) as? T else { return }
        
        switch style {
        case .present:
            present(vc, animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // Generic: 타입에 유연하게 대응하기 위한 요소
    // 코드 중복과 재사용에 대응하기가 좋아서 추상적인 표현 가능
    
    // 덧셈이 가능한 타입만 들어와야 함 -> AdditiveArithmetic
    func sum<T: AdditiveArithmetic>(a: T, b: T) -> T {
        return a + b
    }
    
    func sumInt(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func sumDouble(a: Double, b: Double) -> Double {
        return a + b
    }
    
    func sumFloat(a: Float, b: Float) -> Float {
        return a + b
    }
}
