@_private(sourceFile: "TeamDetails.swift") import ROLOSOFT_FRONT
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import Foundation

extension TeamDetails {
    @_dynamicReplacement(for: fullTeamPictureUrl) private var __preview__fullTeamPictureUrl: String {
        #sourceLocation(file: "/Users/David/Documents/Tec/Semestre 5/Ciberseguridad - swift/reto/ROLOSOFT-FRONT/ROLOSOFT-FRONT/Models/TeamDetails.swift", line: 28)
        return baseUrl + teamPicture
    
#sourceLocation()
    }
}

import struct ROLOSOFT_FRONT.TeamDetails
import struct ROLOSOFT_FRONT.TeamDetailsResponse

