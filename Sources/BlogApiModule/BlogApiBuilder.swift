//
//  BlogApiBuilder.swift
//  BlogApiModule
//
//  Created by Denis Martrin-Bruillot
//

import FeatherCore

/// Blog Module ResAPI
@_cdecl("createBlogApiModule")
public func createBlogApiModuleModule() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(BlogApiBuilder()).toOpaque()
}
public final class BlogApiBuilder: ViperBuilder {
    public override func build() -> ViperModule {
        BlogApiModule()
    }
}
