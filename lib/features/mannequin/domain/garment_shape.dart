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
    'shirt': collaredLongSleeve,
    'polo': collaredShortSleeve,
    'blouse': longSleeveTop,
    'sweater': longSleeveTop,
    'jacket': outerwear,
    'blazer': outerwear,
    'trousers': trousers,
    'jeans': trousers,
    'chinos': trousers,
    'skirt': skirt,
    'shorts': shorts,
    'dress': dress,
    'jumpsuit': jumpsuit,
    'sneakers': lowShoes,
    'loafers': lowShoes,
    'dress-shoes': lowShoes,
    'sandals': sandals,
    'ankle-boots': boots,
    'belt': belt,
    'bag': bag,
    'watch': watch,
    'jewelry': necklace,
    'sunglasses': glasses,
    'scarf': scarf,
    'tie': tie,
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
