<div>
    <div class="card border-0 shadow-sm">
        <div class="card-body">
            <div>
                @if (session()->has('message'))
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <div class="alert-body">
                            <span>{{ session('message') }}</span>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                    </div>
                @endif

                <div class="form-group">
                    <!-- TODO: finish dynamic name search -->
                    <div class="input-group mb-1">
                        <div class="input-group-prepend">
                            <a href="{{ route('customers.create') }}" class="btn btn-primary">
                                <i class="bi bi-person-plus"></i>
                            </a>
                        </div>
                        <input type="text" name="customer-name-autocomplete" id="customer-name-autocomplete"
                            placeholder="Type customer name..." class="form-control dropdown-toggle hs-searchbox"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" autocomplete="off"
                            onkeyup="dynamicNameSearch(event, {{$customers}})">
                        <div class="dropdown hierarchy-select w-100" id="example">
                            <div class="dropdown-menu w-75 shadow p-3 mb-5 bg-white rounded" aria-labelledby="example-two-button">
                                <div class="hs-menu-inner" style="max-height: 300px; overflow-y: scroll;">
                                    <a id="customers-dropdown-item-prompt" class="dropdown-item" data-value="" data-default-selected="">Select Customer</a>
                                    @foreach($customers as $customer)
                                        <a class="dropdown-item customers-dropdown-item" data-value="{{ $customer->id }}" 
                                            onclick="populateCustomerInputWithClicked(this)" wire:click.prevent="selectCustomer({{ $customer->id }})">
                                            {{ $customer->customer_name }}
                                        </a>
                                    @endforeach
                                    <span id="dropdown-item-no-match-dropdown" class="dropdown-item d-none">No matches found</span>
                                    <a id="create-new-user-from-pos-dropdown" class="dropdown-item d-none text-danger" data-toggle="modal" data-target="#createCustomerModal">Create Customer</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- TODO: finish dynamic name search -->

                    <!-- TODO: remove legacy select customers dropdown start -->
                    <!-- 
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <a href="{{ route('customers.create') }}" class="btn btn-primary">
                                <i class="bi bi-person-plus"></i>
                            </a>
                        </div>
                        <select wire:model="customer_id" id="customer_id" class="form-control">
                            <option value="" selected>Select Customer</option>
                            @foreach($customers as $customer)
                                <option value="{{ $customer->id }}">{{ $customer->customer_name }}</option>
                            @endforeach
                        </select>
                    </div> -->
                    <!-- TODO: remove legacy select customers dropdown end -->
                </div>

                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr class="text-center">
                            <th class="align-middle">Product</th>
                            <th class="align-middle">Price</th>
                            <th class="align-middle">Quantity</th>
                            <th class="align-middle">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @if($cart_items->isNotEmpty())
                            @foreach($cart_items as $cart_item)
                                <tr>
                                    <td class="align-middle">
                                        {{ $cart_item->name }} <br>
                                        <span class="badge badge-success">
                                        {{ $cart_item->options->code }}
                                    </span>
                                        @include('livewire.includes.product-cart-modal')
                                    </td>

                                    <td class="align-middle">
                                        {{ format_currency($cart_item->price) }}
                                    </td>

                                    <td class="align-middle">
                                        @include('livewire.includes.product-cart-quantity')
                                    </td>

                                    <td class="align-middle text-center">
                                        <a href="#" wire:click.prevent="removeItem('{{ $cart_item->rowId }}')">
                                            <i class="bi bi-x-circle font-2xl text-danger"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        @else
                            <tr>
                                <td colspan="8" class="text-center">
                        <span class="text-danger">
                            Please search & select products!
                        </span>
                                </td>
                            </tr>
                        @endif
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tr>
                                <th>Order Tax ({{ $global_tax }}%)</th>
                                <td>(+) {{ format_currency(Cart::instance($cart_instance)->tax()) }}</td>
                            </tr>
                            <tr>
                                <th>Discount ({{ $global_discount }}%)</th>
                                <td>(-) {{ format_currency(Cart::instance($cart_instance)->discount()) }}</td>
                            </tr>
                            <tr>
                                <th>Shipping</th>
                                <input type="hidden" value="{{ $shipping }}" name="shipping_amount">
                                <td>(+) {{ format_currency($shipping) }}</td>
                            </tr>
                            <tr class="text-primary">
                                <th>Grand Total</th>
                                @php
                                    $total_with_shipping = Cart::instance($cart_instance)->total() + (float) $shipping
                                @endphp
                                <th>
                                    (=) {{ format_currency($total_with_shipping) }}
                                </th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="col-lg-4">
                    <div class="form-group">
                        <label for="tax_percentage">Order Tax (%)</label>
                        <input wire:model.lazy="global_tax" type="number" class="form-control" min="0" max="100" value="{{ $global_tax }}" required>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="form-group">
                        <label for="discount_percentage">Discount (%)</label>
                        <input wire:model.lazy="global_discount" type="number" class="form-control" min="0" max="100" value="{{ $global_discount }}" required>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="form-group">
                        <label for="shipping_amount">Shipping</label>
                        <input wire:model.lazy="shipping" type="number" class="form-control" min="0" value="0" required step="0.01">
                    </div>
                </div>
            </div>

            <div class="form-group d-flex justify-content-center flex-wrap mb-0">
                <button wire:click="resetCart" type="button" class="btn btn-pill btn-danger mr-3"><i class="bi bi-x"></i> Reset</button>
                <button wire:loading.attr="disabled" wire:click="proceed" type="button" class="btn btn-pill btn-primary" {{  $total_amount == 0 ? 'disabled' : '' }}><i class="bi bi-check"></i> Proceed</button>
            </div>
        </div>
    </div>

    {{--Checkout Modal--}}
    @include('livewire.pos.includes.checkout-modal')

    {{--Create Customer Modal--}}
    @include('livewire.pos.includes.create-customer-modal')

</div>

<script>
    function dynamicNameSearch(e, arr) {
        var isCustomerFound = false;
        var customerCounter = 0;
        // TODO: rework below method
        // turn off all dropdown items
        for (var j = 0; j < document.getElementsByClassName("customers-dropdown-item").length; j++) {
            document.getElementsByClassName("customers-dropdown-item")[j].style.display = "none";
        }
        document.getElementById("customers-dropdown-item-prompt").style.display = "block";

        // hide Create New User Btn and No matches span
        if (document.getElementById("create-new-user-from-pos-dropdown").classList.contains("d-block")) {
            document.getElementById("create-new-user-from-pos-dropdown").classList.remove("d-block");
            document.getElementById("create-new-user-from-pos-dropdown").classList.add("d-none");
        }

        // turn dropdowns on one by one if matches
        for (var i = 0; i < arr.length; i++) {
            if (arr[i].customer_name.includes(e.target.value)) {
                for (var j = 0; j < document.getElementsByClassName("customers-dropdown-item").length; j++) {
                    if (document.getElementsByClassName("customers-dropdown-item")[j].innerText == arr[i].customer_name) {
                        document.getElementsByClassName("customers-dropdown-item")[j].style.display = "block";
                        customerCounter++;
                    }
                }
                isCustomerFound = true;
            }
        }
        
        // when customer is not found
        if (customerCounter < 1) {
            document.getElementById("customers-dropdown-item-prompt").style.display = "none";
            if (document.getElementById("create-new-user-from-pos-dropdown").classList.contains("d-none")) {
                document.getElementById("create-new-user-from-pos-dropdown").classList.remove("d-none");
                document.getElementById("create-new-user-from-pos-dropdown").classList.add("d-block");
            }

            if (document.getElementById("dropdown-item-no-match-dropdown").classList.contains("d-none")) {
                document.getElementById("dropdown-item-no-match-dropdown").classList.remove("d-none");
                document.getElementById("dropdown-item-no-match-dropdown").classList.add("d-block");
            }
        }
    }

    function populateCustomerInputWithClicked(event) {
        let currentElement = document.getElementById("customer-name-autocomplete");
        currentElement.value = event.innerText;
        setSelectValue(event.getAttribute('data-value'));
    }

    function setSelectValue(valueToSelect) {
        let element = document.getElementById('customer_id');
        element.value = valueToSelect;
        console.log(element.value);
    }
</script>