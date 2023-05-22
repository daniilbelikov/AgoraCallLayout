//
//  AgoraCallLayout.swift
//  AgoraCallLayout
//
//  Created by Daniil Belikov on 22.05.2023.
//  Copyright © 2022 Daniil Belikov. All rights reserved.
//

import UIKit

public class AgoraCallLayout {
    
    public init() {}
    
    // MARK: - Public Properties
    
    public var insetForSectionAt: UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    public var minimumLineSpacing: CGFloat {
        return 0.0
    }
    
    // MARK: - Public Methods
    
    public func generateLayout(isSharing: Bool,
                        collectionView: UICollectionView,
                        indexPath: IndexPath,
                        usersCount: Int,
                        sharePadding: Double = 10.0,
                        classicPadding: Double = 16.0) -> CGSize {
        
        let sharingLayout = generateShareLayout(collectionView: collectionView,
                                                indexPath: indexPath,
                                                usersCount: usersCount,
                                                padding: sharePadding)
        
        let classicLayout = generateClassicLayout(collectionView: collectionView,
                                                  indexPath: indexPath,
                                                  usersCount: usersCount,
                                                  padding: classicPadding)
        
        return isSharing ? sharingLayout : classicLayout
    }
    
}

// MARK: - Private Methods

private extension AgoraCallLayout {
    
    func generateShareLayout(collectionView: UICollectionView,
                             indexPath: IndexPath,
                             usersCount: Int,
                             padding: Double) -> CGSize {
        
        let availableWidth = collectionView.frame.width
        let availableHeight = collectionView.frame.height
        
        switch usersCount {
        case 1:
            return CGSize(width: availableWidth, height: availableHeight)
        case 2...20:
            if indexPath.row == 0 {
                return CGSize(width: availableWidth, height: availableHeight * 0.5)
            } else {
                let widthPerItem = (availableWidth - padding) / 2.0
                let heightPerItem = availableHeight * 0.5
                return CGSize(width: widthPerItem, height: heightPerItem)
            }
        default:
            return CGSize(width: availableWidth, height: availableHeight)
        }
    }
    
    func generateClassicLayout(collectionView: UICollectionView,
                               indexPath: IndexPath,
                               usersCount: Int,
                               padding: Double) -> CGSize {
        
        let availableWidth = collectionView.frame.width
        let availableHeight = collectionView.frame.height
        
        switch usersCount {
        case 1:
            return CGSize(width: availableWidth, height: availableHeight)
        case 2:
            let users = CGFloat(usersCount)
            return CGSize(width: (availableHeight / users), height: (availableHeight / users))
        case 3, 4:
            let widthPerItem = (availableWidth - padding) / 2.0
            let heightPerItem = availableHeight / 2.0
            return CGSize(width: widthPerItem, height: heightPerItem)
        case 5...20:
            let widthPerItem = (availableWidth - padding) / 2.0
            let heightPerItem = availableHeight / 3.0
            return CGSize(width: widthPerItem, height: heightPerItem)
        default:
            return CGSize(width: availableWidth, height: availableHeight)
        }
    }
    
}
