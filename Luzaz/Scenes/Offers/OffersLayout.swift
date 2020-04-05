//
//  OffersLayout.swift
//  Luzaz
//
//  Created by Anas Mohamed on 2/7/20.
//  Copyright © 2020 Luzaz. All rights reserved.
//

import UIKit
protocol OffersLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
    
  }
class OffersLayout: UICollectionViewLayout {

      // 1
      weak var delegate: OffersLayoutDelegate?
      // 2
      private let numberOfColumns = 3
      private let cellPadding: CGFloat = 6

      // 3
      private var cache: [UICollectionViewLayoutAttributes] = []

      // 4
      private var contentHeight: CGFloat = 0

      private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
          return 0
        }
        let insets = collectionView.contentInset
        print("left instes  \(insets.left ) right instets \(insets.right)")
        return collectionView.bounds.width - (insets.left + insets.right)
      }

      // 5
      override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
      }
      
      override func prepare() {
        // 1
        cache.removeAll()
        guard
          cache.isEmpty == true,
          let collectionView = collectionView
          else {
            return
        }
        // 2
        let columnWidth = contentWidth   /   CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []
        for column in 0..<numberOfColumns {
          xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
          
        // 3
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
          let indexPath = IndexPath(item: item, section: 0)
            
          // 4
          
                let photoHeight = self.delegate?.collectionView(
                           collectionView,
                           heightForPhotoAtIndexPath: indexPath) ?? 180
               let  height = self.cellPadding * 2 + photoHeight
                      
            
         let frame = CGRect(x: xOffset[column],
                                                  y: yOffset[column],
                                                  width: columnWidth,
                                                  height: height)
          let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
          // 5
          let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
          attributes.frame = insetFrame
            
          cache.append(attributes)
            
          // 6
          contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            
          column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
      }
      
      override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        // Loop through the cache and look for items in the rect
        for attributes in cache {
          if attributes.frame.intersects(rect) {
            visibleLayoutAttributes.append(attributes)
          }
        }
        return visibleLayoutAttributes
      }
      
      override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
      }
    }


