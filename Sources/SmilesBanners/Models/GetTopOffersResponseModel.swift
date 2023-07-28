//
//  File.swift
//  
//
//  Created by Abdul Rehman Amjad on 27/07/2023.
//

import Foundation

public struct GetTopOffersResponseModel: Codable {
    
    public let extTransactionId: String?
    public let sliderTimeout: Double?
    public let ads: [TopOfferAdsDO]?
    
    public enum CodingKeys: String, CodingKey {
        case extTransactionId
        case sliderTimeout, ads
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        extTransactionId = try values.decodeIfPresent(String.self, forKey: .extTransactionId)
        sliderTimeout = try values.decodeIfPresent(Double.self, forKey: .sliderTimeout)
        ads = try values.decodeIfPresent([TopOfferAdsDO].self, forKey: .ads)
    }
    
    public struct TopOfferAdsDO : Codable {
        
        public let adId : Int?
        public let adImageUrl : String?
        public let externalWebUrl : String?
        public let featured: Bool?
        public let isPromotional: Bool?
        public var adsJsonAnimationUrl: String?

        public enum CodingKeys: String, CodingKey {
            case adId
            case adImageUrl, externalWebUrl, featured, isPromotional, adsJsonAnimationUrl
        }
        
        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            adId = try values.decodeIfPresent(Int.self, forKey: .adId)
            adImageUrl = try values.decodeIfPresent(String.self, forKey: .adImageUrl)
            externalWebUrl = try values.decodeIfPresent(String.self, forKey: .externalWebUrl)
            featured = try values.decodeIfPresent(Bool.self, forKey: .featured)
            isPromotional = try values.decodeIfPresent(Bool.self, forKey: .isPromotional)
            adsJsonAnimationUrl = try values.decodeIfPresent(String.self, forKey: .adsJsonAnimationUrl)
        }
                
    }
}
