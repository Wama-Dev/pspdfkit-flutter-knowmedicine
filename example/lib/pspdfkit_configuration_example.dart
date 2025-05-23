///
///  Copyright © 2023-2025 PSPDFKit GmbH. All rights reserved.
///
///  THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY INTERNATIONAL COPYRIGHT LAW
///  AND MAY NOT BE RESOLD OR REDISTRIBUTED. USAGE IS BOUND TO THE PSPDFKIT LICENSE AGREEMENT.
///  UNAUTHORIZED REPRODUCTION OR DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES.
///  This notice may not be removed from this file.
///

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pspdfkit_example/utils/platform_utils.dart';
import 'package:pspdfkit_flutter/pspdfkit.dart';

class PspdfkitConfigurationExample extends StatelessWidget {
  final String documentPath;
  const PspdfkitConfigurationExample({super.key, required this.documentPath});

  @override
  Widget build(BuildContext context) {
    var defaultWebToolbarItems =
        kIsWeb ? Pspdfkit.defaultWebToolbarItems : null;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar:
            PlatformUtils.isCupertino(context) ? false : true,
        appBar: AppBar(),
        body: SafeArea(
            top: false,
            bottom: false,
            child: Container(
                padding: PlatformUtils.isCupertino(context)
                    ? null
                    : const EdgeInsets.only(top: kToolbarHeight),
                child: PspdfkitWidget(
                    documentPath: documentPath,
                    configuration: PdfConfiguration(
                        scrollDirection: PspdfkitScrollDirection.vertical,
                        pageTransition: PspdfkitPageTransition.scrollContinuous,
                        spreadFitting: PspdfkitSpreadFitting.fit,
                        userInterfaceViewMode:
                            PspdfkitUserInterfaceViewMode.automatic,
                        androidShowSearchAction: true,
                        inlineSearch: false,
                        showThumbnailBar: PspdfkitThumbnailBarMode.floating,
                        androidShowThumbnailGridAction: true,
                        androidShowOutlineAction: true,
                        androidShowAnnotationListAction: true,
                        showPageLabels: true,
                        documentLabelEnabled: false,
                        invertColors: false,
                        androidGrayScale: false,
                        startPage: 5,
                        enableAnnotationEditing: true,
                        enableTextSelection: false,
                        androidShowBookmarksAction: false,
                        androidEnableDocumentEditor: false,
                        androidShowShareAction: true,
                        androidShowPrintAction: false,
                        androidShowDocumentInfoView: true,
                        appearanceMode: PspdfkitAppearanceMode.defaultMode,
                        androidDefaultThemeResource: 'PSPDFKit.Theme.Example',
                        iOSRightBarButtonItems: [
                          'thumbnailsButtonItem',
                          'activityButtonItem',
                          'searchButtonItem',
                          'annotationButtonItem'
                        ],
                        iOSLeftBarButtonItems: ['settingsButtonItem'],
                        iOSAllowToolbarTitleChange: false,
                        toolbarTitle: 'Custom Title',
                        settingsMenuItems: [
                          'pageTransition',
                          'scrollDirection',
                          'androidTheme',
                          'iOSAppearance',
                          'androidPageLayout',
                          'iOSPageMode',
                          'iOSSpreadFitting',
                          'androidScreenAwake',
                          'iOSBrightness'
                        ],
                        showActionNavigationButtons: false,
                        pageLayoutMode: PspdfkitPageLayoutMode.double,
                        firstPageAlwaysSingle: true,
                        signatureSavingStrategy:
                            SignatureSavingStrategy.neverSave,
                        signatureCreationConfiguration:
                            SignatureCreationConfiguration(
                                creationModes: [
                              SignatureCreationMode.draw,
                              SignatureCreationMode.type,
                            ],
                                colorOptions: SignatureColorOptions(
                                    option1:
                                        SignatureColorPreset(color: Colors.red),
                                    option2: SignatureColorPreset(
                                        color: Colors.green),
                                    option3: SignatureColorPreset(
                                        color: Colors.blue)),
                                androidSignatureOrientation:
                                    NutrientAndroidSignatureOrientation
                                        .landscape,
                                iosSignatureAspectRatio: const AspectRatio(
                                  aspectRatio: 1 / 1,
                                )),
                        webConfiguration: PdfWebConfiguration(
                            toolbarPlacement: PspdfKitToolbarPlacement.bottom,
                            enableHistory: true,
                            disableTextSelection: false,
                            sideBarMode: PspdfkitSidebarMode.bookmarks,
                            interactionMode: PspdfkitWebInteractionMode.pan,
                            locale: 'de-DE',
                            zoom: PspdfkitZoomMode.fitToViewPort,
                            toolbarItems: defaultWebToolbarItems
                              ?..add(PspdfkitWebToolbarItem(
                                type: PspdfkitWebToolbarItemType.comment,
                                title: 'Comments',
                              ))
                              ..removeWhere((item) =>
                                  item.type == PspdfkitWebToolbarItemType.note),
                            allowPrinting: false))))));
  }
}
