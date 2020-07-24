//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CollectionFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(published: Swift.Optional<CollectionPublished?> = nil, search: Swift.Optional<String?> = nil, isBanner: Swift.Optional<Bool?> = nil, isHidden: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["published": published, "search": search, "isBanner": isBanner, "isHidden": isHidden]
  }

  public var published: Swift.Optional<CollectionPublished?> {
    get {
      return graphQLMap["published"] as? Swift.Optional<CollectionPublished?> ?? Swift.Optional<CollectionPublished?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "published")
    }
  }

  public var search: Swift.Optional<String?> {
    get {
      return graphQLMap["search"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "search")
    }
  }

  public var isBanner: Swift.Optional<Bool?> {
    get {
      return graphQLMap["isBanner"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isBanner")
    }
  }

  public var isHidden: Swift.Optional<Bool?> {
    get {
      return graphQLMap["isHidden"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isHidden")
    }
  }
}

public enum CollectionPublished: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case published
  case hidden
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "PUBLISHED": self = .published
      case "HIDDEN": self = .hidden
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .published: return "PUBLISHED"
      case .hidden: return "HIDDEN"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CollectionPublished, rhs: CollectionPublished) -> Bool {
    switch (lhs, rhs) {
      case (.published, .published): return true
      case (.hidden, .hidden): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CollectionPublished] {
    return [
      .published,
      .hidden,
    ]
  }
}

public struct ProductFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(isPublished: Swift.Optional<Bool?> = nil, collections: Swift.Optional<[GraphQLID?]?> = nil, categories: Swift.Optional<[GraphQLID?]?> = nil, price: Swift.Optional<PriceRangeInput?> = nil, attributes: Swift.Optional<[AttributeInput?]?> = nil, stockAvailability: Swift.Optional<StockAvailability?> = nil, productType: Swift.Optional<GraphQLID?> = nil, search: Swift.Optional<String?> = nil) {
    graphQLMap = ["isPublished": isPublished, "collections": collections, "categories": categories, "price": price, "attributes": attributes, "stockAvailability": stockAvailability, "productType": productType, "search": search]
  }

  public var isPublished: Swift.Optional<Bool?> {
    get {
      return graphQLMap["isPublished"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isPublished")
    }
  }

  public var collections: Swift.Optional<[GraphQLID?]?> {
    get {
      return graphQLMap["collections"] as? Swift.Optional<[GraphQLID?]?> ?? Swift.Optional<[GraphQLID?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "collections")
    }
  }

  public var categories: Swift.Optional<[GraphQLID?]?> {
    get {
      return graphQLMap["categories"] as? Swift.Optional<[GraphQLID?]?> ?? Swift.Optional<[GraphQLID?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "categories")
    }
  }

  public var price: Swift.Optional<PriceRangeInput?> {
    get {
      return graphQLMap["price"] as? Swift.Optional<PriceRangeInput?> ?? Swift.Optional<PriceRangeInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "price")
    }
  }

  public var attributes: Swift.Optional<[AttributeInput?]?> {
    get {
      return graphQLMap["attributes"] as? Swift.Optional<[AttributeInput?]?> ?? Swift.Optional<[AttributeInput?]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributes")
    }
  }

  public var stockAvailability: Swift.Optional<StockAvailability?> {
    get {
      return graphQLMap["stockAvailability"] as? Swift.Optional<StockAvailability?> ?? Swift.Optional<StockAvailability?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "stockAvailability")
    }
  }

  public var productType: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["productType"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "productType")
    }
  }

  public var search: Swift.Optional<String?> {
    get {
      return graphQLMap["search"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "search")
    }
  }
}

public struct PriceRangeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(gte: Swift.Optional<Double?> = nil, lte: Swift.Optional<Double?> = nil) {
    graphQLMap = ["gte": gte, "lte": lte]
  }

  /// Price greater than or equal
  public var gte: Swift.Optional<Double?> {
    get {
      return graphQLMap["gte"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gte")
    }
  }

  /// Price less than or equal
  public var lte: Swift.Optional<Double?> {
    get {
      return graphQLMap["lte"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lte")
    }
  }
}

public struct AttributeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(slug: String, value: String) {
    graphQLMap = ["slug": slug, "value": value]
  }

  /// Internal representation of an attribute name.
  public var slug: String {
    get {
      return graphQLMap["slug"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "slug")
    }
  }

  /// Internal representation of a value (unique per attribute).
  public var value: String {
    get {
      return graphQLMap["value"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }
}

public enum StockAvailability: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case inStock
  case outOfStock
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "IN_STOCK": self = .inStock
      case "OUT_OF_STOCK": self = .outOfStock
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .inStock: return "IN_STOCK"
      case .outOfStock: return "OUT_OF_STOCK"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: StockAvailability, rhs: StockAvailability) -> Bool {
    switch (lhs, rhs) {
      case (.inStock, .inStock): return true
      case (.outOfStock, .outOfStock): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [StockAvailability] {
    return [
      .inStock,
      .outOfStock,
    ]
  }
}

public struct PaymentInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(gateway: GatewaysEnum, token: String, deviceSessionId: Swift.Optional<String?> = nil, saveCard: Swift.Optional<Bool?> = nil, saveAsDefault: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["gateway": gateway, "token": token, "deviceSessionId": deviceSessionId, "saveCard": saveCard, "saveAsDefault": saveAsDefault]
  }

  /// A gateway to use with that payment.
  public var gateway: GatewaysEnum {
    get {
      return graphQLMap["gateway"] as! GatewaysEnum
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gateway")
    }
  }

  /// Client-side generated payment token, representing customer's billing data in a secure manner.
  public var token: String {
    get {
      return graphQLMap["token"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "token")
    }
  }

  /// Client-side generated device session ID.
  public var deviceSessionId: Swift.Optional<String?> {
    get {
      return graphQLMap["deviceSessionId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deviceSessionId")
    }
  }

  /// Save card.
  public var saveCard: Swift.Optional<Bool?> {
    get {
      return graphQLMap["saveCard"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "saveCard")
    }
  }

  /// Save card as default payment method.
  public var saveAsDefault: Swift.Optional<Bool?> {
    get {
      return graphQLMap["saveAsDefault"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "saveAsDefault")
    }
  }
}

/// An enumeration.
public enum GatewaysEnum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case conekta
  case valeDespensa
  case openpay
  case siVale
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "CONEKTA": self = .conekta
      case "VALE_DESPENSA": self = .valeDespensa
      case "OPENPAY": self = .openpay
      case "SI_VALE": self = .siVale
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .conekta: return "CONEKTA"
      case .valeDespensa: return "VALE_DESPENSA"
      case .openpay: return "OPENPAY"
      case .siVale: return "SI_VALE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: GatewaysEnum, rhs: GatewaysEnum) -> Bool {
    switch (lhs, rhs) {
      case (.conekta, .conekta): return true
      case (.valeDespensa, .valeDespensa): return true
      case (.openpay, .openpay): return true
      case (.siVale, .siVale): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [GatewaysEnum] {
    return [
      .conekta,
      .valeDespensa,
      .openpay,
      .siVale,
    ]
  }
}

/// An enumeration.
public enum PaymentChargeStatusEnum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case notCharged
  case partiallyCharged
  case fullyCharged
  case partiallyRefunded
  case fullyRefunded
  case chargePending
  case paymentOnDelivery
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "NOT_CHARGED": self = .notCharged
      case "PARTIALLY_CHARGED": self = .partiallyCharged
      case "FULLY_CHARGED": self = .fullyCharged
      case "PARTIALLY_REFUNDED": self = .partiallyRefunded
      case "FULLY_REFUNDED": self = .fullyRefunded
      case "CHARGE_PENDING": self = .chargePending
      case "PAYMENT_ON_DELIVERY": self = .paymentOnDelivery
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .notCharged: return "NOT_CHARGED"
      case .partiallyCharged: return "PARTIALLY_CHARGED"
      case .fullyCharged: return "FULLY_CHARGED"
      case .partiallyRefunded: return "PARTIALLY_REFUNDED"
      case .fullyRefunded: return "FULLY_REFUNDED"
      case .chargePending: return "CHARGE_PENDING"
      case .paymentOnDelivery: return "PAYMENT_ON_DELIVERY"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: PaymentChargeStatusEnum, rhs: PaymentChargeStatusEnum) -> Bool {
    switch (lhs, rhs) {
      case (.notCharged, .notCharged): return true
      case (.partiallyCharged, .partiallyCharged): return true
      case (.fullyCharged, .fullyCharged): return true
      case (.partiallyRefunded, .partiallyRefunded): return true
      case (.fullyRefunded, .fullyRefunded): return true
      case (.chargePending, .chargePending): return true
      case (.paymentOnDelivery, .paymentOnDelivery): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [PaymentChargeStatusEnum] {
    return [
      .notCharged,
      .partiallyCharged,
      .fullyCharged,
      .partiallyRefunded,
      .fullyRefunded,
      .chargePending,
      .paymentOnDelivery,
    ]
  }
}

public enum OrderAction: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Represents the capture action.
  case capture
  /// Represents a mark-as-paid action.
  case markAsPaid
  /// Represents a refund action.
  case refund
  /// Represents a void action.
  case void
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "CAPTURE": self = .capture
      case "MARK_AS_PAID": self = .markAsPaid
      case "REFUND": self = .refund
      case "VOID": self = .void
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .capture: return "CAPTURE"
      case .markAsPaid: return "MARK_AS_PAID"
      case .refund: return "REFUND"
      case .void: return "VOID"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: OrderAction, rhs: OrderAction) -> Bool {
    switch (lhs, rhs) {
      case (.capture, .capture): return true
      case (.markAsPaid, .markAsPaid): return true
      case (.refund, .refund): return true
      case (.void, .void): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [OrderAction] {
    return [
      .capture,
      .markAsPaid,
      .refund,
      .void,
    ]
  }
}

public struct CheckoutCreateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(lines: [CheckoutLineInput?], email: Swift.Optional<String?> = nil, shippingAddress: Swift.Optional<AddressInput?> = nil, billingAddress: Swift.Optional<AddressInput?> = nil) {
    graphQLMap = ["lines": lines, "email": email, "shippingAddress": shippingAddress, "billingAddress": billingAddress]
  }

  /// A list of checkout lines, each containing information about an item in the checkout.
  public var lines: [CheckoutLineInput?] {
    get {
      return graphQLMap["lines"] as! [CheckoutLineInput?]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lines")
    }
  }

  /// The customer's email address.
  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  /// The mailing address to where the checkout will be shipped.
  public var shippingAddress: Swift.Optional<AddressInput?> {
    get {
      return graphQLMap["shippingAddress"] as? Swift.Optional<AddressInput?> ?? Swift.Optional<AddressInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "shippingAddress")
    }
  }

  /// Billing address of the customer.
  public var billingAddress: Swift.Optional<AddressInput?> {
    get {
      return graphQLMap["billingAddress"] as? Swift.Optional<AddressInput?> ?? Swift.Optional<AddressInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "billingAddress")
    }
  }
}

public struct CheckoutLineInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(quantity: Int, variantId: GraphQLID) {
    graphQLMap = ["quantity": quantity, "variantId": variantId]
  }

  /// The number of items purchased.
  public var quantity: Int {
    get {
      return graphQLMap["quantity"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "quantity")
    }
  }

  /// ID of the ProductVariant.
  public var variantId: GraphQLID {
    get {
      return graphQLMap["variantId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "variantId")
    }
  }
}

public struct AddressInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(addressName: Swift.Optional<String?> = nil, firstName: Swift.Optional<String?> = nil, lastName: Swift.Optional<String?> = nil, companyName: Swift.Optional<String?> = nil, streetAddress1: Swift.Optional<String?> = nil, streetAddress2: Swift.Optional<String?> = nil, city: Swift.Optional<String?> = nil, cityArea: Swift.Optional<String?> = nil, postalCode: Swift.Optional<String?> = nil, country: Swift.Optional<String?> = nil, countryArea: Swift.Optional<String?> = nil, phone: Swift.Optional<String?> = nil) {
    graphQLMap = ["addressName": addressName, "firstName": firstName, "lastName": lastName, "companyName": companyName, "streetAddress1": streetAddress1, "streetAddress2": streetAddress2, "city": city, "cityArea": cityArea, "postalCode": postalCode, "country": country, "countryArea": countryArea, "phone": phone]
  }

  /// Address Name ID.
  public var addressName: Swift.Optional<String?> {
    get {
      return graphQLMap["addressName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "addressName")
    }
  }

  /// Given name.
  public var firstName: Swift.Optional<String?> {
    get {
      return graphQLMap["firstName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  /// Family name.
  public var lastName: Swift.Optional<String?> {
    get {
      return graphQLMap["lastName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  /// Company or organization.
  public var companyName: Swift.Optional<String?> {
    get {
      return graphQLMap["companyName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "companyName")
    }
  }

  /// Address.
  public var streetAddress1: Swift.Optional<String?> {
    get {
      return graphQLMap["streetAddress1"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "streetAddress1")
    }
  }

  /// Address.
  public var streetAddress2: Swift.Optional<String?> {
    get {
      return graphQLMap["streetAddress2"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "streetAddress2")
    }
  }

  /// City.
  public var city: Swift.Optional<String?> {
    get {
      return graphQLMap["city"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "city")
    }
  }

  /// District.
  public var cityArea: Swift.Optional<String?> {
    get {
      return graphQLMap["cityArea"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cityArea")
    }
  }

  /// Postal code.
  public var postalCode: Swift.Optional<String?> {
    get {
      return graphQLMap["postalCode"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "postalCode")
    }
  }

  /// Country.
  public var country: Swift.Optional<String?> {
    get {
      return graphQLMap["country"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "country")
    }
  }

  /// State or province.
  public var countryArea: Swift.Optional<String?> {
    get {
      return graphQLMap["countryArea"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "countryArea")
    }
  }

  /// Phone number.
  public var phone: Swift.Optional<String?> {
    get {
      return graphQLMap["phone"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phone")
    }
  }
}

/// An enumeration.
public enum ShippingMethodTypeEnum: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case price
  case weight
  case sameDay
  case nextDay
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "PRICE": self = .price
      case "WEIGHT": self = .weight
      case "SAME_DAY": self = .sameDay
      case "NEXT_DAY": self = .nextDay
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .price: return "PRICE"
      case .weight: return "WEIGHT"
      case .sameDay: return "SAME_DAY"
      case .nextDay: return "NEXT_DAY"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ShippingMethodTypeEnum, rhs: ShippingMethodTypeEnum) -> Bool {
    switch (lhs, rhs) {
      case (.price, .price): return true
      case (.weight, .weight): return true
      case (.sameDay, .sameDay): return true
      case (.nextDay, .nextDay): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ShippingMethodTypeEnum] {
    return [
      .price,
      .weight,
      .sameDay,
      .nextDay,
    ]
  }
}

public struct CustomerPasswordResetInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(email: String) {
    graphQLMap = ["email": email]
  }

  /// Email of the user that will be used for password recovery.
  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }
}

public struct SetNewPasswordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(token: String, uidb64: String, newPassword: String) {
    graphQLMap = ["token": token, "uidb64": uidb64, "newPassword": newPassword]
  }

  public var token: String {
    get {
      return graphQLMap["token"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "token")
    }
  }

  public var uidb64: String {
    get {
      return graphQLMap["uidb64"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "uidb64")
    }
  }

  public var newPassword: String {
    get {
      return graphQLMap["newPassword"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "newPassword")
    }
  }
}

public struct CustomerInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(defaultBillingAddress: Swift.Optional<AddressInput?> = nil, defaultShippingAddress: Swift.Optional<AddressInput?> = nil, firstName: Swift.Optional<String?> = nil, lastName: Swift.Optional<String?> = nil, email: Swift.Optional<String?> = nil, isActive: Swift.Optional<Bool?> = nil, note: Swift.Optional<String?> = nil) {
    graphQLMap = ["defaultBillingAddress": defaultBillingAddress, "defaultShippingAddress": defaultShippingAddress, "firstName": firstName, "lastName": lastName, "email": email, "isActive": isActive, "note": note]
  }

  /// Billing address of the customer.
  public var defaultBillingAddress: Swift.Optional<AddressInput?> {
    get {
      return graphQLMap["defaultBillingAddress"] as? Swift.Optional<AddressInput?> ?? Swift.Optional<AddressInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "defaultBillingAddress")
    }
  }

  /// Shipping address of the customer.
  public var defaultShippingAddress: Swift.Optional<AddressInput?> {
    get {
      return graphQLMap["defaultShippingAddress"] as? Swift.Optional<AddressInput?> ?? Swift.Optional<AddressInput?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "defaultShippingAddress")
    }
  }

  /// Given name.
  public var firstName: Swift.Optional<String?> {
    get {
      return graphQLMap["firstName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  /// Family name.
  public var lastName: Swift.Optional<String?> {
    get {
      return graphQLMap["lastName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  /// The unique email address of the user.
  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  /// User account is active.
  public var isActive: Swift.Optional<Bool?> {
    get {
      return graphQLMap["isActive"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isActive")
    }
  }

  /// A note about the user.
  public var note: Swift.Optional<String?> {
    get {
      return graphQLMap["note"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "note")
    }
  }
}

public struct ChangePasswordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(oldPassword: Swift.Optional<String?> = nil, newPassword1: String, newPassword2: String) {
    graphQLMap = ["oldPassword": oldPassword, "newPassword1": newPassword1, "newPassword2": newPassword2]
  }

  /// Old password
  public var oldPassword: Swift.Optional<String?> {
    get {
      return graphQLMap["oldPassword"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "oldPassword")
    }
  }

  /// New password
  public var newPassword1: String {
    get {
      return graphQLMap["newPassword1"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "newPassword1")
    }
  }

  /// Repeat new password
  public var newPassword2: String {
    get {
      return graphQLMap["newPassword2"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "newPassword2")
    }
  }
}

/// An enumeration.
public enum OrderStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Borrador
  case draft
  /// Pendiente
  case unfulfilled
  /// Parcialmente completada
  case partiallyFulfilled
  /// Completada
  case fulfilled
  /// Cancelada
  case canceled
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "DRAFT": self = .draft
      case "UNFULFILLED": self = .unfulfilled
      case "PARTIALLY_FULFILLED": self = .partiallyFulfilled
      case "FULFILLED": self = .fulfilled
      case "CANCELED": self = .canceled
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .draft: return "DRAFT"
      case .unfulfilled: return "UNFULFILLED"
      case .partiallyFulfilled: return "PARTIALLY_FULFILLED"
      case .fulfilled: return "FULFILLED"
      case .canceled: return "CANCELED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: OrderStatus, rhs: OrderStatus) -> Bool {
    switch (lhs, rhs) {
      case (.draft, .draft): return true
      case (.unfulfilled, .unfulfilled): return true
      case (.partiallyFulfilled, .partiallyFulfilled): return true
      case (.fulfilled, .fulfilled): return true
      case (.canceled, .canceled): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [OrderStatus] {
    return [
      .draft,
      .unfulfilled,
      .partiallyFulfilled,
      .fulfilled,
      .canceled,
    ]
  }
}

public final class FetchCategoriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchCategories($level: Int!, $first: Int!) {
      categories(level: $level, first: $first) {
        __typename
        edges {
          __typename
          node {
            __typename
            id
            name
            backgroundImage {
              __typename
              url
            }
            children(first: 30) {
              __typename
              totalCount
              edges {
                __typename
                node {
                  __typename
                  id
                  name
                  backgroundImage {
                    __typename
                    url
                  }
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName = "fetchCategories"

  public var level: Int
  public var first: Int

  public init(level: Int, first: Int) {
    self.level = level
    self.first = first
  }

  public var variables: GraphQLMap? {
    return ["level": level, "first": first]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("categories", arguments: ["level": GraphQLVariable("level"), "first": GraphQLVariable("first")], type: .object(Category.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(categories: Category? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "categories": categories.flatMap { (value: Category) -> ResultMap in value.resultMap }])
    }

    /// List of the shop's categories.
    public var categories: Category? {
      get {
        return (resultMap["categories"] as? ResultMap).flatMap { Category(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "categories")
      }
    }

    public struct Category: GraphQLSelectionSet {
      public static let possibleTypes = ["CategoryCountableConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "CategoryCountableConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["CategoryCountableEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .nonNull(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "CategoryCountableEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Category"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("backgroundImage", type: .object(BackgroundImage.selections)),
            GraphQLField("children", arguments: ["first": 30], type: .object(Child.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, backgroundImage: BackgroundImage? = nil, children: Child? = nil) {
            self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name, "backgroundImage": backgroundImage.flatMap { (value: BackgroundImage) -> ResultMap in value.resultMap }, "children": children.flatMap { (value: Child) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of the object.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var backgroundImage: BackgroundImage? {
            get {
              return (resultMap["backgroundImage"] as? ResultMap).flatMap { BackgroundImage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "backgroundImage")
            }
          }

          /// List of children of the category.
          public var children: Child? {
            get {
              return (resultMap["children"] as? ResultMap).flatMap { Child(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "children")
            }
          }

          public struct BackgroundImage: GraphQLSelectionSet {
            public static let possibleTypes = ["Image"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(url: String) {
              self.init(unsafeResultMap: ["__typename": "Image", "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The URL of the image.
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }

          public struct Child: GraphQLSelectionSet {
            public static let possibleTypes = ["CategoryCountableConnection"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("totalCount", type: .scalar(Int.self)),
              GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(totalCount: Int? = nil, edges: [Edge]) {
              self.init(unsafeResultMap: ["__typename": "CategoryCountableConnection", "totalCount": totalCount, "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A total count of items in the collection
            public var totalCount: Int? {
              get {
                return resultMap["totalCount"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "totalCount")
              }
            }

            public var edges: [Edge] {
              get {
                return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
              }
            }

            public struct Edge: GraphQLSelectionSet {
              public static let possibleTypes = ["CategoryCountableEdge"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("node", type: .nonNull(.object(Node.selections))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(node: Node) {
                self.init(unsafeResultMap: ["__typename": "CategoryCountableEdge", "node": node.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The item at the end of the edge
              public var node: Node {
                get {
                  return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "node")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes = ["Category"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  GraphQLField("backgroundImage", type: .object(BackgroundImage.selections)),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(id: GraphQLID, name: String, backgroundImage: BackgroundImage? = nil) {
                  self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name, "backgroundImage": backgroundImage.flatMap { (value: BackgroundImage) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The ID of the object.
                public var id: GraphQLID {
                  get {
                    return resultMap["id"]! as! GraphQLID
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }

                public var backgroundImage: BackgroundImage? {
                  get {
                    return (resultMap["backgroundImage"] as? ResultMap).flatMap { BackgroundImage(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "backgroundImage")
                  }
                }

                public struct BackgroundImage: GraphQLSelectionSet {
                  public static let possibleTypes = ["Image"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(url: String) {
                    self.init(unsafeResultMap: ["__typename": "Image", "url": url])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The URL of the image.
                  public var url: String {
                    get {
                      return resultMap["url"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "url")
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class FetchCollectionQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchCollection($id: ID!, $first: Int, $after: String) {
      collection(id: $id) {
        __typename
        id
        name
        slug
        description
        backgroundImage {
          __typename
          url
          color
        }
        isBanner
        isHidden
        products(first: $first, after: $after) {
          __typename
          pageInfo {
            __typename
            hasNextPage
            endCursor
          }
          edges {
            __typename
            node {
              __typename
              id
              name
              pricing {
                __typename
                priceRange {
                  __typename
                  stop {
                    __typename
                    gross {
                      __typename
                      amount
                      localized
                    }
                  }
                }
              }
              weight {
                __typename
                unit
                value
              }
              description
              availability {
                __typename
                quantityOnCheckout
              }
              thumbnail {
                __typename
                url
              }
              category {
                __typename
                id
                name
              }
              productType {
                __typename
                name
              }
              isAvailable
              variants {
                __typename
                id
                sku
                name
                pricing {
                  __typename
                  price {
                    __typename
                    gross {
                      __typename
                      amount
                      currency
                      localized
                    }
                  }
                }
                availability {
                  __typename
                  quantityOnCheckout
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName = "fetchCollection"

  public var id: GraphQLID
  public var first: Int?
  public var after: String?

  public init(id: GraphQLID, first: Int? = nil, after: String? = nil) {
    self.id = id
    self.first = first
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["id": id, "first": first, "after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("collection", arguments: ["id": GraphQLVariable("id")], type: .object(Collection.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(collection: Collection? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "collection": collection.flatMap { (value: Collection) -> ResultMap in value.resultMap }])
    }

    /// Lookup a collection by ID.
    public var collection: Collection? {
      get {
        return (resultMap["collection"] as? ResultMap).flatMap { Collection(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "collection")
      }
    }

    public struct Collection: GraphQLSelectionSet {
      public static let possibleTypes = ["Collection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("slug", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("backgroundImage", type: .object(BackgroundImage.selections)),
        GraphQLField("isBanner", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("isHidden", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("products", arguments: ["first": GraphQLVariable("first"), "after": GraphQLVariable("after")], type: .object(Product.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, slug: String, description: String, backgroundImage: BackgroundImage? = nil, isBanner: Bool, isHidden: Bool, products: Product? = nil) {
        self.init(unsafeResultMap: ["__typename": "Collection", "id": id, "name": name, "slug": slug, "description": description, "backgroundImage": backgroundImage.flatMap { (value: BackgroundImage) -> ResultMap in value.resultMap }, "isBanner": isBanner, "isHidden": isHidden, "products": products.flatMap { (value: Product) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of the object.
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var slug: String {
        get {
          return resultMap["slug"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "slug")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var backgroundImage: BackgroundImage? {
        get {
          return (resultMap["backgroundImage"] as? ResultMap).flatMap { BackgroundImage(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "backgroundImage")
        }
      }

      public var isBanner: Bool {
        get {
          return resultMap["isBanner"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isBanner")
        }
      }

      public var isHidden: Bool {
        get {
          return resultMap["isHidden"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isHidden")
        }
      }

      /// List of products in this collection.
      public var products: Product? {
        get {
          return (resultMap["products"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "products")
        }
      }

      public struct BackgroundImage: GraphQLSelectionSet {
        public static let possibleTypes = ["Image"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("url", type: .nonNull(.scalar(String.self))),
          GraphQLField("color", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(url: String, color: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "url": url, "color": color])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The URL of the image.
        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        /// Color
        public var color: String? {
          get {
            return resultMap["color"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "color")
          }
        }
      }

      public struct Product: GraphQLSelectionSet {
        public static let possibleTypes = ["ProductCountableConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pageInfo: PageInfo, edges: [Edge]) {
          self.init(unsafeResultMap: ["__typename": "ProductCountableConnection", "pageInfo": pageInfo.resultMap, "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var pageInfo: PageInfo {
          get {
            return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
          }
        }

        public var edges: [Edge] {
          get {
            return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["PageInfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(hasNextPage: Bool, endCursor: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, are there more items?
          public var hasNextPage: Bool {
            get {
              return resultMap["hasNextPage"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "hasNextPage")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return resultMap["endCursor"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endCursor")
            }
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["ProductCountableEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node) {
            self.init(unsafeResultMap: ["__typename": "ProductCountableEdge", "node": node.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge
          public var node: Node {
            get {
              return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes = ["Product"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("pricing", type: .object(Pricing.selections)),
              GraphQLField("weight", type: .object(Weight.selections)),
              GraphQLField("description", type: .nonNull(.scalar(String.self))),
              GraphQLField("availability", type: .object(Availability.selections)),
              GraphQLField("thumbnail", type: .object(Thumbnail.selections)),
              GraphQLField("category", type: .nonNull(.object(Category.selections))),
              GraphQLField("productType", type: .nonNull(.object(ProductType.selections))),
              GraphQLField("isAvailable", type: .scalar(Bool.self)),
              GraphQLField("variants", type: .list(.object(Variant.selections))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String, pricing: Pricing? = nil, weight: Weight? = nil, description: String, availability: Availability? = nil, thumbnail: Thumbnail? = nil, category: Category, productType: ProductType, isAvailable: Bool? = nil, variants: [Variant?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "pricing": pricing.flatMap { (value: Pricing) -> ResultMap in value.resultMap }, "weight": weight.flatMap { (value: Weight) -> ResultMap in value.resultMap }, "description": description, "availability": availability.flatMap { (value: Availability) -> ResultMap in value.resultMap }, "thumbnail": thumbnail.flatMap { (value: Thumbnail) -> ResultMap in value.resultMap }, "category": category.resultMap, "productType": productType.resultMap, "isAvailable": isAvailable, "variants": variants.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of the object.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// Lists the storefront product's pricing,
            /// the current price and discounts, only meant for displaying.
            public var pricing: Pricing? {
              get {
                return (resultMap["pricing"] as? ResultMap).flatMap { Pricing(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "pricing")
              }
            }

            public var weight: Weight? {
              get {
                return (resultMap["weight"] as? ResultMap).flatMap { Weight(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "weight")
              }
            }

            public var description: String {
              get {
                return resultMap["description"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "description")
              }
            }

            /// Informs about product's availability in the
            /// storefront, current price and discounts.
            public var availability: Availability? {
              get {
                return (resultMap["availability"] as? ResultMap).flatMap { Availability(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "availability")
              }
            }

            /// The main thumbnail for a product.
            public var thumbnail: Thumbnail? {
              get {
                return (resultMap["thumbnail"] as? ResultMap).flatMap { Thumbnail(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "thumbnail")
              }
            }

            public var category: Category {
              get {
                return Category(unsafeResultMap: resultMap["category"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "category")
              }
            }

            public var productType: ProductType {
              get {
                return ProductType(unsafeResultMap: resultMap["productType"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "productType")
              }
            }

            /// Whether the product is in stock and visible or not.
            public var isAvailable: Bool? {
              get {
                return resultMap["isAvailable"] as? Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isAvailable")
              }
            }

            /// List of variants for the product
            public var variants: [Variant?]? {
              get {
                return (resultMap["variants"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Variant?] in value.map { (value: ResultMap?) -> Variant? in value.flatMap { (value: ResultMap) -> Variant in Variant(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }, forKey: "variants")
              }
            }

            public struct Pricing: GraphQLSelectionSet {
              public static let possibleTypes = ["ProductPricingInfo"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("priceRange", type: .object(PriceRange.selections)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(priceRange: PriceRange? = nil) {
                self.init(unsafeResultMap: ["__typename": "ProductPricingInfo", "priceRange": priceRange.flatMap { (value: PriceRange) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The discounted price range of the product variants.
              public var priceRange: PriceRange? {
                get {
                  return (resultMap["priceRange"] as? ResultMap).flatMap { PriceRange(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "priceRange")
                }
              }

              public struct PriceRange: GraphQLSelectionSet {
                public static let possibleTypes = ["TaxedMoneyRange"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("stop", type: .object(Stop.selections)),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(stop: Stop? = nil) {
                  self.init(unsafeResultMap: ["__typename": "TaxedMoneyRange", "stop": stop.flatMap { (value: Stop) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Upper bound of a price range.
                public var stop: Stop? {
                  get {
                    return (resultMap["stop"] as? ResultMap).flatMap { Stop(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "stop")
                  }
                }

                public struct Stop: GraphQLSelectionSet {
                  public static let possibleTypes = ["TaxedMoney"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(gross: Gross) {
                    self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Amount of money including taxes.
                  public var gross: Gross {
                    get {
                      return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "gross")
                    }
                  }

                  public struct Gross: GraphQLSelectionSet {
                    public static let possibleTypes = ["Money"]

                    public static let selections: [GraphQLSelection] = [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
                      GraphQLField("localized", type: .nonNull(.scalar(String.self))),
                    ]

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(amount: Double, localized: String) {
                      self.init(unsafeResultMap: ["__typename": "Money", "amount": amount, "localized": localized])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Amount of money.
                    public var amount: Double {
                      get {
                        return resultMap["amount"]! as! Double
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "amount")
                      }
                    }

                    /// Money formatted according to the current locale.
                    public var localized: String {
                      get {
                        return resultMap["localized"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "localized")
                      }
                    }
                  }
                }
              }
            }

            public struct Weight: GraphQLSelectionSet {
              public static let possibleTypes = ["Weight"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("unit", type: .nonNull(.scalar(String.self))),
                GraphQLField("value", type: .nonNull(.scalar(Double.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(unit: String, value: Double) {
                self.init(unsafeResultMap: ["__typename": "Weight", "unit": unit, "value": value])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Weight unit
              public var unit: String {
                get {
                  return resultMap["unit"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "unit")
                }
              }

              /// Weight value
              public var value: Double {
                get {
                  return resultMap["value"]! as! Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "value")
                }
              }
            }

            public struct Availability: GraphQLSelectionSet {
              public static let possibleTypes = ["ProductAvailabilityInfo"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("quantityOnCheckout", type: .scalar(Int.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(quantityOnCheckout: Int? = nil) {
                self.init(unsafeResultMap: ["__typename": "ProductAvailabilityInfo", "quantityOnCheckout": quantityOnCheckout])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var quantityOnCheckout: Int? {
                get {
                  return resultMap["quantityOnCheckout"] as? Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "quantityOnCheckout")
                }
              }
            }

            public struct Thumbnail: GraphQLSelectionSet {
              public static let possibleTypes = ["Image"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("url", type: .nonNull(.scalar(String.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String) {
                self.init(unsafeResultMap: ["__typename": "Image", "url": url])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The URL of the image.
              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }
            }

            public struct Category: GraphQLSelectionSet {
              public static let possibleTypes = ["Category"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, name: String) {
                self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The ID of the object.
              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }

            public struct ProductType: GraphQLSelectionSet {
              public static let possibleTypes = ["ProductType"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String) {
                self.init(unsafeResultMap: ["__typename": "ProductType", "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }

            public struct Variant: GraphQLSelectionSet {
              public static let possibleTypes = ["ProductVariant"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("sku", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("pricing", type: .object(Pricing.selections)),
                GraphQLField("availability", type: .object(Availability.selections)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, sku: String, name: String, pricing: Pricing? = nil, availability: Availability? = nil) {
                self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "sku": sku, "name": name, "pricing": pricing.flatMap { (value: Pricing) -> ResultMap in value.resultMap }, "availability": availability.flatMap { (value: Availability) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The ID of the object.
              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              public var sku: String {
                get {
                  return resultMap["sku"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "sku")
                }
              }

              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              /// Lists the storefront variant's pricing,
              /// the current price and discounts, only meant for displaying
              public var pricing: Pricing? {
                get {
                  return (resultMap["pricing"] as? ResultMap).flatMap { Pricing(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "pricing")
                }
              }

              /// Informs about variant's availability in the
              /// storefront, current price and discounted price.
              public var availability: Availability? {
                get {
                  return (resultMap["availability"] as? ResultMap).flatMap { Availability(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "availability")
                }
              }

              public struct Pricing: GraphQLSelectionSet {
                public static let possibleTypes = ["VariantPricingInfo"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("price", type: .object(Price.selections)),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(price: Price? = nil) {
                  self.init(unsafeResultMap: ["__typename": "VariantPricingInfo", "price": price.flatMap { (value: Price) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The price, with any discount subtracted.
                public var price: Price? {
                  get {
                    return (resultMap["price"] as? ResultMap).flatMap { Price(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "price")
                  }
                }

                public struct Price: GraphQLSelectionSet {
                  public static let possibleTypes = ["TaxedMoney"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(gross: Gross) {
                    self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Amount of money including taxes.
                  public var gross: Gross {
                    get {
                      return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "gross")
                    }
                  }

                  public struct Gross: GraphQLSelectionSet {
                    public static let possibleTypes = ["Money"]

                    public static let selections: [GraphQLSelection] = [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
                      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
                      GraphQLField("localized", type: .nonNull(.scalar(String.self))),
                    ]

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(amount: Double, currency: String, localized: String) {
                      self.init(unsafeResultMap: ["__typename": "Money", "amount": amount, "currency": currency, "localized": localized])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Amount of money.
                    public var amount: Double {
                      get {
                        return resultMap["amount"]! as! Double
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "amount")
                      }
                    }

                    /// Currency code.
                    public var currency: String {
                      get {
                        return resultMap["currency"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "currency")
                      }
                    }

                    /// Money formatted according to the current locale.
                    public var localized: String {
                      get {
                        return resultMap["localized"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "localized")
                      }
                    }
                  }
                }
              }

              public struct Availability: GraphQLSelectionSet {
                public static let possibleTypes = ["VariantAvailabilityInfo"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("quantityOnCheckout", type: .scalar(Int.self)),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(quantityOnCheckout: Int? = nil) {
                  self.init(unsafeResultMap: ["__typename": "VariantAvailabilityInfo", "quantityOnCheckout": quantityOnCheckout])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var quantityOnCheckout: Int? {
                  get {
                    return resultMap["quantityOnCheckout"] as? Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "quantityOnCheckout")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class FetchCollectionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchCollections($first: Int, $after: String, $filter: CollectionFilterInput!) {
      collections(first: $first, filter: $filter) {
        __typename
        edges {
          __typename
          node {
            __typename
            id
            name
            slug
            description
            backgroundImage {
              __typename
              url
              color
            }
            isBanner
            isHidden
            products(first: 10, after: $after) {
              __typename
              pageInfo {
                __typename
                hasNextPage
                endCursor
              }
              edges {
                __typename
                node {
                  __typename
                  id
                  name
                  description
                  availability {
                    __typename
                    quantityOnCheckout
                  }
                  pricing {
                    __typename
                    priceRange {
                      __typename
                      stop {
                        __typename
                        gross {
                          __typename
                          amount
                          localized
                        }
                      }
                    }
                  }
                  weight {
                    __typename
                    unit
                    value
                  }
                  thumbnail {
                    __typename
                    url
                  }
                  category {
                    __typename
                    id
                    name
                  }
                  productType {
                    __typename
                    name
                  }
                  isAvailable
                  variants {
                    __typename
                    id
                    sku
                    name
                    pricing {
                      __typename
                      price {
                        __typename
                        gross {
                          __typename
                          amount
                          currency
                          localized
                        }
                      }
                    }
                    availability {
                      __typename
                      quantityOnCheckout
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName = "fetchCollections"

  public var first: Int?
  public var after: String?
  public var filter: CollectionFilterInput

  public init(first: Int? = nil, after: String? = nil, filter: CollectionFilterInput) {
    self.first = first
    self.after = after
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["first": first, "after": after, "filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("collections", arguments: ["first": GraphQLVariable("first"), "filter": GraphQLVariable("filter")], type: .object(Collection.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(collections: Collection? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "collections": collections.flatMap { (value: Collection) -> ResultMap in value.resultMap }])
    }

    /// List of the shop's collections.
    public var collections: Collection? {
      get {
        return (resultMap["collections"] as? ResultMap).flatMap { Collection(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "collections")
      }
    }

    public struct Collection: GraphQLSelectionSet {
      public static let possibleTypes = ["CollectionCountableConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "CollectionCountableConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["CollectionCountableEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .nonNull(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "CollectionCountableEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Collection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("slug", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("backgroundImage", type: .object(BackgroundImage.selections)),
            GraphQLField("isBanner", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("isHidden", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("products", arguments: ["first": 10, "after": GraphQLVariable("after")], type: .object(Product.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, slug: String, description: String, backgroundImage: BackgroundImage? = nil, isBanner: Bool, isHidden: Bool, products: Product? = nil) {
            self.init(unsafeResultMap: ["__typename": "Collection", "id": id, "name": name, "slug": slug, "description": description, "backgroundImage": backgroundImage.flatMap { (value: BackgroundImage) -> ResultMap in value.resultMap }, "isBanner": isBanner, "isHidden": isHidden, "products": products.flatMap { (value: Product) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of the object.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var slug: String {
            get {
              return resultMap["slug"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "slug")
            }
          }

          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          public var backgroundImage: BackgroundImage? {
            get {
              return (resultMap["backgroundImage"] as? ResultMap).flatMap { BackgroundImage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "backgroundImage")
            }
          }

          public var isBanner: Bool {
            get {
              return resultMap["isBanner"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isBanner")
            }
          }

          public var isHidden: Bool {
            get {
              return resultMap["isHidden"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isHidden")
            }
          }

          /// List of products in this collection.
          public var products: Product? {
            get {
              return (resultMap["products"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "products")
            }
          }

          public struct BackgroundImage: GraphQLSelectionSet {
            public static let possibleTypes = ["Image"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
              GraphQLField("color", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(url: String, color: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Image", "url": url, "color": color])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The URL of the image.
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            /// Color
            public var color: String? {
              get {
                return resultMap["color"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "color")
              }
            }
          }

          public struct Product: GraphQLSelectionSet {
            public static let possibleTypes = ["ProductCountableConnection"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
              GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(pageInfo: PageInfo, edges: [Edge]) {
              self.init(unsafeResultMap: ["__typename": "ProductCountableConnection", "pageInfo": pageInfo.resultMap, "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var pageInfo: PageInfo {
              get {
                return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
              }
            }

            public var edges: [Edge] {
              get {
                return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
              }
            }

            public struct PageInfo: GraphQLSelectionSet {
              public static let possibleTypes = ["PageInfo"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("endCursor", type: .scalar(String.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(hasNextPage: Bool, endCursor: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// When paginating forwards, are there more items?
              public var hasNextPage: Bool {
                get {
                  return resultMap["hasNextPage"]! as! Bool
                }
                set {
                  resultMap.updateValue(newValue, forKey: "hasNextPage")
                }
              }

              /// When paginating forwards, the cursor to continue.
              public var endCursor: String? {
                get {
                  return resultMap["endCursor"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "endCursor")
                }
              }
            }

            public struct Edge: GraphQLSelectionSet {
              public static let possibleTypes = ["ProductCountableEdge"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("node", type: .nonNull(.object(Node.selections))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(node: Node) {
                self.init(unsafeResultMap: ["__typename": "ProductCountableEdge", "node": node.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The item at the end of the edge
              public var node: Node {
                get {
                  return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "node")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes = ["Product"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  GraphQLField("description", type: .nonNull(.scalar(String.self))),
                  GraphQLField("availability", type: .object(Availability.selections)),
                  GraphQLField("pricing", type: .object(Pricing.selections)),
                  GraphQLField("weight", type: .object(Weight.selections)),
                  GraphQLField("thumbnail", type: .object(Thumbnail.selections)),
                  GraphQLField("category", type: .nonNull(.object(Category.selections))),
                  GraphQLField("productType", type: .nonNull(.object(ProductType.selections))),
                  GraphQLField("isAvailable", type: .scalar(Bool.self)),
                  GraphQLField("variants", type: .list(.object(Variant.selections))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(id: GraphQLID, name: String, description: String, availability: Availability? = nil, pricing: Pricing? = nil, weight: Weight? = nil, thumbnail: Thumbnail? = nil, category: Category, productType: ProductType, isAvailable: Bool? = nil, variants: [Variant?]? = nil) {
                  self.init(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "description": description, "availability": availability.flatMap { (value: Availability) -> ResultMap in value.resultMap }, "pricing": pricing.flatMap { (value: Pricing) -> ResultMap in value.resultMap }, "weight": weight.flatMap { (value: Weight) -> ResultMap in value.resultMap }, "thumbnail": thumbnail.flatMap { (value: Thumbnail) -> ResultMap in value.resultMap }, "category": category.resultMap, "productType": productType.resultMap, "isAvailable": isAvailable, "variants": variants.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The ID of the object.
                public var id: GraphQLID {
                  get {
                    return resultMap["id"]! as! GraphQLID
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "id")
                  }
                }

                public var name: String {
                  get {
                    return resultMap["name"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "name")
                  }
                }

                public var description: String {
                  get {
                    return resultMap["description"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "description")
                  }
                }

                /// Informs about product's availability in the
                /// storefront, current price and discounts.
                public var availability: Availability? {
                  get {
                    return (resultMap["availability"] as? ResultMap).flatMap { Availability(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "availability")
                  }
                }

                /// Lists the storefront product's pricing,
                /// the current price and discounts, only meant for displaying.
                public var pricing: Pricing? {
                  get {
                    return (resultMap["pricing"] as? ResultMap).flatMap { Pricing(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "pricing")
                  }
                }

                public var weight: Weight? {
                  get {
                    return (resultMap["weight"] as? ResultMap).flatMap { Weight(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "weight")
                  }
                }

                /// The main thumbnail for a product.
                public var thumbnail: Thumbnail? {
                  get {
                    return (resultMap["thumbnail"] as? ResultMap).flatMap { Thumbnail(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "thumbnail")
                  }
                }

                public var category: Category {
                  get {
                    return Category(unsafeResultMap: resultMap["category"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "category")
                  }
                }

                public var productType: ProductType {
                  get {
                    return ProductType(unsafeResultMap: resultMap["productType"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "productType")
                  }
                }

                /// Whether the product is in stock and visible or not.
                public var isAvailable: Bool? {
                  get {
                    return resultMap["isAvailable"] as? Bool
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "isAvailable")
                  }
                }

                /// List of variants for the product
                public var variants: [Variant?]? {
                  get {
                    return (resultMap["variants"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Variant?] in value.map { (value: ResultMap?) -> Variant? in value.flatMap { (value: ResultMap) -> Variant in Variant(unsafeResultMap: value) } } }
                  }
                  set {
                    resultMap.updateValue(newValue.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }, forKey: "variants")
                  }
                }

                public struct Availability: GraphQLSelectionSet {
                  public static let possibleTypes = ["ProductAvailabilityInfo"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("quantityOnCheckout", type: .scalar(Int.self)),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(quantityOnCheckout: Int? = nil) {
                    self.init(unsafeResultMap: ["__typename": "ProductAvailabilityInfo", "quantityOnCheckout": quantityOnCheckout])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var quantityOnCheckout: Int? {
                    get {
                      return resultMap["quantityOnCheckout"] as? Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "quantityOnCheckout")
                    }
                  }
                }

                public struct Pricing: GraphQLSelectionSet {
                  public static let possibleTypes = ["ProductPricingInfo"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("priceRange", type: .object(PriceRange.selections)),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(priceRange: PriceRange? = nil) {
                    self.init(unsafeResultMap: ["__typename": "ProductPricingInfo", "priceRange": priceRange.flatMap { (value: PriceRange) -> ResultMap in value.resultMap }])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The discounted price range of the product variants.
                  public var priceRange: PriceRange? {
                    get {
                      return (resultMap["priceRange"] as? ResultMap).flatMap { PriceRange(unsafeResultMap: $0) }
                    }
                    set {
                      resultMap.updateValue(newValue?.resultMap, forKey: "priceRange")
                    }
                  }

                  public struct PriceRange: GraphQLSelectionSet {
                    public static let possibleTypes = ["TaxedMoneyRange"]

                    public static let selections: [GraphQLSelection] = [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("stop", type: .object(Stop.selections)),
                    ]

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(stop: Stop? = nil) {
                      self.init(unsafeResultMap: ["__typename": "TaxedMoneyRange", "stop": stop.flatMap { (value: Stop) -> ResultMap in value.resultMap }])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// Upper bound of a price range.
                    public var stop: Stop? {
                      get {
                        return (resultMap["stop"] as? ResultMap).flatMap { Stop(unsafeResultMap: $0) }
                      }
                      set {
                        resultMap.updateValue(newValue?.resultMap, forKey: "stop")
                      }
                    }

                    public struct Stop: GraphQLSelectionSet {
                      public static let possibleTypes = ["TaxedMoney"]

                      public static let selections: [GraphQLSelection] = [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
                      ]

                      public private(set) var resultMap: ResultMap

                      public init(unsafeResultMap: ResultMap) {
                        self.resultMap = unsafeResultMap
                      }

                      public init(gross: Gross) {
                        self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
                      }

                      public var __typename: String {
                        get {
                          return resultMap["__typename"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      /// Amount of money including taxes.
                      public var gross: Gross {
                        get {
                          return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
                        }
                        set {
                          resultMap.updateValue(newValue.resultMap, forKey: "gross")
                        }
                      }

                      public struct Gross: GraphQLSelectionSet {
                        public static let possibleTypes = ["Money"]

                        public static let selections: [GraphQLSelection] = [
                          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                          GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
                          GraphQLField("localized", type: .nonNull(.scalar(String.self))),
                        ]

                        public private(set) var resultMap: ResultMap

                        public init(unsafeResultMap: ResultMap) {
                          self.resultMap = unsafeResultMap
                        }

                        public init(amount: Double, localized: String) {
                          self.init(unsafeResultMap: ["__typename": "Money", "amount": amount, "localized": localized])
                        }

                        public var __typename: String {
                          get {
                            return resultMap["__typename"]! as! String
                          }
                          set {
                            resultMap.updateValue(newValue, forKey: "__typename")
                          }
                        }

                        /// Amount of money.
                        public var amount: Double {
                          get {
                            return resultMap["amount"]! as! Double
                          }
                          set {
                            resultMap.updateValue(newValue, forKey: "amount")
                          }
                        }

                        /// Money formatted according to the current locale.
                        public var localized: String {
                          get {
                            return resultMap["localized"]! as! String
                          }
                          set {
                            resultMap.updateValue(newValue, forKey: "localized")
                          }
                        }
                      }
                    }
                  }
                }

                public struct Weight: GraphQLSelectionSet {
                  public static let possibleTypes = ["Weight"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("unit", type: .nonNull(.scalar(String.self))),
                    GraphQLField("value", type: .nonNull(.scalar(Double.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(unit: String, value: Double) {
                    self.init(unsafeResultMap: ["__typename": "Weight", "unit": unit, "value": value])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Weight unit
                  public var unit: String {
                    get {
                      return resultMap["unit"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "unit")
                    }
                  }

                  /// Weight value
                  public var value: Double {
                    get {
                      return resultMap["value"]! as! Double
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "value")
                    }
                  }
                }

                public struct Thumbnail: GraphQLSelectionSet {
                  public static let possibleTypes = ["Image"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(url: String) {
                    self.init(unsafeResultMap: ["__typename": "Image", "url": url])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The URL of the image.
                  public var url: String {
                    get {
                      return resultMap["url"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "url")
                    }
                  }
                }

                public struct Category: GraphQLSelectionSet {
                  public static let possibleTypes = ["Category"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(id: GraphQLID, name: String) {
                    self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The ID of the object.
                  public var id: GraphQLID {
                    get {
                      return resultMap["id"]! as! GraphQLID
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "id")
                    }
                  }

                  public var name: String {
                    get {
                      return resultMap["name"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "name")
                    }
                  }
                }

                public struct ProductType: GraphQLSelectionSet {
                  public static let possibleTypes = ["ProductType"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(name: String) {
                    self.init(unsafeResultMap: ["__typename": "ProductType", "name": name])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var name: String {
                    get {
                      return resultMap["name"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "name")
                    }
                  }
                }

                public struct Variant: GraphQLSelectionSet {
                  public static let possibleTypes = ["ProductVariant"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("sku", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                    GraphQLField("pricing", type: .object(Pricing.selections)),
                    GraphQLField("availability", type: .object(Availability.selections)),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(id: GraphQLID, sku: String, name: String, pricing: Pricing? = nil, availability: Availability? = nil) {
                    self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "sku": sku, "name": name, "pricing": pricing.flatMap { (value: Pricing) -> ResultMap in value.resultMap }, "availability": availability.flatMap { (value: Availability) -> ResultMap in value.resultMap }])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The ID of the object.
                  public var id: GraphQLID {
                    get {
                      return resultMap["id"]! as! GraphQLID
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "id")
                    }
                  }

                  public var sku: String {
                    get {
                      return resultMap["sku"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "sku")
                    }
                  }

                  public var name: String {
                    get {
                      return resultMap["name"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "name")
                    }
                  }

                  /// Lists the storefront variant's pricing,
                  /// the current price and discounts, only meant for displaying
                  public var pricing: Pricing? {
                    get {
                      return (resultMap["pricing"] as? ResultMap).flatMap { Pricing(unsafeResultMap: $0) }
                    }
                    set {
                      resultMap.updateValue(newValue?.resultMap, forKey: "pricing")
                    }
                  }

                  /// Informs about variant's availability in the
                  /// storefront, current price and discounted price.
                  public var availability: Availability? {
                    get {
                      return (resultMap["availability"] as? ResultMap).flatMap { Availability(unsafeResultMap: $0) }
                    }
                    set {
                      resultMap.updateValue(newValue?.resultMap, forKey: "availability")
                    }
                  }

                  public struct Pricing: GraphQLSelectionSet {
                    public static let possibleTypes = ["VariantPricingInfo"]

                    public static let selections: [GraphQLSelection] = [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("price", type: .object(Price.selections)),
                    ]

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(price: Price? = nil) {
                      self.init(unsafeResultMap: ["__typename": "VariantPricingInfo", "price": price.flatMap { (value: Price) -> ResultMap in value.resultMap }])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The price, with any discount subtracted.
                    public var price: Price? {
                      get {
                        return (resultMap["price"] as? ResultMap).flatMap { Price(unsafeResultMap: $0) }
                      }
                      set {
                        resultMap.updateValue(newValue?.resultMap, forKey: "price")
                      }
                    }

                    public struct Price: GraphQLSelectionSet {
                      public static let possibleTypes = ["TaxedMoney"]

                      public static let selections: [GraphQLSelection] = [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
                      ]

                      public private(set) var resultMap: ResultMap

                      public init(unsafeResultMap: ResultMap) {
                        self.resultMap = unsafeResultMap
                      }

                      public init(gross: Gross) {
                        self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
                      }

                      public var __typename: String {
                        get {
                          return resultMap["__typename"]! as! String
                        }
                        set {
                          resultMap.updateValue(newValue, forKey: "__typename")
                        }
                      }

                      /// Amount of money including taxes.
                      public var gross: Gross {
                        get {
                          return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
                        }
                        set {
                          resultMap.updateValue(newValue.resultMap, forKey: "gross")
                        }
                      }

                      public struct Gross: GraphQLSelectionSet {
                        public static let possibleTypes = ["Money"]

                        public static let selections: [GraphQLSelection] = [
                          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                          GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
                          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
                          GraphQLField("localized", type: .nonNull(.scalar(String.self))),
                        ]

                        public private(set) var resultMap: ResultMap

                        public init(unsafeResultMap: ResultMap) {
                          self.resultMap = unsafeResultMap
                        }

                        public init(amount: Double, currency: String, localized: String) {
                          self.init(unsafeResultMap: ["__typename": "Money", "amount": amount, "currency": currency, "localized": localized])
                        }

                        public var __typename: String {
                          get {
                            return resultMap["__typename"]! as! String
                          }
                          set {
                            resultMap.updateValue(newValue, forKey: "__typename")
                          }
                        }

                        /// Amount of money.
                        public var amount: Double {
                          get {
                            return resultMap["amount"]! as! Double
                          }
                          set {
                            resultMap.updateValue(newValue, forKey: "amount")
                          }
                        }

                        /// Currency code.
                        public var currency: String {
                          get {
                            return resultMap["currency"]! as! String
                          }
                          set {
                            resultMap.updateValue(newValue, forKey: "currency")
                          }
                        }

                        /// Money formatted according to the current locale.
                        public var localized: String {
                          get {
                            return resultMap["localized"]! as! String
                          }
                          set {
                            resultMap.updateValue(newValue, forKey: "localized")
                          }
                        }
                      }
                    }
                  }

                  public struct Availability: GraphQLSelectionSet {
                    public static let possibleTypes = ["VariantAvailabilityInfo"]

                    public static let selections: [GraphQLSelection] = [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("quantityOnCheckout", type: .scalar(Int.self)),
                    ]

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(quantityOnCheckout: Int? = nil) {
                      self.init(unsafeResultMap: ["__typename": "VariantAvailabilityInfo", "quantityOnCheckout": quantityOnCheckout])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    public var quantityOnCheckout: Int? {
                      get {
                        return resultMap["quantityOnCheckout"] as? Int
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "quantityOnCheckout")
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class FetchProductQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchProduct($id: ID!) {
      product(id: $id) {
        __typename
        id
        name
        description
        availability {
          __typename
          quantityOnCheckout
        }
        weight {
          __typename
          unit
          value
        }
        thumbnail {
          __typename
          url
        }
        category {
          __typename
          id
          name
        }
        productType {
          __typename
          name
        }
        isAvailable
        pricing {
          __typename
          priceRange {
            __typename
            stop {
              __typename
              gross {
                __typename
                amount
                localized
              }
            }
          }
        }
        variants {
          __typename
          id
          sku
          name
          pricing {
            __typename
            price {
              __typename
              gross {
                __typename
                amount
                currency
                localized
              }
            }
          }
          availability {
            __typename
            quantityOnCheckout
          }
        }
      }
    }
    """

  public let operationName = "fetchProduct"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("product", arguments: ["id": GraphQLVariable("id")], type: .object(Product.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(product: Product? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }])
    }

    /// Lookup a product by ID.
    public var product: Product? {
      get {
        return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "product")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes = ["Product"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("availability", type: .object(Availability.selections)),
        GraphQLField("weight", type: .object(Weight.selections)),
        GraphQLField("thumbnail", type: .object(Thumbnail.selections)),
        GraphQLField("category", type: .nonNull(.object(Category.selections))),
        GraphQLField("productType", type: .nonNull(.object(ProductType.selections))),
        GraphQLField("isAvailable", type: .scalar(Bool.self)),
        GraphQLField("pricing", type: .object(Pricing.selections)),
        GraphQLField("variants", type: .list(.object(Variant.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, description: String, availability: Availability? = nil, weight: Weight? = nil, thumbnail: Thumbnail? = nil, category: Category, productType: ProductType, isAvailable: Bool? = nil, pricing: Pricing? = nil, variants: [Variant?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "description": description, "availability": availability.flatMap { (value: Availability) -> ResultMap in value.resultMap }, "weight": weight.flatMap { (value: Weight) -> ResultMap in value.resultMap }, "thumbnail": thumbnail.flatMap { (value: Thumbnail) -> ResultMap in value.resultMap }, "category": category.resultMap, "productType": productType.resultMap, "isAvailable": isAvailable, "pricing": pricing.flatMap { (value: Pricing) -> ResultMap in value.resultMap }, "variants": variants.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of the object.
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// Informs about product's availability in the
      /// storefront, current price and discounts.
      public var availability: Availability? {
        get {
          return (resultMap["availability"] as? ResultMap).flatMap { Availability(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "availability")
        }
      }

      public var weight: Weight? {
        get {
          return (resultMap["weight"] as? ResultMap).flatMap { Weight(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "weight")
        }
      }

      /// The main thumbnail for a product.
      public var thumbnail: Thumbnail? {
        get {
          return (resultMap["thumbnail"] as? ResultMap).flatMap { Thumbnail(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "thumbnail")
        }
      }

      public var category: Category {
        get {
          return Category(unsafeResultMap: resultMap["category"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "category")
        }
      }

      public var productType: ProductType {
        get {
          return ProductType(unsafeResultMap: resultMap["productType"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "productType")
        }
      }

      /// Whether the product is in stock and visible or not.
      public var isAvailable: Bool? {
        get {
          return resultMap["isAvailable"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isAvailable")
        }
      }

      /// Lists the storefront product's pricing,
      /// the current price and discounts, only meant for displaying.
      public var pricing: Pricing? {
        get {
          return (resultMap["pricing"] as? ResultMap).flatMap { Pricing(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pricing")
        }
      }

      /// List of variants for the product
      public var variants: [Variant?]? {
        get {
          return (resultMap["variants"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Variant?] in value.map { (value: ResultMap?) -> Variant? in value.flatMap { (value: ResultMap) -> Variant in Variant(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }, forKey: "variants")
        }
      }

      public struct Availability: GraphQLSelectionSet {
        public static let possibleTypes = ["ProductAvailabilityInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("quantityOnCheckout", type: .scalar(Int.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(quantityOnCheckout: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductAvailabilityInfo", "quantityOnCheckout": quantityOnCheckout])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var quantityOnCheckout: Int? {
          get {
            return resultMap["quantityOnCheckout"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "quantityOnCheckout")
          }
        }
      }

      public struct Weight: GraphQLSelectionSet {
        public static let possibleTypes = ["Weight"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("unit", type: .nonNull(.scalar(String.self))),
          GraphQLField("value", type: .nonNull(.scalar(Double.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(unit: String, value: Double) {
          self.init(unsafeResultMap: ["__typename": "Weight", "unit": unit, "value": value])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Weight unit
        public var unit: String {
          get {
            return resultMap["unit"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "unit")
          }
        }

        /// Weight value
        public var value: Double {
          get {
            return resultMap["value"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }
      }

      public struct Thumbnail: GraphQLSelectionSet {
        public static let possibleTypes = ["Image"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("url", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(url: String) {
          self.init(unsafeResultMap: ["__typename": "Image", "url": url])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The URL of the image.
        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }
      }

      public struct Category: GraphQLSelectionSet {
        public static let possibleTypes = ["Category"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String) {
          self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct ProductType: GraphQLSelectionSet {
        public static let possibleTypes = ["ProductType"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "ProductType", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct Pricing: GraphQLSelectionSet {
        public static let possibleTypes = ["ProductPricingInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("priceRange", type: .object(PriceRange.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(priceRange: PriceRange? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductPricingInfo", "priceRange": priceRange.flatMap { (value: PriceRange) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The discounted price range of the product variants.
        public var priceRange: PriceRange? {
          get {
            return (resultMap["priceRange"] as? ResultMap).flatMap { PriceRange(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "priceRange")
          }
        }

        public struct PriceRange: GraphQLSelectionSet {
          public static let possibleTypes = ["TaxedMoneyRange"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("stop", type: .object(Stop.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(stop: Stop? = nil) {
            self.init(unsafeResultMap: ["__typename": "TaxedMoneyRange", "stop": stop.flatMap { (value: Stop) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Upper bound of a price range.
          public var stop: Stop? {
            get {
              return (resultMap["stop"] as? ResultMap).flatMap { Stop(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "stop")
            }
          }

          public struct Stop: GraphQLSelectionSet {
            public static let possibleTypes = ["TaxedMoney"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(gross: Gross) {
              self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Amount of money including taxes.
            public var gross: Gross {
              get {
                return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "gross")
              }
            }

            public struct Gross: GraphQLSelectionSet {
              public static let possibleTypes = ["Money"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
                GraphQLField("localized", type: .nonNull(.scalar(String.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(amount: Double, localized: String) {
                self.init(unsafeResultMap: ["__typename": "Money", "amount": amount, "localized": localized])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Amount of money.
              public var amount: Double {
                get {
                  return resultMap["amount"]! as! Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "amount")
                }
              }

              /// Money formatted according to the current locale.
              public var localized: String {
                get {
                  return resultMap["localized"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "localized")
                }
              }
            }
          }
        }
      }

      public struct Variant: GraphQLSelectionSet {
        public static let possibleTypes = ["ProductVariant"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sku", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("pricing", type: .object(Pricing.selections)),
          GraphQLField("availability", type: .object(Availability.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, sku: String, name: String, pricing: Pricing? = nil, availability: Availability? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "sku": sku, "name": name, "pricing": pricing.flatMap { (value: Pricing) -> ResultMap in value.resultMap }, "availability": availability.flatMap { (value: Availability) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var sku: String {
          get {
            return resultMap["sku"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sku")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// Lists the storefront variant's pricing,
        /// the current price and discounts, only meant for displaying
        public var pricing: Pricing? {
          get {
            return (resultMap["pricing"] as? ResultMap).flatMap { Pricing(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pricing")
          }
        }

        /// Informs about variant's availability in the
        /// storefront, current price and discounted price.
        public var availability: Availability? {
          get {
            return (resultMap["availability"] as? ResultMap).flatMap { Availability(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "availability")
          }
        }

        public struct Pricing: GraphQLSelectionSet {
          public static let possibleTypes = ["VariantPricingInfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("price", type: .object(Price.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(price: Price? = nil) {
            self.init(unsafeResultMap: ["__typename": "VariantPricingInfo", "price": price.flatMap { (value: Price) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The price, with any discount subtracted.
          public var price: Price? {
            get {
              return (resultMap["price"] as? ResultMap).flatMap { Price(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "price")
            }
          }

          public struct Price: GraphQLSelectionSet {
            public static let possibleTypes = ["TaxedMoney"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(gross: Gross) {
              self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Amount of money including taxes.
            public var gross: Gross {
              get {
                return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "gross")
              }
            }

            public struct Gross: GraphQLSelectionSet {
              public static let possibleTypes = ["Money"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
                GraphQLField("currency", type: .nonNull(.scalar(String.self))),
                GraphQLField("localized", type: .nonNull(.scalar(String.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(amount: Double, currency: String, localized: String) {
                self.init(unsafeResultMap: ["__typename": "Money", "amount": amount, "currency": currency, "localized": localized])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Amount of money.
              public var amount: Double {
                get {
                  return resultMap["amount"]! as! Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "amount")
                }
              }

              /// Currency code.
              public var currency: String {
                get {
                  return resultMap["currency"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "currency")
                }
              }

              /// Money formatted according to the current locale.
              public var localized: String {
                get {
                  return resultMap["localized"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "localized")
                }
              }
            }
          }
        }

        public struct Availability: GraphQLSelectionSet {
          public static let possibleTypes = ["VariantAvailabilityInfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("quantityOnCheckout", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(quantityOnCheckout: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "VariantAvailabilityInfo", "quantityOnCheckout": quantityOnCheckout])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var quantityOnCheckout: Int? {
            get {
              return resultMap["quantityOnCheckout"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "quantityOnCheckout")
            }
          }
        }
      }
    }
  }
}

public final class SearchQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query search($first: Int!, $after: String, $query: String, $filter: ProductFilterInput) {
      products(first: $first, query: $query, filter: $filter, after: $after) {
        __typename
        totalCount
        pageInfo {
          __typename
          hasNextPage
          endCursor
        }
        edges {
          __typename
          node {
            __typename
            id
            name
            description
            availability {
              __typename
              quantityOnCheckout
            }
            weight {
              __typename
              unit
              value
            }
            thumbnail {
              __typename
              url
            }
            category {
              __typename
              id
              name
            }
            productType {
              __typename
              name
            }
            isAvailable
            pricing {
              __typename
              priceRange {
                __typename
                stop {
                  __typename
                  gross {
                    __typename
                    amount
                    localized
                  }
                }
              }
            }
            variants {
              __typename
              id
              sku
              name
              pricing {
                __typename
                price {
                  __typename
                  gross {
                    __typename
                    amount
                    currency
                    localized
                  }
                }
              }
              availability {
                __typename
                quantityOnCheckout
              }
            }
          }
        }
      }
    }
    """

  public let operationName = "search"

  public var first: Int
  public var after: String?
  public var query: String?
  public var filter: ProductFilterInput?

  public init(first: Int, after: String? = nil, query: String? = nil, filter: ProductFilterInput? = nil) {
    self.first = first
    self.after = after
    self.query = query
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["first": first, "after": after, "query": query, "filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("products", arguments: ["first": GraphQLVariable("first"), "query": GraphQLVariable("query"), "filter": GraphQLVariable("filter"), "after": GraphQLVariable("after")], type: .object(Product.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(products: Product? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "products": products.flatMap { (value: Product) -> ResultMap in value.resultMap }])
    }

    /// List of the shop's products.
    public var products: Product? {
      get {
        return (resultMap["products"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "products")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes = ["ProductCountableConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("totalCount", type: .scalar(Int.self)),
        GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(totalCount: Int? = nil, pageInfo: PageInfo, edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "ProductCountableConnection", "totalCount": totalCount, "pageInfo": pageInfo.resultMap, "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A total count of items in the collection
      public var totalCount: Int? {
        get {
          return resultMap["totalCount"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalCount")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("endCursor", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool, endCursor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["ProductCountableEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .nonNull(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "ProductCountableEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Product"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("availability", type: .object(Availability.selections)),
            GraphQLField("weight", type: .object(Weight.selections)),
            GraphQLField("thumbnail", type: .object(Thumbnail.selections)),
            GraphQLField("category", type: .nonNull(.object(Category.selections))),
            GraphQLField("productType", type: .nonNull(.object(ProductType.selections))),
            GraphQLField("isAvailable", type: .scalar(Bool.self)),
            GraphQLField("pricing", type: .object(Pricing.selections)),
            GraphQLField("variants", type: .list(.object(Variant.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, description: String, availability: Availability? = nil, weight: Weight? = nil, thumbnail: Thumbnail? = nil, category: Category, productType: ProductType, isAvailable: Bool? = nil, pricing: Pricing? = nil, variants: [Variant?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "description": description, "availability": availability.flatMap { (value: Availability) -> ResultMap in value.resultMap }, "weight": weight.flatMap { (value: Weight) -> ResultMap in value.resultMap }, "thumbnail": thumbnail.flatMap { (value: Thumbnail) -> ResultMap in value.resultMap }, "category": category.resultMap, "productType": productType.resultMap, "isAvailable": isAvailable, "pricing": pricing.flatMap { (value: Pricing) -> ResultMap in value.resultMap }, "variants": variants.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of the object.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var description: String {
            get {
              return resultMap["description"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          /// Informs about product's availability in the
          /// storefront, current price and discounts.
          public var availability: Availability? {
            get {
              return (resultMap["availability"] as? ResultMap).flatMap { Availability(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "availability")
            }
          }

          public var weight: Weight? {
            get {
              return (resultMap["weight"] as? ResultMap).flatMap { Weight(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "weight")
            }
          }

          /// The main thumbnail for a product.
          public var thumbnail: Thumbnail? {
            get {
              return (resultMap["thumbnail"] as? ResultMap).flatMap { Thumbnail(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "thumbnail")
            }
          }

          public var category: Category {
            get {
              return Category(unsafeResultMap: resultMap["category"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "category")
            }
          }

          public var productType: ProductType {
            get {
              return ProductType(unsafeResultMap: resultMap["productType"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "productType")
            }
          }

          /// Whether the product is in stock and visible or not.
          public var isAvailable: Bool? {
            get {
              return resultMap["isAvailable"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isAvailable")
            }
          }

          /// Lists the storefront product's pricing,
          /// the current price and discounts, only meant for displaying.
          public var pricing: Pricing? {
            get {
              return (resultMap["pricing"] as? ResultMap).flatMap { Pricing(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "pricing")
            }
          }

          /// List of variants for the product
          public var variants: [Variant?]? {
            get {
              return (resultMap["variants"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Variant?] in value.map { (value: ResultMap?) -> Variant? in value.flatMap { (value: ResultMap) -> Variant in Variant(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }, forKey: "variants")
            }
          }

          public struct Availability: GraphQLSelectionSet {
            public static let possibleTypes = ["ProductAvailabilityInfo"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("quantityOnCheckout", type: .scalar(Int.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(quantityOnCheckout: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "ProductAvailabilityInfo", "quantityOnCheckout": quantityOnCheckout])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var quantityOnCheckout: Int? {
              get {
                return resultMap["quantityOnCheckout"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "quantityOnCheckout")
              }
            }
          }

          public struct Weight: GraphQLSelectionSet {
            public static let possibleTypes = ["Weight"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("unit", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .nonNull(.scalar(Double.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(unit: String, value: Double) {
              self.init(unsafeResultMap: ["__typename": "Weight", "unit": unit, "value": value])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Weight unit
            public var unit: String {
              get {
                return resultMap["unit"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "unit")
              }
            }

            /// Weight value
            public var value: Double {
              get {
                return resultMap["value"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }
          }

          public struct Thumbnail: GraphQLSelectionSet {
            public static let possibleTypes = ["Image"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(url: String) {
              self.init(unsafeResultMap: ["__typename": "Image", "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The URL of the image.
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }

          public struct Category: GraphQLSelectionSet {
            public static let possibleTypes = ["Category"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String) {
              self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of the object.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }

          public struct ProductType: GraphQLSelectionSet {
            public static let possibleTypes = ["ProductType"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "ProductType", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }

          public struct Pricing: GraphQLSelectionSet {
            public static let possibleTypes = ["ProductPricingInfo"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("priceRange", type: .object(PriceRange.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(priceRange: PriceRange? = nil) {
              self.init(unsafeResultMap: ["__typename": "ProductPricingInfo", "priceRange": priceRange.flatMap { (value: PriceRange) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The discounted price range of the product variants.
            public var priceRange: PriceRange? {
              get {
                return (resultMap["priceRange"] as? ResultMap).flatMap { PriceRange(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "priceRange")
              }
            }

            public struct PriceRange: GraphQLSelectionSet {
              public static let possibleTypes = ["TaxedMoneyRange"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("stop", type: .object(Stop.selections)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(stop: Stop? = nil) {
                self.init(unsafeResultMap: ["__typename": "TaxedMoneyRange", "stop": stop.flatMap { (value: Stop) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Upper bound of a price range.
              public var stop: Stop? {
                get {
                  return (resultMap["stop"] as? ResultMap).flatMap { Stop(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "stop")
                }
              }

              public struct Stop: GraphQLSelectionSet {
                public static let possibleTypes = ["TaxedMoney"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(gross: Gross) {
                  self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Amount of money including taxes.
                public var gross: Gross {
                  get {
                    return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "gross")
                  }
                }

                public struct Gross: GraphQLSelectionSet {
                  public static let possibleTypes = ["Money"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
                    GraphQLField("localized", type: .nonNull(.scalar(String.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(amount: Double, localized: String) {
                    self.init(unsafeResultMap: ["__typename": "Money", "amount": amount, "localized": localized])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Amount of money.
                  public var amount: Double {
                    get {
                      return resultMap["amount"]! as! Double
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "amount")
                    }
                  }

                  /// Money formatted according to the current locale.
                  public var localized: String {
                    get {
                      return resultMap["localized"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "localized")
                    }
                  }
                }
              }
            }
          }

          public struct Variant: GraphQLSelectionSet {
            public static let possibleTypes = ["ProductVariant"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("sku", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("pricing", type: .object(Pricing.selections)),
              GraphQLField("availability", type: .object(Availability.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, sku: String, name: String, pricing: Pricing? = nil, availability: Availability? = nil) {
              self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "sku": sku, "name": name, "pricing": pricing.flatMap { (value: Pricing) -> ResultMap in value.resultMap }, "availability": availability.flatMap { (value: Availability) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of the object.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var sku: String {
              get {
                return resultMap["sku"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "sku")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// Lists the storefront variant's pricing,
            /// the current price and discounts, only meant for displaying
            public var pricing: Pricing? {
              get {
                return (resultMap["pricing"] as? ResultMap).flatMap { Pricing(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "pricing")
              }
            }

            /// Informs about variant's availability in the
            /// storefront, current price and discounted price.
            public var availability: Availability? {
              get {
                return (resultMap["availability"] as? ResultMap).flatMap { Availability(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "availability")
              }
            }

            public struct Pricing: GraphQLSelectionSet {
              public static let possibleTypes = ["VariantPricingInfo"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("price", type: .object(Price.selections)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(price: Price? = nil) {
                self.init(unsafeResultMap: ["__typename": "VariantPricingInfo", "price": price.flatMap { (value: Price) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The price, with any discount subtracted.
              public var price: Price? {
                get {
                  return (resultMap["price"] as? ResultMap).flatMap { Price(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "price")
                }
              }

              public struct Price: GraphQLSelectionSet {
                public static let possibleTypes = ["TaxedMoney"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(gross: Gross) {
                  self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Amount of money including taxes.
                public var gross: Gross {
                  get {
                    return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "gross")
                  }
                }

                public struct Gross: GraphQLSelectionSet {
                  public static let possibleTypes = ["Money"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
                    GraphQLField("currency", type: .nonNull(.scalar(String.self))),
                    GraphQLField("localized", type: .nonNull(.scalar(String.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(amount: Double, currency: String, localized: String) {
                    self.init(unsafeResultMap: ["__typename": "Money", "amount": amount, "currency": currency, "localized": localized])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Amount of money.
                  public var amount: Double {
                    get {
                      return resultMap["amount"]! as! Double
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "amount")
                    }
                  }

                  /// Currency code.
                  public var currency: String {
                    get {
                      return resultMap["currency"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "currency")
                    }
                  }

                  /// Money formatted according to the current locale.
                  public var localized: String {
                    get {
                      return resultMap["localized"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "localized")
                    }
                  }
                }
              }
            }

            public struct Availability: GraphQLSelectionSet {
              public static let possibleTypes = ["VariantAvailabilityInfo"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("quantityOnCheckout", type: .scalar(Int.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(quantityOnCheckout: Int? = nil) {
                self.init(unsafeResultMap: ["__typename": "VariantAvailabilityInfo", "quantityOnCheckout": quantityOnCheckout])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var quantityOnCheckout: Int? {
                get {
                  return resultMap["quantityOnCheckout"] as? Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "quantityOnCheckout")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class FetchSuggestionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchSuggestions($query: String!) {
      autocomplete(query: $query) {
        __typename
        result
      }
    }
    """

  public let operationName = "fetchSuggestions"

  public var query: String

  public init(query: String) {
    self.query = query
  }

  public var variables: GraphQLMap? {
    return ["query": query]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("autocomplete", arguments: ["query": GraphQLVariable("query")], type: .list(.object(Autocomplete.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(autocomplete: [Autocomplete?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "autocomplete": autocomplete.flatMap { (value: [Autocomplete?]) -> [ResultMap?] in value.map { (value: Autocomplete?) -> ResultMap? in value.flatMap { (value: Autocomplete) -> ResultMap in value.resultMap } } }])
    }

    public var autocomplete: [Autocomplete?]? {
      get {
        return (resultMap["autocomplete"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Autocomplete?] in value.map { (value: ResultMap?) -> Autocomplete? in value.flatMap { (value: ResultMap) -> Autocomplete in Autocomplete(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Autocomplete?]) -> [ResultMap?] in value.map { (value: Autocomplete?) -> ResultMap? in value.flatMap { (value: Autocomplete) -> ResultMap in value.resultMap } } }, forKey: "autocomplete")
      }
    }

    public struct Autocomplete: GraphQLSelectionSet {
      public static let possibleTypes = ["AutocompleteType"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("result", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(result: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "AutocompleteType", "result": result])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var result: String? {
        get {
          return resultMap["result"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "result")
        }
      }
    }
  }
}

public final class FetchPaymentMethodsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchPaymentMethods($first: Int!) {
      me {
        __typename
        savedCards(first: $first) {
          __typename
          edges {
            __typename
            node {
              __typename
              id
              reference
              brand
              expirationMonth
              expirationYear
              lastDigits
              isDefault
            }
          }
        }
      }
    }
    """

  public let operationName = "fetchPaymentMethods"

  public var first: Int

  public init(first: Int) {
    self.first = first
  }

  public var variables: GraphQLMap? {
    return ["first": first]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("me", type: .object(Me.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    /// Logged in user data.
    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("savedCards", arguments: ["first": GraphQLVariable("first")], type: .object(SavedCard.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(savedCards: SavedCard? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "savedCards": savedCards.flatMap { (value: SavedCard) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Saved user payment methods
      public var savedCards: SavedCard? {
        get {
          return (resultMap["savedCards"] as? ResultMap).flatMap { SavedCard(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "savedCards")
        }
      }

      public struct SavedCard: GraphQLSelectionSet {
        public static let possibleTypes = ["UserPaymentMethodCountableConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge]) {
          self.init(unsafeResultMap: ["__typename": "UserPaymentMethodCountableConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge] {
          get {
            return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["UserPaymentMethodCountableEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node) {
            self.init(unsafeResultMap: ["__typename": "UserPaymentMethodCountableEdge", "node": node.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge
          public var node: Node {
            get {
              return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes = ["UserPaymentMethod"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("reference", type: .nonNull(.scalar(String.self))),
              GraphQLField("brand", type: .nonNull(.scalar(String.self))),
              GraphQLField("expirationMonth", type: .nonNull(.scalar(String.self))),
              GraphQLField("expirationYear", type: .nonNull(.scalar(String.self))),
              GraphQLField("lastDigits", type: .nonNull(.scalar(String.self))),
              GraphQLField("isDefault", type: .nonNull(.scalar(Bool.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, reference: String, brand: String, expirationMonth: String, expirationYear: String, lastDigits: String, isDefault: Bool) {
              self.init(unsafeResultMap: ["__typename": "UserPaymentMethod", "id": id, "reference": reference, "brand": brand, "expirationMonth": expirationMonth, "expirationYear": expirationYear, "lastDigits": lastDigits, "isDefault": isDefault])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of the object.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var reference: String {
              get {
                return resultMap["reference"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "reference")
              }
            }

            public var brand: String {
              get {
                return resultMap["brand"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "brand")
              }
            }

            public var expirationMonth: String {
              get {
                return resultMap["expirationMonth"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "expirationMonth")
              }
            }

            public var expirationYear: String {
              get {
                return resultMap["expirationYear"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "expirationYear")
              }
            }

            public var lastDigits: String {
              get {
                return resultMap["lastDigits"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "lastDigits")
              }
            }

            public var isDefault: Bool {
              get {
                return resultMap["isDefault"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isDefault")
              }
            }
          }
        }
      }
    }
  }
}

public final class CheckoutNoteAddMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation checkoutNoteAdd($checkoutId: ID!, $note: String) {
      checkoutUpdateNote(note: $note, checkoutId: $checkoutId) {
        __typename
        checkout {
          __typename
          id
          token
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "checkoutNoteAdd"

  public var checkoutId: GraphQLID
  public var note: String?

  public init(checkoutId: GraphQLID, note: String? = nil) {
    self.checkoutId = checkoutId
    self.note = note
  }

  public var variables: GraphQLMap? {
    return ["checkoutId": checkoutId, "note": note]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkoutUpdateNote", arguments: ["note": GraphQLVariable("note"), "checkoutId": GraphQLVariable("checkoutId")], type: .object(CheckoutUpdateNote.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkoutUpdateNote: CheckoutUpdateNote? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "checkoutUpdateNote": checkoutUpdateNote.flatMap { (value: CheckoutUpdateNote) -> ResultMap in value.resultMap }])
    }

    public var checkoutUpdateNote: CheckoutUpdateNote? {
      get {
        return (resultMap["checkoutUpdateNote"] as? ResultMap).flatMap { CheckoutUpdateNote(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkoutUpdateNote")
      }
    }

    public struct CheckoutUpdateNote: GraphQLSelectionSet {
      public static let possibleTypes = ["CheckoutUpdateNote"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("checkout", type: .object(Checkout.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(checkout: Checkout? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CheckoutUpdateNote", "checkout": checkout.flatMap { (value: Checkout) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A checkout with updated user note
      public var checkout: Checkout? {
        get {
          return (resultMap["checkout"] as? ResultMap).flatMap { Checkout(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "checkout")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Checkout: GraphQLSelectionSet {
        public static let possibleTypes = ["Checkout"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, token: String) {
          self.init(unsafeResultMap: ["__typename": "Checkout", "id": id, "token": token])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class CheckoutPaymentAddMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation checkoutPaymentAdd($checkoutId: ID!, $input: PaymentInput!) {
      checkoutPaymentCreate(checkoutId: $checkoutId, input: $input) {
        __typename
        payment {
          __typename
          id
          chargeStatus
          actions
          total {
            __typename
            amount
          }
          transactions {
            __typename
            id
            gatewayResponse
            token
          }
          creditCard {
            __typename
            brand
            firstDigits
            lastDigits
            expMonth
            expYear
          }
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "checkoutPaymentAdd"

  public var checkoutId: GraphQLID
  public var input: PaymentInput

  public init(checkoutId: GraphQLID, input: PaymentInput) {
    self.checkoutId = checkoutId
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["checkoutId": checkoutId, "input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkoutPaymentCreate", arguments: ["checkoutId": GraphQLVariable("checkoutId"), "input": GraphQLVariable("input")], type: .object(CheckoutPaymentCreate.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkoutPaymentCreate: CheckoutPaymentCreate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "checkoutPaymentCreate": checkoutPaymentCreate.flatMap { (value: CheckoutPaymentCreate) -> ResultMap in value.resultMap }])
    }

    public var checkoutPaymentCreate: CheckoutPaymentCreate? {
      get {
        return (resultMap["checkoutPaymentCreate"] as? ResultMap).flatMap { CheckoutPaymentCreate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkoutPaymentCreate")
      }
    }

    public struct CheckoutPaymentCreate: GraphQLSelectionSet {
      public static let possibleTypes = ["CheckoutPaymentCreate"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("payment", type: .object(Payment.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(payment: Payment? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CheckoutPaymentCreate", "payment": payment.flatMap { (value: Payment) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A newly created payment.
      public var payment: Payment? {
        get {
          return (resultMap["payment"] as? ResultMap).flatMap { Payment(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "payment")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Payment: GraphQLSelectionSet {
        public static let possibleTypes = ["Payment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("chargeStatus", type: .nonNull(.scalar(PaymentChargeStatusEnum.self))),
          GraphQLField("actions", type: .nonNull(.list(.scalar(OrderAction.self)))),
          GraphQLField("total", type: .object(Total.selections)),
          GraphQLField("transactions", type: .list(.object(Transaction.selections))),
          GraphQLField("creditCard", type: .object(CreditCard.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, chargeStatus: PaymentChargeStatusEnum, actions: [OrderAction?], total: Total? = nil, transactions: [Transaction?]? = nil, creditCard: CreditCard? = nil) {
          self.init(unsafeResultMap: ["__typename": "Payment", "id": id, "chargeStatus": chargeStatus, "actions": actions, "total": total.flatMap { (value: Total) -> ResultMap in value.resultMap }, "transactions": transactions.flatMap { (value: [Transaction?]) -> [ResultMap?] in value.map { (value: Transaction?) -> ResultMap? in value.flatMap { (value: Transaction) -> ResultMap in value.resultMap } } }, "creditCard": creditCard.flatMap { (value: CreditCard) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// Internal payment status.
        public var chargeStatus: PaymentChargeStatusEnum {
          get {
            return resultMap["chargeStatus"]! as! PaymentChargeStatusEnum
          }
          set {
            resultMap.updateValue(newValue, forKey: "chargeStatus")
          }
        }

        /// List of actions that can be performed in
        /// the current state of a payment.
        public var actions: [OrderAction?] {
          get {
            return resultMap["actions"]! as! [OrderAction?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "actions")
          }
        }

        /// Total amount of the payment.
        public var total: Total? {
          get {
            return (resultMap["total"] as? ResultMap).flatMap { Total(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "total")
          }
        }

        /// List of all transactions within this payment.
        public var transactions: [Transaction?]? {
          get {
            return (resultMap["transactions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Transaction?] in value.map { (value: ResultMap?) -> Transaction? in value.flatMap { (value: ResultMap) -> Transaction in Transaction(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Transaction?]) -> [ResultMap?] in value.map { (value: Transaction?) -> ResultMap? in value.flatMap { (value: Transaction) -> ResultMap in value.resultMap } } }, forKey: "transactions")
          }
        }

        /// The details of the card used for this payment.
        public var creditCard: CreditCard? {
          get {
            return (resultMap["creditCard"] as? ResultMap).flatMap { CreditCard(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "creditCard")
          }
        }

        public struct Total: GraphQLSelectionSet {
          public static let possibleTypes = ["Money"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Double) {
            self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money.
          public var amount: Double {
            get {
              return resultMap["amount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }
        }

        public struct Transaction: GraphQLSelectionSet {
          public static let possibleTypes = ["Transaction"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("gatewayResponse", type: .scalar(String.self)),
            GraphQLField("token", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, gatewayResponse: String? = nil, token: String) {
            self.init(unsafeResultMap: ["__typename": "Transaction", "id": id, "gatewayResponse": gatewayResponse, "token": token])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of the object.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// Changes the postgres to mysql field
          public var gatewayResponse: String? {
            get {
              return resultMap["gatewayResponse"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "gatewayResponse")
            }
          }

          public var token: String {
            get {
              return resultMap["token"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "token")
            }
          }
        }

        public struct CreditCard: GraphQLSelectionSet {
          public static let possibleTypes = ["CreditCard"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("brand", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstDigits", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastDigits", type: .nonNull(.scalar(String.self))),
            GraphQLField("expMonth", type: .nonNull(.scalar(Int.self))),
            GraphQLField("expYear", type: .nonNull(.scalar(Int.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(brand: String, firstDigits: String, lastDigits: String, expMonth: Int, expYear: Int) {
            self.init(unsafeResultMap: ["__typename": "CreditCard", "brand": brand, "firstDigits": firstDigits, "lastDigits": lastDigits, "expMonth": expMonth, "expYear": expYear])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Card brand.
          public var brand: String {
            get {
              return resultMap["brand"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "brand")
            }
          }

          /// The host name of the domain.
          public var firstDigits: String {
            get {
              return resultMap["firstDigits"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstDigits")
            }
          }

          /// Last 4 digits of the card number.
          public var lastDigits: String {
            get {
              return resultMap["lastDigits"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastDigits")
            }
          }

          /// Two-digit number representing the card’s expiration month.
          public var expMonth: Int {
            get {
              return resultMap["expMonth"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "expMonth")
            }
          }

          /// Four-digit number representing the card’s expiration year.
          public var expYear: Int {
            get {
              return resultMap["expYear"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "expYear")
            }
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class AddCheckoutPaymentSavedMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation addCheckoutPaymentSaved($checkoutId: ID!, $cardId: ID!, $deviceSessionId: String!) {
      checkoutAddSavedCard(checkoutId: $checkoutId, cardId: $cardId, deviceSessionId: $deviceSessionId) {
        __typename
        payment {
          __typename
          id
          chargeStatus
          actions
          total {
            __typename
            amount
          }
          transactions {
            __typename
            id
            gatewayResponse
            token
          }
          creditCard {
            __typename
            brand
            firstDigits
            lastDigits
            expMonth
            expYear
          }
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "addCheckoutPaymentSaved"

  public var checkoutId: GraphQLID
  public var cardId: GraphQLID
  public var deviceSessionId: String

  public init(checkoutId: GraphQLID, cardId: GraphQLID, deviceSessionId: String) {
    self.checkoutId = checkoutId
    self.cardId = cardId
    self.deviceSessionId = deviceSessionId
  }

  public var variables: GraphQLMap? {
    return ["checkoutId": checkoutId, "cardId": cardId, "deviceSessionId": deviceSessionId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkoutAddSavedCard", arguments: ["checkoutId": GraphQLVariable("checkoutId"), "cardId": GraphQLVariable("cardId"), "deviceSessionId": GraphQLVariable("deviceSessionId")], type: .object(CheckoutAddSavedCard.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkoutAddSavedCard: CheckoutAddSavedCard? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "checkoutAddSavedCard": checkoutAddSavedCard.flatMap { (value: CheckoutAddSavedCard) -> ResultMap in value.resultMap }])
    }

    public var checkoutAddSavedCard: CheckoutAddSavedCard? {
      get {
        return (resultMap["checkoutAddSavedCard"] as? ResultMap).flatMap { CheckoutAddSavedCard(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkoutAddSavedCard")
      }
    }

    public struct CheckoutAddSavedCard: GraphQLSelectionSet {
      public static let possibleTypes = ["CheckoutAddSavedCard"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("payment", type: .object(Payment.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(payment: Payment? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CheckoutAddSavedCard", "payment": payment.flatMap { (value: Payment) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A newly created payment.
      public var payment: Payment? {
        get {
          return (resultMap["payment"] as? ResultMap).flatMap { Payment(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "payment")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Payment: GraphQLSelectionSet {
        public static let possibleTypes = ["Payment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("chargeStatus", type: .nonNull(.scalar(PaymentChargeStatusEnum.self))),
          GraphQLField("actions", type: .nonNull(.list(.scalar(OrderAction.self)))),
          GraphQLField("total", type: .object(Total.selections)),
          GraphQLField("transactions", type: .list(.object(Transaction.selections))),
          GraphQLField("creditCard", type: .object(CreditCard.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, chargeStatus: PaymentChargeStatusEnum, actions: [OrderAction?], total: Total? = nil, transactions: [Transaction?]? = nil, creditCard: CreditCard? = nil) {
          self.init(unsafeResultMap: ["__typename": "Payment", "id": id, "chargeStatus": chargeStatus, "actions": actions, "total": total.flatMap { (value: Total) -> ResultMap in value.resultMap }, "transactions": transactions.flatMap { (value: [Transaction?]) -> [ResultMap?] in value.map { (value: Transaction?) -> ResultMap? in value.flatMap { (value: Transaction) -> ResultMap in value.resultMap } } }, "creditCard": creditCard.flatMap { (value: CreditCard) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// Internal payment status.
        public var chargeStatus: PaymentChargeStatusEnum {
          get {
            return resultMap["chargeStatus"]! as! PaymentChargeStatusEnum
          }
          set {
            resultMap.updateValue(newValue, forKey: "chargeStatus")
          }
        }

        /// List of actions that can be performed in
        /// the current state of a payment.
        public var actions: [OrderAction?] {
          get {
            return resultMap["actions"]! as! [OrderAction?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "actions")
          }
        }

        /// Total amount of the payment.
        public var total: Total? {
          get {
            return (resultMap["total"] as? ResultMap).flatMap { Total(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "total")
          }
        }

        /// List of all transactions within this payment.
        public var transactions: [Transaction?]? {
          get {
            return (resultMap["transactions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Transaction?] in value.map { (value: ResultMap?) -> Transaction? in value.flatMap { (value: ResultMap) -> Transaction in Transaction(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Transaction?]) -> [ResultMap?] in value.map { (value: Transaction?) -> ResultMap? in value.flatMap { (value: Transaction) -> ResultMap in value.resultMap } } }, forKey: "transactions")
          }
        }

        /// The details of the card used for this payment.
        public var creditCard: CreditCard? {
          get {
            return (resultMap["creditCard"] as? ResultMap).flatMap { CreditCard(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "creditCard")
          }
        }

        public struct Total: GraphQLSelectionSet {
          public static let possibleTypes = ["Money"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Double) {
            self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money.
          public var amount: Double {
            get {
              return resultMap["amount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }
        }

        public struct Transaction: GraphQLSelectionSet {
          public static let possibleTypes = ["Transaction"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("gatewayResponse", type: .scalar(String.self)),
            GraphQLField("token", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, gatewayResponse: String? = nil, token: String) {
            self.init(unsafeResultMap: ["__typename": "Transaction", "id": id, "gatewayResponse": gatewayResponse, "token": token])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of the object.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// Changes the postgres to mysql field
          public var gatewayResponse: String? {
            get {
              return resultMap["gatewayResponse"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "gatewayResponse")
            }
          }

          public var token: String {
            get {
              return resultMap["token"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "token")
            }
          }
        }

        public struct CreditCard: GraphQLSelectionSet {
          public static let possibleTypes = ["CreditCard"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("brand", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstDigits", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastDigits", type: .nonNull(.scalar(String.self))),
            GraphQLField("expMonth", type: .nonNull(.scalar(Int.self))),
            GraphQLField("expYear", type: .nonNull(.scalar(Int.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(brand: String, firstDigits: String, lastDigits: String, expMonth: Int, expYear: Int) {
            self.init(unsafeResultMap: ["__typename": "CreditCard", "brand": brand, "firstDigits": firstDigits, "lastDigits": lastDigits, "expMonth": expMonth, "expYear": expYear])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Card brand.
          public var brand: String {
            get {
              return resultMap["brand"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "brand")
            }
          }

          /// The host name of the domain.
          public var firstDigits: String {
            get {
              return resultMap["firstDigits"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstDigits")
            }
          }

          /// Last 4 digits of the card number.
          public var lastDigits: String {
            get {
              return resultMap["lastDigits"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastDigits")
            }
          }

          /// Two-digit number representing the card’s expiration month.
          public var expMonth: Int {
            get {
              return resultMap["expMonth"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "expMonth")
            }
          }

          /// Four-digit number representing the card’s expiration year.
          public var expYear: Int {
            get {
              return resultMap["expYear"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "expYear")
            }
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class AddOrderLinesToCheckoutMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation addOrderLinesToCheckout($id: ID!) {
      addOrderLinesToCheckout(id: $id) {
        __typename
        checkout {
          __typename
          id
          token
          quantity
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "addOrderLinesToCheckout"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addOrderLinesToCheckout", arguments: ["id": GraphQLVariable("id")], type: .object(AddOrderLinesToCheckout.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addOrderLinesToCheckout: AddOrderLinesToCheckout? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "addOrderLinesToCheckout": addOrderLinesToCheckout.flatMap { (value: AddOrderLinesToCheckout) -> ResultMap in value.resultMap }])
    }

    public var addOrderLinesToCheckout: AddOrderLinesToCheckout? {
      get {
        return (resultMap["addOrderLinesToCheckout"] as? ResultMap).flatMap { AddOrderLinesToCheckout(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addOrderLinesToCheckout")
      }
    }

    public struct AddOrderLinesToCheckout: GraphQLSelectionSet {
      public static let possibleTypes = ["AddOrderLinesToCheckout"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("checkout", type: .object(Checkout.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(checkout: Checkout? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "AddOrderLinesToCheckout", "checkout": checkout.flatMap { (value: Checkout) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Updated checkout.
      public var checkout: Checkout? {
        get {
          return (resultMap["checkout"] as? ResultMap).flatMap { Checkout(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "checkout")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Checkout: GraphQLSelectionSet {
        public static let possibleTypes = ["Checkout"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, token: String, quantity: Int) {
          self.init(unsafeResultMap: ["__typename": "Checkout", "id": id, "token": token, "quantity": quantity])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }

        public var quantity: Int {
          get {
            return resultMap["quantity"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "quantity")
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class CheckoutCompleteMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation checkoutComplete($checkoutId: ID!) {
      checkoutComplete(checkoutId: $checkoutId) {
        __typename
        order {
          __typename
          number
          isPaid
          paymentStatus
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "checkoutComplete"

  public var checkoutId: GraphQLID

  public init(checkoutId: GraphQLID) {
    self.checkoutId = checkoutId
  }

  public var variables: GraphQLMap? {
    return ["checkoutId": checkoutId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkoutComplete", arguments: ["checkoutId": GraphQLVariable("checkoutId")], type: .object(CheckoutComplete.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkoutComplete: CheckoutComplete? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "checkoutComplete": checkoutComplete.flatMap { (value: CheckoutComplete) -> ResultMap in value.resultMap }])
    }

    public var checkoutComplete: CheckoutComplete? {
      get {
        return (resultMap["checkoutComplete"] as? ResultMap).flatMap { CheckoutComplete(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkoutComplete")
      }
    }

    public struct CheckoutComplete: GraphQLSelectionSet {
      public static let possibleTypes = ["CheckoutComplete"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("order", type: .object(Order.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(order: Order? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CheckoutComplete", "order": order.flatMap { (value: Order) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Placed order
      public var order: Order? {
        get {
          return (resultMap["order"] as? ResultMap).flatMap { Order(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "order")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Order: GraphQLSelectionSet {
        public static let possibleTypes = ["Order"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("number", type: .scalar(String.self)),
          GraphQLField("isPaid", type: .scalar(Bool.self)),
          GraphQLField("paymentStatus", type: .scalar(PaymentChargeStatusEnum.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(number: String? = nil, isPaid: Bool? = nil, paymentStatus: PaymentChargeStatusEnum? = nil) {
          self.init(unsafeResultMap: ["__typename": "Order", "number": number, "isPaid": isPaid, "paymentStatus": paymentStatus])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// User-friendly number of an order.
        public var number: String? {
          get {
            return resultMap["number"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "number")
          }
        }

        /// Informs if an order is fully paid.
        public var isPaid: Bool? {
          get {
            return resultMap["isPaid"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isPaid")
          }
        }

        /// Internal payment status.
        public var paymentStatus: PaymentChargeStatusEnum? {
          get {
            return resultMap["paymentStatus"] as? PaymentChargeStatusEnum
          }
          set {
            resultMap.updateValue(newValue, forKey: "paymentStatus")
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class CleanCheckoutLinesMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation cleanCheckoutLines($checkoutId: ID!) {
      checkoutCleanLines(checkoutId: $checkoutId) {
        __typename
        checkout {
          __typename
          id
          token
          quantity
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "cleanCheckoutLines"

  public var checkoutId: GraphQLID

  public init(checkoutId: GraphQLID) {
    self.checkoutId = checkoutId
  }

  public var variables: GraphQLMap? {
    return ["checkoutId": checkoutId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkoutCleanLines", arguments: ["checkoutId": GraphQLVariable("checkoutId")], type: .object(CheckoutCleanLine.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkoutCleanLines: CheckoutCleanLine? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "checkoutCleanLines": checkoutCleanLines.flatMap { (value: CheckoutCleanLine) -> ResultMap in value.resultMap }])
    }

    public var checkoutCleanLines: CheckoutCleanLine? {
      get {
        return (resultMap["checkoutCleanLines"] as? ResultMap).flatMap { CheckoutCleanLine(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkoutCleanLines")
      }
    }

    public struct CheckoutCleanLine: GraphQLSelectionSet {
      public static let possibleTypes = ["CheckoutCleanLines"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("checkout", type: .object(Checkout.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(checkout: Checkout? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CheckoutCleanLines", "checkout": checkout.flatMap { (value: Checkout) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A clean checkout.
      public var checkout: Checkout? {
        get {
          return (resultMap["checkout"] as? ResultMap).flatMap { Checkout(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "checkout")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Checkout: GraphQLSelectionSet {
        public static let possibleTypes = ["Checkout"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, token: String, quantity: Int) {
          self.init(unsafeResultMap: ["__typename": "Checkout", "id": id, "token": token, "quantity": quantity])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }

        public var quantity: Int {
          get {
            return resultMap["quantity"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "quantity")
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class CreateCheckoutMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation createCheckout($checkoutCreateInput: CheckoutCreateInput!) {
      checkoutCreate(input: $checkoutCreateInput) {
        __typename
        checkout {
          __typename
          id
          token
          quantity
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "createCheckout"

  public var checkoutCreateInput: CheckoutCreateInput

  public init(checkoutCreateInput: CheckoutCreateInput) {
    self.checkoutCreateInput = checkoutCreateInput
  }

  public var variables: GraphQLMap? {
    return ["checkoutCreateInput": checkoutCreateInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkoutCreate", arguments: ["input": GraphQLVariable("checkoutCreateInput")], type: .object(CheckoutCreate.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkoutCreate: CheckoutCreate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "checkoutCreate": checkoutCreate.flatMap { (value: CheckoutCreate) -> ResultMap in value.resultMap }])
    }

    public var checkoutCreate: CheckoutCreate? {
      get {
        return (resultMap["checkoutCreate"] as? ResultMap).flatMap { CheckoutCreate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkoutCreate")
      }
    }

    public struct CheckoutCreate: GraphQLSelectionSet {
      public static let possibleTypes = ["CheckoutCreate"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("checkout", type: .object(Checkout.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(checkout: Checkout? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CheckoutCreate", "checkout": checkout.flatMap { (value: Checkout) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var checkout: Checkout? {
        get {
          return (resultMap["checkout"] as? ResultMap).flatMap { Checkout(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "checkout")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Checkout: GraphQLSelectionSet {
        public static let possibleTypes = ["Checkout"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, token: String, quantity: Int) {
          self.init(unsafeResultMap: ["__typename": "Checkout", "id": id, "token": token, "quantity": quantity])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }

        public var quantity: Int {
          get {
            return resultMap["quantity"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "quantity")
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class DiscountCodeMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation discountCode($checkoutId: ID!, $discountCode: String) {
      checkoutUpdateVoucher(checkoutId: $checkoutId, voucherCode: $discountCode) {
        __typename
        checkout {
          __typename
          id
          token
          quantity
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "discountCode"

  public var checkoutId: GraphQLID
  public var discountCode: String?

  public init(checkoutId: GraphQLID, discountCode: String? = nil) {
    self.checkoutId = checkoutId
    self.discountCode = discountCode
  }

  public var variables: GraphQLMap? {
    return ["checkoutId": checkoutId, "discountCode": discountCode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkoutUpdateVoucher", arguments: ["checkoutId": GraphQLVariable("checkoutId"), "voucherCode": GraphQLVariable("discountCode")], type: .object(CheckoutUpdateVoucher.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkoutUpdateVoucher: CheckoutUpdateVoucher? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "checkoutUpdateVoucher": checkoutUpdateVoucher.flatMap { (value: CheckoutUpdateVoucher) -> ResultMap in value.resultMap }])
    }

    public var checkoutUpdateVoucher: CheckoutUpdateVoucher? {
      get {
        return (resultMap["checkoutUpdateVoucher"] as? ResultMap).flatMap { CheckoutUpdateVoucher(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkoutUpdateVoucher")
      }
    }

    public struct CheckoutUpdateVoucher: GraphQLSelectionSet {
      public static let possibleTypes = ["CheckoutUpdateVoucher"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("checkout", type: .object(Checkout.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(checkout: Checkout? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CheckoutUpdateVoucher", "checkout": checkout.flatMap { (value: Checkout) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// An checkout with updated voucher
      public var checkout: Checkout? {
        get {
          return (resultMap["checkout"] as? ResultMap).flatMap { Checkout(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "checkout")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Checkout: GraphQLSelectionSet {
        public static let possibleTypes = ["Checkout"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, token: String, quantity: Int) {
          self.init(unsafeResultMap: ["__typename": "Checkout", "id": id, "token": token, "quantity": quantity])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }

        public var quantity: Int {
          get {
            return resultMap["quantity"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "quantity")
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class FetchCheckoutQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchCheckoutQuery($token: UUID) {
      checkout(token: $token) {
        __typename
        id
        token
        quantity
        subtotalPrice {
          __typename
          gross {
            __typename
            amount
          }
        }
        shippingPrice {
          __typename
          gross {
            __typename
            amount
          }
        }
        discountAmount {
          __typename
          amount
        }
        totalPrice {
          __typename
          gross {
            __typename
            amount
          }
        }
        shippingAddress {
          __typename
          id
          addressName
          firstName
          lastName
          streetAddress1
          streetAddress2
          city
          cityArea
          postalCode
          country {
            __typename
            country
            code
          }
          countryArea
          phone
          isDefaultShippingAddress
          isDefaultBillingAddress
        }
        deliveryDate
        paymentInfo {
          __typename
          ccFirstDigits
          ccLastDigits
          ccBrand
          ccExpMonth
          ccExpYear
        }
      }
    }
    """

  public let operationName = "fetchCheckoutQuery"

  public var token: String?

  public init(token: String? = nil) {
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkout", arguments: ["token": GraphQLVariable("token")], type: .object(Checkout.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkout: Checkout? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "checkout": checkout.flatMap { (value: Checkout) -> ResultMap in value.resultMap }])
    }

    /// Single checkout.
    public var checkout: Checkout? {
      get {
        return (resultMap["checkout"] as? ResultMap).flatMap { Checkout(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkout")
      }
    }

    public struct Checkout: GraphQLSelectionSet {
      public static let possibleTypes = ["Checkout"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("token", type: .nonNull(.scalar(String.self))),
        GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
        GraphQLField("subtotalPrice", type: .object(SubtotalPrice.selections)),
        GraphQLField("shippingPrice", type: .object(ShippingPrice.selections)),
        GraphQLField("discountAmount", type: .object(DiscountAmount.selections)),
        GraphQLField("totalPrice", type: .object(TotalPrice.selections)),
        GraphQLField("shippingAddress", type: .object(ShippingAddress.selections)),
        GraphQLField("deliveryDate", type: .scalar(String.self)),
        GraphQLField("paymentInfo", type: .object(PaymentInfo.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, token: String, quantity: Int, subtotalPrice: SubtotalPrice? = nil, shippingPrice: ShippingPrice? = nil, discountAmount: DiscountAmount? = nil, totalPrice: TotalPrice? = nil, shippingAddress: ShippingAddress? = nil, deliveryDate: String? = nil, paymentInfo: PaymentInfo? = nil) {
        self.init(unsafeResultMap: ["__typename": "Checkout", "id": id, "token": token, "quantity": quantity, "subtotalPrice": subtotalPrice.flatMap { (value: SubtotalPrice) -> ResultMap in value.resultMap }, "shippingPrice": shippingPrice.flatMap { (value: ShippingPrice) -> ResultMap in value.resultMap }, "discountAmount": discountAmount.flatMap { (value: DiscountAmount) -> ResultMap in value.resultMap }, "totalPrice": totalPrice.flatMap { (value: TotalPrice) -> ResultMap in value.resultMap }, "shippingAddress": shippingAddress.flatMap { (value: ShippingAddress) -> ResultMap in value.resultMap }, "deliveryDate": deliveryDate, "paymentInfo": paymentInfo.flatMap { (value: PaymentInfo) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of the object.
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public var quantity: Int {
        get {
          return resultMap["quantity"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "quantity")
        }
      }

      /// The price of the checkout before shipping, with taxes included.
      public var subtotalPrice: SubtotalPrice? {
        get {
          return (resultMap["subtotalPrice"] as? ResultMap).flatMap { SubtotalPrice(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "subtotalPrice")
        }
      }

      /// The price of the shipping, with all the taxes included.
      public var shippingPrice: ShippingPrice? {
        get {
          return (resultMap["shippingPrice"] as? ResultMap).flatMap { ShippingPrice(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "shippingPrice")
        }
      }

      public var discountAmount: DiscountAmount? {
        get {
          return (resultMap["discountAmount"] as? ResultMap).flatMap { DiscountAmount(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "discountAmount")
        }
      }

      /// The sum of the the checkout line prices, with all the taxes,shipping costs, and discounts included.
      public var totalPrice: TotalPrice? {
        get {
          return (resultMap["totalPrice"] as? ResultMap).flatMap { TotalPrice(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "totalPrice")
        }
      }

      public var shippingAddress: ShippingAddress? {
        get {
          return (resultMap["shippingAddress"] as? ResultMap).flatMap { ShippingAddress(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "shippingAddress")
        }
      }

      public var deliveryDate: String? {
        get {
          return resultMap["deliveryDate"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "deliveryDate")
        }
      }

      /// Payment method information used to pay the order.
      public var paymentInfo: PaymentInfo? {
        get {
          return (resultMap["paymentInfo"] as? ResultMap).flatMap { PaymentInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "paymentInfo")
        }
      }

      public struct SubtotalPrice: GraphQLSelectionSet {
        public static let possibleTypes = ["TaxedMoney"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(gross: Gross) {
          self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Amount of money including taxes.
        public var gross: Gross {
          get {
            return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "gross")
          }
        }

        public struct Gross: GraphQLSelectionSet {
          public static let possibleTypes = ["Money"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Double) {
            self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money.
          public var amount: Double {
            get {
              return resultMap["amount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }
        }
      }

      public struct ShippingPrice: GraphQLSelectionSet {
        public static let possibleTypes = ["TaxedMoney"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(gross: Gross) {
          self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Amount of money including taxes.
        public var gross: Gross {
          get {
            return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "gross")
          }
        }

        public struct Gross: GraphQLSelectionSet {
          public static let possibleTypes = ["Money"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Double) {
            self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money.
          public var amount: Double {
            get {
              return resultMap["amount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }
        }
      }

      public struct DiscountAmount: GraphQLSelectionSet {
        public static let possibleTypes = ["Money"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(amount: Double) {
          self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Amount of money.
        public var amount: Double {
          get {
            return resultMap["amount"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }
      }

      public struct TotalPrice: GraphQLSelectionSet {
        public static let possibleTypes = ["TaxedMoney"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(gross: Gross) {
          self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Amount of money including taxes.
        public var gross: Gross {
          get {
            return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "gross")
          }
        }

        public struct Gross: GraphQLSelectionSet {
          public static let possibleTypes = ["Money"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Double) {
            self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money.
          public var amount: Double {
            get {
              return resultMap["amount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }
        }
      }

      public struct ShippingAddress: GraphQLSelectionSet {
        public static let possibleTypes = ["Address"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("addressName", type: .scalar(String.self)),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("streetAddress1", type: .nonNull(.scalar(String.self))),
          GraphQLField("streetAddress2", type: .nonNull(.scalar(String.self))),
          GraphQLField("city", type: .nonNull(.scalar(String.self))),
          GraphQLField("cityArea", type: .nonNull(.scalar(String.self))),
          GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
          GraphQLField("country", type: .nonNull(.object(Country.selections))),
          GraphQLField("countryArea", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("isDefaultShippingAddress", type: .scalar(Bool.self)),
          GraphQLField("isDefaultBillingAddress", type: .scalar(Bool.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, addressName: String? = nil, firstName: String, lastName: String, streetAddress1: String, streetAddress2: String, city: String, cityArea: String, postalCode: String, country: Country, countryArea: String, phone: String? = nil, isDefaultShippingAddress: Bool? = nil, isDefaultBillingAddress: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "Address", "id": id, "addressName": addressName, "firstName": firstName, "lastName": lastName, "streetAddress1": streetAddress1, "streetAddress2": streetAddress2, "city": city, "cityArea": cityArea, "postalCode": postalCode, "country": country.resultMap, "countryArea": countryArea, "phone": phone, "isDefaultShippingAddress": isDefaultShippingAddress, "isDefaultBillingAddress": isDefaultBillingAddress])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var addressName: String? {
          get {
            return resultMap["addressName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "addressName")
          }
        }

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var streetAddress1: String {
          get {
            return resultMap["streetAddress1"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "streetAddress1")
          }
        }

        public var streetAddress2: String {
          get {
            return resultMap["streetAddress2"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "streetAddress2")
          }
        }

        public var city: String {
          get {
            return resultMap["city"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "city")
          }
        }

        public var cityArea: String {
          get {
            return resultMap["cityArea"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cityArea")
          }
        }

        public var postalCode: String {
          get {
            return resultMap["postalCode"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "postalCode")
          }
        }

        /// Default shop's country
        public var country: Country {
          get {
            return Country(unsafeResultMap: resultMap["country"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "country")
          }
        }

        public var countryArea: String {
          get {
            return resultMap["countryArea"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "countryArea")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        /// Address is user's default shipping address
        public var isDefaultShippingAddress: Bool? {
          get {
            return resultMap["isDefaultShippingAddress"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isDefaultShippingAddress")
          }
        }

        /// Address is user's default billing address
        public var isDefaultBillingAddress: Bool? {
          get {
            return resultMap["isDefaultBillingAddress"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isDefaultBillingAddress")
          }
        }

        public struct Country: GraphQLSelectionSet {
          public static let possibleTypes = ["CountryDisplay"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("country", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(country: String, code: String) {
            self.init(unsafeResultMap: ["__typename": "CountryDisplay", "country": country, "code": code])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Country name.
          public var country: String {
            get {
              return resultMap["country"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "country")
            }
          }

          /// Country code.
          public var code: String {
            get {
              return resultMap["code"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "code")
            }
          }
        }
      }

      public struct PaymentInfo: GraphQLSelectionSet {
        public static let possibleTypes = ["PaymentInformation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ccFirstDigits", type: .scalar(String.self)),
          GraphQLField("ccLastDigits", type: .scalar(String.self)),
          GraphQLField("ccBrand", type: .scalar(String.self)),
          GraphQLField("ccExpMonth", type: .scalar(String.self)),
          GraphQLField("ccExpYear", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(ccFirstDigits: String? = nil, ccLastDigits: String? = nil, ccBrand: String? = nil, ccExpMonth: String? = nil, ccExpYear: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PaymentInformation", "ccFirstDigits": ccFirstDigits, "ccLastDigits": ccLastDigits, "ccBrand": ccBrand, "ccExpMonth": ccExpMonth, "ccExpYear": ccExpYear])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var ccFirstDigits: String? {
          get {
            return resultMap["ccFirstDigits"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ccFirstDigits")
          }
        }

        public var ccLastDigits: String? {
          get {
            return resultMap["ccLastDigits"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ccLastDigits")
          }
        }

        public var ccBrand: String? {
          get {
            return resultMap["ccBrand"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ccBrand")
          }
        }

        public var ccExpMonth: String? {
          get {
            return resultMap["ccExpMonth"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ccExpMonth")
          }
        }

        public var ccExpYear: String? {
          get {
            return resultMap["ccExpYear"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ccExpYear")
          }
        }
      }
    }
  }
}

public final class CheckoutAddressUpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation checkoutAddressUpdate($checkoutId: ID!, $shippingAddressId: ID!) {
      checkoutShippingAddressUpdate(checkoutId: $checkoutId, shippingAddressId: $shippingAddressId) {
        __typename
        checkout {
          __typename
          id
          token
          shippingAddress {
            __typename
            id
            addressName
            firstName
            lastName
            streetAddress1
            streetAddress2
            city
            cityArea
            postalCode
            country {
              __typename
              country
              code
            }
            countryArea
            phone
            isDefaultShippingAddress
            isDefaultBillingAddress
          }
          availableShippingMethods {
            __typename
            id
            name
            price {
              __typename
              currency
              amount
              localized
            }
            type
          }
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "checkoutAddressUpdate"

  public var checkoutId: GraphQLID
  public var shippingAddressId: GraphQLID

  public init(checkoutId: GraphQLID, shippingAddressId: GraphQLID) {
    self.checkoutId = checkoutId
    self.shippingAddressId = shippingAddressId
  }

  public var variables: GraphQLMap? {
    return ["checkoutId": checkoutId, "shippingAddressId": shippingAddressId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkoutShippingAddressUpdate", arguments: ["checkoutId": GraphQLVariable("checkoutId"), "shippingAddressId": GraphQLVariable("shippingAddressId")], type: .object(CheckoutShippingAddressUpdate.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkoutShippingAddressUpdate: CheckoutShippingAddressUpdate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "checkoutShippingAddressUpdate": checkoutShippingAddressUpdate.flatMap { (value: CheckoutShippingAddressUpdate) -> ResultMap in value.resultMap }])
    }

    public var checkoutShippingAddressUpdate: CheckoutShippingAddressUpdate? {
      get {
        return (resultMap["checkoutShippingAddressUpdate"] as? ResultMap).flatMap { CheckoutShippingAddressUpdate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkoutShippingAddressUpdate")
      }
    }

    public struct CheckoutShippingAddressUpdate: GraphQLSelectionSet {
      public static let possibleTypes = ["CheckoutShippingAddressUpdate"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("checkout", type: .object(Checkout.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(checkout: Checkout? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CheckoutShippingAddressUpdate", "checkout": checkout.flatMap { (value: Checkout) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// An updated checkout
      public var checkout: Checkout? {
        get {
          return (resultMap["checkout"] as? ResultMap).flatMap { Checkout(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "checkout")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Checkout: GraphQLSelectionSet {
        public static let possibleTypes = ["Checkout"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("shippingAddress", type: .object(ShippingAddress.selections)),
          GraphQLField("availableShippingMethods", type: .nonNull(.list(.object(AvailableShippingMethod.selections)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, token: String, shippingAddress: ShippingAddress? = nil, availableShippingMethods: [AvailableShippingMethod?]) {
          self.init(unsafeResultMap: ["__typename": "Checkout", "id": id, "token": token, "shippingAddress": shippingAddress.flatMap { (value: ShippingAddress) -> ResultMap in value.resultMap }, "availableShippingMethods": availableShippingMethods.map { (value: AvailableShippingMethod?) -> ResultMap? in value.flatMap { (value: AvailableShippingMethod) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }

        public var shippingAddress: ShippingAddress? {
          get {
            return (resultMap["shippingAddress"] as? ResultMap).flatMap { ShippingAddress(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "shippingAddress")
          }
        }

        /// Shipping methods that can be used with this order.
        public var availableShippingMethods: [AvailableShippingMethod?] {
          get {
            return (resultMap["availableShippingMethods"] as! [ResultMap?]).map { (value: ResultMap?) -> AvailableShippingMethod? in value.flatMap { (value: ResultMap) -> AvailableShippingMethod in AvailableShippingMethod(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.map { (value: AvailableShippingMethod?) -> ResultMap? in value.flatMap { (value: AvailableShippingMethod) -> ResultMap in value.resultMap } }, forKey: "availableShippingMethods")
          }
        }

        public struct ShippingAddress: GraphQLSelectionSet {
          public static let possibleTypes = ["Address"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("addressName", type: .scalar(String.self)),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            GraphQLField("streetAddress1", type: .nonNull(.scalar(String.self))),
            GraphQLField("streetAddress2", type: .nonNull(.scalar(String.self))),
            GraphQLField("city", type: .nonNull(.scalar(String.self))),
            GraphQLField("cityArea", type: .nonNull(.scalar(String.self))),
            GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
            GraphQLField("country", type: .nonNull(.object(Country.selections))),
            GraphQLField("countryArea", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .scalar(String.self)),
            GraphQLField("isDefaultShippingAddress", type: .scalar(Bool.self)),
            GraphQLField("isDefaultBillingAddress", type: .scalar(Bool.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, addressName: String? = nil, firstName: String, lastName: String, streetAddress1: String, streetAddress2: String, city: String, cityArea: String, postalCode: String, country: Country, countryArea: String, phone: String? = nil, isDefaultShippingAddress: Bool? = nil, isDefaultBillingAddress: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "Address", "id": id, "addressName": addressName, "firstName": firstName, "lastName": lastName, "streetAddress1": streetAddress1, "streetAddress2": streetAddress2, "city": city, "cityArea": cityArea, "postalCode": postalCode, "country": country.resultMap, "countryArea": countryArea, "phone": phone, "isDefaultShippingAddress": isDefaultShippingAddress, "isDefaultBillingAddress": isDefaultBillingAddress])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of the object.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var addressName: String? {
            get {
              return resultMap["addressName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "addressName")
            }
          }

          public var firstName: String {
            get {
              return resultMap["firstName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          public var lastName: String {
            get {
              return resultMap["lastName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastName")
            }
          }

          public var streetAddress1: String {
            get {
              return resultMap["streetAddress1"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "streetAddress1")
            }
          }

          public var streetAddress2: String {
            get {
              return resultMap["streetAddress2"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "streetAddress2")
            }
          }

          public var city: String {
            get {
              return resultMap["city"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "city")
            }
          }

          public var cityArea: String {
            get {
              return resultMap["cityArea"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "cityArea")
            }
          }

          public var postalCode: String {
            get {
              return resultMap["postalCode"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "postalCode")
            }
          }

          /// Default shop's country
          public var country: Country {
            get {
              return Country(unsafeResultMap: resultMap["country"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "country")
            }
          }

          public var countryArea: String {
            get {
              return resultMap["countryArea"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "countryArea")
            }
          }

          public var phone: String? {
            get {
              return resultMap["phone"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "phone")
            }
          }

          /// Address is user's default shipping address
          public var isDefaultShippingAddress: Bool? {
            get {
              return resultMap["isDefaultShippingAddress"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isDefaultShippingAddress")
            }
          }

          /// Address is user's default billing address
          public var isDefaultBillingAddress: Bool? {
            get {
              return resultMap["isDefaultBillingAddress"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "isDefaultBillingAddress")
            }
          }

          public struct Country: GraphQLSelectionSet {
            public static let possibleTypes = ["CountryDisplay"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("country", type: .nonNull(.scalar(String.self))),
              GraphQLField("code", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(country: String, code: String) {
              self.init(unsafeResultMap: ["__typename": "CountryDisplay", "country": country, "code": code])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Country name.
            public var country: String {
              get {
                return resultMap["country"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "country")
              }
            }

            /// Country code.
            public var code: String {
              get {
                return resultMap["code"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "code")
              }
            }
          }
        }

        public struct AvailableShippingMethod: GraphQLSelectionSet {
          public static let possibleTypes = ["ShippingMethod"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("price", type: .object(Price.selections)),
            GraphQLField("type", type: .scalar(ShippingMethodTypeEnum.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, price: Price? = nil, type: ShippingMethodTypeEnum? = nil) {
            self.init(unsafeResultMap: ["__typename": "ShippingMethod", "id": id, "name": name, "price": price.flatMap { (value: Price) -> ResultMap in value.resultMap }, "type": type])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of the object.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var price: Price? {
            get {
              return (resultMap["price"] as? ResultMap).flatMap { Price(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "price")
            }
          }

          /// Type of the shipping method.
          public var type: ShippingMethodTypeEnum? {
            get {
              return resultMap["type"] as? ShippingMethodTypeEnum
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public struct Price: GraphQLSelectionSet {
            public static let possibleTypes = ["Money"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
              GraphQLField("localized", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(currency: String, amount: Double, localized: String) {
              self.init(unsafeResultMap: ["__typename": "Money", "currency": currency, "amount": amount, "localized": localized])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Currency code.
            public var currency: String {
              get {
                return resultMap["currency"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "currency")
              }
            }

            /// Amount of money.
            public var amount: Double {
              get {
                return resultMap["amount"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "amount")
              }
            }

            /// Money formatted according to the current locale.
            public var localized: String {
              get {
                return resultMap["localized"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "localized")
              }
            }
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class CheckoutLinesUpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation checkoutLinesUpdate($checkoutId: ID!, $lines: [CheckoutLineInput]!) {
      checkoutLinesUpdate(checkoutId: $checkoutId, lines: $lines) {
        __typename
        checkout {
          __typename
          id
          token
          quantity
          lines {
            __typename
            quantity
            totalPrice {
              __typename
              gross {
                __typename
                amount
              }
            }
            variant {
              __typename
              id
              product {
                __typename
                name
                weight {
                  __typename
                  unit
                  value
                }
                thumbnail {
                  __typename
                  url
                }
              }
              name
              pricing {
                __typename
                price {
                  __typename
                  gross {
                    __typename
                    amount
                  }
                }
              }
            }
          }
          subtotalPrice {
            __typename
            gross {
              __typename
              amount
            }
          }
          totalPrice {
            __typename
            gross {
              __typename
              amount
            }
          }
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "checkoutLinesUpdate"

  public var checkoutId: GraphQLID
  public var lines: [CheckoutLineInput?]

  public init(checkoutId: GraphQLID, lines: [CheckoutLineInput?]) {
    self.checkoutId = checkoutId
    self.lines = lines
  }

  public var variables: GraphQLMap? {
    return ["checkoutId": checkoutId, "lines": lines]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkoutLinesUpdate", arguments: ["checkoutId": GraphQLVariable("checkoutId"), "lines": GraphQLVariable("lines")], type: .object(CheckoutLinesUpdate.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkoutLinesUpdate: CheckoutLinesUpdate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "checkoutLinesUpdate": checkoutLinesUpdate.flatMap { (value: CheckoutLinesUpdate) -> ResultMap in value.resultMap }])
    }

    public var checkoutLinesUpdate: CheckoutLinesUpdate? {
      get {
        return (resultMap["checkoutLinesUpdate"] as? ResultMap).flatMap { CheckoutLinesUpdate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkoutLinesUpdate")
      }
    }

    public struct CheckoutLinesUpdate: GraphQLSelectionSet {
      public static let possibleTypes = ["CheckoutLinesUpdate"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("checkout", type: .object(Checkout.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(checkout: Checkout? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CheckoutLinesUpdate", "checkout": checkout.flatMap { (value: Checkout) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// An updated Checkout.
      public var checkout: Checkout? {
        get {
          return (resultMap["checkout"] as? ResultMap).flatMap { Checkout(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "checkout")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Checkout: GraphQLSelectionSet {
        public static let possibleTypes = ["Checkout"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
          GraphQLField("lines", type: .list(.object(Line.selections))),
          GraphQLField("subtotalPrice", type: .object(SubtotalPrice.selections)),
          GraphQLField("totalPrice", type: .object(TotalPrice.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, token: String, quantity: Int, lines: [Line?]? = nil, subtotalPrice: SubtotalPrice? = nil, totalPrice: TotalPrice? = nil) {
          self.init(unsafeResultMap: ["__typename": "Checkout", "id": id, "token": token, "quantity": quantity, "lines": lines.flatMap { (value: [Line?]) -> [ResultMap?] in value.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } } }, "subtotalPrice": subtotalPrice.flatMap { (value: SubtotalPrice) -> ResultMap in value.resultMap }, "totalPrice": totalPrice.flatMap { (value: TotalPrice) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }

        public var quantity: Int {
          get {
            return resultMap["quantity"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "quantity")
          }
        }

        /// A list of checkout lines, each containing information about an item in the checkout.
        public var lines: [Line?]? {
          get {
            return (resultMap["lines"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Line?] in value.map { (value: ResultMap?) -> Line? in value.flatMap { (value: ResultMap) -> Line in Line(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Line?]) -> [ResultMap?] in value.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } } }, forKey: "lines")
          }
        }

        /// The price of the checkout before shipping, with taxes included.
        public var subtotalPrice: SubtotalPrice? {
          get {
            return (resultMap["subtotalPrice"] as? ResultMap).flatMap { SubtotalPrice(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "subtotalPrice")
          }
        }

        /// The sum of the the checkout line prices, with all the taxes,shipping costs, and discounts included.
        public var totalPrice: TotalPrice? {
          get {
            return (resultMap["totalPrice"] as? ResultMap).flatMap { TotalPrice(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "totalPrice")
          }
        }

        public struct Line: GraphQLSelectionSet {
          public static let possibleTypes = ["CheckoutLine"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
            GraphQLField("totalPrice", type: .object(TotalPrice.selections)),
            GraphQLField("variant", type: .nonNull(.object(Variant.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(quantity: Int, totalPrice: TotalPrice? = nil, variant: Variant) {
            self.init(unsafeResultMap: ["__typename": "CheckoutLine", "quantity": quantity, "totalPrice": totalPrice.flatMap { (value: TotalPrice) -> ResultMap in value.resultMap }, "variant": variant.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var quantity: Int {
            get {
              return resultMap["quantity"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "quantity")
            }
          }

          /// The sum of the checkout line price, taxes and discounts.
          public var totalPrice: TotalPrice? {
            get {
              return (resultMap["totalPrice"] as? ResultMap).flatMap { TotalPrice(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "totalPrice")
            }
          }

          public var variant: Variant {
            get {
              return Variant(unsafeResultMap: resultMap["variant"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "variant")
            }
          }

          public struct TotalPrice: GraphQLSelectionSet {
            public static let possibleTypes = ["TaxedMoney"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(gross: Gross) {
              self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Amount of money including taxes.
            public var gross: Gross {
              get {
                return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "gross")
              }
            }

            public struct Gross: GraphQLSelectionSet {
              public static let possibleTypes = ["Money"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(amount: Double) {
                self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Amount of money.
              public var amount: Double {
                get {
                  return resultMap["amount"]! as! Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "amount")
                }
              }
            }
          }

          public struct Variant: GraphQLSelectionSet {
            public static let possibleTypes = ["ProductVariant"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("product", type: .nonNull(.object(Product.selections))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("pricing", type: .object(Pricing.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, product: Product, name: String, pricing: Pricing? = nil) {
              self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "product": product.resultMap, "name": name, "pricing": pricing.flatMap { (value: Pricing) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of the object.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var product: Product {
              get {
                return Product(unsafeResultMap: resultMap["product"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "product")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// Lists the storefront variant's pricing,
            /// the current price and discounts, only meant for displaying
            public var pricing: Pricing? {
              get {
                return (resultMap["pricing"] as? ResultMap).flatMap { Pricing(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "pricing")
              }
            }

            public struct Product: GraphQLSelectionSet {
              public static let possibleTypes = ["Product"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("weight", type: .object(Weight.selections)),
                GraphQLField("thumbnail", type: .object(Thumbnail.selections)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String, weight: Weight? = nil, thumbnail: Thumbnail? = nil) {
                self.init(unsafeResultMap: ["__typename": "Product", "name": name, "weight": weight.flatMap { (value: Weight) -> ResultMap in value.resultMap }, "thumbnail": thumbnail.flatMap { (value: Thumbnail) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              public var weight: Weight? {
                get {
                  return (resultMap["weight"] as? ResultMap).flatMap { Weight(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "weight")
                }
              }

              /// The main thumbnail for a product.
              public var thumbnail: Thumbnail? {
                get {
                  return (resultMap["thumbnail"] as? ResultMap).flatMap { Thumbnail(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "thumbnail")
                }
              }

              public struct Weight: GraphQLSelectionSet {
                public static let possibleTypes = ["Weight"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("unit", type: .nonNull(.scalar(String.self))),
                  GraphQLField("value", type: .nonNull(.scalar(Double.self))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(unit: String, value: Double) {
                  self.init(unsafeResultMap: ["__typename": "Weight", "unit": unit, "value": value])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Weight unit
                public var unit: String {
                  get {
                    return resultMap["unit"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "unit")
                  }
                }

                /// Weight value
                public var value: Double {
                  get {
                    return resultMap["value"]! as! Double
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "value")
                  }
                }
              }

              public struct Thumbnail: GraphQLSelectionSet {
                public static let possibleTypes = ["Image"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(url: String) {
                  self.init(unsafeResultMap: ["__typename": "Image", "url": url])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The URL of the image.
                public var url: String {
                  get {
                    return resultMap["url"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "url")
                  }
                }
              }
            }

            public struct Pricing: GraphQLSelectionSet {
              public static let possibleTypes = ["VariantPricingInfo"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("price", type: .object(Price.selections)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(price: Price? = nil) {
                self.init(unsafeResultMap: ["__typename": "VariantPricingInfo", "price": price.flatMap { (value: Price) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The price, with any discount subtracted.
              public var price: Price? {
                get {
                  return (resultMap["price"] as? ResultMap).flatMap { Price(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "price")
                }
              }

              public struct Price: GraphQLSelectionSet {
                public static let possibleTypes = ["TaxedMoney"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(gross: Gross) {
                  self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Amount of money including taxes.
                public var gross: Gross {
                  get {
                    return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "gross")
                  }
                }

                public struct Gross: GraphQLSelectionSet {
                  public static let possibleTypes = ["Money"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(amount: Double) {
                    self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Amount of money.
                  public var amount: Double {
                    get {
                      return resultMap["amount"]! as! Double
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "amount")
                    }
                  }
                }
              }
            }
          }
        }

        public struct SubtotalPrice: GraphQLSelectionSet {
          public static let possibleTypes = ["TaxedMoney"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(gross: Gross) {
            self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money including taxes.
          public var gross: Gross {
            get {
              return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "gross")
            }
          }

          public struct Gross: GraphQLSelectionSet {
            public static let possibleTypes = ["Money"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(amount: Double) {
              self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Amount of money.
            public var amount: Double {
              get {
                return resultMap["amount"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "amount")
              }
            }
          }
        }

        public struct TotalPrice: GraphQLSelectionSet {
          public static let possibleTypes = ["TaxedMoney"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(gross: Gross) {
            self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money including taxes.
          public var gross: Gross {
            get {
              return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "gross")
            }
          }

          public struct Gross: GraphQLSelectionSet {
            public static let possibleTypes = ["Money"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(amount: Double) {
              self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Amount of money.
            public var amount: Double {
              get {
                return resultMap["amount"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "amount")
              }
            }
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class CheckoutShippingMethodUpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation checkoutShippingMethodUpdate($checkoutId: ID!, $shippingMethodId: ID!, $deliveryDate: DateTime!) {
      checkoutShippingMethodUpdate(checkoutId: $checkoutId, shippingMethodId: $shippingMethodId, deliveryDate: $deliveryDate) {
        __typename
        checkout {
          __typename
          id
          token
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "checkoutShippingMethodUpdate"

  public var checkoutId: GraphQLID
  public var shippingMethodId: GraphQLID
  public var deliveryDate: String

  public init(checkoutId: GraphQLID, shippingMethodId: GraphQLID, deliveryDate: String) {
    self.checkoutId = checkoutId
    self.shippingMethodId = shippingMethodId
    self.deliveryDate = deliveryDate
  }

  public var variables: GraphQLMap? {
    return ["checkoutId": checkoutId, "shippingMethodId": shippingMethodId, "deliveryDate": deliveryDate]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("checkoutShippingMethodUpdate", arguments: ["checkoutId": GraphQLVariable("checkoutId"), "shippingMethodId": GraphQLVariable("shippingMethodId"), "deliveryDate": GraphQLVariable("deliveryDate")], type: .object(CheckoutShippingMethodUpdate.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkoutShippingMethodUpdate: CheckoutShippingMethodUpdate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "checkoutShippingMethodUpdate": checkoutShippingMethodUpdate.flatMap { (value: CheckoutShippingMethodUpdate) -> ResultMap in value.resultMap }])
    }

    public var checkoutShippingMethodUpdate: CheckoutShippingMethodUpdate? {
      get {
        return (resultMap["checkoutShippingMethodUpdate"] as? ResultMap).flatMap { CheckoutShippingMethodUpdate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkoutShippingMethodUpdate")
      }
    }

    public struct CheckoutShippingMethodUpdate: GraphQLSelectionSet {
      public static let possibleTypes = ["CheckoutShippingMethodUpdate"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("checkout", type: .object(Checkout.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(checkout: Checkout? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CheckoutShippingMethodUpdate", "checkout": checkout.flatMap { (value: Checkout) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// An updated checkout
      public var checkout: Checkout? {
        get {
          return (resultMap["checkout"] as? ResultMap).flatMap { Checkout(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "checkout")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Checkout: GraphQLSelectionSet {
        public static let possibleTypes = ["Checkout"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, token: String) {
          self.init(unsafeResultMap: ["__typename": "Checkout", "id": id, "token": token])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class FetchDeliveryDatesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchDeliveryDates($token: UUID!, $postalCode: String!) {
      deliverySlots(token: $token, zipCode: $postalCode) {
        __typename
        nextDay {
          __typename
          year
          month
          weekDay
          day
          hours {
            __typename
            slot
            startInterval
            endInterval
          }
        }
      }
    }
    """

  public let operationName = "fetchDeliveryDates"

  public var token: String
  public var postalCode: String

  public init(token: String, postalCode: String) {
    self.token = token
    self.postalCode = postalCode
  }

  public var variables: GraphQLMap? {
    return ["token": token, "postalCode": postalCode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deliverySlots", arguments: ["token": GraphQLVariable("token"), "zipCode": GraphQLVariable("postalCode")], type: .object(DeliverySlot.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deliverySlots: DeliverySlot? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "deliverySlots": deliverySlots.flatMap { (value: DeliverySlot) -> ResultMap in value.resultMap }])
    }

    public var deliverySlots: DeliverySlot? {
      get {
        return (resultMap["deliverySlots"] as? ResultMap).flatMap { DeliverySlot(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deliverySlots")
      }
    }

    public struct DeliverySlot: GraphQLSelectionSet {
      public static let possibleTypes = ["ShippingMethodSlots"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nextDay", type: .list(.object(NextDay.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nextDay: [NextDay?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "ShippingMethodSlots", "nextDay": nextDay.flatMap { (value: [NextDay?]) -> [ResultMap?] in value.map { (value: NextDay?) -> ResultMap? in value.flatMap { (value: NextDay) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var nextDay: [NextDay?]? {
        get {
          return (resultMap["nextDay"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [NextDay?] in value.map { (value: ResultMap?) -> NextDay? in value.flatMap { (value: ResultMap) -> NextDay in NextDay(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [NextDay?]) -> [ResultMap?] in value.map { (value: NextDay?) -> ResultMap? in value.flatMap { (value: NextDay) -> ResultMap in value.resultMap } } }, forKey: "nextDay")
        }
      }

      public struct NextDay: GraphQLSelectionSet {
        public static let possibleTypes = ["AvailableSlots"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("year", type: .scalar(String.self)),
          GraphQLField("month", type: .scalar(String.self)),
          GraphQLField("weekDay", type: .scalar(String.self)),
          GraphQLField("day", type: .scalar(Int.self)),
          GraphQLField("hours", type: .list(.object(Hour.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(year: String? = nil, month: String? = nil, weekDay: String? = nil, day: Int? = nil, hours: [Hour?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "AvailableSlots", "year": year, "month": month, "weekDay": weekDay, "day": day, "hours": hours.flatMap { (value: [Hour?]) -> [ResultMap?] in value.map { (value: Hour?) -> ResultMap? in value.flatMap { (value: Hour) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var year: String? {
          get {
            return resultMap["year"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "year")
          }
        }

        public var month: String? {
          get {
            return resultMap["month"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "month")
          }
        }

        public var weekDay: String? {
          get {
            return resultMap["weekDay"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "weekDay")
          }
        }

        public var day: Int? {
          get {
            return resultMap["day"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "day")
          }
        }

        public var hours: [Hour?]? {
          get {
            return (resultMap["hours"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Hour?] in value.map { (value: ResultMap?) -> Hour? in value.flatMap { (value: ResultMap) -> Hour in Hour(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Hour?]) -> [ResultMap?] in value.map { (value: Hour?) -> ResultMap? in value.flatMap { (value: Hour) -> ResultMap in value.resultMap } } }, forKey: "hours")
          }
        }

        public struct Hour: GraphQLSelectionSet {
          public static let possibleTypes = ["SlotLabels"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("slot", type: .scalar(String.self)),
            GraphQLField("startInterval", type: .scalar(String.self)),
            GraphQLField("endInterval", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(slot: String? = nil, startInterval: String? = nil, endInterval: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "SlotLabels", "slot": slot, "startInterval": startInterval, "endInterval": endInterval])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var slot: String? {
            get {
              return resultMap["slot"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "slot")
            }
          }

          public var startInterval: String? {
            get {
              return resultMap["startInterval"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "startInterval")
            }
          }

          public var endInterval: String? {
            get {
              return resultMap["endInterval"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "endInterval")
            }
          }
        }
      }
    }
  }
}

public final class AddressAddMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation addressAdd($input: AddressInput!) {
      addressCreate(input: $input) {
        __typename
        user {
          __typename
          email
          addresses {
            __typename
            id
            addressName
            firstName
            lastName
            companyName
            streetAddress1
            streetAddress2
            city
            postalCode
            countryArea
            phone
          }
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "addressAdd"

  public var input: AddressInput

  public init(input: AddressInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addressCreate", arguments: ["input": GraphQLVariable("input")], type: .object(AddressCreate.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addressCreate: AddressCreate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "addressCreate": addressCreate.flatMap { (value: AddressCreate) -> ResultMap in value.resultMap }])
    }

    public var addressCreate: AddressCreate? {
      get {
        return (resultMap["addressCreate"] as? ResultMap).flatMap { AddressCreate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addressCreate")
      }
    }

    public struct AddressCreate: GraphQLSelectionSet {
      public static let possibleTypes = ["AddressCreate"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(user: User? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "AddressCreate", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A user instance for which the address was created.
      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("addresses", type: .list(.object(Address.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(email: String, addresses: [Address?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "email": email, "addresses": addresses.flatMap { (value: [Address?]) -> [ResultMap?] in value.map { (value: Address?) -> ResultMap? in value.flatMap { (value: Address) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        /// List of all user's addresses.
        public var addresses: [Address?]? {
          get {
            return (resultMap["addresses"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Address?] in value.map { (value: ResultMap?) -> Address? in value.flatMap { (value: ResultMap) -> Address in Address(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Address?]) -> [ResultMap?] in value.map { (value: Address?) -> ResultMap? in value.flatMap { (value: Address) -> ResultMap in value.resultMap } } }, forKey: "addresses")
          }
        }

        public struct Address: GraphQLSelectionSet {
          public static let possibleTypes = ["Address"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("addressName", type: .scalar(String.self)),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            GraphQLField("companyName", type: .nonNull(.scalar(String.self))),
            GraphQLField("streetAddress1", type: .nonNull(.scalar(String.self))),
            GraphQLField("streetAddress2", type: .nonNull(.scalar(String.self))),
            GraphQLField("city", type: .nonNull(.scalar(String.self))),
            GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
            GraphQLField("countryArea", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, addressName: String? = nil, firstName: String, lastName: String, companyName: String, streetAddress1: String, streetAddress2: String, city: String, postalCode: String, countryArea: String, phone: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Address", "id": id, "addressName": addressName, "firstName": firstName, "lastName": lastName, "companyName": companyName, "streetAddress1": streetAddress1, "streetAddress2": streetAddress2, "city": city, "postalCode": postalCode, "countryArea": countryArea, "phone": phone])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of the object.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var addressName: String? {
            get {
              return resultMap["addressName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "addressName")
            }
          }

          public var firstName: String {
            get {
              return resultMap["firstName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          public var lastName: String {
            get {
              return resultMap["lastName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastName")
            }
          }

          public var companyName: String {
            get {
              return resultMap["companyName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "companyName")
            }
          }

          public var streetAddress1: String {
            get {
              return resultMap["streetAddress1"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "streetAddress1")
            }
          }

          public var streetAddress2: String {
            get {
              return resultMap["streetAddress2"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "streetAddress2")
            }
          }

          public var city: String {
            get {
              return resultMap["city"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "city")
            }
          }

          public var postalCode: String {
            get {
              return resultMap["postalCode"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "postalCode")
            }
          }

          public var countryArea: String {
            get {
              return resultMap["countryArea"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "countryArea")
            }
          }

          public var phone: String? {
            get {
              return resultMap["phone"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "phone")
            }
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class RecoverPasswordMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation recoverPassword($input: CustomerPasswordResetInput!) {
      customerPasswordReset(input: $input) {
        __typename
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "recoverPassword"

  public var input: CustomerPasswordResetInput

  public init(input: CustomerPasswordResetInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("customerPasswordReset", arguments: ["input": GraphQLVariable("input")], type: .object(CustomerPasswordReset.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(customerPasswordReset: CustomerPasswordReset? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "customerPasswordReset": customerPasswordReset.flatMap { (value: CustomerPasswordReset) -> ResultMap in value.resultMap }])
    }

    public var customerPasswordReset: CustomerPasswordReset? {
      get {
        return (resultMap["customerPasswordReset"] as? ResultMap).flatMap { CustomerPasswordReset(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "customerPasswordReset")
      }
    }

    public struct CustomerPasswordReset: GraphQLSelectionSet {
      public static let possibleTypes = ["CustomerPasswordReset"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CustomerPasswordReset", "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class SetNewPasswordMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation setNewPassword($input: SetNewPasswordInput!) {
      setNewPassword(input: $input) {
        __typename
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "setNewPassword"

  public var input: SetNewPasswordInput

  public init(input: SetNewPasswordInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("setNewPassword", arguments: ["input": GraphQLVariable("input")], type: .object(SetNewPassword.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(setNewPassword: SetNewPassword? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "setNewPassword": setNewPassword.flatMap { (value: SetNewPassword) -> ResultMap in value.resultMap }])
    }

    public var setNewPassword: SetNewPassword? {
      get {
        return (resultMap["setNewPassword"] as? ResultMap).flatMap { SetNewPassword(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "setNewPassword")
      }
    }

    public struct SetNewPassword: GraphQLSelectionSet {
      public static let possibleTypes = ["SetNewPassword"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SetNewPassword", "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class SignInMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation signIn($email: String!, $password: String!) {
      tokenCreate(email: $email, password: $password) {
        __typename
        token
        user {
          __typename
          id
          token
          email
          firstName
          lastName
          checkout {
            __typename
            id
            token
            quantity
          }
        }
        errors {
          __typename
          message
        }
      }
    }
    """

  public let operationName = "signIn"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("tokenCreate", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(TokenCreate.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(tokenCreate: TokenCreate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "tokenCreate": tokenCreate.flatMap { (value: TokenCreate) -> ResultMap in value.resultMap }])
    }

    public var tokenCreate: TokenCreate? {
      get {
        return (resultMap["tokenCreate"] as? ResultMap).flatMap { TokenCreate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "tokenCreate")
      }
    }

    public struct TokenCreate: GraphQLSelectionSet {
      public static let possibleTypes = ["CreateToken"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .scalar(String.self)),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("errors", type: .nonNull(.list(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil, user: User? = nil, errors: [Error?]) {
        self.init(unsafeResultMap: ["__typename": "CreateToken", "token": token, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "errors": errors.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public var errors: [Error?] {
        get {
          return (resultMap["errors"] as! [ResultMap?]).map { (value: ResultMap?) -> Error? in value.flatMap { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Error?) -> ResultMap? in value.flatMap { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("checkout", type: .object(Checkout.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, token: String, email: String, firstName: String, lastName: String, checkout: Checkout? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "token": token, "email": email, "firstName": firstName, "lastName": lastName, "checkout": checkout.flatMap { (value: Checkout) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        /// Returns the last open checkout of this user.
        public var checkout: Checkout? {
          get {
            return (resultMap["checkout"] as? ResultMap).flatMap { Checkout(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "checkout")
          }
        }

        public struct Checkout: GraphQLSelectionSet {
          public static let possibleTypes = ["Checkout"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("token", type: .nonNull(.scalar(String.self))),
            GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, token: String, quantity: Int) {
            self.init(unsafeResultMap: ["__typename": "Checkout", "id": id, "token": token, "quantity": quantity])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of the object.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var token: String {
            get {
              return resultMap["token"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "token")
            }
          }

          public var quantity: Int {
            get {
              return resultMap["quantity"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "quantity")
            }
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class TokenLogoutMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation tokenLogout {
      tokenLogout {
        __typename
        message
        errors {
          __typename
          message
        }
      }
    }
    """

  public let operationName = "tokenLogout"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("tokenLogout", type: .object(TokenLogout.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(tokenLogout: TokenLogout? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "tokenLogout": tokenLogout.flatMap { (value: TokenLogout) -> ResultMap in value.resultMap }])
    }

    public var tokenLogout: TokenLogout? {
      get {
        return (resultMap["tokenLogout"] as? ResultMap).flatMap { TokenLogout(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "tokenLogout")
      }
    }

    public struct TokenLogout: GraphQLSelectionSet {
      public static let possibleTypes = ["BlacklistToken"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("message", type: .scalar(String.self)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(message: String? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "BlacklistToken", "message": message, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var message: String? {
        get {
          return resultMap["message"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class SignUpMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation signUp($firstName: String!, $lastName: String!, $email: String!, $zipCode: String!, $password: String!) {
      customerRegister(input: {firstName: $firstName, lastName: $lastName, email: $email, zipCode: $zipCode, password: $password}) {
        __typename
        token
        user {
          __typename
          id
          token
          email
          firstName
          lastName
        }
        errors {
          __typename
          message
        }
      }
    }
    """

  public let operationName = "signUp"

  public var firstName: String
  public var lastName: String
  public var email: String
  public var zipCode: String
  public var password: String

  public init(firstName: String, lastName: String, email: String, zipCode: String, password: String) {
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
    self.zipCode = zipCode
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["firstName": firstName, "lastName": lastName, "email": email, "zipCode": zipCode, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("customerRegister", arguments: ["input": ["firstName": GraphQLVariable("firstName"), "lastName": GraphQLVariable("lastName"), "email": GraphQLVariable("email"), "zipCode": GraphQLVariable("zipCode"), "password": GraphQLVariable("password")]], type: .object(CustomerRegister.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(customerRegister: CustomerRegister? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "customerRegister": customerRegister.flatMap { (value: CustomerRegister) -> ResultMap in value.resultMap }])
    }

    public var customerRegister: CustomerRegister? {
      get {
        return (resultMap["customerRegister"] as? ResultMap).flatMap { CustomerRegister(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "customerRegister")
      }
    }

    public struct CustomerRegister: GraphQLSelectionSet {
      public static let possibleTypes = ["CustomerRegister"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .scalar(String.self)),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil, user: User? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CustomerRegister", "token": token, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, token: String, email: String, firstName: String, lastName: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "token": token, "email": email, "firstName": firstName, "lastName": lastName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class EditAccountMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation editAccount($input: CustomerInput!) {
      loggedUserUpdate(input: $input) {
        __typename
        user {
          __typename
          id
          firstName
          lastName
          email
          token
        }
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "editAccount"

  public var input: CustomerInput

  public init(input: CustomerInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("loggedUserUpdate", arguments: ["input": GraphQLVariable("input")], type: .object(LoggedUserUpdate.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(loggedUserUpdate: LoggedUserUpdate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "loggedUserUpdate": loggedUserUpdate.flatMap { (value: LoggedUserUpdate) -> ResultMap in value.resultMap }])
    }

    public var loggedUserUpdate: LoggedUserUpdate? {
      get {
        return (resultMap["loggedUserUpdate"] as? ResultMap).flatMap { LoggedUserUpdate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "loggedUserUpdate")
      }
    }

    public struct LoggedUserUpdate: GraphQLSelectionSet {
      public static let possibleTypes = ["LoggedUserUpdate"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(user: User? = nil, errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "LoggedUserUpdate", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, firstName: String, lastName: String, email: String, token: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "email": email, "token": token])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class FetchProfileQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchProfile {
      me {
        __typename
        token
        id
        firstName
        lastName
        email
        checkout {
          __typename
          id
          token
          quantity
          lines {
            __typename
            quantity
            totalPrice {
              __typename
              gross {
                __typename
                amount
              }
            }
            variant {
              __typename
              id
              product {
                __typename
                name
                weight {
                  __typename
                  unit
                  value
                }
                thumbnail {
                  __typename
                  url
                }
              }
              name
              pricing {
                __typename
                price {
                  __typename
                  gross {
                    __typename
                    amount
                  }
                }
              }
            }
          }
          subtotalPrice {
            __typename
            gross {
              __typename
              amount
            }
          }
          totalPrice {
            __typename
            gross {
              __typename
              amount
            }
          }
        }
        addresses {
          __typename
          id
          addressName
          firstName
          lastName
          streetAddress1
          streetAddress2
          city
          cityArea
          postalCode
          country {
            __typename
            country
            code
          }
          countryArea
          phone
          isDefaultShippingAddress
          isDefaultBillingAddress
        }
      }
    }
    """

  public let operationName = "fetchProfile"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("me", type: .object(Me.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    /// Logged in user data.
    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
        GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("checkout", type: .object(Checkout.selections)),
        GraphQLField("addresses", type: .list(.object(Address.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String, id: GraphQLID, firstName: String, lastName: String, email: String, checkout: Checkout? = nil, addresses: [Address?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "token": token, "id": id, "firstName": firstName, "lastName": lastName, "email": email, "checkout": checkout.flatMap { (value: Checkout) -> ResultMap in value.resultMap }, "addresses": addresses.flatMap { (value: [Address?]) -> [ResultMap?] in value.map { (value: Address?) -> ResultMap? in value.flatMap { (value: Address) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      /// The ID of the object.
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var firstName: String {
        get {
          return resultMap["firstName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String {
        get {
          return resultMap["lastName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      /// Returns the last open checkout of this user.
      public var checkout: Checkout? {
        get {
          return (resultMap["checkout"] as? ResultMap).flatMap { Checkout(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "checkout")
        }
      }

      /// List of all user's addresses.
      public var addresses: [Address?]? {
        get {
          return (resultMap["addresses"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Address?] in value.map { (value: ResultMap?) -> Address? in value.flatMap { (value: ResultMap) -> Address in Address(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Address?]) -> [ResultMap?] in value.map { (value: Address?) -> ResultMap? in value.flatMap { (value: Address) -> ResultMap in value.resultMap } } }, forKey: "addresses")
        }
      }

      public struct Checkout: GraphQLSelectionSet {
        public static let possibleTypes = ["Checkout"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .nonNull(.scalar(String.self))),
          GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
          GraphQLField("lines", type: .list(.object(Line.selections))),
          GraphQLField("subtotalPrice", type: .object(SubtotalPrice.selections)),
          GraphQLField("totalPrice", type: .object(TotalPrice.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, token: String, quantity: Int, lines: [Line?]? = nil, subtotalPrice: SubtotalPrice? = nil, totalPrice: TotalPrice? = nil) {
          self.init(unsafeResultMap: ["__typename": "Checkout", "id": id, "token": token, "quantity": quantity, "lines": lines.flatMap { (value: [Line?]) -> [ResultMap?] in value.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } } }, "subtotalPrice": subtotalPrice.flatMap { (value: SubtotalPrice) -> ResultMap in value.resultMap }, "totalPrice": totalPrice.flatMap { (value: TotalPrice) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }

        public var quantity: Int {
          get {
            return resultMap["quantity"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "quantity")
          }
        }

        /// A list of checkout lines, each containing information about an item in the checkout.
        public var lines: [Line?]? {
          get {
            return (resultMap["lines"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Line?] in value.map { (value: ResultMap?) -> Line? in value.flatMap { (value: ResultMap) -> Line in Line(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Line?]) -> [ResultMap?] in value.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } } }, forKey: "lines")
          }
        }

        /// The price of the checkout before shipping, with taxes included.
        public var subtotalPrice: SubtotalPrice? {
          get {
            return (resultMap["subtotalPrice"] as? ResultMap).flatMap { SubtotalPrice(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "subtotalPrice")
          }
        }

        /// The sum of the the checkout line prices, with all the taxes,shipping costs, and discounts included.
        public var totalPrice: TotalPrice? {
          get {
            return (resultMap["totalPrice"] as? ResultMap).flatMap { TotalPrice(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "totalPrice")
          }
        }

        public struct Line: GraphQLSelectionSet {
          public static let possibleTypes = ["CheckoutLine"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
            GraphQLField("totalPrice", type: .object(TotalPrice.selections)),
            GraphQLField("variant", type: .nonNull(.object(Variant.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(quantity: Int, totalPrice: TotalPrice? = nil, variant: Variant) {
            self.init(unsafeResultMap: ["__typename": "CheckoutLine", "quantity": quantity, "totalPrice": totalPrice.flatMap { (value: TotalPrice) -> ResultMap in value.resultMap }, "variant": variant.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var quantity: Int {
            get {
              return resultMap["quantity"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "quantity")
            }
          }

          /// The sum of the checkout line price, taxes and discounts.
          public var totalPrice: TotalPrice? {
            get {
              return (resultMap["totalPrice"] as? ResultMap).flatMap { TotalPrice(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "totalPrice")
            }
          }

          public var variant: Variant {
            get {
              return Variant(unsafeResultMap: resultMap["variant"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "variant")
            }
          }

          public struct TotalPrice: GraphQLSelectionSet {
            public static let possibleTypes = ["TaxedMoney"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(gross: Gross) {
              self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Amount of money including taxes.
            public var gross: Gross {
              get {
                return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "gross")
              }
            }

            public struct Gross: GraphQLSelectionSet {
              public static let possibleTypes = ["Money"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(amount: Double) {
                self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Amount of money.
              public var amount: Double {
                get {
                  return resultMap["amount"]! as! Double
                }
                set {
                  resultMap.updateValue(newValue, forKey: "amount")
                }
              }
            }
          }

          public struct Variant: GraphQLSelectionSet {
            public static let possibleTypes = ["ProductVariant"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("product", type: .nonNull(.object(Product.selections))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("pricing", type: .object(Pricing.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, product: Product, name: String, pricing: Pricing? = nil) {
              self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "product": product.resultMap, "name": name, "pricing": pricing.flatMap { (value: Pricing) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The ID of the object.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var product: Product {
              get {
                return Product(unsafeResultMap: resultMap["product"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "product")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// Lists the storefront variant's pricing,
            /// the current price and discounts, only meant for displaying
            public var pricing: Pricing? {
              get {
                return (resultMap["pricing"] as? ResultMap).flatMap { Pricing(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "pricing")
              }
            }

            public struct Product: GraphQLSelectionSet {
              public static let possibleTypes = ["Product"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("weight", type: .object(Weight.selections)),
                GraphQLField("thumbnail", type: .object(Thumbnail.selections)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String, weight: Weight? = nil, thumbnail: Thumbnail? = nil) {
                self.init(unsafeResultMap: ["__typename": "Product", "name": name, "weight": weight.flatMap { (value: Weight) -> ResultMap in value.resultMap }, "thumbnail": thumbnail.flatMap { (value: Thumbnail) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              public var weight: Weight? {
                get {
                  return (resultMap["weight"] as? ResultMap).flatMap { Weight(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "weight")
                }
              }

              /// The main thumbnail for a product.
              public var thumbnail: Thumbnail? {
                get {
                  return (resultMap["thumbnail"] as? ResultMap).flatMap { Thumbnail(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "thumbnail")
                }
              }

              public struct Weight: GraphQLSelectionSet {
                public static let possibleTypes = ["Weight"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("unit", type: .nonNull(.scalar(String.self))),
                  GraphQLField("value", type: .nonNull(.scalar(Double.self))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(unit: String, value: Double) {
                  self.init(unsafeResultMap: ["__typename": "Weight", "unit": unit, "value": value])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Weight unit
                public var unit: String {
                  get {
                    return resultMap["unit"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "unit")
                  }
                }

                /// Weight value
                public var value: Double {
                  get {
                    return resultMap["value"]! as! Double
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "value")
                  }
                }
              }

              public struct Thumbnail: GraphQLSelectionSet {
                public static let possibleTypes = ["Image"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(url: String) {
                  self.init(unsafeResultMap: ["__typename": "Image", "url": url])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The URL of the image.
                public var url: String {
                  get {
                    return resultMap["url"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "url")
                  }
                }
              }
            }

            public struct Pricing: GraphQLSelectionSet {
              public static let possibleTypes = ["VariantPricingInfo"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("price", type: .object(Price.selections)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(price: Price? = nil) {
                self.init(unsafeResultMap: ["__typename": "VariantPricingInfo", "price": price.flatMap { (value: Price) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The price, with any discount subtracted.
              public var price: Price? {
                get {
                  return (resultMap["price"] as? ResultMap).flatMap { Price(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "price")
                }
              }

              public struct Price: GraphQLSelectionSet {
                public static let possibleTypes = ["TaxedMoney"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(gross: Gross) {
                  self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Amount of money including taxes.
                public var gross: Gross {
                  get {
                    return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "gross")
                  }
                }

                public struct Gross: GraphQLSelectionSet {
                  public static let possibleTypes = ["Money"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(amount: Double) {
                    self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Amount of money.
                  public var amount: Double {
                    get {
                      return resultMap["amount"]! as! Double
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "amount")
                    }
                  }
                }
              }
            }
          }
        }

        public struct SubtotalPrice: GraphQLSelectionSet {
          public static let possibleTypes = ["TaxedMoney"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(gross: Gross) {
            self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money including taxes.
          public var gross: Gross {
            get {
              return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "gross")
            }
          }

          public struct Gross: GraphQLSelectionSet {
            public static let possibleTypes = ["Money"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(amount: Double) {
              self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Amount of money.
            public var amount: Double {
              get {
                return resultMap["amount"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "amount")
              }
            }
          }
        }

        public struct TotalPrice: GraphQLSelectionSet {
          public static let possibleTypes = ["TaxedMoney"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(gross: Gross) {
            self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money including taxes.
          public var gross: Gross {
            get {
              return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "gross")
            }
          }

          public struct Gross: GraphQLSelectionSet {
            public static let possibleTypes = ["Money"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(amount: Double) {
              self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Amount of money.
            public var amount: Double {
              get {
                return resultMap["amount"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "amount")
              }
            }
          }
        }
      }

      public struct Address: GraphQLSelectionSet {
        public static let possibleTypes = ["Address"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("addressName", type: .scalar(String.self)),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("streetAddress1", type: .nonNull(.scalar(String.self))),
          GraphQLField("streetAddress2", type: .nonNull(.scalar(String.self))),
          GraphQLField("city", type: .nonNull(.scalar(String.self))),
          GraphQLField("cityArea", type: .nonNull(.scalar(String.self))),
          GraphQLField("postalCode", type: .nonNull(.scalar(String.self))),
          GraphQLField("country", type: .nonNull(.object(Country.selections))),
          GraphQLField("countryArea", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("isDefaultShippingAddress", type: .scalar(Bool.self)),
          GraphQLField("isDefaultBillingAddress", type: .scalar(Bool.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, addressName: String? = nil, firstName: String, lastName: String, streetAddress1: String, streetAddress2: String, city: String, cityArea: String, postalCode: String, country: Country, countryArea: String, phone: String? = nil, isDefaultShippingAddress: Bool? = nil, isDefaultBillingAddress: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "Address", "id": id, "addressName": addressName, "firstName": firstName, "lastName": lastName, "streetAddress1": streetAddress1, "streetAddress2": streetAddress2, "city": city, "cityArea": cityArea, "postalCode": postalCode, "country": country.resultMap, "countryArea": countryArea, "phone": phone, "isDefaultShippingAddress": isDefaultShippingAddress, "isDefaultBillingAddress": isDefaultBillingAddress])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var addressName: String? {
          get {
            return resultMap["addressName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "addressName")
          }
        }

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var streetAddress1: String {
          get {
            return resultMap["streetAddress1"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "streetAddress1")
          }
        }

        public var streetAddress2: String {
          get {
            return resultMap["streetAddress2"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "streetAddress2")
          }
        }

        public var city: String {
          get {
            return resultMap["city"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "city")
          }
        }

        public var cityArea: String {
          get {
            return resultMap["cityArea"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cityArea")
          }
        }

        public var postalCode: String {
          get {
            return resultMap["postalCode"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "postalCode")
          }
        }

        /// Default shop's country
        public var country: Country {
          get {
            return Country(unsafeResultMap: resultMap["country"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "country")
          }
        }

        public var countryArea: String {
          get {
            return resultMap["countryArea"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "countryArea")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        /// Address is user's default shipping address
        public var isDefaultShippingAddress: Bool? {
          get {
            return resultMap["isDefaultShippingAddress"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isDefaultShippingAddress")
          }
        }

        /// Address is user's default billing address
        public var isDefaultBillingAddress: Bool? {
          get {
            return resultMap["isDefaultBillingAddress"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isDefaultBillingAddress")
          }
        }

        public struct Country: GraphQLSelectionSet {
          public static let possibleTypes = ["CountryDisplay"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("country", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(country: String, code: String) {
            self.init(unsafeResultMap: ["__typename": "CountryDisplay", "country": country, "code": code])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Country name.
          public var country: String {
            get {
              return resultMap["country"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "country")
            }
          }

          /// Country code.
          public var code: String {
            get {
              return resultMap["code"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "code")
            }
          }
        }
      }
    }
  }
}

public final class UpdatePasswordMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation updatePassword($input: ChangePasswordInput!) {
      changePassword(input: $input) {
        __typename
        errors {
          __typename
          field
          message
        }
      }
    }
    """

  public let operationName = "updatePassword"

  public var input: ChangePasswordInput

  public init(input: ChangePasswordInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutations"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("changePassword", arguments: ["input": GraphQLVariable("input")], type: .object(ChangePassword.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(changePassword: ChangePassword? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutations", "changePassword": changePassword.flatMap { (value: ChangePassword) -> ResultMap in value.resultMap }])
    }

    public var changePassword: ChangePassword? {
      get {
        return (resultMap["changePassword"] as? ResultMap).flatMap { ChangePassword(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "changePassword")
      }
    }

    public struct ChangePassword: GraphQLSelectionSet {
      public static let possibleTypes = ["ChangePassword"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("errors", type: .list(.nonNull(.object(Error.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(errors: [Error]? = nil) {
        self.init(unsafeResultMap: ["__typename": "ChangePassword", "errors": errors.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// List of errors that occurred executing the mutation.
      public var errors: [Error]? {
        get {
          return (resultMap["errors"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Error] in value.map { (value: ResultMap) -> Error in Error(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Error]) -> [ResultMap] in value.map { (value: Error) -> ResultMap in value.resultMap } }, forKey: "errors")
        }
      }

      public struct Error: GraphQLSelectionSet {
        public static let possibleTypes = ["Error"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("field", type: .scalar(String.self)),
          GraphQLField("message", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(field: String? = nil, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Error", "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Name of a field that caused the error. A value of
        /// `null` indicates that the error isn't associated with a particular
        /// field.
        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}

public final class FetchOrderQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchOrder($id: ID!) {
      order(id: $id) {
        __typename
        id
        number
        subtotal {
          __typename
          gross {
            __typename
            amount
          }
        }
        total {
          __typename
          gross {
            __typename
            amount
          }
        }
        shippingPrice {
          __typename
          gross {
            __typename
            amount
          }
        }
        discountAmount {
          __typename
          amount
        }
        shippingAddress {
          __typename
          streetAddress1
          streetAddress2
          countryArea
          city
          cityArea
          phone
        }
        deliveryDate
        payments {
          __typename
          creditCard {
            __typename
            brand
            lastDigits
          }
        }
        customerNote
        lines {
          __typename
          id
          thumbnail {
            __typename
            url
          }
          productName
          quantity
          total {
            __typename
            gross {
              __typename
              amount
            }
          }
        }
      }
    }
    """

  public let operationName = "fetchOrder"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("order", arguments: ["id": GraphQLVariable("id")], type: .object(Order.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(order: Order? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "order": order.flatMap { (value: Order) -> ResultMap in value.resultMap }])
    }

    /// Lookup an order by ID.
    public var order: Order? {
      get {
        return (resultMap["order"] as? ResultMap).flatMap { Order(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "order")
      }
    }

    public struct Order: GraphQLSelectionSet {
      public static let possibleTypes = ["Order"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("number", type: .scalar(String.self)),
        GraphQLField("subtotal", type: .object(Subtotal.selections)),
        GraphQLField("total", type: .object(Total.selections)),
        GraphQLField("shippingPrice", type: .object(ShippingPrice.selections)),
        GraphQLField("discountAmount", type: .object(DiscountAmount.selections)),
        GraphQLField("shippingAddress", type: .object(ShippingAddress.selections)),
        GraphQLField("deliveryDate", type: .scalar(String.self)),
        GraphQLField("payments", type: .list(.object(Payment.selections))),
        GraphQLField("customerNote", type: .nonNull(.scalar(String.self))),
        GraphQLField("lines", type: .nonNull(.list(.object(Line.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, number: String? = nil, subtotal: Subtotal? = nil, total: Total? = nil, shippingPrice: ShippingPrice? = nil, discountAmount: DiscountAmount? = nil, shippingAddress: ShippingAddress? = nil, deliveryDate: String? = nil, payments: [Payment?]? = nil, customerNote: String, lines: [Line?]) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "number": number, "subtotal": subtotal.flatMap { (value: Subtotal) -> ResultMap in value.resultMap }, "total": total.flatMap { (value: Total) -> ResultMap in value.resultMap }, "shippingPrice": shippingPrice.flatMap { (value: ShippingPrice) -> ResultMap in value.resultMap }, "discountAmount": discountAmount.flatMap { (value: DiscountAmount) -> ResultMap in value.resultMap }, "shippingAddress": shippingAddress.flatMap { (value: ShippingAddress) -> ResultMap in value.resultMap }, "deliveryDate": deliveryDate, "payments": payments.flatMap { (value: [Payment?]) -> [ResultMap?] in value.map { (value: Payment?) -> ResultMap? in value.flatMap { (value: Payment) -> ResultMap in value.resultMap } } }, "customerNote": customerNote, "lines": lines.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of the object.
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// User-friendly number of an order.
      public var number: String? {
        get {
          return resultMap["number"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "number")
        }
      }

      /// The sum of line prices not including shipping.
      public var subtotal: Subtotal? {
        get {
          return (resultMap["subtotal"] as? ResultMap).flatMap { Subtotal(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "subtotal")
        }
      }

      /// Total amount of the order.
      public var total: Total? {
        get {
          return (resultMap["total"] as? ResultMap).flatMap { Total(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "total")
        }
      }

      /// Total price of shipping.
      public var shippingPrice: ShippingPrice? {
        get {
          return (resultMap["shippingPrice"] as? ResultMap).flatMap { ShippingPrice(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "shippingPrice")
        }
      }

      public var discountAmount: DiscountAmount? {
        get {
          return (resultMap["discountAmount"] as? ResultMap).flatMap { DiscountAmount(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "discountAmount")
        }
      }

      public var shippingAddress: ShippingAddress? {
        get {
          return (resultMap["shippingAddress"] as? ResultMap).flatMap { ShippingAddress(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "shippingAddress")
        }
      }

      /// Delivery date
      public var deliveryDate: String? {
        get {
          return resultMap["deliveryDate"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "deliveryDate")
        }
      }

      /// List of payments for the order
      public var payments: [Payment?]? {
        get {
          return (resultMap["payments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Payment?] in value.map { (value: ResultMap?) -> Payment? in value.flatMap { (value: ResultMap) -> Payment in Payment(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Payment?]) -> [ResultMap?] in value.map { (value: Payment?) -> ResultMap? in value.flatMap { (value: Payment) -> ResultMap in value.resultMap } } }, forKey: "payments")
        }
      }

      public var customerNote: String {
        get {
          return resultMap["customerNote"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "customerNote")
        }
      }

      /// List of order lines.
      public var lines: [Line?] {
        get {
          return (resultMap["lines"] as! [ResultMap?]).map { (value: ResultMap?) -> Line? in value.flatMap { (value: ResultMap) -> Line in Line(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } }, forKey: "lines")
        }
      }

      public struct Subtotal: GraphQLSelectionSet {
        public static let possibleTypes = ["TaxedMoney"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(gross: Gross) {
          self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Amount of money including taxes.
        public var gross: Gross {
          get {
            return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "gross")
          }
        }

        public struct Gross: GraphQLSelectionSet {
          public static let possibleTypes = ["Money"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Double) {
            self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money.
          public var amount: Double {
            get {
              return resultMap["amount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }
        }
      }

      public struct Total: GraphQLSelectionSet {
        public static let possibleTypes = ["TaxedMoney"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(gross: Gross) {
          self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Amount of money including taxes.
        public var gross: Gross {
          get {
            return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "gross")
          }
        }

        public struct Gross: GraphQLSelectionSet {
          public static let possibleTypes = ["Money"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Double) {
            self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money.
          public var amount: Double {
            get {
              return resultMap["amount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }
        }
      }

      public struct ShippingPrice: GraphQLSelectionSet {
        public static let possibleTypes = ["TaxedMoney"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(gross: Gross) {
          self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Amount of money including taxes.
        public var gross: Gross {
          get {
            return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "gross")
          }
        }

        public struct Gross: GraphQLSelectionSet {
          public static let possibleTypes = ["Money"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Double) {
            self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money.
          public var amount: Double {
            get {
              return resultMap["amount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }
        }
      }

      public struct DiscountAmount: GraphQLSelectionSet {
        public static let possibleTypes = ["Money"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(amount: Double) {
          self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Amount of money.
        public var amount: Double {
          get {
            return resultMap["amount"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }
      }

      public struct ShippingAddress: GraphQLSelectionSet {
        public static let possibleTypes = ["Address"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("streetAddress1", type: .nonNull(.scalar(String.self))),
          GraphQLField("streetAddress2", type: .nonNull(.scalar(String.self))),
          GraphQLField("countryArea", type: .nonNull(.scalar(String.self))),
          GraphQLField("city", type: .nonNull(.scalar(String.self))),
          GraphQLField("cityArea", type: .nonNull(.scalar(String.self))),
          GraphQLField("phone", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(streetAddress1: String, streetAddress2: String, countryArea: String, city: String, cityArea: String, phone: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Address", "streetAddress1": streetAddress1, "streetAddress2": streetAddress2, "countryArea": countryArea, "city": city, "cityArea": cityArea, "phone": phone])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var streetAddress1: String {
          get {
            return resultMap["streetAddress1"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "streetAddress1")
          }
        }

        public var streetAddress2: String {
          get {
            return resultMap["streetAddress2"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "streetAddress2")
          }
        }

        public var countryArea: String {
          get {
            return resultMap["countryArea"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "countryArea")
          }
        }

        public var city: String {
          get {
            return resultMap["city"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "city")
          }
        }

        public var cityArea: String {
          get {
            return resultMap["cityArea"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cityArea")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }
      }

      public struct Payment: GraphQLSelectionSet {
        public static let possibleTypes = ["Payment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("creditCard", type: .object(CreditCard.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(creditCard: CreditCard? = nil) {
          self.init(unsafeResultMap: ["__typename": "Payment", "creditCard": creditCard.flatMap { (value: CreditCard) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The details of the card used for this payment.
        public var creditCard: CreditCard? {
          get {
            return (resultMap["creditCard"] as? ResultMap).flatMap { CreditCard(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "creditCard")
          }
        }

        public struct CreditCard: GraphQLSelectionSet {
          public static let possibleTypes = ["CreditCard"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("brand", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastDigits", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(brand: String, lastDigits: String) {
            self.init(unsafeResultMap: ["__typename": "CreditCard", "brand": brand, "lastDigits": lastDigits])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Card brand.
          public var brand: String {
            get {
              return resultMap["brand"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "brand")
            }
          }

          /// Last 4 digits of the card number.
          public var lastDigits: String {
            get {
              return resultMap["lastDigits"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastDigits")
            }
          }
        }
      }

      public struct Line: GraphQLSelectionSet {
        public static let possibleTypes = ["OrderLine"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("thumbnail", type: .object(Thumbnail.selections)),
          GraphQLField("productName", type: .nonNull(.scalar(String.self))),
          GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
          GraphQLField("total", type: .object(Total.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, thumbnail: Thumbnail? = nil, productName: String, quantity: Int, total: Total? = nil) {
          self.init(unsafeResultMap: ["__typename": "OrderLine", "id": id, "thumbnail": thumbnail.flatMap { (value: Thumbnail) -> ResultMap in value.resultMap }, "productName": productName, "quantity": quantity, "total": total.flatMap { (value: Total) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The main thumbnail for the ordered product.
        public var thumbnail: Thumbnail? {
          get {
            return (resultMap["thumbnail"] as? ResultMap).flatMap { Thumbnail(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "thumbnail")
          }
        }

        public var productName: String {
          get {
            return resultMap["productName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "productName")
          }
        }

        public var quantity: Int {
          get {
            return resultMap["quantity"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "quantity")
          }
        }

        /// Total price for line
        public var total: Total? {
          get {
            return (resultMap["total"] as? ResultMap).flatMap { Total(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "total")
          }
        }

        public struct Thumbnail: GraphQLSelectionSet {
          public static let possibleTypes = ["Image"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(url: String) {
            self.init(unsafeResultMap: ["__typename": "Image", "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The URL of the image.
          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }

        public struct Total: GraphQLSelectionSet {
          public static let possibleTypes = ["TaxedMoney"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("gross", type: .nonNull(.object(Gross.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(gross: Gross) {
            self.init(unsafeResultMap: ["__typename": "TaxedMoney", "gross": gross.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Amount of money including taxes.
          public var gross: Gross {
            get {
              return Gross(unsafeResultMap: resultMap["gross"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "gross")
            }
          }

          public struct Gross: GraphQLSelectionSet {
            public static let possibleTypes = ["Money"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(amount: Double) {
              self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Amount of money.
            public var amount: Double {
              get {
                return resultMap["amount"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "amount")
              }
            }
          }
        }
      }
    }
  }
}

public final class FetchOrdersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchOrders($first: Int, $query: String) {
      myOrders(first: $first, query: $query) {
        __typename
        edges {
          __typename
          node {
            __typename
            id
            number
            status
            totalCaptured {
              __typename
              amount
            }
            deliveryDate
          }
        }
      }
    }
    """

  public let operationName = "fetchOrders"

  public var first: Int?
  public var query: String?

  public init(first: Int? = nil, query: String? = nil) {
    self.first = first
    self.query = query
  }

  public var variables: GraphQLMap? {
    return ["first": first, "query": query]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("myOrders", arguments: ["first": GraphQLVariable("first"), "query": GraphQLVariable("query")], type: .object(MyOrder.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(myOrders: MyOrder? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "myOrders": myOrders.flatMap { (value: MyOrder) -> ResultMap in value.resultMap }])
    }

    /// My orders list.
    public var myOrders: MyOrder? {
      get {
        return (resultMap["myOrders"] as? ResultMap).flatMap { MyOrder(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "myOrders")
      }
    }

    public struct MyOrder: GraphQLSelectionSet {
      public static let possibleTypes = ["OrderCountableConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "OrderCountableConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["OrderCountableEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .nonNull(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "OrderCountableEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Order"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("number", type: .scalar(String.self)),
            GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
            GraphQLField("totalCaptured", type: .object(TotalCaptured.selections)),
            GraphQLField("deliveryDate", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, number: String? = nil, status: OrderStatus, totalCaptured: TotalCaptured? = nil, deliveryDate: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Order", "id": id, "number": number, "status": status, "totalCaptured": totalCaptured.flatMap { (value: TotalCaptured) -> ResultMap in value.resultMap }, "deliveryDate": deliveryDate])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The ID of the object.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// User-friendly number of an order.
          public var number: String? {
            get {
              return resultMap["number"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "number")
            }
          }

          public var status: OrderStatus {
            get {
              return resultMap["status"]! as! OrderStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          /// Amount captured by payment.
          public var totalCaptured: TotalCaptured? {
            get {
              return (resultMap["totalCaptured"] as? ResultMap).flatMap { TotalCaptured(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "totalCaptured")
            }
          }

          /// Delivery date
          public var deliveryDate: String? {
            get {
              return resultMap["deliveryDate"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "deliveryDate")
            }
          }

          public struct TotalCaptured: GraphQLSelectionSet {
            public static let possibleTypes = ["Money"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(amount: Double) {
              self.init(unsafeResultMap: ["__typename": "Money", "amount": amount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Amount of money.
            public var amount: Double {
              get {
                return resultMap["amount"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "amount")
              }
            }
          }
        }
      }
    }
  }
}
