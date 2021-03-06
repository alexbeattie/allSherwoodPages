//
//  ListingInfoCell.swift
//  sherwoodrealestate
//
//  Created by Alex Beattie on 5/12/19.
//  Copyright © 2019 Alex Beattie. All rights reserved.
//

import UIKit
import LBTATools

class SoldListingInfoCell: UICollectionViewCell {
    let listingAddressLabel = UILabel(text: " ", font:.systemFont(ofSize: 14), textColor: .darkGray, textAlignment: .center)
    let listingCityLabel = UILabel(text: "city", font:.systemFont(ofSize: 14), textColor: .darkGray, textAlignment: .center )
    let listingStateLabel = UILabel(text: "state", font:.systemFont(ofSize: 14), textColor: .darkGray, textAlignment: .center)
    let listingIdLabel = UILabel(text: "ListingId", font:.systemFont(ofSize: 12))
    let mlsStatusLabel = UILabel(text: "MLS Status", font:.systemFont(ofSize: 14), textColor: .darkGray, textAlignment: .center)
    let coListAgentNameLabel = UILabel(text: "CoList", font:.systemFont(ofSize: 12))
    let listingAgentName = UILabel(text: "listingAgent", font:.systemFont(ofSize: 12))
    let openHousesLabelDate = UILabel(text: "openHouses", font:.systemFont(ofSize: 12))
    let openHousesLabelStart = UILabel(text: "openHouses", font:.systemFont(ofSize: 12))
    let openHousesLabelEnd = UILabel(text: "openHouses", font:.systemFont(ofSize: 12))
    let bedsTotalLabel = UILabel(text: "bedRooms", font: .systemFont(ofSize: 14),textColor: .darkGray, textAlignment: .center)
    let squareFootage = UILabel(text: "squareFootage", font: .systemFont(ofSize: 14),textColor: .darkGray, textAlignment: .center)
    let bathsLabel = UILabel(text: "Bathrooms:", font: .systemFont(ofSize: 14),textColor: .darkGray, textAlignment: .center)
    let costLabel = UILabel(text: "cost", font: .systemFont(ofSize: 14), textColor: .darkGray, textAlignment: .center)
    let zipLabel = UILabel(text: "zip", font: .systemFont(ofSize: 14), textColor: .darkGray, textAlignment: .center)

    
    
    
 
    
    var listing: SoldListings.listingResults! {
            didSet {
                if let newAddress = listing?.StandardFields.UnparsedFirstLineAddress?.localizedCapitalized {
                    listingAddressLabel.text = "\(newAddress),"
                }
//                listingAddressLabel.text =
    //            listingCityLabel.text = listing?.StandardFields.City
    //            listingStateLabel.text = String("\(listing?.StandardFields.StateOrProvince)")
                listingIdLabel.text = listing?.StandardFields.ListingId
                mlsStatusLabel.text = String("Status: \(listing?.StandardFields.MlsStatus)")
                coListAgentNameLabel.text = listing?.StandardFields.CoListAgentName
                listingAgentName.text = listing?.StandardFields.ListAgentName
                
                if let city = listing?.StandardFields.City {
                    listingCityLabel.text = "\(city), "
                }
                if let state = listing?.StandardFields.StateOrProvince {
                    listingStateLabel.text = "\(state),"
                }
//                if let state = listing?.StandardFields.StateOrProvince {
//                    listingStateLabel.text = state
//                }
                if let zipcode = listing.StandardFields.PostalCode {
                    zipLabel.text = zipcode
                }
                
                if let squareFeet = listing?.StandardFields.BuildingAreaTotal {
                    let nf = NumberFormatter()
                    nf.numberStyle = .decimal
                    let someDouble:Int = Int(squareFeet)
                    let newTrick = "\(nf.string(from: NSNumber(value:(UInt64(someDouble))))!)"
                    squareFootage.text = NSString(utf8String: "\(newTrick) SF") as String?
                }
                
                if let bathsTotal = listing?.StandardFields.BathsFull {
                    bathsLabel.text = ("\(bathsTotal) BA")
                }
                
                if let bedsTotal  = listing?.StandardFields.BedsTotal {
                    let nf = NumberFormatter()
                    nf.numberStyle = .decimal
                    if (listing?.StandardFields.BedsTotal) != nil {
                        bedsTotalLabel.text = String(describing: ("\(bedsTotal) BR" ))
                    }
                }
                
                if (listing?.StandardFields.MlsStatus) != nil {
                    mlsStatusLabel.text = String(" ")
                }
                if let listingId = listing?.StandardFields.ListingId {
                    listingIdLabel.text = String("Listing ID: \(listingId)")
                }
                
                if let colistingAgent = listing?.StandardFields.CoListAgentName {
                    coListAgentNameLabel.text = String("Co Listed: \(colistingAgent)")
                }
                
                if let listPrice = listing?.StandardFields.ListPrice {
                    let nf = NumberFormatter()
                    nf.numberStyle = .decimal
                    let subTitleCost = "$\(nf.string(from: NSNumber(value:(UInt64(listPrice))))!)"
                    costLabel.text = NSString(utf8String: subTitleCost) as String?
                    print(subTitleCost)
                }
            }
        }
    
 

    

    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .red

//                stack(listingAddressLabel,
//                    stack(hstack(listingCityLabel, listingStateLabel, zipLabel,
//                                 spacing: 2, alignment: .center, distribution: .fillProportionally), alignment: .center, distribution: .equalCentering),
//                    stack(hstack(bedsTotalLabel,bathsLabel,squareFootage,UIView(), spacing: 4, alignment: .top), alignment: .center, distribution: .fillProportionally))
//                hstack(costLabel, spacing: 8, alignment: .bottom, distribution: .fillEqually)

        
        
        
    stack(hstack(listingAddressLabel,listingCityLabel, listingStateLabel, zipLabel,
                 spacing: 2, alignment: .center, distribution: .fillProportionally),
    stack(hstack(bedsTotalLabel,bathsLabel,squareFootage,
                 spacing: 2, alignment: .center, distribution: .fillProportionally),
                 alignment: .center, distribution: .fillProportionally),
    stack(hstack(costLabel,
                 spacing: 2, alignment: .center, distribution: .fillProportionally)),
                 alignment: .center, distribution: .fillProportionally)

        
        
        

//        stack(hstack(listingAddressLabel,listingCityLabel, listingStateLabel, zipLabel,
//                     spacing: 2, alignment: .top, distribution: .equalSpacing),
//              stack(hstack(bedsTotalLabel,bathsLabel,squareFootage, spacing: 4, alignment: .top)), spacing:0, alignment:.bottom, distribution: .equalCentering)

//        hstack(costLabel, spacing: 8, alignment: .center, distribution: .fillEqually)

        
//        hstack(mlsStatusLabel,listingIdLabel, listingAgentName, UIView(),spacing: 8, alignment: .top).padLeft(12)
//        hstack(listingAddressLabel, listingCityLabel, listingStateLabel, UIView(),spacing: 8, alignment: .top).withMargins(.allSides(12)).padTop(14)
//        hstack(bedsTotalLabel, bathroomsLabelSource, squareFootage, UIView(),spacing: 4, alignment: .top).withMargins(.allSides(12)).padTop(26)
//        hstack(coListAgentNameLabel, UIView(),spacing: 16, alignment: .top).withMargins(.allSides(12)).padTop(38)

//        hstack(listingIdLabel, mlsStatusLabel, costLabel, UIView(),
//               alignment: .top).withMargins(.allSides(12)).padTop(64)
//        hstack(listingIdLabel, UIView(),
//               alignment: .top).withMargins(.allSides(12)).padTop(58)
//        hstack(listingIdLabel, UIView(),spacing: 16, alignment: .bottom).padLeft(12)

//        hstack(costLabel, UIView(),spacing: 16, alignment: .bottom).padLeft(12)
//        hstack(coListAgentNameLabel, UIView(),spacing: 16, alignment: .top).padLeft(12)


//        stack(listingIdLabel, mlsStatusLabel, spacing: 6)
//                      hstack(coListAgentName),
        
                     
               
        
        
        
//        let stackView = VerticalStackView(arrangedSubviews: [
//            UIStackView(arrangedSubviews: [
//                listingAddressLabel,listingCityLabel,listingStateLabel,
//                VerticalStackView(arrangedSubviews: [
//                     UIStackView(arrangedSubviews: [mlsStatusLabel]),
//                    ], spacing: 0)
//                ], customSpacing: 20),
//            costLabel,
//            squareFootage,
//            coListAgentName
//            ], spacing:16)
//        addSubview(stackView)
//        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

