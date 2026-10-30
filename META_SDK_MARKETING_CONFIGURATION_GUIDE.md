# Meta (Facebook) App Events SDK Integration & Marketing Configuration Guide

**Project:** WebroFM Mobile Application (Flutter - iOS & Android)  
**Date:** September 26, 2026  
**Document Target:** Marketing Team / SEO Specialist / App Growth Team  

---

## 1. Executive Summary

Meta (Facebook) App Events SDK has been successfully integrated into the **WebroFM** cross-platform Flutter application for both **iOS (iPhone)** and **Android**. 

This integration allows the marketing team to run targeted Meta (Facebook & Instagram) Ad Campaigns, track App Installs, measure User Retention, and analyze key In-App Conversions and User Interactions seamlessly across devices.

---

## 2. What Has Been Integrated in the Application

### A. Meta SDK Core Frameworks
* **Facebook App Events SDK (`facebook_app_events`)**: Handles automatic and manual event tracking sent directly from the app to Meta Servers.
* **iOS App Tracking Transparency (ATT) (`app_tracking_transparency`)**: Fully compliant with Apple’s iOS 14.5+ privacy requirements. The app prompts users for tracking permission on iOS to ensure max conversion tracking efficiency.

### B. Tracked Events & Conversion Triggers
The application is pre-configured to capture the following key user funnel events:

| Event Name | Event Type | Trigger Description | Logged Parameters |
| :--- | :--- | :--- | :--- |
| **`fb_mobile_activate_app`** | Automatic Standard | Logged automatically whenever a user opens/launches the app. | App version, OS, Device model |
| **`CompletedRegistration`** | Standard | Logged when a user completes sign-up / OTP login. | `registration_method` |
| **`ViewContent`** | Standard | Logged when a user views a Show or Episode detail page. | `id`, `type`, `currency`, `price` |
| **`episode_played`** | Custom | Logged when a user starts streaming an audio episode. | `episode_id`, `show_id`, `title` |
| **`Purchase`** | Standard | Logged when a user purchases a subscription or plan. | `amount`, `currency`, `parameters` |

---

## 3. Action Items Required from the Marketing Team

To complete the Meta SDK activation, the Marketing / SEO team needs to provide the following **3 configuration credentials** from the [Meta for Developers Portal](https://developers.facebook.com/):

```env
1. FACEBOOK_APP_ID       = "123456789012345"       (Numeric App ID)
2. FACEBOOK_CLIENT_TOKEN = "a1b2c3d4e5f67890..."   (Alphanumeric Client Token)
3. FACEBOOK_DISPLAY_NAME = "WebroFM"               (Registered Meta App Name)
```

---

## 4. Step-by-Step Guide for Marketing Team to Get Credentials

1. **Log in to Meta for Developers**:
   * Go to [https://developers.facebook.com/](https://developers.facebook.com/) and log in with your Business Account.
2. **Select / Create WebroFM App**:
   * Navigate to **My Apps** -> Select **WebroFM** (or click **Create App** -> Select App Type as **Consumer** or **Business**).
3. **Get App ID**:
   * Go to **App Settings** -> **Basic**.
   * Copy the **App ID** displayed at the top.
4. **Get Client Token**:
   * Go to **App Settings** -> **Advanced**.
   * Scroll down to the **Security** section.
   * Copy the **Client Token**.
5. **Configure Android & iOS Platforms in Meta Dashboard**:
   * Under **App Settings** -> **Basic**, click **Add Platform**:
     * **Android**: Enter Package Name (e.g. `com.webrofm.app`) and Main Activity (`.MainActivity`).
     * **iOS**: Enter iOS Bundle Identifier (e.g. `com.webrofm.app`).
6. **Enable Auto-Tracking & Advertiser ID**:
   * Ensure **Auto-Log App Events** and **Advertiser ID Collection** are set to **ON** in the Meta App Dashboard.

---

## 5. Technical Implementation Summary for Developers

The following configuration files in the project repository have been updated with placeholder structures:

1. **`pubspec.yaml`**: Added `facebook_app_events` and `app_tracking_transparency`.
2. **`android/app/src/main/AndroidManifest.xml`**: Added Facebook meta-data tags for `ApplicationId`, `ClientToken`, `AutoInitEnabled`, `AutoLogAppEventsEnabled`, and `AdvertiserIDCollectionEnabled`.
3. **`android/app/src/main/res/values/strings.xml`**: Added `<string name="facebook_app_id">` and `<string name="facebook_client_token">`.
4. **`ios/Runner/Info.plist`**: Added `FacebookAppID`, `FacebookClientToken`, `FacebookDisplayName`, `FacebookAutoLogAppEventsEnabled`, `FacebookAdvertiserIDCollectionEnabled`, `CFBundleURLSchemes`, and `NSUserTrackingUsageDescription` for iOS ATT permission popup.
5. **`lib/core/services/analytics_service.dart`**: Created centralized analytics service wrapper for Meta events and iOS ATT permissions.
6. **`lib/main.dart`**: Initialized `AnalyticsService.init()` on app startup.

---

*Once the Marketing Team provides the `FACEBOOK_APP_ID` and `FACEBOOK_CLIENT_TOKEN`, replace the placeholders in `strings.xml` (Android) and `Info.plist` (iOS), and the integration will be 100% active for live production build.*
