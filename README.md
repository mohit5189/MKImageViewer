# MkImageViewer
MKImageViewer is used to display images in horizontal scrollview. It is very easy to integrate in your project.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS 8 OR greater

## Installation

MkImageViewer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MkImageViewer'
```

## Integration Steps

To integrate MKImageViewer, you just need to follow following steps:

1. Import MKImageViewer on top of your file.
```
import MkImageViewer
```
2. Use following lines of code to display images:

```
let controller:MKImageViewController = MKImageViewController()
controller.images = [MKImage(url: URL(string: "https://images.pexels.com/photos/34950/pexels-photo.jpg")),MKImage(url: URL(string: "https://images.pexels.com/photos/459225/pexels-photo-459225.jpeg")),MKImage(url: URL(string: "https://i.ytimg.com/vi/c2NmyoXBXmE/maxresdefault.jpg")),MKImage(url: URL(string: "https://www.nmfnewsonline.com/upload/news/lifestyle/Nmf2adb21_02_01_slide_nature.jpg")),MKImage(image: UIImage.init(named: "water"))];

controller.delegate = self;

controller.placeholderImage = UIImage(named: "Placeholder")

self.navigationController?.pushViewController(controller, animated: true)

```
In above example you can see that this library provide you options for passing Images object Via URL OR direct UIImage Object.

You can set delegate if you want to handle pagination. Delegate method will call on scroll of every image. You can fetch new images record from API and can append to image viewer as given below:

```
func willDisplayImage(index:Int) -> Void{

// fetch new image as per your requirement and append as given below:

    controller.appendImages([List of MKImage object])
}}
```


# Warning
Library is designed for portrait mode only.


## Author

mohit5189, ch.mohitkumar1234@gmail.com


## License

MkImageViewer is available under the MIT license. See the LICENSE file for more info.
