import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('fr')];

  /// No description provided for @appTitle.
  ///
  /// In fr, this message translates to:
  /// **'Herycia'**
  String get appTitle;

  /// No description provided for @navCompose.
  ///
  /// In fr, this message translates to:
  /// **'Composer'**
  String get navCompose;

  /// No description provided for @navFavorites.
  ///
  /// In fr, this message translates to:
  /// **'Favoris'**
  String get navFavorites;

  /// No description provided for @navProfile.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get navProfile;

  /// No description provided for @commonRetry.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get commonRetry;

  /// No description provided for @commonCancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get commonCancel;

  /// No description provided for @commonLater.
  ///
  /// In fr, this message translates to:
  /// **'Plus tard'**
  String get commonLater;

  /// No description provided for @commonOptional.
  ///
  /// In fr, this message translates to:
  /// **'facultatif'**
  String get commonOptional;

  /// No description provided for @commonEdit.
  ///
  /// In fr, this message translates to:
  /// **'Modifier'**
  String get commonEdit;

  /// No description provided for @commonRemove.
  ///
  /// In fr, this message translates to:
  /// **'Retirer'**
  String get commonRemove;

  /// No description provided for @commonSlowLoading.
  ///
  /// In fr, this message translates to:
  /// **'Ça prend plus de temps que prévu'**
  String get commonSlowLoading;

  /// No description provided for @commonComingSoon.
  ///
  /// In fr, this message translates to:
  /// **'Bientôt disponible'**
  String get commonComingSoon;

  /// No description provided for @commonErrorTitle.
  ///
  /// In fr, this message translates to:
  /// **'Un problème est survenu'**
  String get commonErrorTitle;

  /// No description provided for @commonErrorMessage.
  ///
  /// In fr, this message translates to:
  /// **'Vérifiez votre connexion puis réessayez.'**
  String get commonErrorMessage;

  /// No description provided for @offlineBanner.
  ///
  /// In fr, this message translates to:
  /// **'Hors ligne · suggestions calculées sur l\'appareil'**
  String get offlineBanner;

  /// No description provided for @requiresConnection.
  ///
  /// In fr, this message translates to:
  /// **'nécessite une connexion'**
  String get requiresConnection;

  /// No description provided for @swatchSemantics.
  ///
  /// In fr, this message translates to:
  /// **'Couleur {name}, {state}'**
  String swatchSemantics(String name, String state);

  /// No description provided for @swatchSelected.
  ///
  /// In fr, this message translates to:
  /// **'sélectionnée'**
  String get swatchSelected;

  /// No description provided for @swatchNotSelected.
  ///
  /// In fr, this message translates to:
  /// **'non sélectionnée'**
  String get swatchNotSelected;

  /// No description provided for @swatchMore.
  ///
  /// In fr, this message translates to:
  /// **'+{count}'**
  String swatchMore(int count);

  /// No description provided for @scoreSemantics.
  ///
  /// In fr, this message translates to:
  /// **'{score} sur 100, {label}'**
  String scoreSemantics(int score, String label);

  /// No description provided for @scoreOutOf.
  ///
  /// In fr, this message translates to:
  /// **'sur 100'**
  String get scoreOutOf;

  /// No description provided for @scoreLabelHigh.
  ///
  /// In fr, this message translates to:
  /// **'Belle harmonie'**
  String get scoreLabelHigh;

  /// No description provided for @scoreLabelMedium.
  ///
  /// In fr, this message translates to:
  /// **'Bonne base'**
  String get scoreLabelMedium;

  /// No description provided for @scoreLabelLow.
  ///
  /// In fr, this message translates to:
  /// **'À ajuster'**
  String get scoreLabelLow;

  /// No description provided for @scoreHowComputed.
  ///
  /// In fr, this message translates to:
  /// **'Comment c\'est calculé ?'**
  String get scoreHowComputed;

  /// No description provided for @pieceSlotAdd.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter {role}'**
  String pieceSlotAdd(String role);

  /// No description provided for @pieceSlotReplacedBy.
  ///
  /// In fr, this message translates to:
  /// **'remplacé par : {piece}'**
  String pieceSlotReplacedBy(String piece);

  /// No description provided for @passwordShow.
  ///
  /// In fr, this message translates to:
  /// **'Afficher le mot de passe'**
  String get passwordShow;

  /// No description provided for @passwordHide.
  ///
  /// In fr, this message translates to:
  /// **'Masquer le mot de passe'**
  String get passwordHide;

  /// No description provided for @homeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Composer'**
  String get homeTitle;

  /// No description provided for @homeGreeting.
  ///
  /// In fr, this message translates to:
  /// **'Qu\'est-ce qu\'on porte aujourd\'hui ?'**
  String get homeGreeting;

  /// No description provided for @homeFromItemTitle.
  ///
  /// In fr, this message translates to:
  /// **'Partir d\'une pièce'**
  String get homeFromItemTitle;

  /// No description provided for @homeFromItemSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisissez un vêtement, on complète la tenue.'**
  String get homeFromItemSubtitle;

  /// No description provided for @homeFullOutfitTitle.
  ///
  /// In fr, this message translates to:
  /// **'Composer une tenue'**
  String get homeFullOutfitTitle;

  /// No description provided for @homeFullOutfitSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Assemblez vos pièces, on vous dit ce qui marche.'**
  String get homeFullOutfitSubtitle;

  /// No description provided for @homePaletteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Palette du catalogue'**
  String get homePaletteTitle;

  /// No description provided for @homeColorGuide.
  ///
  /// In fr, this message translates to:
  /// **'Guide des couleurs'**
  String get homeColorGuide;

  /// No description provided for @homeColorGuideSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Neutres, contrastes et harmonies'**
  String get homeColorGuideSubtitle;

  /// No description provided for @favoritesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Favoris'**
  String get favoritesTitle;

  /// No description provided for @favoritesEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucun favori pour l\'instant'**
  String get favoritesEmptyTitle;

  /// No description provided for @favoritesEmptyMessage.
  ///
  /// In fr, this message translates to:
  /// **'Touchez le cœur d\'un look pour le retrouver ici, même hors ligne.'**
  String get favoritesEmptyMessage;

  /// No description provided for @favoritesEmptyAction.
  ///
  /// In fr, this message translates to:
  /// **'Composer une tenue'**
  String get favoritesEmptyAction;

  /// No description provided for @profileTitle.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get profileTitle;

  /// No description provided for @profileSignInPitch.
  ///
  /// In fr, this message translates to:
  /// **'Connectez-vous pour retrouver vos favoris sur tous vos appareils.'**
  String get profileSignInPitch;

  /// No description provided for @profileSignIn.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get profileSignIn;

  /// No description provided for @profilePreferences.
  ///
  /// In fr, this message translates to:
  /// **'Préférences'**
  String get profilePreferences;

  /// No description provided for @profilePrivacy.
  ///
  /// In fr, this message translates to:
  /// **'Confidentialité'**
  String get profilePrivacy;

  /// No description provided for @profileAbout.
  ///
  /// In fr, this message translates to:
  /// **'À propos et crédits'**
  String get profileAbout;

  /// No description provided for @profileDesignSystem.
  ///
  /// In fr, this message translates to:
  /// **'Galerie du design system'**
  String get profileDesignSystem;

  /// No description provided for @galleryTitle.
  ///
  /// In fr, this message translates to:
  /// **'Design system'**
  String get galleryTitle;

  /// No description provided for @pieceSlotFilledSemantics.
  ///
  /// In fr, this message translates to:
  /// **'{role} : {piece}. Modifier'**
  String pieceSlotFilledSemantics(String role, String piece);

  /// No description provided for @silhouetteStraight.
  ///
  /// In fr, this message translates to:
  /// **'Droite'**
  String get silhouetteStraight;

  /// No description provided for @silhouetteHourglass.
  ///
  /// In fr, this message translates to:
  /// **'Sablier'**
  String get silhouetteHourglass;

  /// No description provided for @silhouetteBroad.
  ///
  /// In fr, this message translates to:
  /// **'Ample'**
  String get silhouetteBroad;

  /// No description provided for @mannequinEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu de la tenue : aucune pièce choisie'**
  String get mannequinEmpty;

  /// No description provided for @mannequinSemantics.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu de la tenue : {pieces}'**
  String mannequinSemantics(String pieces);

  /// No description provided for @composeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Composer une tenue'**
  String get composeTitle;

  /// No description provided for @composeRoleTop.
  ///
  /// In fr, this message translates to:
  /// **'Haut'**
  String get composeRoleTop;

  /// No description provided for @composeRoleBottom.
  ///
  /// In fr, this message translates to:
  /// **'Bas'**
  String get composeRoleBottom;

  /// No description provided for @composeRoleOnePiece.
  ///
  /// In fr, this message translates to:
  /// **'Robe ou combinaison'**
  String get composeRoleOnePiece;

  /// No description provided for @composeRoleShoes.
  ///
  /// In fr, this message translates to:
  /// **'Chaussures'**
  String get composeRoleShoes;

  /// No description provided for @composeRoleAccessories.
  ///
  /// In fr, this message translates to:
  /// **'Accessoires'**
  String get composeRoleAccessories;

  /// No description provided for @composeAddAccessory.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un accessoire'**
  String get composeAddAccessory;

  /// No description provided for @composeAccessoriesLimit.
  ///
  /// In fr, this message translates to:
  /// **'{max} accessoires maximum'**
  String composeAccessoriesLimit(int max);

  /// No description provided for @composeEvaluate.
  ///
  /// In fr, this message translates to:
  /// **'Évaluer'**
  String get composeEvaluate;

  /// No description provided for @composeMissing.
  ///
  /// In fr, this message translates to:
  /// **'Il manque : {pieces}'**
  String composeMissing(String pieces);

  /// No description provided for @composeReady.
  ///
  /// In fr, this message translates to:
  /// **'Tenue prête à évaluer'**
  String get composeReady;

  /// No description provided for @composeReset.
  ///
  /// In fr, this message translates to:
  /// **'Tout effacer'**
  String get composeReset;

  /// No description provided for @composeRemovePiece.
  ///
  /// In fr, this message translates to:
  /// **'Retirer'**
  String get composeRemovePiece;

  /// No description provided for @composePieceRemoved.
  ///
  /// In fr, this message translates to:
  /// **'Pièce retirée'**
  String get composePieceRemoved;

  /// No description provided for @pickerChooseType.
  ///
  /// In fr, this message translates to:
  /// **'Quel type ?'**
  String get pickerChooseType;

  /// No description provided for @pickerChooseColor.
  ///
  /// In fr, this message translates to:
  /// **'Quelle couleur ?'**
  String get pickerChooseColor;

  /// No description provided for @pickerConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Valider'**
  String get pickerConfirm;

  /// No description provided for @pickerBack.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get pickerBack;

  /// No description provided for @pieceLabel.
  ///
  /// In fr, this message translates to:
  /// **'{type} {color}'**
  String pieceLabel(String type, String color);

  /// No description provided for @colorFamily.
  ///
  /// In fr, this message translates to:
  /// **'{family, select, black{Noirs} white{Blancs} grey{Gris} beige{Beiges} cream{Crèmes} brown{Marrons} camel{Camels} blue{Bleus} green{Verts} red{Rouges} burgundy{Bordeaux} pink{Roses} purple{Violets} yellow{Jaunes} orange{Oranges} other{Autres}}'**
  String colorFamily(String family);

  /// No description provided for @errorOffline.
  ///
  /// In fr, this message translates to:
  /// **'Vous êtes hors ligne. Vérifiez votre connexion.'**
  String get errorOffline;

  /// No description provided for @errorSessionExpired.
  ///
  /// In fr, this message translates to:
  /// **'Votre session a expiré. Reconnectez-vous.'**
  String get errorSessionExpired;

  /// No description provided for @filtersTitle.
  ///
  /// In fr, this message translates to:
  /// **'Occasion et style'**
  String get filtersTitle;

  /// No description provided for @filtersOptional.
  ///
  /// In fr, this message translates to:
  /// **'Facultatif : sans filtre, on vous propose de tout.'**
  String get filtersOptional;

  /// No description provided for @filtersOccasion.
  ///
  /// In fr, this message translates to:
  /// **'Occasion'**
  String get filtersOccasion;

  /// No description provided for @filtersStyle.
  ///
  /// In fr, this message translates to:
  /// **'Style'**
  String get filtersStyle;

  /// No description provided for @evaluationTitle.
  ///
  /// In fr, this message translates to:
  /// **'Évaluation'**
  String get evaluationTitle;

  /// No description provided for @evaluationStrengths.
  ///
  /// In fr, this message translates to:
  /// **'Points forts'**
  String get evaluationStrengths;

  /// No description provided for @evaluationStructural.
  ///
  /// In fr, this message translates to:
  /// **'À compléter'**
  String get evaluationStructural;

  /// No description provided for @evaluationStyleRemarks.
  ///
  /// In fr, this message translates to:
  /// **'À considérer'**
  String get evaluationStyleRemarks;

  /// No description provided for @evaluationSuggestions.
  ///
  /// In fr, this message translates to:
  /// **'Pour aller plus loin'**
  String get evaluationSuggestions;

  /// No description provided for @evaluationTry.
  ///
  /// In fr, this message translates to:
  /// **'Essayer'**
  String get evaluationTry;

  /// No description provided for @evaluationBeforeAfter.
  ///
  /// In fr, this message translates to:
  /// **'Avant {before} · Après {after}'**
  String evaluationBeforeAfter(int before, int after);

  /// No description provided for @evaluationGain.
  ///
  /// In fr, this message translates to:
  /// **'{gain, plural, =1{+1 point} other{+{gain} points}}'**
  String evaluationGain(int gain);

  /// No description provided for @evaluationEditOutfit.
  ///
  /// In fr, this message translates to:
  /// **'Modifier la tenue'**
  String get evaluationEditOutfit;

  /// No description provided for @evaluationSave.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer la composition'**
  String get evaluationSave;

  /// No description provided for @evaluationNoSuggestion.
  ///
  /// In fr, this message translates to:
  /// **'Rien d\'évident à changer : c\'est une tenue équilibrée.'**
  String get evaluationNoSuggestion;

  /// No description provided for @breakdownTitle.
  ///
  /// In fr, this message translates to:
  /// **'Comment c\'est calculé'**
  String get breakdownTitle;

  /// No description provided for @breakdownIntro.
  ///
  /// In fr, this message translates to:
  /// **'Le score est indicatif : il additionne cinq critères. Il ne remplace pas vos goûts.'**
  String get breakdownIntro;

  /// No description provided for @breakdownColor.
  ///
  /// In fr, this message translates to:
  /// **'Harmonie des couleurs'**
  String get breakdownColor;

  /// No description provided for @breakdownStructure.
  ///
  /// In fr, this message translates to:
  /// **'Cohérence de la tenue'**
  String get breakdownStructure;

  /// No description provided for @breakdownOccasion.
  ///
  /// In fr, this message translates to:
  /// **'Adéquation à l\'occasion'**
  String get breakdownOccasion;

  /// No description provided for @breakdownStyle.
  ///
  /// In fr, this message translates to:
  /// **'Style choisi'**
  String get breakdownStyle;

  /// No description provided for @breakdownCompleteness.
  ///
  /// In fr, this message translates to:
  /// **'Tenue complète'**
  String get breakdownCompleteness;

  /// No description provided for @breakdownValue.
  ///
  /// In fr, this message translates to:
  /// **'{value} / {max}'**
  String breakdownValue(int value, int max);

  /// No description provided for @feedbackQuestion.
  ///
  /// In fr, this message translates to:
  /// **'Cette proposition vous aide ?'**
  String get feedbackQuestion;

  /// No description provided for @feedbackHelpful.
  ///
  /// In fr, this message translates to:
  /// **'Utile'**
  String get feedbackHelpful;

  /// No description provided for @feedbackNotHelpful.
  ///
  /// In fr, this message translates to:
  /// **'Pas utile'**
  String get feedbackNotHelpful;

  /// No description provided for @feedbackCommentLabel.
  ///
  /// In fr, this message translates to:
  /// **'Un commentaire ? (facultatif)'**
  String get feedbackCommentLabel;

  /// No description provided for @feedbackSend.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer'**
  String get feedbackSend;

  /// No description provided for @feedbackThanks.
  ///
  /// In fr, this message translates to:
  /// **'Merci pour votre retour !'**
  String get feedbackThanks;

  /// No description provided for @offlineComputed.
  ///
  /// In fr, this message translates to:
  /// **'Calculé hors ligne'**
  String get offlineComputed;

  /// No description provided for @fromItemTitle.
  ///
  /// In fr, this message translates to:
  /// **'Partir d\'une pièce'**
  String get fromItemTitle;

  /// No description provided for @fromItemStepCategory.
  ///
  /// In fr, this message translates to:
  /// **'Quelle pièce voulez-vous porter ?'**
  String get fromItemStepCategory;

  /// No description provided for @fromItemStepType.
  ///
  /// In fr, this message translates to:
  /// **'Quel type exactement ?'**
  String get fromItemStepType;

  /// No description provided for @fromItemStepColor.
  ///
  /// In fr, this message translates to:
  /// **'De quelle couleur ?'**
  String get fromItemStepColor;

  /// No description provided for @fromItemStepFilters.
  ///
  /// In fr, this message translates to:
  /// **'Pour quelle occasion ?'**
  String get fromItemStepFilters;

  /// No description provided for @fromItemShowLooks.
  ///
  /// In fr, this message translates to:
  /// **'Voir les tenues'**
  String get fromItemShowLooks;

  /// No description provided for @fromItemNoFilter.
  ///
  /// In fr, this message translates to:
  /// **'Sans filtre'**
  String get fromItemNoFilter;

  /// No description provided for @fromItemSummary.
  ///
  /// In fr, this message translates to:
  /// **'{piece}{context}'**
  String fromItemSummary(String piece, String context);

  /// No description provided for @fromItemYourPiece.
  ///
  /// In fr, this message translates to:
  /// **'Votre pièce'**
  String get fromItemYourPiece;

  /// No description provided for @fromItemChange.
  ///
  /// In fr, this message translates to:
  /// **'Changer'**
  String get fromItemChange;

  /// No description provided for @resultsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Tenues proposées'**
  String get resultsTitle;

  /// No description provided for @resultsBroadened.
  ///
  /// In fr, this message translates to:
  /// **'Peu de tenues correspondaient exactement. {steps}.'**
  String resultsBroadened(String steps);

  /// No description provided for @resultsEmptyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aucune tenue avec ces filtres'**
  String get resultsEmptyTitle;

  /// No description provided for @resultsEmptyMessage.
  ///
  /// In fr, this message translates to:
  /// **'Essayez sans filtrer l\'occasion ou le style.'**
  String get resultsEmptyMessage;

  /// No description provided for @resultsEmptyAction.
  ///
  /// In fr, this message translates to:
  /// **'Modifier la recherche'**
  String get resultsEmptyAction;

  /// No description provided for @resultsCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 tenue} other{{count} tenues}}'**
  String resultsCount(int count);

  /// No description provided for @lookTitle.
  ///
  /// In fr, this message translates to:
  /// **'Détail du look'**
  String get lookTitle;

  /// No description provided for @lookPieces.
  ///
  /// In fr, this message translates to:
  /// **'Les pièces'**
  String get lookPieces;

  /// No description provided for @lookWhy.
  ///
  /// In fr, this message translates to:
  /// **'Pourquoi ça marche'**
  String get lookWhy;

  /// No description provided for @lookOccasion.
  ///
  /// In fr, this message translates to:
  /// **'Occasion'**
  String get lookOccasion;

  /// No description provided for @lookStyle.
  ///
  /// In fr, this message translates to:
  /// **'Style'**
  String get lookStyle;

  /// No description provided for @lookCredit.
  ///
  /// In fr, this message translates to:
  /// **'Crédit : {credit}'**
  String lookCredit(String credit);

  /// No description provided for @lookShare.
  ///
  /// In fr, this message translates to:
  /// **'Partager'**
  String get lookShare;

  /// No description provided for @lookUseAsBase.
  ///
  /// In fr, this message translates to:
  /// **'Composer à partir de ce look'**
  String get lookUseAsBase;

  /// No description provided for @lookVariants.
  ///
  /// In fr, this message translates to:
  /// **'Voir des variantes'**
  String get lookVariants;

  /// No description provided for @lookAnchorBadge.
  ///
  /// In fr, this message translates to:
  /// **'Votre pièce'**
  String get lookAnchorBadge;

  /// No description provided for @lookIllustration.
  ///
  /// In fr, this message translates to:
  /// **'Illustration : la photo n\'est pas disponible pour cette variante.'**
  String get lookIllustration;

  /// No description provided for @shareText.
  ///
  /// In fr, this message translates to:
  /// **'{title} — {pieces}. Composé avec Herycia.'**
  String shareText(String title, String pieces);

  /// No description provided for @lookNotFound.
  ///
  /// In fr, this message translates to:
  /// **'Ce look n\'est plus disponible.'**
  String get lookNotFound;

  /// No description provided for @favoriteAdd.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter aux favoris'**
  String get favoriteAdd;

  /// No description provided for @favoriteRemove.
  ///
  /// In fr, this message translates to:
  /// **'Retirer des favoris'**
  String get favoriteRemove;

  /// No description provided for @homeInspiration.
  ///
  /// In fr, this message translates to:
  /// **'Looks d\'inspiration'**
  String get homeInspiration;

  /// No description provided for @homeRecentFavorites.
  ///
  /// In fr, this message translates to:
  /// **'Favoris récents'**
  String get homeRecentFavorites;

  /// No description provided for @homeSeeAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout voir'**
  String get homeSeeAll;

  /// No description provided for @guideTitle.
  ///
  /// In fr, this message translates to:
  /// **'Guide des couleurs'**
  String get guideTitle;

  /// No description provided for @guideIntro.
  ///
  /// In fr, this message translates to:
  /// **'Des repères pour associer les couleurs. Ce sont des indications, pas des règles : vos goûts passent avant.'**
  String get guideIntro;

  /// No description provided for @guidePrinciples.
  ///
  /// In fr, this message translates to:
  /// **'Principes d\'harmonie'**
  String get guidePrinciples;

  /// No description provided for @guidePrinciplesSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Neutres, contrastes, camaïeu…'**
  String get guidePrinciplesSubtitle;

  /// No description provided for @guideNeutralBadge.
  ///
  /// In fr, this message translates to:
  /// **'Neutre'**
  String get guideNeutralBadge;

  /// No description provided for @guidePairsWell.
  ///
  /// In fr, this message translates to:
  /// **'S\'accorde bien avec'**
  String get guidePairsWell;

  /// No description provided for @guideSuggestedPairs.
  ///
  /// In fr, this message translates to:
  /// **'Associations conseillées pour : {color}'**
  String guideSuggestedPairs(String color);

  /// No description provided for @guideComposeWith.
  ///
  /// In fr, this message translates to:
  /// **'Composer avec cette couleur'**
  String get guideComposeWith;

  /// No description provided for @guidePickColor.
  ///
  /// In fr, this message translates to:
  /// **'Touchez une nuance pour voir ses associations.'**
  String get guidePickColor;

  /// No description provided for @authEmail.
  ///
  /// In fr, this message translates to:
  /// **'Adresse e-mail'**
  String get authEmail;

  /// No description provided for @authPassword.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get authPassword;

  /// No description provided for @authName.
  ///
  /// In fr, this message translates to:
  /// **'Nom ou pseudonyme'**
  String get authName;

  /// No description provided for @authLoginTitle.
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get authLoginTitle;

  /// No description provided for @authLoginAction.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get authLoginAction;

  /// No description provided for @authForgotLink.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié ?'**
  String get authForgotLink;

  /// No description provided for @authNoAccount.
  ///
  /// In fr, this message translates to:
  /// **'Pas encore de compte ? Créer un compte'**
  String get authNoAccount;

  /// No description provided for @authRegisterTitle.
  ///
  /// In fr, this message translates to:
  /// **'Créer un compte'**
  String get authRegisterTitle;

  /// No description provided for @authRegisterAction.
  ///
  /// In fr, this message translates to:
  /// **'Créer mon compte'**
  String get authRegisterAction;

  /// No description provided for @authPasswordRule.
  ///
  /// In fr, this message translates to:
  /// **'Au moins 8 caractères.'**
  String get authPasswordRule;

  /// No description provided for @authAcceptPrivacy.
  ///
  /// In fr, this message translates to:
  /// **'J\'accepte la politique de confidentialité'**
  String get authAcceptPrivacy;

  /// No description provided for @authHaveAccount.
  ///
  /// In fr, this message translates to:
  /// **'Déjà un compte ? Se connecter'**
  String get authHaveAccount;

  /// No description provided for @authWelcome.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue, {name} !'**
  String authWelcome(String name);

  /// No description provided for @authForgotTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié'**
  String get authForgotTitle;

  /// No description provided for @authForgotIntro.
  ///
  /// In fr, this message translates to:
  /// **'Entrez votre adresse : si un compte existe, vous recevrez un lien pour choisir un nouveau mot de passe.'**
  String get authForgotIntro;

  /// No description provided for @authForgotAction.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer le lien'**
  String get authForgotAction;

  /// No description provided for @authForgotSent.
  ///
  /// In fr, this message translates to:
  /// **'C\'est envoyé. Pensez à vérifier vos courriers indésirables.'**
  String get authForgotSent;

  /// No description provided for @authHaveCode.
  ///
  /// In fr, this message translates to:
  /// **'J\'ai reçu un code'**
  String get authHaveCode;

  /// No description provided for @authDemoCode.
  ///
  /// In fr, this message translates to:
  /// **'Mode démonstration : votre code est {code}'**
  String authDemoCode(String code);

  /// No description provided for @authResetTitle.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau mot de passe'**
  String get authResetTitle;

  /// No description provided for @authResetCode.
  ///
  /// In fr, this message translates to:
  /// **'Code reçu par e-mail'**
  String get authResetCode;

  /// No description provided for @authResetNewPassword.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau mot de passe'**
  String get authResetNewPassword;

  /// No description provided for @authResetAction.
  ///
  /// In fr, this message translates to:
  /// **'Changer le mot de passe'**
  String get authResetAction;

  /// No description provided for @authResetDone.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe modifié. Vous pouvez vous connecter.'**
  String get authResetDone;

  /// No description provided for @authEmailInvalid.
  ///
  /// In fr, this message translates to:
  /// **'Entrez une adresse e-mail valide.'**
  String get authEmailInvalid;

  /// No description provided for @authRequired.
  ///
  /// In fr, this message translates to:
  /// **'Ce champ est obligatoire.'**
  String get authRequired;

  /// No description provided for @profileSignedInAs.
  ///
  /// In fr, this message translates to:
  /// **'Connecté en tant que {email}'**
  String profileSignedInAs(String email);

  /// No description provided for @profileLogout.
  ///
  /// In fr, this message translates to:
  /// **'Se déconnecter'**
  String get profileLogout;

  /// No description provided for @profileLoggedOut.
  ///
  /// In fr, this message translates to:
  /// **'Vous êtes déconnecté.'**
  String get profileLoggedOut;

  /// No description provided for @profileDeleteAccount.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer mon compte'**
  String get profileDeleteAccount;

  /// No description provided for @profileSavedOutfits.
  ///
  /// In fr, this message translates to:
  /// **'Mes compositions'**
  String get profileSavedOutfits;

  /// No description provided for @syncSynced.
  ///
  /// In fr, this message translates to:
  /// **'Synchronisé'**
  String get syncSynced;

  /// No description provided for @syncPending.
  ///
  /// In fr, this message translates to:
  /// **'En attente de synchronisation'**
  String get syncPending;

  /// No description provided for @syncFailed.
  ///
  /// In fr, this message translates to:
  /// **'Échec de synchronisation · réessayer'**
  String get syncFailed;

  /// No description provided for @syncLocalOnly.
  ///
  /// In fr, this message translates to:
  /// **'Enregistré sur cet appareil'**
  String get syncLocalOnly;

  /// No description provided for @deleteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer votre compte ?'**
  String get deleteTitle;

  /// No description provided for @deleteBody.
  ///
  /// In fr, this message translates to:
  /// **'Vos favoris, compositions et préférences seront effacés de nos serveurs. Cette action est définitive.'**
  String get deleteBody;

  /// No description provided for @deleteConfirmTitle.
  ///
  /// In fr, this message translates to:
  /// **'Vraiment supprimer ?'**
  String get deleteConfirmTitle;

  /// No description provided for @deleteConfirmBody.
  ///
  /// In fr, this message translates to:
  /// **'Dernière confirmation : votre compte sera supprimé immédiatement.'**
  String get deleteConfirmBody;

  /// No description provided for @deleteAction.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer'**
  String get deleteAction;

  /// No description provided for @deleteDone.
  ///
  /// In fr, this message translates to:
  /// **'Votre compte a été supprimé.'**
  String get deleteDone;

  /// No description provided for @prefsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Préférences'**
  String get prefsTitle;

  /// No description provided for @prefsStyles.
  ///
  /// In fr, this message translates to:
  /// **'Styles que vous aimez'**
  String get prefsStyles;

  /// No description provided for @prefsOccasions.
  ///
  /// In fr, this message translates to:
  /// **'Occasions fréquentes'**
  String get prefsOccasions;

  /// No description provided for @prefsTheme.
  ///
  /// In fr, this message translates to:
  /// **'Thème'**
  String get prefsTheme;

  /// No description provided for @prefsThemeSystem.
  ///
  /// In fr, this message translates to:
  /// **'Système'**
  String get prefsThemeSystem;

  /// No description provided for @prefsThemeLight.
  ///
  /// In fr, this message translates to:
  /// **'Clair'**
  String get prefsThemeLight;

  /// No description provided for @prefsThemeDark.
  ///
  /// In fr, this message translates to:
  /// **'Sombre'**
  String get prefsThemeDark;

  /// No description provided for @prefsSilhouette.
  ///
  /// In fr, this message translates to:
  /// **'Silhouette du mannequin'**
  String get prefsSilhouette;

  /// No description provided for @prefsSaved.
  ///
  /// In fr, this message translates to:
  /// **'Préférences enregistrées'**
  String get prefsSaved;

  /// No description provided for @prefsLocalHint.
  ///
  /// In fr, this message translates to:
  /// **'Vos préférences sont gardées sur cet appareil. Connectez-vous pour les retrouver partout.'**
  String get prefsLocalHint;

  /// No description provided for @privacyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Confidentialité'**
  String get privacyTitle;

  /// No description provided for @privacyBody.
  ///
  /// In fr, this message translates to:
  /// **'Herycia collecte le minimum : votre adresse e-mail si vous créez un compte, vos favoris, vos compositions et vos préférences. Aucune publicité ciblée. Vos retours sur les suggestions sont anonymisés si vous supprimez votre compte. Vous pouvez supprimer votre compte et vos données à tout moment depuis votre profil.'**
  String get privacyBody;

  /// No description provided for @aboutTitle.
  ///
  /// In fr, this message translates to:
  /// **'À propos et crédits'**
  String get aboutTitle;

  /// No description provided for @aboutVersion.
  ///
  /// In fr, this message translates to:
  /// **'Version {version}'**
  String aboutVersion(String version);

  /// No description provided for @aboutBody.
  ///
  /// In fr, this message translates to:
  /// **'Les visuels des looks sont publiés avec l\'accord de leurs auteurs ; leur crédit apparaît sous chaque image quand la licence l\'exige. Police : DM Sans (SIL Open Font License). Icônes : Lucide (ISC).'**
  String get aboutBody;

  /// No description provided for @signInPromptSave.
  ///
  /// In fr, this message translates to:
  /// **'Connectez-vous pour enregistrer vos compositions et les retrouver sur tous vos appareils.'**
  String get signInPromptSave;

  /// No description provided for @devSimulateOffline.
  ///
  /// In fr, this message translates to:
  /// **'Simuler l\'absence de réseau (dev)'**
  String get devSimulateOffline;

  /// No description provided for @savedOutfitsTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mes compositions'**
  String get savedOutfitsTitle;

  /// No description provided for @savedOutfitsEmpty.
  ///
  /// In fr, this message translates to:
  /// **'Aucune composition enregistrée'**
  String get savedOutfitsEmpty;

  /// No description provided for @savedOutfitsEmptyMessage.
  ///
  /// In fr, this message translates to:
  /// **'Évaluez une tenue puis enregistrez-la pour la retrouver ici.'**
  String get savedOutfitsEmptyMessage;

  /// No description provided for @savedOutfitDeleted.
  ///
  /// In fr, this message translates to:
  /// **'Composition supprimée'**
  String get savedOutfitDeleted;

  /// No description provided for @savedOutfitSaved.
  ///
  /// In fr, this message translates to:
  /// **'Composition enregistrée'**
  String get savedOutfitSaved;

  /// No description provided for @savedOutfitDefaultTitle.
  ///
  /// In fr, this message translates to:
  /// **'Composition du {date}'**
  String savedOutfitDefaultTitle(String date);

  /// No description provided for @favoriteRemoved.
  ///
  /// In fr, this message translates to:
  /// **'Retiré des favoris'**
  String get favoriteRemoved;

  /// No description provided for @favoritesAll.
  ///
  /// In fr, this message translates to:
  /// **'Tous'**
  String get favoritesAll;

  /// No description provided for @commonLoading.
  ///
  /// In fr, this message translates to:
  /// **'Chargement en cours'**
  String get commonLoading;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
