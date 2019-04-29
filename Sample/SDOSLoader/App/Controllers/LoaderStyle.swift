//
//  LoaderStyle.swift
//  SDOSLoaderSample
//
//  Created by Rafael Fernandez Alvarez on 26/04/2019.
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import SDOSSwiftExtension
import SDOSLoader
import SDOSCustomLoader
import MBProgressHUD
import M13ProgressSuite
import DGActivityIndicatorView

extension LoaderObject {
    enum style {
        static var styleSDOSLoaderProgress: Style<SDOSLoaderProgress> {
            return Style<SDOSLoaderProgress> {
                $0.progressColor = .green
                $0.trackColor = .orange
                $0.trackWidth = 20
            }
        }
        
        static var styleMBProgressHUDText: Style<MBProgressHUD> {
            return Style<MBProgressHUD> {
                $0.contentColor = .red
                $0.detailsLabel.text = "Por favor, espere"
                $0.animationType = .zoomIn
            }
        }
        
        static var styleMBProgressHUDBar: Style<MBProgressHUD> {
            return Style<MBProgressHUD> {
                $0.contentColor = .blue
                $0.detailsLabel.text = "Por favor, espere"
                $0.animationType = .zoomOut
            }
        }
        
        static var styleMBProgressHUDCircular: Style<MBProgressHUD> {
            return Style<MBProgressHUD> {
                $0.contentColor = .black
                $0.detailsLabel.text = "Por favor, espere"
                $0.animationType = .zoom
            }
        }
        
        static var styleM13ProgressViewRing: Style<M13ProgressViewRing> {
            return Style<M13ProgressViewRing> {
                $0.backgroundRingWidth = 10
                $0.progressRingWidth = 10
                $0.showPercentage = false
                $0.primaryColor = .black
                $0.secondaryColor = .lightGray
            }
        }
        
        static var styleDGActivityIndicatorView: Style<DGActivityIndicatorView> {
            return Style<DGActivityIndicatorView> {
                $0.tintColor = .orange
            }
        }
    }
}
