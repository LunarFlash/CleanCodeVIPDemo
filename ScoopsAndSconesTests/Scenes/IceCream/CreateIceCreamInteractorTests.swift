import XCTest
@testable import ScoopsAndScones

class CreateIceCreamInteractorTests: XCTestCase {
  // swiftlint:disable implicitly_unwrapped_optional
  var sut: CreateIceCreamInteractor!
  var presenterSpy: CreateIceCreamPresenterSpy!
  // swiftlint:enable implicitly_unwrapped_optional

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = CreateIceCreamInteractor()
    presenterSpy = CreateIceCreamPresenterSpy()
  }

  // MARK: - Test doubles
  class CreateIceCreamPresenterSpy: CreateIceCreamPresentationLogic {
    var iceCream: IceCream?
    var presentIceCreamCalled = false
    
    func presentIceCream(response: CreateIceCream.LoadIceCream.Response) {
      presentIceCreamCalled = true
      iceCream = response.iceCreamData
    }
  }

  // MARK: - Tests

  func testLoadIceCreamCallsPresenterToPresentIceCream() {
    sut.presenter = presenterSpy
    let iceCream = Seeds.iceCream
    
    let request = CreateIceCream.LoadIceCream.Request()
    sut.loadIceCream(request: request)
    
    XCTAssertEqual(presenterSpy.iceCream,
                   iceCream,
                   "loadIceCream(request:) should ask the presenter to presetn the same ice cream data it loaded"
                  )
  }
  
  override func tearDownWithError() throws {
    sut = nil
    presenterSpy = nil
    try super.tearDownWithError()
  }
}
