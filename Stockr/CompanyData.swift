//
//  CompanyData.swift
//  Stockr
//
//  Created by jwunderl on 12/3/19.
//  Copyright © 2019 John Wunderle. All rights reserved.
//

import Foundation

struct CompanyData: Codable {
    let symbol, companyName, primaryExchange, calculationPrice: String
    let open, openTime, close, closeTime: JSONNull?
    let high, low: JSONNull?
    let latestPrice: Double
    let latestSource, latestTime: String
    let latestUpdate: Int
    let latestVolume: JSONNull?
    let iexRealtimePrice: Double
    let iexRealtimeSize, iexLastUpdated: Int
    let delayedPrice, delayedPriceTime, extendedPrice, extendedChange: JSONNull?
    let extendedChangePercent, extendedPriceTime: JSONNull?
    let previousClose: Double
    let previousVolume: Int
    let change, changePercent: Double
    let volume: JSONNull?
    let iexMarketPercent: Double
    let iexVolume, avgTotalVolume, iexBidPrice, iexBidSize: Int
    let iexAskPrice: Double
    let iexAskSize, marketCap: Int
    let peRatio, week52High: Double
    let week52Low: Int
    let ytdChange: Double
    let lastTradeTime: Int
    let isUSMarketOpen: Bool

    enum CodingKeys: String, CodingKey {
        case symbol, companyName, primaryExchange, calculationPrice
        case open, openTime, close, closeTime, high, low, latestPrice, latestSource, latestTime, latestUpdate, latestVolume, iexRealtimePrice, iexRealtimeSize, iexLastUpdated, delayedPrice, delayedPriceTime, extendedPrice, extendedChange, extendedChangePercent, extendedPriceTime, previousClose, previousVolume, change, changePercent, volume, iexMarketPercent, iexVolume, avgTotalVolume, iexBidPrice, iexBidSize, iexAskPrice, iexAskSize, marketCap, peRatio, week52High, week52Low, ytdChange, lastTradeTime, isUSMarketOpen
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
