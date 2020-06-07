# PopImageExample
A Swift example of having a context menu when long pressing an image.

This sample app demonstrates the basic ability to create a context menu upon long pressing on an image using the UIXontextMenuInteraction API provided by Apple.
The app allows a user to choose a photo from their photo library and display it on the screen. Upon long pressing on the image, a context menu will appear to remove the image from the screen if desired.

[Main app view](https://github.com/cjwillis809/PopImageExample/blob/master/Images/PopImageMainView.png)
[Context image view](https://github.com/cjwillis809/PopImageExample/blob/master/Images/PopImageContextView.png)

## More Resources
- [Ray Wenderlich tutorial](https://www.raywenderlich.com/6328155-context-menus-tutorial-for-ios-getting-started)
- [Context Menu Design Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/controls/context-menus/)
- [UIContextMenuConfiguration documentation](https://developer.apple.com/documentation/uikit/uicontextmenuconfiguration)

## Notes
- This does not take into account custom previews or actions, which are explained more in detail in the Ray Wenderlich tutorial linked above.
- One important aspect is to make sure `User Interaction Enabled` is set to true on the element you want to add the context menu to. If you run into the behavior where the context menu will not show, check this variable.
