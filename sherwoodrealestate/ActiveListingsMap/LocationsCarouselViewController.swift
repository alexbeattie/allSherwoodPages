//
//  LocationsCarouselViewController.swift
//  sherwoodrealestate
//
//  Created by Alex Beattie on 1/10/20.
//  Copyright © 2020 Alex Beattie. All rights reserved.
//

import UIKit
import LBTATools
import MapKit



class LocationCell: LBTAListCell<ListingAnno> {
//   var listing:AllListings!
    var listings:[ActiveListings.listingResults]?
      
    var homeController:HomeViewController?
    override var item: ListingAnno! {
        didSet {
            label.text = item.title
            let currencyFormatter = NumberFormatter()
            currencyFormatter.usesGroupingSeparator = true
            currencyFormatter.numberStyle = .currency
            currencyFormatter.maximumFractionDigits = 0

            // localize to your grouping and decimal separator
            currencyFormatter.locale = Locale.current
            priceLabel.text = currencyFormatter.string(from: item?.subtitle! as! NSNumber)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.masksToBounds = true
            imageView.constrainWidth(120)
            
            imageView.image = item.image
            
            
            

        }
    }
    
    let label = UILabel(text: "This is a road", font: .boldSystemFont(ofSize: 16), textAlignment: .center, numberOfLines: 1)
    let priceLabel = UILabel(text: "Address", font: .systemFont(ofSize: 14), textAlignment: .center)
    let imageView = UIImageView(frame: .init(x: 0, y: 0, width: 100, height: 100))
    
    override func setupViews() {
        backgroundColor = .white
        
        setupShadow(opacity: 0.1, radius: 5, offset: .zero, color: .black)
        layer.cornerRadius = 5
        clipsToBounds = true
//        stack(label, priceLabel,UIView(), spacing: 10).withMargins(.allSides(8))
        hstack(imageView, stack(label, priceLabel, spacing: 4).withMargins(.allSides(16)),
        alignment: .center)
    }
}

class LocationsCarouselController: LBTAListController<LocationCell, ListingAnno> {
    
    weak var mapOfListingVC: MapOfListings?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(self.items[indexPath.item].name)
        let annotations = mapOfListingVC?.mapView.annotations
        annotations?.forEach({ (annotation) in
            guard let customAnnotation = annotation as? MapOfListings.CustomListingAnno else { return }
            if customAnnotation.listingItem == self.items[indexPath.item] {
                mapOfListingVC?.mapView.selectAnnotation(annotation, animated: true)
            }
        
        })
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = false
    }
  
}
extension LocationsCarouselController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          .init(width: view.frame.width - 64, height: 100)
      }
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
          return .init(top: 0, left: 16, bottom: 0, right: 16)
      }
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 12
      }
}