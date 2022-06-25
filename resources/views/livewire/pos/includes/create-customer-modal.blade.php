<!-- Modal -->
<div class="modal fade" id="createCustomerModal" tabindex="-1" role="dialog" aria-labelledby="createCustomerModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createCustomerModalLabel">Create Customer</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="{{ route('customers.quick-store') }}" method="POST">
        @csrf
        <div class="modal-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="customer_name">Customer Name <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" name="customer_name" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="customer_email">Email</label>
                                            <input type="email" class="form-control" name="customer_email">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="customer_phone">Phone <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" name="customer_phone" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="city">Cell Group</label>
                                            <input type="text" class="form-control" name="city">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="country">Department</label>
                                            <input type="text" class="form-control" name="country">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="address">Address</label>
                                            <input type="text" class="form-control" name="address">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <div class="col-lg-12">
                @include('utils.alerts')
                <div class="form-group">
                    <button class="btn btn-primary">Create Customer <i class="bi bi-check"></i></button>
                </div>
            </div>
        </div>
      </form>
    </div>
  </div>
</div>