# store_review

Rate on App Store directly in your Flutter app.

## Add in pubspec.yaml
```yaml
store_review: ^0.0.2
```

## Usage
```dart

if (await StoreReview.isAvailable) {
  StoreReview.requestReview();
}
```

Demo
--------

<p align="center"> 
	  <img src="https://raw.githubusercontent.com/viniciusmo/flutter_store_review/master/example.gif" width="40%" height="40%">
</p>