# iOS SDK Integration Guide

This guide provides step-by-step instructions on how to integrate the `MalibleDistribution` SDK into your iOS project. The SDK is designed to interact with an API layer to fetch various data such as manifests, pages, secrets, client segments, and client attributes.

## Prerequisites

- Xcode 12 or later
- iOS 13 or later

## Installation

### Swift Package Manager

1. Open your Xcode project.
2. Navigate to `File` > `Add Packages...`.
3. Enter the repository URL of the SDK.
4. Select the version you want to use.
5. Click `Add Package`.

## Configuration

To use the `MalibleDistribution` SDK, you need to configure it with the necessary parameters.

### Initialization

First, import the SDK in your Swift file:

```swift
import MalibleDistribution
```

```swift
let distributionParams = DistributionParams(
    apiKey: "YOUR_API_KEY",
    workspaceId: "YOUR_WORKSPACE_ID",
    privateKeys: [PrivateKeyParams(keyId: "KEY_ID", keyValue: "KEY_VALUE")],
    baseURL: "https://api.malible.com",
    timeout: 30.0,
    debug: false
)

let malibleDistribution = MalibleDistribution(params: distributionParams)
```

#### Parameters
| Key             | Description |
| :---------------- | :------ |
| apiKey        |   Your API key for authentication.   | 
| workspaceId        |   Your workspace Id.   | 
| privateKeys           |   An array of private key parameters (optional).   | 
| baseURL    |  The base URL for the API (optional, defaults to a **staging url**).   | 
| timeout |  The timeout interval for API requests (optional, defaults to a **30.0** value).   | 
| debug |  A boolean to enable debug mode (optional, defaults to a **false** value).   | 

***

## Usage
- **Fetching Manifest**

```swift
do {
    let manifest = try await malibleDistribution.getManifest(clientId: "")
    print("Manifest: \(manifest)")
} catch {
    print("Failed to fetch manifest: \(error)")
}
``` 

- **Fetching Pages**
```swift
do {
    let pages = try await malibleDistribution.getPages(clientId: "YOUR_CLIENT_ID")
    print("Pages: \(pages)")
} catch {
    print("Failed to fetch pages: \(error)")
}
```
- **Fetching a Specific Page**
```swift
do {
    let page = try await malibleDistribution.getPage(pageId: "PAGE_ID", clientId: "YOUR_CLIENT_ID")
    print("Page: \(page)")
} catch {
    print("Failed to fetch page: \(error)")
}
```

- **Fetching Secrets**
```swift
do {
    let secrets = try await malibleDistribution.getSecrets(clientId: "YOUR_CLIENT_ID")
    print("Secrets: \(secrets)")
} catch {
    print("Failed to fetch secrets: \(error)")
}
```


- **Fetching Client Segments**
```swift
do {
    let clientSegments = try await malibleDistribution.getClientSegments(clientId: "YOUR_CLIENT_ID")
    print("Client Segments: \(clientSegments)")
} catch {
    print("Failed to fetch client segments: \(error)")
}
```
- **Fetching Client Attributes**
```swift
do {
    let clientAttributes = try await malibleDistribution.getClientAttribute(clientId: "YOUR_CLIENT_ID")
    print("Client Attributes: \(clientAttributes)")
} catch {
    print("Failed to fetch client attributes: \(error)")
}
```

***

## Error Handling
All the methods in the SDK can throw errors. Make sure to handle them appropriately using do-catch blocks.

***

## Set API Polling

**Note:** An active subscription is required for this feature.

**Steps:**
1. Navigate to the Malible portal: [link](https://portal.malible.com/)
2. Select your workspace and go to workspace app management.
    Here's an image for reference: ![image info](https://malible-distribution.s3.amazonaws.com/1.%20app-management.png)
3. Navigate to workspace default app management.
    ![image info](https://malible-distribution.s3.amazonaws.com/2.%20app-management-default.png)
4. Update API Polling data.
    ![image info](https://malible-distribution.s3.amazonaws.com/3.%20app-management-api-polling.png)
5. Change manually:
    Enable the toggle button
    Update desired value inside interval `120` (seconds)
