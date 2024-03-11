enum OrderStatus {
  neww,
  pending,
  confirmed,
  dispatched,
  completed,
  canceled;

  factory OrderStatus.fromString(String status) {
    switch (status) {
      case 'new':
        return neww;
      case 'pending':
        return pending;
      case 'confirmed':
        return confirmed;
      case 'dispatched':
        return dispatched;
      case 'completed':
        return completed;
      case 'canceled':
        return canceled;
      default:
        throw Exception('Invalid order status');
    }
  }

  String get string {
    switch (this) {
      case neww:
        return 'New';
      case pending:
        return 'Pending';
      case confirmed:
        return 'Confirmed';
      case dispatched:
        return 'Dispatched';
      case completed:
        return 'Completed';
      case canceled:
        return 'Canceled';
    }
  }

  String get stringDB {
    switch (this) {
      case neww:
        return 'new';
      case pending:
        return 'pending';
      case confirmed:
        return 'confirmed';
      case dispatched:
        return 'dispatched';
      case completed:
        return 'completed';
      case canceled:
        return 'canceled';
    }
  }

  bool get showEditFlag {
    if (this == neww || this == pending) {
      return true;
    }

    return false;
  }
}
