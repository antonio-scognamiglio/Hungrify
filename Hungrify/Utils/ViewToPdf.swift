//
//  Prova.swift
//  Hungrify
//
//  Created by Antonio Scognamiglio on 05/12/22.
//

import SwiftUI

// async version of render
func render(view: some View) async -> URL {
    // 1: Render Hello World with some modifiers
    let renderer = await ImageRenderer (
        content: view
            .scaledToFit()
    )

    // 2: Save it to our documents directory
    let url = URL.documentsDirectory.appending(path: "output.pdf")

    // 3: Start the rendering process
    await renderer.render { size, context in
        // 4: Tell SwiftUI our PDF should be the same size as the views we're rendering
        var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        // 5: Create the CGContext for our PDF pages
        guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
            return
        }

        // 6: Start a new PDF page
        pdf.beginPDFPage(nil)

        // 7: Render the SwiftUI view data onto the page
        context(pdf)

        // 8: End the page and close the file
        pdf.endPDFPage()
        pdf.closePDF()
    }

    return url
}


//If you need to target iOS 15 and below
extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

// To use that extension in SwiftUI, you should create your view as a property so you can reference it on demand – for example, in response to a button action.

//https://www.hackingwithswift.com/quick-start/swiftui/how-to-convert-a-swiftui-view-to-an-image


