//
//  ExploreViewController.swift
//  Discover
//
//  Created by Farouk on 8/29/17.
//  Copyright © 2017 Farouk. All rights reserved.
//

import Foundation
import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var interests = Interest.fetchInterests()
    let cellScaling: CGFloat = 0.6

    override func viewDidLoad() {
        super.viewDidLoad()
        
     let screenSize = UIScreen.main.bounds.size
     let cellWidth = floor(screenSize.width * cellScaling)
     let cellHeight = floor(screenSize.height * cellScaling)
     let insetX = (view.bounds.width - cellWidth) / 2.0
     let insetY = (view.bounds.height - cellHeight) / 2.0
     
     let layout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView?.contentInset = UIEdgeInsetsMake(insetY, insetX, insetY, insetX)
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
}
extension ExploreViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! ExploreCollectionViewCell
        cell.interest = interests[indexPath.item]
        
        return cell
        
    }
    
    
}

extension ExploreViewController: UIScrollViewDelegate, UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIcludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIcludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIcludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
    }
}



