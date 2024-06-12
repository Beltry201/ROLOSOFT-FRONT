@_private(sourceFile: "MatchEvent.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import Foundation

extension MatchEvent.Team {
typealias Goal = MatchEvent.Team.Goal
typealias Team = MatchEvent.Team

    @_dynamicReplacement(for: fullTeamPictureUrl) private var __preview__fullTeamPictureUrl: String {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Models/MatchEvent.swift", line: 25)
            return baseUrl + shieldFileName
        
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.MatchEvent
import struct ROLOSOFT_FRONT.MatchEventResponse

