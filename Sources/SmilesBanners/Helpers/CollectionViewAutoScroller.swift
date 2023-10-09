//
//  File.swift
//  
//
//  Created by Abdul Rehman Amjad on 27/07/2023.
//

import Foundation
import UIKit

public class CollectionViewAutoScroller: NSObject {
    public var itemsCount = 0
    public var collectionView: UICollectionView?
    public weak var timer: Timer?
    public var currentIndex = 0
    
    public init(collectionView: UICollectionView, itemsCount:Int,currentIndex:Int) {
        self.itemsCount = itemsCount
        self.collectionView = collectionView
        self.currentIndex = currentIndex
        super.init()
        if itemsCount>0 {
            self.startTimer()
        }
    }
    
    public func resetAutoScroller() {
        
        timer?.invalidate()
        itemsCount = 0
        currentIndex = 0
        
    }
    
    // -------------------------------------------------------------------------------
    //    Timer Controls
    // -------------------------------------------------------------------------------
    func startTimer(interval: Double = 5.0) {
        guard itemsCount>0 else {return}
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }
            if self.itemsCount == 0 {
                self.stopTimer()
            }
            if self.currentIndex < self.itemsCount {
                let indexPath = IndexPath(item: self.currentIndex, section: 0)
                UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut) { [weak self] in
                    if let collection = self?.collectionView, collection.isValid(indexPath: indexPath){
                        self?.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
                    }
                } completion: { (success) in
                    
                }
                self.currentIndex = self.currentIndex + 1
            } else {
                self.currentIndex = 1
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) { [weak self] in
                    self?.collectionView?.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: false)
                } completion: { (success) in
                    
                }
            }
        }
        timer?.fire()
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
