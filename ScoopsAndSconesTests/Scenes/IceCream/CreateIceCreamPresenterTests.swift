import XCTest
@testable import ScoopsAndScones

class CreateIceCreamPresenterTests: XCTestCase {
  var sut: CreateIceCreamPresenter!
  var viewSpy: CreateIceCreamViewSpy!

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = CreateIceCreamPresenter()
    viewSpy = CreateIceCreamViewSpy()
  }

  // MARK: - Test doubles
  class CreateIceCreamViewSpy {}

  // MARK: - Tests

  override func tearDownWithError() throws {
    sut = nil
    viewSpy = nil
    try super.tearDownWithError()
  }
}
