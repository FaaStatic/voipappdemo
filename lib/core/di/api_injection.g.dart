// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_injection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiInjectionHash() => r'b9ecf5f9fe9b57c1c60eaae460a041ee23fcfb7b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [apiInjection].
@ProviderFor(apiInjection)
const apiInjectionProvider = ApiInjectionFamily();

/// See also [apiInjection].
class ApiInjectionFamily extends Family<Dio> {
  /// See also [apiInjection].
  const ApiInjectionFamily();

  /// See also [apiInjection].
  ApiInjectionProvider call(
    Map<String, dynamic> requestData,
  ) {
    return ApiInjectionProvider(
      requestData,
    );
  }

  @override
  ApiInjectionProvider getProviderOverride(
    covariant ApiInjectionProvider provider,
  ) {
    return call(
      provider.requestData,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'apiInjectionProvider';
}

/// See also [apiInjection].
class ApiInjectionProvider extends AutoDisposeProvider<Dio> {
  /// See also [apiInjection].
  ApiInjectionProvider(
    Map<String, dynamic> requestData,
  ) : this._internal(
          (ref) => apiInjection(
            ref as ApiInjectionRef,
            requestData,
          ),
          from: apiInjectionProvider,
          name: r'apiInjectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$apiInjectionHash,
          dependencies: ApiInjectionFamily._dependencies,
          allTransitiveDependencies:
              ApiInjectionFamily._allTransitiveDependencies,
          requestData: requestData,
        );

  ApiInjectionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.requestData,
  }) : super.internal();

  final Map<String, dynamic> requestData;

  @override
  Override overrideWith(
    Dio Function(ApiInjectionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApiInjectionProvider._internal(
        (ref) => create(ref as ApiInjectionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        requestData: requestData,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Dio> createElement() {
    return _ApiInjectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiInjectionProvider && other.requestData == requestData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, requestData.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApiInjectionRef on AutoDisposeProviderRef<Dio> {
  /// The parameter `requestData` of this provider.
  Map<String, dynamic> get requestData;
}

class _ApiInjectionProviderElement extends AutoDisposeProviderElement<Dio>
    with ApiInjectionRef {
  _ApiInjectionProviderElement(super.provider);

  @override
  Map<String, dynamic> get requestData =>
      (origin as ApiInjectionProvider).requestData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
