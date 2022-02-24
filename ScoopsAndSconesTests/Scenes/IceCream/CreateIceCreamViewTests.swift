import XCTest
@testable import ScoopsAndScones

class CreateIceCreamViewTests: XCTestCase {
  // swiftlint:disable implicitly_unwrapped_optional
  var sut: CreateIceCreamView!
  var interactorSpy: CreateIceCreamInteractorSpy!
  // swiftlint:enable implicitly_unwrapped_optional

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = CreateIceCreamView()
    interactorSpy = CreateIceCreamInteractorSpy()
  }

  // MARK: - Test doubles
  class CreateIceCreamInteractorSpy: CreateIceCreamBusinessLogic {
    var loadIceCreamCalled = false
    func loadIceCream(request: CreateIceCream.LoadIceCream.Request) {
      loadIceCreamCalled = true
    }
  }

  // MARK: - Tests
  func testShouldLoadIceCreamOnViewAppear() {
    sut.interactor = interactorSpy
    
    sut.fetchIceCream()
    
    XCTAssertTrue(
      interactorSpy.loadIceCreamCalled,
      "fetchIceCream() should ask the interactor to load the ice cream"
    )
  }

  override func tearDownWithError() throws {
    sut = nil
    interactorSpy = nil
    try super.tearDownWithError()
  }
}
