//
//  CustomAnnotation.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/21.
//

import UIKit
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    @objc dynamic var coordinate: CLLocationCoordinate2D

    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
