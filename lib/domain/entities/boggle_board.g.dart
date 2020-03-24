// GENERATED CODE - DO NOT MODIFY BY HAND

part of boggle_board;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BoggleBoard extends BoggleBoard {
  @override
  final int dimension;
  @override
  final BuiltList<BoggleDice> dice;

  factory _$BoggleBoard([void Function(BoggleBoardBuilder) updates]) =>
      (new BoggleBoardBuilder()..update(updates)).build();

  _$BoggleBoard._({this.dimension, this.dice}) : super._() {
    if (dimension == null) {
      throw new BuiltValueNullFieldError('BoggleBoard', 'dimension');
    }
    if (dice == null) {
      throw new BuiltValueNullFieldError('BoggleBoard', 'dice');
    }
  }

  @override
  BoggleBoard rebuild(void Function(BoggleBoardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BoggleBoardBuilder toBuilder() => new BoggleBoardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BoggleBoard &&
        dimension == other.dimension &&
        dice == other.dice;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, dimension.hashCode), dice.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BoggleBoard')
          ..add('dimension', dimension)
          ..add('dice', dice))
        .toString();
  }
}

class BoggleBoardBuilder implements Builder<BoggleBoard, BoggleBoardBuilder> {
  _$BoggleBoard _$v;

  int _dimension;
  int get dimension => _$this._dimension;
  set dimension(int dimension) => _$this._dimension = dimension;

  ListBuilder<BoggleDice> _dice;
  ListBuilder<BoggleDice> get dice =>
      _$this._dice ??= new ListBuilder<BoggleDice>();
  set dice(ListBuilder<BoggleDice> dice) => _$this._dice = dice;

  BoggleBoardBuilder();

  BoggleBoardBuilder get _$this {
    if (_$v != null) {
      _dimension = _$v.dimension;
      _dice = _$v.dice?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BoggleBoard other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BoggleBoard;
  }

  @override
  void update(void Function(BoggleBoardBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BoggleBoard build() {
    _$BoggleBoard _$result;
    try {
      _$result =
          _$v ?? new _$BoggleBoard._(dimension: dimension, dice: dice.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'dice';
        dice.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BoggleBoard', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
