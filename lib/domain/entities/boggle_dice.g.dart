// GENERATED CODE - DO NOT MODIFY BY HAND

part of boggle_dice;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BoggleDice extends BoggleDice {
  @override
  final String letters;
  @override
  final int selectedFaceIndex;
  @override
  final Position position;
  @override
  final bool isSelected;

  factory _$BoggleDice([void Function(BoggleDiceBuilder) updates]) =>
      (new BoggleDiceBuilder()..update(updates)).build();

  _$BoggleDice._(
      {this.letters, this.selectedFaceIndex, this.position, this.isSelected})
      : super._() {
    if (letters == null) {
      throw new BuiltValueNullFieldError('BoggleDice', 'letters');
    }
    if (isSelected == null) {
      throw new BuiltValueNullFieldError('BoggleDice', 'isSelected');
    }
  }

  @override
  BoggleDice rebuild(void Function(BoggleDiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BoggleDiceBuilder toBuilder() => new BoggleDiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BoggleDice &&
        letters == other.letters &&
        selectedFaceIndex == other.selectedFaceIndex &&
        position == other.position &&
        isSelected == other.isSelected;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, letters.hashCode), selectedFaceIndex.hashCode),
            position.hashCode),
        isSelected.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BoggleDice')
          ..add('letters', letters)
          ..add('selectedFaceIndex', selectedFaceIndex)
          ..add('position', position)
          ..add('isSelected', isSelected))
        .toString();
  }
}

class BoggleDiceBuilder implements Builder<BoggleDice, BoggleDiceBuilder> {
  _$BoggleDice _$v;

  String _letters;
  String get letters => _$this._letters;
  set letters(String letters) => _$this._letters = letters;

  int _selectedFaceIndex;
  int get selectedFaceIndex => _$this._selectedFaceIndex;
  set selectedFaceIndex(int selectedFaceIndex) =>
      _$this._selectedFaceIndex = selectedFaceIndex;

  Position _position;
  Position get position => _$this._position;
  set position(Position position) => _$this._position = position;

  bool _isSelected;
  bool get isSelected => _$this._isSelected;
  set isSelected(bool isSelected) => _$this._isSelected = isSelected;

  BoggleDiceBuilder();

  BoggleDiceBuilder get _$this {
    if (_$v != null) {
      _letters = _$v.letters;
      _selectedFaceIndex = _$v.selectedFaceIndex;
      _position = _$v.position;
      _isSelected = _$v.isSelected;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BoggleDice other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BoggleDice;
  }

  @override
  void update(void Function(BoggleDiceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BoggleDice build() {
    final _$result = _$v ??
        new _$BoggleDice._(
            letters: letters,
            selectedFaceIndex: selectedFaceIndex,
            position: position,
            isSelected: isSelected);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
