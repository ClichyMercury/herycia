// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Herycia';

  @override
  String get navCompose => 'Composer';

  @override
  String get navFavorites => 'Favoris';

  @override
  String get navProfile => 'Profil';

  @override
  String get commonRetry => 'Réessayer';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonLater => 'Plus tard';

  @override
  String get commonOptional => 'facultatif';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonRemove => 'Retirer';

  @override
  String get commonSlowLoading => 'Ça prend plus de temps que prévu';

  @override
  String get commonComingSoon => 'Bientôt disponible';

  @override
  String get commonErrorTitle => 'Un problème est survenu';

  @override
  String get commonErrorMessage => 'Vérifiez votre connexion puis réessayez.';

  @override
  String get offlineBanner =>
      'Hors ligne · suggestions calculées sur l\'appareil';

  @override
  String get requiresConnection => 'nécessite une connexion';

  @override
  String swatchSemantics(String name, String state) {
    return 'Couleur $name, $state';
  }

  @override
  String get swatchSelected => 'sélectionnée';

  @override
  String get swatchNotSelected => 'non sélectionnée';

  @override
  String swatchMore(int count) {
    return '+$count';
  }

  @override
  String scoreSemantics(int score, String label) {
    return '$score sur 100, $label';
  }

  @override
  String get scoreOutOf => 'sur 100';

  @override
  String get scoreLabelHigh => 'Belle harmonie';

  @override
  String get scoreLabelMedium => 'Bonne base';

  @override
  String get scoreLabelLow => 'À ajuster';

  @override
  String get scoreHowComputed => 'Comment c\'est calculé ?';

  @override
  String pieceSlotAdd(String role) {
    return 'Ajouter $role';
  }

  @override
  String pieceSlotReplacedBy(String piece) {
    return 'remplacé par : $piece';
  }

  @override
  String get passwordShow => 'Afficher le mot de passe';

  @override
  String get passwordHide => 'Masquer le mot de passe';

  @override
  String get homeTitle => 'Composer';

  @override
  String get homeGreeting => 'Qu\'est-ce qu\'on porte aujourd\'hui ?';

  @override
  String get homeFromItemTitle => 'Partir d\'une pièce';

  @override
  String get homeFromItemSubtitle =>
      'Choisissez un vêtement, on complète la tenue.';

  @override
  String get homeFullOutfitTitle => 'Composer une tenue';

  @override
  String get homeFullOutfitSubtitle =>
      'Assemblez vos pièces, on vous dit ce qui marche.';

  @override
  String get homePaletteTitle => 'Palette du catalogue';

  @override
  String get homeColorGuide => 'Guide des couleurs';

  @override
  String get homeColorGuideSubtitle => 'Neutres, contrastes et harmonies';

  @override
  String get favoritesTitle => 'Favoris';

  @override
  String get favoritesEmptyTitle => 'Aucun favori pour l\'instant';

  @override
  String get favoritesEmptyMessage =>
      'Touchez le cœur d\'un look pour le retrouver ici, même hors ligne.';

  @override
  String get favoritesEmptyAction => 'Composer une tenue';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileSignInPitch =>
      'Connectez-vous pour retrouver vos favoris sur tous vos appareils.';

  @override
  String get profileSignIn => 'Se connecter';

  @override
  String get profilePreferences => 'Préférences';

  @override
  String get profilePrivacy => 'Confidentialité';

  @override
  String get profileAbout => 'À propos et crédits';

  @override
  String get profileDesignSystem => 'Galerie du design system';

  @override
  String get galleryTitle => 'Design system';

  @override
  String pieceSlotFilledSemantics(String role, String piece) {
    return '$role : $piece. Modifier';
  }

  @override
  String get silhouetteStraight => 'Droite';

  @override
  String get silhouetteHourglass => 'Sablier';

  @override
  String get silhouetteBroad => 'Ample';

  @override
  String get mannequinEmpty => 'Aperçu de la tenue : aucune pièce choisie';

  @override
  String mannequinSemantics(String pieces) {
    return 'Aperçu de la tenue : $pieces';
  }

  @override
  String get composeTitle => 'Composer une tenue';

  @override
  String get composeRoleTop => 'Haut';

  @override
  String get composeRoleBottom => 'Bas';

  @override
  String get composeRoleOnePiece => 'Robe ou combinaison';

  @override
  String get composeRoleShoes => 'Chaussures';

  @override
  String get composeRoleAccessories => 'Accessoires';

  @override
  String get composeAddAccessory => 'Ajouter un accessoire';

  @override
  String composeAccessoriesLimit(int max) {
    return '$max accessoires maximum';
  }

  @override
  String get composeEvaluate => 'Évaluer';

  @override
  String composeMissing(String pieces) {
    return 'Il manque : $pieces';
  }

  @override
  String get composeReady => 'Tenue prête à évaluer';

  @override
  String get composeReset => 'Tout effacer';

  @override
  String get composeRemovePiece => 'Retirer';

  @override
  String get composePieceRemoved => 'Pièce retirée';

  @override
  String get pickerChooseType => 'Quel type ?';

  @override
  String get pickerChooseColor => 'Quelle couleur ?';

  @override
  String get pickerConfirm => 'Valider';

  @override
  String get pickerBack => 'Retour';

  @override
  String pieceLabel(String type, String color) {
    return '$type $color';
  }

  @override
  String get errorOffline => 'Vous êtes hors ligne. Vérifiez votre connexion.';

  @override
  String get errorSessionExpired => 'Votre session a expiré. Reconnectez-vous.';

  @override
  String get filtersTitle => 'Occasion et style';

  @override
  String get filtersOptional =>
      'Facultatif : sans filtre, on vous propose de tout.';

  @override
  String get filtersOccasion => 'Occasion';

  @override
  String get filtersStyle => 'Style';

  @override
  String get evaluationTitle => 'Évaluation';

  @override
  String get evaluationStrengths => 'Points forts';

  @override
  String get evaluationStructural => 'À compléter';

  @override
  String get evaluationStyleRemarks => 'À considérer';

  @override
  String get evaluationSuggestions => 'Pour aller plus loin';

  @override
  String get evaluationTry => 'Essayer';

  @override
  String evaluationBeforeAfter(int before, int after) {
    return 'Avant $before · Après $after';
  }

  @override
  String evaluationGain(int gain) {
    String _temp0 = intl.Intl.pluralLogic(
      gain,
      locale: localeName,
      other: '+$gain points',
      one: '+1 point',
    );
    return '$_temp0';
  }

  @override
  String get evaluationEditOutfit => 'Modifier la tenue';

  @override
  String get evaluationSave => 'Enregistrer la composition';

  @override
  String get evaluationNoSuggestion =>
      'Rien d\'évident à changer : c\'est une tenue équilibrée.';

  @override
  String get breakdownTitle => 'Comment c\'est calculé';

  @override
  String get breakdownIntro =>
      'Le score est indicatif : il additionne cinq critères. Il ne remplace pas vos goûts.';

  @override
  String get breakdownColor => 'Harmonie des couleurs';

  @override
  String get breakdownStructure => 'Cohérence de la tenue';

  @override
  String get breakdownOccasion => 'Adéquation à l\'occasion';

  @override
  String get breakdownStyle => 'Style choisi';

  @override
  String get breakdownCompleteness => 'Tenue complète';

  @override
  String breakdownValue(int value, int max) {
    return '$value / $max';
  }

  @override
  String get feedbackQuestion => 'Cette proposition vous aide ?';

  @override
  String get feedbackHelpful => 'Utile';

  @override
  String get feedbackNotHelpful => 'Pas utile';

  @override
  String get feedbackCommentLabel => 'Un commentaire ? (facultatif)';

  @override
  String get feedbackSend => 'Envoyer';

  @override
  String get feedbackThanks => 'Merci pour votre retour !';

  @override
  String get fromItemTitle => 'Partir d\'une pièce';

  @override
  String get fromItemStepCategory => 'Quelle pièce voulez-vous porter ?';

  @override
  String get fromItemStepType => 'Quel type exactement ?';

  @override
  String get fromItemStepColor => 'De quelle couleur ?';

  @override
  String get fromItemStepFilters => 'Pour quelle occasion ?';

  @override
  String get fromItemShowLooks => 'Voir les tenues';

  @override
  String get fromItemNoFilter => 'Sans filtre';

  @override
  String fromItemSummary(String piece, String context) {
    return '$piece$context';
  }

  @override
  String get fromItemYourPiece => 'Votre pièce';

  @override
  String get fromItemChange => 'Changer';

  @override
  String get resultsTitle => 'Tenues proposées';

  @override
  String resultsBroadened(String steps) {
    return 'Peu de tenues correspondaient exactement : nous avons ignoré $steps pour trouver plus de propositions.';
  }

  @override
  String get resultsEmptyTitle => 'Aucune tenue avec ces filtres';

  @override
  String get resultsEmptyMessage =>
      'Essayez sans filtrer l\'occasion ou le style.';

  @override
  String get resultsEmptyAction => 'Modifier la recherche';

  @override
  String resultsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tenues',
      one: '1 tenue',
    );
    return '$_temp0';
  }

  @override
  String get lookTitle => 'Détail du look';

  @override
  String get lookPieces => 'Les pièces';

  @override
  String get lookWhy => 'Pourquoi ça marche';

  @override
  String get lookOccasion => 'Occasion';

  @override
  String get lookStyle => 'Style';

  @override
  String lookCredit(String credit) {
    return 'Crédit : $credit';
  }

  @override
  String get lookShare => 'Partager';

  @override
  String get lookUseAsBase => 'Composer à partir de ce look';

  @override
  String get lookVariants => 'Voir des variantes';

  @override
  String get lookAnchorBadge => 'Votre pièce';

  @override
  String get lookIllustration =>
      'Illustration : la photo n\'est pas disponible pour cette variante.';

  @override
  String shareText(String title, String pieces) {
    return '$title — $pieces. Composé avec Herycia.';
  }

  @override
  String get lookNotFound => 'Ce look n\'est plus disponible.';

  @override
  String get favoriteAdd => 'Ajouter aux favoris';

  @override
  String get favoriteRemove => 'Retirer des favoris';

  @override
  String get homeInspiration => 'Looks d\'inspiration';

  @override
  String get homeRecentFavorites => 'Favoris récents';

  @override
  String get homeSeeAll => 'Tout voir';

  @override
  String get guideTitle => 'Guide des couleurs';

  @override
  String get guideIntro =>
      'Des repères pour associer les couleurs. Ce sont des indications, pas des règles : vos goûts passent avant.';

  @override
  String get guidePrinciples => 'Principes d\'harmonie';

  @override
  String get guidePrinciplesSubtitle => 'Neutres, contrastes, camaïeu…';

  @override
  String get guideNeutralBadge => 'Neutre';

  @override
  String guideSuggestedPairs(String color) {
    return 'Associations conseillées pour : $color';
  }

  @override
  String get guideComposeWith => 'Composer avec cette couleur';

  @override
  String get guidePickColor => 'Touchez une nuance pour voir ses associations.';

  @override
  String get authEmail => 'Adresse e-mail';

  @override
  String get authPassword => 'Mot de passe';

  @override
  String get authName => 'Nom ou pseudonyme';

  @override
  String get authLoginTitle => 'Connexion';

  @override
  String get authLoginAction => 'Se connecter';

  @override
  String get authForgotLink => 'Mot de passe oublié ?';

  @override
  String get authNoAccount => 'Pas encore de compte ? Créer un compte';

  @override
  String get authRegisterTitle => 'Créer un compte';

  @override
  String get authRegisterAction => 'Créer mon compte';

  @override
  String get authPasswordRule => 'Au moins 8 caractères.';

  @override
  String get authAcceptPrivacy => 'J\'accepte la politique de confidentialité';

  @override
  String get authHaveAccount => 'Déjà un compte ? Se connecter';

  @override
  String authWelcome(String name) {
    return 'Bienvenue, $name !';
  }

  @override
  String get authForgotTitle => 'Mot de passe oublié';

  @override
  String get authForgotIntro =>
      'Entrez votre adresse : si un compte existe, vous recevrez un code à 6 chiffres pour choisir un nouveau mot de passe.';

  @override
  String get authForgotAction => 'Envoyer le code';

  @override
  String get authForgotSent =>
      'C\'est envoyé. Pensez à vérifier vos courriers indésirables.';

  @override
  String get authHaveCode => 'J\'ai reçu un code';

  @override
  String authDemoCode(String code) {
    return 'Mode démonstration : votre code est $code';
  }

  @override
  String get authResetTitle => 'Nouveau mot de passe';

  @override
  String get authResetCode => 'Code reçu par e-mail';

  @override
  String get authResetNewPassword => 'Nouveau mot de passe';

  @override
  String get authResetAction => 'Changer le mot de passe';

  @override
  String get authResetDone =>
      'Mot de passe modifié. Vous pouvez vous connecter.';

  @override
  String get authEmailInvalid => 'Entrez une adresse e-mail valide.';

  @override
  String get authRequired => 'Ce champ est obligatoire.';

  @override
  String profileSignedInAs(String email) {
    return 'Connecté en tant que $email';
  }

  @override
  String get profileLogout => 'Se déconnecter';

  @override
  String get profileLoggedOut => 'Vous êtes déconnecté.';

  @override
  String get profileDeleteAccount => 'Supprimer mon compte';

  @override
  String get profileSavedOutfits => 'Mes compositions';

  @override
  String get syncSynced => 'Synchronisé';

  @override
  String get syncPending => 'En attente de synchronisation';

  @override
  String get syncFailed => 'Échec de synchronisation · réessayer';

  @override
  String get syncLocalOnly => 'Enregistré sur cet appareil';

  @override
  String get deleteTitle => 'Supprimer votre compte ?';

  @override
  String get deleteBody =>
      'Vos favoris, compositions et préférences seront effacés de nos serveurs. Cette action est définitive.';

  @override
  String get deleteConfirmTitle => 'Vraiment supprimer ?';

  @override
  String get deleteAction => 'Supprimer';

  @override
  String get deleteDone => 'Votre compte a été supprimé.';

  @override
  String get prefsTitle => 'Préférences';

  @override
  String get prefsStyles => 'Styles que vous aimez';

  @override
  String get prefsOccasions => 'Occasions fréquentes';

  @override
  String get prefsTheme => 'Thème';

  @override
  String get prefsThemeSystem => 'Système';

  @override
  String get prefsThemeLight => 'Clair';

  @override
  String get prefsThemeDark => 'Sombre';

  @override
  String get prefsSilhouette => 'Silhouette du mannequin';

  @override
  String get prefsSaved => 'Préférences enregistrées';

  @override
  String get prefsLocalHint =>
      'Vos préférences sont gardées sur cet appareil. Connectez-vous pour les retrouver partout.';

  @override
  String get privacyTitle => 'Confidentialité';

  @override
  String get privacyBody =>
      'Herycia collecte le minimum : votre adresse e-mail si vous créez un compte, vos favoris, vos compositions et vos préférences. Aucune publicité ciblée. Vos retours sur les suggestions sont anonymisés si vous supprimez votre compte. Vous pouvez supprimer votre compte et vos données à tout moment depuis votre profil.';

  @override
  String get aboutTitle => 'À propos et crédits';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutBody =>
      'Les visuels des looks sont publiés avec l\'accord de leurs auteurs ; leur crédit apparaît sous chaque image quand la licence l\'exige. Police : DM Sans (SIL Open Font License). Icônes : Lucide (ISC).';

  @override
  String get devSimulateOffline => 'Simuler l\'absence de réseau (dev)';

  @override
  String get savedOutfitsTitle => 'Mes compositions';

  @override
  String get savedOutfitsEmpty => 'Aucune composition enregistrée';

  @override
  String get savedOutfitsEmptyMessage =>
      'Évaluez une tenue puis enregistrez-la pour la retrouver ici.';

  @override
  String get savedOutfitDeleted => 'Composition supprimée';

  @override
  String get savedOutfitSaved => 'Composition enregistrée';

  @override
  String savedOutfitDefaultTitle(String date) {
    return 'Composition du $date';
  }

  @override
  String get favoriteRemoved => 'Retiré des favoris';

  @override
  String get favoritesAll => 'Tous';

  @override
  String get commonLoading => 'Chargement en cours';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get composeRoleOuterwear => 'Veste';

  @override
  String get sessionExpiredBanner =>
      'Session expirée, reconnectez-vous pour synchroniser.';

  @override
  String get syncInProgress => 'Synchronisation…';

  @override
  String get authResend => 'Renvoyer un code';

  @override
  String authResendIn(int seconds) {
    return 'Renvoyer un code dans $seconds s';
  }

  @override
  String get authOtpInvalid => 'Entrez le code à 6 chiffres reçu par e-mail.';

  @override
  String get authOtpHint => '6 chiffres, valable 15 minutes.';

  @override
  String get deletePasswordPrompt =>
      'Pour confirmer, saisissez votre mot de passe. Votre compte sera supprimé immédiatement.';

  @override
  String get profileEditName => 'Modifier mon nom';

  @override
  String get profileNameSaved => 'Nom mis à jour.';

  @override
  String get profileChangePassword => 'Changer mon mot de passe';

  @override
  String get profileCurrentPassword => 'Mot de passe actuel';

  @override
  String get profilePasswordChanged =>
      'Mot de passe modifié. Vos autres appareils ont été déconnectés.';

  @override
  String cachedResult(String date) {
    return 'Résultat du $date, hors ligne';
  }

  @override
  String get evaluationComplete => 'Votre tenue est complète.';

  @override
  String get evaluationIncomplete =>
      'Il manque encore des pièces pour compléter la tenue.';

  @override
  String get evaluationIndicative =>
      'Ce score est indicatif : vos goûts passent avant.';

  @override
  String get warningStructure => 'Structure';

  @override
  String get warningPreference => 'Préférence';

  @override
  String get broadenedStyle => 'le style';

  @override
  String get broadenedOccasion => 'l\'occasion';

  @override
  String get broadenedShades => 'les nuances proches';

  @override
  String get broadenedNeutral => 'les conseils de couleurs neutres';

  @override
  String get resultsAdviceTitle => 'Quelques conseils de couleurs';

  @override
  String get resultsAdviceIntro =>
      'Aucun look ne correspond assez bien à cette pièce pour l\'instant. Voici des couleurs faciles à associer.';

  @override
  String get offlineGuideBadge => 'Hors ligne : guide des couleurs';

  @override
  String offlineGuideTitle(String color) {
    return 'Avec du $color';
  }

  @override
  String get offlineGuideIntro =>
      'Les propositions de looks reviendront avec la connexion. En attendant, voici les associations du guide des couleurs.';

  @override
  String guideFamilyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nuances',
      one: '1 nuance',
    );
    return '$_temp0';
  }

  @override
  String get guideHarmonious => 'S\'harmonise avec';

  @override
  String get guideContrast => 'En contraste';

  @override
  String get guideNeutralPairing => 'Neutres qui l\'accompagnent';

  @override
  String get guideCaution => 'À manier avec prudence';

  @override
  String get guideNoPairs =>
      'Pas encore d\'association conseillée pour cette nuance.';

  @override
  String get principleNeutralTitle => 'Partir d\'une base neutre';

  @override
  String get principleNeutralBody =>
      'Noir, blanc, gris, beige ou bleu marine s\'associent à presque tout. Une base neutre laisse une seule pièce de couleur prendre la vedette.';

  @override
  String get principleHarmonyTitle => 'Jouer l\'harmonie';

  @override
  String get principleHarmonyBody =>
      'Des couleurs voisines ou un camaïeu d\'une même teinte donnent une tenue douce et cohérente.';

  @override
  String get principleContrastTitle => 'Oser le contraste';

  @override
  String get principleContrastBody =>
      'Des couleurs opposées réveillent une tenue. Gardez-en une dominante et utilisez l\'autre en touche.';

  @override
  String get principleCautionTitle => 'Savoir doser';

  @override
  String get principleCautionBody =>
      'Certaines associations sont plus délicates : elles demandent une pièce neutre pour faire le lien. Ce sont des repères, pas des interdits.';

  @override
  String get authInvalidCredentials =>
      'Identifiants invalides. Vérifiez votre e-mail et votre mot de passe.';

  @override
  String profileVersion(String version) {
    return 'Herycia $version';
  }
}
