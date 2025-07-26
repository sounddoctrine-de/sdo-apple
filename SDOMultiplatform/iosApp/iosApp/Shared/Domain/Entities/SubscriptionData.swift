//
//  SubscriptionData.swift
//  SDO
//
//  Created by Joel Kingsley on 27/08/2022.
//

import Foundation
import SwiftUI

struct SubscriptionData {
    let subscriptionId: String
    let subscriptionName: String
    let subscriptionCost: Double
    let currencyCode: String
    let eligibleForTrial: Bool
    let timeIntervalOfTrial: TimeInterval
    
    var localizedSubscriptionCostText: LocalizedStringKey {
        if eligibleForTrial {
            let timeIntervalOfTrialString = timeIntervalOfTrial.formattedByLength()
            let costPerMonthTextString = String(
                localized: "videoDetailCostPerMonthText \(subscriptionCost.formatted(.currency(code: currencyCode)))"
            )
            return "videoDetailSubscriptionTrialCostLabel \(timeIntervalOfTrialString) \(costPerMonthTextString)"
        } else {
            return "videoDetailCostPerMonthText \(subscriptionCost.formatted(.currency(code: currencyCode)))"
        }
    }
    
    var localizedSubscribeButtonText: LocalizedStringKey {
        if eligibleForTrial {
            return localizedTrySubscriptionText
        } else {
            return localizedSubscribeToText
        }
    }
    
    private var localizedSubscribeToText: LocalizedStringKey {
        return "videoDetailSubscribeToLabel \(subscriptionName)"
    }
    
    private var localizedTrySubscriptionText: LocalizedStringKey {
        return "videoDetailTrySubscriptionLabel \(subscriptionName)"
    }
}
