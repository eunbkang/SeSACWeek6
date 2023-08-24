//
//  LocationViewController.swift
//  SeSACWeek6
//
//  Created by Eunbee Kang on 2023/08/22.
//

import UIKit
import CoreLocation //1. 위치 import
import MapKit
import SnapKit

class LocationViewController: UIViewController {

    //2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    
    let mapView = MKMapView()
    
    let foodButton = UIButton()
    let shopButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        mapView.delegate = self
        
        view.addSubview(foodButton)
        foodButton.backgroundColor = .systemTeal
        foodButton.addTarget(self, action: #selector(tappedFoodButton), for: .touchUpInside)
        foodButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.size.equalTo(48)
            make.leading.equalTo(view).offset(16)
        }
        
        view.addSubview(shopButton)
        shopButton.backgroundColor = .systemOrange
        shopButton.addTarget(self, action: #selector(tappedShopButton), for: .touchUpInside)
        shopButton.snp.makeConstraints { make in
            make.top.equalTo(foodButton.snp.bottom).offset(24)
            make.size.equalTo(foodButton)
            make.leading.equalTo(foodButton)
        }
        
        view.backgroundColor = .white
        
        //3. 위치 프로토콜 연결
        locationManager.delegate = self
        
        // info.plist <<< 얼럿 문구
//        locationManager.requestWhenInUseAuthorization()
        
//        checkDeviceLocationAuthorization()
        
        // 37.545771, 126.954097 공덕초등학교
        let center = CLLocationCoordinate2D(latitude: 37.545771, longitude: 126.954097)
        setRegionAndAnnotation(center: center)
        
        addMapAnnotation(type: 0)
    }
    
    @objc func tappedFoodButton() {
        addMapAnnotation(type: 1)
        print(#function)
    }
    
    @objc func tappedShopButton() {
        print(#function)
    }
    
    func addMapAnnotation(type: Int) {
        
        // 37.546604, 126.954430 진대감
        // 37.543493, 126.952847 올리브영
        
        let annotation1 = MKPointAnnotation()
        annotation1.title = "진대감"
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 37.546604, longitude: 126.954430)
        
//        mapView.removeAnnotation(annotation1)
        
        let annotation2 = MKPointAnnotation()
        annotation2.title = "올리브영"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 37.543493, longitude: 126.952847)
        
//        mapView.addAnnotations([annotation2])
        
        if type == 0 { // viewDidLoad
            mapView.addAnnotations([annotation1, annotation2])
        } else if type == 1 {
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotation(annotation1)
        } else {
            mapView.removeAnnotation(annotation1) // annotation1이 함수 내 선언되었으므로 잘 제거되지 않음
            mapView.addAnnotation(annotation2)
        }
        
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        
//        37.176411, -3.589214 알함브라 궁전
        // 지도 중심 기반으로 보여질 범위 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 400, longitudinalMeters: 400)
        
        mapView.setRegion(region, animated: true)
        
        // 지도에 어노테이션 추가
        let annotation = MKPointAnnotation() // 애플 기본 핀 모양
        annotation.title = "공덕초등학교"
        annotation.coordinate = center // 원하는 위경도
        
        mapView.addAnnotation(annotation)
        
//        mapView.removeAnnotation(annotation)
    }
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            
            // 설정 앱에서 해당 앱 설정 화면에 들어간 적이 없다면 설정앱 메인으로 이동(해당 앱 설정 페이지까지 이동하지 않음)
            // 설정 앱 메인으로 갈지, 설정에서 해당 앱 상세페이지로 넘어갈지는 개발자가 결정할 수 없음
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        
        present(alert, animated: true)
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
                
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
                
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
            showLocationSettingAlert()
            
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
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setRegionAndAnnotation(center: coordinate)
            
            // 날씨 api 호출 등
        }
        
        locationManager.stopUpdatingLocation()
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

extension LocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        print(#function)
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        print(#function)
//    }
    
    
}
