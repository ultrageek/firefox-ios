/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import Shared
import XCTest

func compareScratchpads(lhs: Scratchpad, rhs: Scratchpad) {
    XCTAssertEqual(lhs.collectionLastFetched, rhs.collectionLastFetched)
    XCTAssertEqual(lhs.clientName, rhs.clientName)
    // TODO: more
}

class StateTests: XCTestCase {
    func testPickling() {
        let prefs = MockProfilePrefs()

        let syncKeyBundle = KeyBundle.fromKB(Bytes.generateRandomBytes(32))
        let s = Scratchpad(b: syncKeyBundle)
        s.pickle(prefs)

        let ss = Scratchpad.unpickle(syncKeyBundle, prefs: prefs)!

        compareScratchpads(s, ss)
    }
}
