enum GarmentSlot { top, bottom, onePiece, shoes, accessory }

enum GarmentShape {
  shortSleeveTop(GarmentSlot.top),
  longSleeveTop(GarmentSlot.top),
  collaredShortSleeve(GarmentSlot.top),
  collaredLongSleeve(GarmentSlot.top),
  outerwear(GarmentSlot.top),
  trousers(GarmentSlot.bottom),
  shorts(GarmentSlot.bottom),
  skirt(GarmentSlot.bottom),
  dress(GarmentSlot.onePiece),
  jumpsuit(GarmentSlot.onePiece),
  lowShoes(GarmentSlot.shoes),
  boots(GarmentSlot.shoes),
  sandals(GarmentSlot.shoes),
  belt(GarmentSlot.accessory),
  bag(GarmentSlot.accessory),
  watch(GarmentSlot.accessory),
  necklace(GarmentSlot.accessory),
  glasses(GarmentSlot.accessory),
  scarf(GarmentSlot.accessory),
  tie(GarmentSlot.accessory);

  const GarmentShape(this.slot);

  final GarmentSlot slot;

  static const _bySlug = <String, GarmentShape>{
    't-shirt': shortSleeveTop,
    'chemise': collaredLongSleeve,
    'polo': collaredShortSleeve,
    'blouse': longSleeveTop,
    'pull': longSleeveTop,
    'veste': outerwear,
    'blazer': outerwear,
    'pantalon': trousers,
    'jean': trousers,
    'chino': trousers,
    'jupe': skirt,
    'short': shorts,
    'robe': dress,
    'combinaison': jumpsuit,
    'baskets': lowShoes,
    'mocassins': lowShoes,
    'chaussures-habillees': lowShoes,
    'sandales': sandals,
    'bottines': boots,
    'ceinture': belt,
    'sac': bag,
    'montre': watch,
    'bijoux': necklace,
    'lunettes': glasses,
    'foulard': scarf,
    'cravate': tie,
  };

  static const _fallback = <GarmentSlot, GarmentShape>{
    GarmentSlot.top: longSleeveTop,
    GarmentSlot.bottom: trousers,
    GarmentSlot.onePiece: dress,
    GarmentSlot.shoes: lowShoes,
  };

  static GarmentShape? resolve(GarmentSlot slot, String typeSlug) {
    final known = _bySlug[typeSlug];
    if (known != null && known.slot == slot) return known;
    return _fallback[slot];
  }

  bool get isLayeredOverBottom => this == outerwear;
}
