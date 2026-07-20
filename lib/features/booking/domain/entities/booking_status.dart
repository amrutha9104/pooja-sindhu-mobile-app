enum BookingStatus {
  draft,
  pendingPayment,
  confirmed,
  paymentFailed,
  cancelled,
  completed;

  bool get isCancellable => this == confirmed || this == pendingPayment;
  bool get isReviewable => this == completed;
}
