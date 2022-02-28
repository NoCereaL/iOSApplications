//
//  MapViewControllerBridge.swift
//  First iPhone App
//
//  Created by Simon K Moyana on 11/08/2021.
//

import GoogleMaps
import SwiftUI

struct MapViewControllerBridge: UIViewControllerRepresentable {

  func makeUIViewController(context: Context) -> MapViewController {
    // Replace this line
    //return UIViewController() as! MapViewController
    return MapViewController()
  }

  func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
  }
}
