import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../catalog/domain/catalog_models.dart';
import '../../recommendation/domain/recommendation_models.dart';

enum FromItemStep { category, type, color, filters }

@immutable
class FromItemDraft {
  const FromItemDraft({this.category, this.type, this.color, this.occasionSlug, this.styleSlug});

  final ClothingCategory? category;
  final ClothingType? type;
  final CatalogColor? color;
  final String? occasionSlug;
  final String? styleSlug;

  FromItemStep get step {
    if (category == null) return FromItemStep.category;
    if (type == null) return FromItemStep.type;
    if (color == null) return FromItemStep.color;
    return FromItemStep.filters;
  }

  FromItemRequest? toRequest() => type == null || color == null
      ? null
      : FromItemRequest(
          clothingTypeId: type!.id,
          colorId: color!.id,
          occasionSlug: occasionSlug,
          styleSlug: styleSlug,
        );

  @override
  bool operator ==(Object other) =>
      other is FromItemDraft &&
      other.category == category &&
      other.type == type &&
      other.color == color &&
      other.occasionSlug == occasionSlug &&
      other.styleSlug == styleSlug;

  @override
  int get hashCode => Object.hash(category, type, color, occasionSlug, styleSlug);
}

class FromItemController extends Notifier<FromItemDraft> {
  @override
  FromItemDraft build() => const FromItemDraft();

  CatalogColor? _presetColor;

  void presetColor(CatalogColor color) {
    _presetColor = color;
    state = FromItemDraft(category: state.category, type: state.type, color: state.type == null ? null : color);
  }

  void selectCategory(ClothingCategory category) => state = FromItemDraft(category: category);

  void selectType(ClothingType type) =>
      state = FromItemDraft(category: state.category, type: type, color: _presetColor);

  void selectColor(CatalogColor color) => state = FromItemDraft(
        category: state.category,
        type: state.type,
        color: color,
        occasionSlug: state.occasionSlug,
        styleSlug: state.styleSlug,
      );

  void setOccasion(String? slug) => state = FromItemDraft(
        category: state.category,
        type: state.type,
        color: state.color,
        occasionSlug: slug,
        styleSlug: state.styleSlug,
      );

  void setStyle(String? slug) => state = FromItemDraft(
        category: state.category,
        type: state.type,
        color: state.color,
        occasionSlug: state.occasionSlug,
        styleSlug: slug,
      );

  void clearFilters() => state = FromItemDraft(category: state.category, type: state.type, color: state.color);

  void back() {
    state = switch (state.step) {
      FromItemStep.filters => FromItemDraft(category: state.category, type: state.type),
      FromItemStep.color => FromItemDraft(category: state.category),
      FromItemStep.type || FromItemStep.category => const FromItemDraft(),
    };
  }

  void reset() {
    _presetColor = null;
    state = const FromItemDraft();
  }
}

final fromItemDraftProvider = NotifierProvider<FromItemController, FromItemDraft>(FromItemController.new);
