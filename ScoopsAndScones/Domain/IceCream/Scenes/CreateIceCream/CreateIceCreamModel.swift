// https://www.raywenderlich.com/29416318-getting-started-with-the-vip-clean-architecture-pattern
import Foundation

enum CreateIceCream {
  enum LoadIceCream {
    struct Request {}
    
    struct Response {
      var iceCreamData: IceCream
    }
    
    struct ViewModel {
      var cones: [String]
      var flavors: [String]
      var toppings: [String]
    }
  }
}
