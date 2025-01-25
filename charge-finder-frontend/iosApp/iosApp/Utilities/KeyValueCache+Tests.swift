import Testing
@testable import Charge_Finder

struct KeyValueCacheTests {
    
    private let sut = KeyValueCache<String, String>()

    @Test func returnsNilsForUnknownKey() {
        #expect(sut.value(forKey: "unknown") == nil)
    }
    
    @Test func returnValueForCachedKey() {
        sut.set(value: "testValue", forKey: "testKey")
        
        #expect(sut.value(forKey: "testKey") == "testValue")
    }
}
