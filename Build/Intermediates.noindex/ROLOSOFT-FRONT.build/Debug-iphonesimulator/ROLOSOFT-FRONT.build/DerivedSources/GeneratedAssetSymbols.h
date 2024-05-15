#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "escudo-santa-fe" asset catalog image resource.
static NSString * const ACImageNameEscudoSantaFe AC_SWIFT_PRIVATE = @"escudo-santa-fe";

/// The "frisa-logox4" asset catalog image resource.
static NSString * const ACImageNameFrisaLogox4 AC_SWIFT_PRIVATE = @"frisa-logox4";

#undef AC_SWIFT_PRIVATE
