/*import 'package:c_messaging/c_messaging.dart';

import 'package:flutter/material.dart';

class CMessagingSettings {
  static void init(BuildContext context, String userId) {
    CMessaging.instance.init(
      context,
      userId: userId,
      serviceSettings: _serviceSettings,
      firebaseSettings: _firebaseSettings,
      languageSettings: _languageSettings(context),
      contactsPageSettings: _contactsPageSettings,
      messagesPageSettings: _messagesPageSettings,
    );
  }

  static ServiceSettings _serviceSettings = ServiceSettings(
    userDatabaseServiceMode: UserDatabaseServiceMode.Firestore,
    messagesDatabaseServiceMode: MessageDatabaseServiceMode.Firestore,
    notificationServiceMode: NotificationServiceMode.FirebaseCloudMessaging,
    storageServiceMode: StorageServiceMode.FirebaseStorage,
  );

  static FirebaseSettings _firebaseSettings = FirebaseSettings(
    usersCollectionName: "user",
    usernameKey: Dealer.fullNameKey,
    userProfilePhotoUrlKey: Dealer.profilePhotoKey,
    userNotificationIdKey: Dealer.notificationIdKey,
    fcmSettings: FcmSettings(
      projectId: FirebaseCustomSettings.projectId,
      privateKeyId: FirebaseCustomSettings.privateKeyId,
      privateKey: FirebaseCustomSettings.privateKey,
      clientEmail: FirebaseCustomSettings.clientEmail,
      clientId: FirebaseCustomSettings.clientId,
      notificationType: 'new_message',
      notificationChannelId: 'messages',
    ),
  );

  static LanguageSettings _languageSettings(BuildContext context) =>
      LanguageSettings(
        cancel: S.of(context).cancel,
        send: S.of(context).send,
        takePhoto: S.of(context).takePhoto,
        chooseFromGallery: S.of(context).chooseFromGallery,
        typeMessage: S.of(context).typeMessage,
        uploadingImage: S.of(context).typeMessage,
        contactsPageTitle: S.of(context).contactsPageTitle,
        contactsPageDefaultUsername: S.of(context).unknown,
        contactsPageNoMessageTextContent:
            S.of(context).contactsPageNoMessageTextContent,
        contactsPageImageTypeText: S.of(context).contactsPageImageTypeText,
        contactsPageErrorTryAgainMessage: S.of(context).errorTryAgain,
        messagesPageDefaultUsernameForContactTitle: S.of(context).unknown,
        messagesPageDefaultUsernameForNotification: S.of(context).unknown,
      );

  static ContactsPageSettings _contactsPageSettings = ContactsPageSettings();

  static MessagesPageSettings _messagesPageSettings = MessagesPageSettings();
}*/
