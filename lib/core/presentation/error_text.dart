import '../../l10n/l10n.dart';
import '../api/api_exception.dart';

String errorText(Object error, AppLocalizations l10n) => switch (error) {
      NetworkUnavailableException() => l10n.errorOffline,
      ApiException(code: ApiErrorCode.rateLimited) => error.message,
      ApiException(code: ApiErrorCode.unauthenticated) => l10n.errorSessionExpired,
      ApiException(:final message) when message.isNotEmpty => message,
      _ => l10n.commonErrorMessage,
    };
