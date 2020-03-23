//
//  SwipingController.swift
//  AutoLayout-day3
//
//  Created by Sugirbay Margulan on 3/22/20.
//  Copyright © 2020 Sugirbay Margulan. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }) { (_) in
            
        }
        
    }
    var pages = [
        Page(imageName: "chelsea-logo", headerText: "Chelsea is a Brithish football club", bodyText: "The greatest football club ever. Currently coach is Frank Lampard and owner is Roman Abramovich"),
        Page(imageName: "chelsea-logo", headerText: "Chelsea is a Brithish football club", bodyText: "The greatest football club ever. Currently coach is Frank Lampard and owner is Roman Abramovich"),
        Page(imageName: "chelsea-logo", headerText: "Chelsea is a Brithish football club", bodyText: "The greatest football club ever. Currently coach is Frank Lampard and owner is Roman Abramovich")
    ]
    
    private let previusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev() {
              let nextIndex = max(pageControl.currentPage - 1, 0)
              let indexPath = IndexPath(item: nextIndex, section: 0)
              pageControl.currentPage = nextIndex
              collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
          }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(#colorLiteral(red: 0.01176470588, green: 0.2745098039, blue: 0.5803921569, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
           let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
           let indexPath = IndexPath(item: nextIndex, section: 0)
           pageControl.currentPage = nextIndex
           collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
       }
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = #colorLiteral(red: 0.01176470588, green: 0.2745098039, blue: 0.5803921569, alpha: 1)
        pc.pageIndicatorTintColor = .gray
        return pc
    }()

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        setupButtonControls()
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .blue
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    private func setupButtonControls() {
           
           
           let buttomControlsStackView = UIStackView(arrangedSubviews: [previusButton,pageControl,nextButton])
           buttomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
           buttomControlsStackView.distribution = .fillEqually
           view.addSubview(buttomControlsStackView)
           NSLayoutConstraint.activate([
               buttomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
               buttomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
               buttomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
               buttomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
           ])
       }
}
