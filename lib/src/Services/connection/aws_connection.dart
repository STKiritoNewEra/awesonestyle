import 'dart:async';
import 'dart:io';

/// Represents the state of the data connection.
/// Returned by [AwsConnection.connectionStatus],[AwsConnection.onStatusChange],[AwsConnection.hasConnection]
enum AwsConnectionStatus {
  disconnected,
  connected,
}

/// This is a singleton that can be accessed as a regular constructor ie [AwsConnection] always returns the same instance.
class AwsConnection {
  /// The default connection port is 53.
  /// For more information see "https://www.google.com/search?q=dns server port".
  static int get defaultPort => 53;

  /// The default timeout is 5 seconds before an unreachable request is dropped.
  static Duration get defaultTimeOut => Duration(seconds: 5);

  /// The request interval is every 3 seconds by default.
  static Duration get defaultInterval => Duration(seconds: 3);

  /// Set the request interval.
  set alternateInterval(Duration interval) => _checkInterval = interval;

  /// Predefined trusted addresses.
  /// google: "1.1.1.1" and "8.8.4.4".
  /// opendns: "208.67.222.222".
  static final List<AwsConnectionOption> defaultAddresses = List.unmodifiable([
    AwsConnectionOption(
      address: InternetAddress('1.1.1.1'),
      port: defaultPort,
      timeout: defaultTimeOut,
    ),
    AwsConnectionOption(
      address: InternetAddress('8.8.4.4'),
      port: defaultPort,
      timeout: defaultTimeOut,
    ),
    AwsConnectionOption(
      address: InternetAddress('208.67.222.222'),
      port: defaultPort,
      timeout: defaultTimeOut,
    ),
  ]);

  List<AwsConnectionOption> _addresses = defaultAddresses;

  ///set an alternate address list, you can set the address of a specific server.
  set alternateAddresses(List<AwsConnectionOption> addresses) =>
      this._addresses = addresses;

  /// This is a singleton that can be accessed as a regular constructor
  /// That is, [AwsConnection] always returns the same instance.
  factory AwsConnection() {
    return _instance;
  }
  AwsConnection._() {
    // immediately do an initial check so we know the latest status?
    // connection status.then((status) => _laststatus = status);

    // start sending status updates to onStatusChange when there are listeners
    // (emits only if there are any changes since the last status update)

    _statusController.onListen = () {
      _maybeEmitStatusUpdate();
    };
    // stop sending status updates when no one is listening
    _statusController.onCancel = () {
      _timerHandle?.cancel();
      _lastStatus = null; // reset the last state
    };
  }
  static final AwsConnection _instance = AwsConnection._();

  /// Ping a single address. See [AwsConnectionOption] for more
  /// information about the accepted argument.
  Future<AwsConnectionResult> isHostReachable(
      AwsConnectionOption option) async {
    Socket? socket;
    try {
      socket = await Socket.connect(
        option.address,
        option.port,
        timeout: option.timeout,
      );
      socket.destroy();
      return AwsConnectionResult(option, true);
    } catch (e) {
      socket?.destroy();
      return AwsConnectionResult(option, false);
    }
  }

  /// Return the results of the last check.
  ///
  /// The list is filled only when [hasConnection]
  /// (or [connectionStatus]) is called.
  List<AwsConnectionResult> get lastTryResults => _lastTryResults;
  List<AwsConnectionResult> _lastTryResults = <AwsConnectionResult>[];

  /// Start a request to each address in [addresses].
  /// If at least one of the addresses is accessible
  /// We assume that an Internet connection is available and return `true`.
  /// `false` otherwise.
  Future<bool> get hasConnection async {
    var requests = <Future<AwsConnectionResult>>[];

    for (var addressOptions in _addresses) {
      requests.add(isHostReachable(addressOptions));
    }
    _lastTryResults = List.unmodifiable(await Future.wait(requests));

    return _lastTryResults.map((result) => result.isSuccess).contains(true);
  }

  /// Start a request to each address.
  /// If at least one of the addresses is accessible
  /// assume there is an Internet connection available and return
  /// [AwsConnectionStatus.connected].
  /// [AwsConnectionStatus.disconnected] otherwise.
  Future<AwsConnectionStatus> get connectionStatus async {
    return await hasConnection
        ? AwsConnectionStatus.connected
        : AwsConnectionStatus.disconnected;
  }

  /// The interval between periodic checks. periodic checks
  /// only done if there is a listener attached [onStatusChange].
  /// If that's the case [onStatusChange] issues an update only if
  /// there is change from the previous state.
  ///
  /// Default is [defaultInterval] (5 seconds).
  Duration _checkInterval = defaultInterval;

  // Check the current state, compare it with the previous one, and output
  // an event only if there is a change and listeners are attached
  //
  // If there are listeners, start a timer that reruns this function
  // after the time specified in 'checkInterval'.
  Future<void> _maybeEmitStatusUpdate([Timer? timer]) async {
    // just in case
    _timerHandle?.cancel();
    timer?.cancel();

    var currentStatus = await connectionStatus;

    // only send the status update if the last status differs from the current one
    // and if someone is really listening.
    if (_lastStatus != currentStatus && _statusController.hasListener) {
      _statusController.add(currentStatus);
    }

    // start a new timer only if there are listeners.
    if (!_statusController.hasListener) return;
    _timerHandle = Timer(_checkInterval, _maybeEmitStatusUpdate);

    // update the last state
    _lastStatus = currentStatus;
  }

// _lastStatus should only be set by _maybeEmitStatusUpdate()
  // and the _statusController's.onCancel event handler
  AwsConnectionStatus? _lastStatus;
  Timer? _timerHandle;

  // handler for exposed 'onStatusChange' flow
  final StreamController<AwsConnectionStatus> _statusController =
      StreamController.broadcast();

  /// Emits an AwsConnectionStatus every 5 seconds.
  /// When all listeners are removed from `onStatusChange`, the internal
  /// the timer is canceled and the stream does not emit events.
  Stream<AwsConnectionStatus> get onStatusChange => _statusController.stream;

  /// Returns true if any listeners are attached [onStatusChange].
  bool get hasListeners => _statusController.hasListener;
}

///[AwsConnectionOption] is a class that contains the data needed to make a connection.
class AwsConnectionOption {
  final InternetAddress address;
  final int port;
  final Duration timeout;

  AwsConnectionOption({
    required this.address,
    required this.port,
    required this.timeout,
  });

  @override
  String toString() => 'AddressCheckOptions($address, $port, $timeout)';
}

/// [AwsConnectionResult] is a class that provides connection status.
class AwsConnectionResult {
  final AwsConnectionOption options;
  final bool isSuccess;

  AwsConnectionResult(
    this.options,
    this.isSuccess,
  );

  @override
  String toString() => 'AddressCheckResult($options, $isSuccess)';
}
