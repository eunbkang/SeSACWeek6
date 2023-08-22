//
//  LocationViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/22.
//

import UIKit
import CoreLocation //1. 위치 import

class LocationViewController: UIViewController {

    //2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        //3. 위치 프로토콜 연결
        locationManager.delegate = self
        
        // info.plist <<< 얼럿 문구
//        locationManager.requestWhenInUseAuthorization()
        
        checkDeviceLocationAuthorization()
    }
    
    func checkDeviceLocationAuthorization() {
        
        // iOS 위치 서비스 활성화 체크
        
        DispatchQueue.global().async {
            
            if CLLocationManager.locationServicesEnabled() {
                
                // 현재 사용자의 위치 상태를 가지고 옴
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print(authorization)
                self.checkCurrentLocationAuthorization(status: authorization)
                
            } else {
                print("위치 서비스 꺼짐, 위치 권한 요청 불가")
            }
        }
    }
    
    // 사용자의 상태에 따라 권한 요청
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        print(#function, status)
        
        switch status {
        case .notDetermined: // 사용자가 처음 앱을 켰을 때, 아무것도 선택되지 않은 상태
            print("not determined")
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default:
            print("unknown status")
        }
    }
}

//4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {
    
    //5. 사용자의 위치를 성공적으로 가지고 온 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("======", locations)
    }

    // 사용자 위치 가져오기 실패한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }

    // 사용자의 권한 상태가 바뀔 때를 알려줌
    // 거부했다가 설정에서 변경, 또는 notDetermined 상태에서 허용하는 경우,
    // 허용해서 위치를 가져오는 도중에 설정에서 거부하고 앱으로 다시 돌아오는 경우 등
    // iOS14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    }

    // 사용자의 권한 상태가 바뀔 때 알려줌
    // iOS14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}
