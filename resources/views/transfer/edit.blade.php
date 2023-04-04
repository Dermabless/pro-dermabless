@extends('layout.main') @section('content')
  @if(session()->has('not_permitted'))
    <div class="alert alert-danger alert-dismissible text-center">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
  @endif
  <section class="forms">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-header d-flex align-items-center">
              <h4>{{trans('file.Update Transfer')}}</h4>
            </div>
            <div class="card-body">
              <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
              {!! Form::open(['route' => ['transfers.update', $lims_transfer_data->id], 'method' => 'put', 'files' => true, 'id' => 'transfer-form']) !!}
              <div class="row">
                <div class="col-md-12">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>{{trans('file.Date')}}</label>
                        <input type="text" name="created_at" class="form-control date" value="{{date($general_setting->date_format, strtotime($lims_transfer_data->created_at->toDateString()))}}"/>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>{{trans('file.reference')}}</label>
                        <p><strong>{{ $lims_transfer_data->reference_no }}</strong></p>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>{{trans("file.Status")}}</label>
                        <input type="hidden" name="status_hidden" value="{{ $lims_transfer_data->status }}">
                        <select name="status" class="form-control selectpicker">
                          <option value="1">{{trans('file.Completed')}}</option>
                          <option value="2">{{trans('file.Pending')}}</option>
                          <option value="3">{{trans('file.Sent')}}</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>{{trans('file.From Warehouse')}} *</label>
                        <input type="hidden" name="from_warehouse_id_hidden" value="{{ $lims_transfer_data->from_warehouse_id }}"/>
                        <select id="from-warehouse-id" required name="from_warehouse_id" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins" title="Select warehouse...">
                          @foreach($lims_warehouse_list_from as $warehouse)
                            <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                          @endforeach
                        </select>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label>{{trans('file.To Warehouse')}} *</label>
                        <input type="hidden" name="to_warehouse_id_hidden" value="{{ $lims_transfer_data->to_warehouse_id }}"/>
                        <select required name="to_warehouse_id" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins" title="Select warehouse...">
                          @foreach($lims_warehouse_list_to as $warehouse)
                            <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                          @endforeach
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-md-12">
                      <label>{{trans('file.Select Product')}}</label>
                      <div class="search-box input-group">
                        <button type="button" class="btn btn-secondary btn-lg"><i class="fa fa-barcode"></i></button>
                        <input type="text" name="product_code_name" id="lims_productcodeSearch" placeholder="Please type product code and select..." class="form-control"/>
                      </div>
                    </div>
                  </div>
                  <div class="row mt-4">
                    <div class="col-md-12">

                      <ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
                        <li class="nav-item">
                          <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home"
                             role="tab" aria-controls="home" aria-selected="true">
                            <h5>{{trans('file.Order Table')}} *</h5>
                          </a>
                        </li>
                        @if($lims_transfer_data->status == 1)
                          <li class="nav-item">
                            <a class="nav-link" id="send-tab" data-toggle="tab" href="#send" role="tab" aria-controls="send" aria-selected="false">
                              <h5>{{trans('file.Location Products Send')}} *</h5>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" id="receive-tab" data-toggle="tab" href="#receive" role="tab" aria-controls="receive" aria-selected="false">
                              <h5>{{trans('file.Location Products Receive')}} *</h5>
                            </a>
                          </li>
                        @endif
                      </ul>

                      <div class="tab-content" id="myTabContent">

                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                          <div class="row">
                            <div class="col-md-12">
                              <div class="table-responsive mt-3">
                                <table id="myTable" class="table table-hover order-list">
                                  <thead>
                                  <tr>
                                    <th>{{trans('file.name')}}</th>
                                    <th>{{trans('file.Code')}}</th>
                                    <th>{{trans('file.Batch No')}}</th>
                                    <th>{{trans('file.Quantity')}}</th>
                                    <th>{{trans('file.Net Unit Cost')}}</th>
                                    <th>{{trans('file.Tax')}}</th>
                                    <th>{{trans('file.Subtotal')}}</th>
                                    <th><i class="dripicons-trash"></i></th>
                                  </tr>
                                  </thead>
                                  <tbody>
								  <?php
								  $temp_unit_name = [];
								  $temp_unit_operator = [];
								  $temp_unit_operation_value = [];
								  ?>
                                  @foreach($lims_product_transfer_data as $product_transfer)
                                    <tr>
										<?php
										$product_data = DB::table('products')->find($product_transfer->product_id);

										if ($product_transfer->variant_id) {
											$product_variant_data = \App\ProductVariant::select('id', 'item_code')->FindExactProduct($product_data->id, $product_transfer->variant_id)->first();
											$product_variant_id = $product_variant_data->id;
											$product_data->code = $product_variant_data->item_code;
										} else
											$product_variant_id = null;

										$tax = DB::table('taxes')->where('rate', $product_transfer->tax_rate)->first();

										$units = DB::table('units')->where('base_unit', $product_data->unit_id)->orWhere('id', $product_data->unit_id)->get();

										$unit_name = array();
										$unit_operator = array();
										$unit_operation_value = array();

										foreach ($units as $unit) {
											if ($product_transfer->purchase_unit_id == $unit->id) {
												array_unshift($unit_name, $unit->unit_name);
												array_unshift($unit_operator, $unit->operator);
												array_unshift($unit_operation_value, $unit->operation_value);
											} else {
												$unit_name[] = $unit->unit_name;
												$unit_operator[] = $unit->operator;
												$unit_operation_value[] = $unit->operation_value;
											}
										}
										if ($product_data->tax_method == 1) {

											$product_cost = $product_transfer->net_unit_cost / $unit_operation_value[0];
										} else {
											$product_cost = ($product_transfer->total / $product_transfer->qty) / $unit_operation_value[0];
										}


										$temp_unit_name = $unit_name = implode(",", $unit_name) . ',';

										$temp_unit_operator = $unit_operator = implode(",", $unit_operator) . ',';

										$temp_unit_operation_value = $unit_operation_value = implode(",", $unit_operation_value) . ',';
										$product_batch_data = \App\ProductBatch::select('batch_no')->find($product_transfer->product_batch_id);
										?>
                                      <td>{{$product_data->name}}
                                        <button type="button" class="edit-product btn btn-link" data-toggle="modal" data-target="#editModal"><i class="dripicons-document-edit"></i></button>
                                      </td>
                                      <td>{{$product_data->code}}</td>
                                      @if($product_batch_data)
                                        <td>
                                          <input type="hidden" class="product-batch-id" name="product_batch_id[]" value="{{$product_transfer->product_batch_id}}">
                                          <input type="text" class="form-control batch-no" name="batch_no[]" value="{{$product_batch_data->batch_no}}" required/>
                                        </td>
                                      @else
                                        <td>
                                          <input type="hidden" class="product-batch-id" name="product_batch_id[]" value="">
                                          <input type="text" class="form-control batch-no" name="batch_no[]" value="" disabled/>
                                        </td>
                                      @endif
                                      <td><input type="number" class="form-control qty" name="qty[]" value="{{$product_transfer->qty}}" required step="any"/></td>
                                      <td class="net_unit_cost">{{ number_format((float)$product_transfer->net_unit_cost, 2, '.', '') }} </td>
                                      <td class="tax">{{ number_format((float)$product_transfer->tax, 2, '.', '') }}</td>
                                      <td class="sub-total">{{ number_format((float)$product_transfer->total, 2, '.', '') }}</td>
                                      <td>
                                        <button type="button" class="ibtnDel btn btn-md btn-danger">{{trans("file.delete")}}</button>
                                      </td>
                                      <input type="hidden" class="product-id" name="product_id[]" value="{{$product_data->id}}"/>
                                      <input type="hidden" name="product_variant_id[]" value="{{$product_variant_id}}"/>
                                      <input type="hidden" class="product-code" name="product_code[]" value="{{$product_data->code}}"/>
                                      <input type="hidden" class="product-cost" name="product_cost[]" value="{{ $product_cost}}"/>
                                      <input type="hidden" class="purchase-unit" name="purchase_unit[]" value="{{$unit_name}}"/>
                                      <input type="hidden" class="purchase-unit-operator" value="{{$unit_operator}}"/>
                                      <input type="hidden" class="purchase-unit-operation-value" value="{{$unit_operation_value}}"/>
                                      <input type="hidden" class="net_unit_cost" name="net_unit_cost[]" value="{{$product_transfer->net_unit_cost}}"/>
                                      <input type="hidden" class="tax-rate" name="tax_rate[]" value="{{$product_transfer->tax_rate}}"/>
                                      @if($tax)
                                        <input type="hidden" class="tax-name" value="{{$tax->name}}"/>
                                      @else
                                        <input type="hidden" class="tax-name" value="No Tax"/>
                                      @endif
                                      <input type="hidden" class="tax-method" value="{{$product_data->tax_method}}"/>
                                      <input type="hidden" class="tax-value" name="tax[]" value="{{$product_transfer->tax}}"/>
                                      <input type="hidden" class="subtotal-value" name="subtotal[]" value="{{$product_transfer->total}}"/>
                                      <input type="hidden" class="imei-number" name="imei_number[]" value="{{$product_transfer->imei_number}}"/>
                                    </tr>
                                  @endforeach
                                  </tbody>
                                  <tfoot class="tfoot active">
                                  <th colspan="3">{{trans('file.Total')}}</th>
                                  <th id="total-qty">{{$lims_transfer_data->total_qty}}</th>
                                  <th></th>
                                  <th id="total-tax">{{ number_format((float)$lims_transfer_data->total_tax, 2, '.', '')}}</th>
                                  <th id="total">{{ number_format((float)$lims_transfer_data->total_cost, 2, '.', '')}}</th>
                                  <th><i class="dripicons-trash"></i></th>
                                  </tfoot>
                                </table>
                              </div>
                            </div>
                          </div>
                        </div>

                        @if($lims_transfer_data->status == 1)

                          <div class="tab-pane fade" id="send" role="tabpanel" aria-labelledby="send-tab">
                            <div class="table-responsive mt-3">
                              <table id="product-location-send" class="table table-hover">
                                <thead>
                                <tr>
                                  <th></th>
                                  <th style="display:none"></th>
                                  <th>{{trans('file.name')}}</th>
                                  <th>{{trans('file.Code')}}</th>
                                  <th>{{trans('file.Location')}}</th>
                                  <th>{{trans('file.Date Out')}}</th>
                                </tr>
                                </thead>
                                <tbody>
                                @php
                                  $withLocation = 0;
                                  $productTransferIds = \App\ProductTransfer::where('transfer_id', $lims_transfer_data->id)->get()->pluck('id')->toArray();
                                  $products_sales = \App\SalesLocation::whereIn('product_transfer_id', $productTransferIds)->with(['product', 'productLocation.location'])->get();
                                @endphp
                                @foreach($products_sales as $product)
                                  @php
                                    $withLocation += ($product->productLocation?1:0);
                                  @endphp
                                  <tr>
                                    <td style="width: 100px"></td>
                                    <td style="display:none">
                                      {{$product->id}}
                                    </td>
                                    <td>
                                      {{$product->product->name}}
                                    </td>
                                    <td>{{$product->product->code}}</td>
                                    <td>
                                      <span @if(!$product->productLocation ) style="display:none" @endif id="location-send-live-{{$product->id}}">
                                         <i class="fa fa-check-circle text-success"></i>
                                      </span>
                                      <span @if($product->productLocation) style="display:none" @endif id="location-send-warning-{{$product->id}}">
                                         <i class="fa fa-exclamation-triangle text-warning"></i>
                                      </span>
                                      <span id="location-send-{{$product->id}}">
                                          {{$product->productLocation?$product->productLocation->location->key:''}}
                                      </span>
                                    </td>
                                    <td>
                                      <span id="location-send-date-{{$product->id}}">
                                          {{$product->productLocation ? $product->productLocation->date_out->format('d/m/Y H:i a'):''}}
                                      </span>
                                    </td>
                                  </tr>
                                @endforeach
                                </tbody>
                                <tfoot class="tfoot active">
                                <th style="width: 200px">{{__('file.Total Receive')}}</th>
                                <th id="total-qty">{{count($products_sales)}}</th>
                                <th></th>
                                <th>{{trans('file.Total Location')}}</th>
                                <th>{{$withLocation}}</th>
                                </tfoot>
                              </table>
                            </div>
                          </div>

                          <div class="tab-pane fade" id="receive" role="tabpanel" aria-labelledby="receive-tab">
                            <div class="table-responsive mt-3">
                              <table id="product-location-received" class="table table-hover">
                                <thead>
                                <tr>
                                  <th></th>
                                  <th style="display:none"></th>
                                  <th>{{trans('file.name')}}</th>
                                  <th>{{trans('file.Code')}}</th>
                                  <th>{{trans('file.Location')}}</th>
                                  <th>{{trans('file.Date In')}}</th>
                                  <th>{{trans('file.Date Out')}}</th>
                                </tr>
                                </thead>
                                <tbody>
                                @php
                                  $withLocation = 0;
                                  $productTransferIds = \App\ProductTransfer::where('transfer_id', $lims_transfer_data->id)->get()->pluck('id')->toArray();
                                  $products_locations = \App\ProductLocation::whereIn('product_transfer_id', $productTransferIds)
                                                                              ->whereNull('before_location_id')
                                                                              ->with(['product', 'location'])
                                                                              ->get();
                                @endphp
                                @foreach($products_locations as $product)
                                  @php
                                    $withLocation += ($product->location?1:0);
                                  @endphp
                                  <tr>
                                    <td style="width: 100px">

                                    </td>
                                    <td style="display:none">
                                      {{$product->id}}
                                    </td>
                                    <td>
                                      {{$product->product->name}}
                                    </td>
                                    <td>{{$product->product->code}}</td>
                                    <td>
                                     <span @if($product->date_out || !$product->location ) style="display:none" @endif id="location-received-live-{{$product->id}}">
                                         <i class="fa fa-check-circle text-success"></i>
                                     </span>
                                      <span @if($product->date_out || $product->location) style="display:none" @endif id="location-received-warning-{{$product->id}}">
                                         <i class="fa fa-exclamation-triangle text-warning"></i>
                                      </span>
                                      <span @if(!$product->date_out) style="display:none" @endif>
                                           <i class="fa fa-minus-circle text-danger"></i>
                                       </span>
                                      <span id="location-received-{{$product->id}}">
                                          {{$product->location?$product->location->key:''}}
                                      </span>
                                    </td>
                                    <td>{{$product->created_at->format('d/m/Y H:i a')}}</td>
                                    <td>{{$product->date_out ? $product->date_out->format('d/m/Y H:i a'):''}}</td>
                                  </tr>
                                @endforeach
                                </tbody>
                                <tfoot class="tfoot active">
                                <th style="width: 200px">{{__('file.Total Receive')}}</th>
                                <th id="total-qty">{{count($products_locations)}}</th>
                                <th></th>
                                <th>{{trans('file.Total Location')}}</th>
                                <th>{{$withLocation}}</th>
                                </tfoot>
                              </table>
                            </div>
                          </div>

                        @endif
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-2">
                      <div class="form-group">
                        <input type="hidden" name="total_qty" value="{{$lims_transfer_data->total_qty}}"/>
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div class="form-group">
                        <input type="hidden" name="total_tax" value="{{$lims_transfer_data->total_tax}}"/>
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div class="form-group">
                        <input type="hidden" name="total_cost" value="{{$lims_transfer_data->total_cost}}"/>
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div class="form-group">
                        <input type="hidden" name="item" value="{{$lims_transfer_data->item}}"/>
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div class="form-group">
                        <input type="hidden" name="grand_total" value="{{$lims_transfer_data->grand_total}}"/>
                        <input type="hidden" name="paid_amount" value="{{$lims_transfer_data->paid_amount}}"/>
                        <input type="hidden" name="payment_status" value="1"/>
                      </div>
                    </div>
                  </div>
                  <div class="row mt-2">
                    <div class="col-md-4">
                      <div class="form-group">
                        <label>
                          <strong>{{trans('file.Shipping Cost')}}</strong>
                        </label>
                        <input type="number" name="shipping_cost" class="form-control" value="{{ $lims_transfer_data->shipping_cost }}" step="any"/>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-group">
                        <label>{{trans('file.Attach Document')}}</label>
                        <i class="dripicons-question" data-toggle="tooltip" title="Only jpg, jpeg, png, gif, pdf, csv, docx, xlsx and txt file is supported"></i>
                        <input type="file" name="document" class="form-control"/>
                        @if($errors->has('extension'))
                          <span>
                             <strong>{{ $errors->first('extension') }}</strong>
                          </span>
                        @endif
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>{{trans('file.Note')}}</label>
                        <textarea rows="5" class="form-control" name="note">{{ $lims_transfer_data->note }}</textarea>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary" id="submit-button">
                  </div>
                </div>
              </div>
              {!! Form::close() !!}
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <table class="table table-bordered table-condensed totals">
        <td><strong>{{trans('file.Items')}}</strong>
          <span class="pull-right" id="item">0.00</span>
        </td>
        <td><strong>{{trans('file.Total')}}</strong>
          <span class="pull-right" id="subtotal">0.00</span>
        </td>
        <td><strong>{{trans('file.Shipping Cost')}}</strong>
          <span class="pull-right" id="shipping_cost">0.00</span>
        </td>
        <td><strong>{{trans('file.grand total')}}</strong>
          <span class="pull-right" id="grand_total">0.00</span>
        </td>
      </table>
    </div>

    <div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
      <div role="document" class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 id="modal_header" class="modal-title"></h5>
            <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
          </div>
          <div class="modal-body">
            <form>
              <div class="row modal-element">
                <div class="col-md-4 form-group">
                  <label>{{trans('file.Quantity')}}</label>
                  <input type="number" name="edit_qty" class="form-control" step="any">
                </div>
                <div class="col-md-4 form-group">
                  <label>{{trans('file.Unit Cost')}}</label>
                  <input type="number" name="edit_unit_cost" class="form-control" step="any">
                </div>
                <div class="col-md-4 form-group">
                  <label>{{trans('file.Product Unit')}}</label>
                  <select name="edit_unit" class="form-control selectpicker">
                  </select>
                </div>
              </div>
              <button type="button" name="update_btn" class="btn btn-primary">{{trans('file.update')}}</button>
            </form>
          </div>
        </div>
      </div>
    </div>

    <div id="location-received-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
      <div role="document" class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <h5 id="modal_header" class="modal-title">{{(__('file.Select the location'))}}</h5>
            <button type="button" data-dismiss="modal" aria-label="Close" class="close">
              <span aria-hidden="true"><i class="dripicons-cross"></i></span>
            </button>
          </div>
          <div class="modal-body p-2">

            <label>{{trans('file.Location')}}</label>

            <select name="location-received-select" title="{{__('file.Select location...')}}" data-live-search="true" class="form-control selectpicker">
              @php
                $locations = \App\Location::where('warehouse_id', $lims_transfer_data->to_warehouse_id)->get()
              @endphp
              @foreach($locations as $location)
                <option value="{{$location->id}}">{{$location->key}}</option>
              @endforeach
            </select>
          </div>
          <div class="modal-footer text-right">
            <button type="button" name="location-received-btn" class="btn btn-primary">{{__('file.Assign Location')}}</button>
          </div>
        </div>
      </div>
    </div>

    <div id="location-send-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
      <div role="document" class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <h5 id="modal_header" class="modal-title">{{(__('file.Select the location'))}}</h5>
            <button type="button" data-dismiss="modal" aria-label="Close" class="close">
              <span aria-hidden="true"><i class="dripicons-cross"></i></span>
            </button>
          </div>
          <div class="modal-body p-2">

            <label>{{trans('file.Location')}}</label>

            <select name="location-send-select" title="{{__('file.Select location...')}}" class="form-control selectpicker">
            </select>
          </div>
          <div class="modal-footer text-right">
            <button type="button" name="location-send-btn" class="btn btn-primary">{{__('file.Assign Location')}}</button>
          </div>
        </div>
      </div>
    </div>

  </section>

@endsection

@push('scripts')
  <script type="text/javascript">
      $("ul#transfer").siblings('a').attr('aria-expanded', 'true');
      $("ul#transfer").addClass("show");
      // array data depend on warehouse
      var lims_product_array = [];
      var product_code = [];
      var product_name = [];
      var product_qty = [];

      // array data with selection
      var product_cost = [];
      var tax_rate = [];
      var tax_name = [];
      var tax_method = [];
      var unit_name = [];
      var unit_operator = [];
      var unit_operation_value = [];
      var is_imei = [];
      // temporary array
      var temp_unit_name = [];
      var temp_unit_operator = [];
      var temp_unit_operation_value = [];

      var exist_code = [];
      var exist_qty = [];
      var rowindex;
      var row_product_cost;

      var rownumber = $('table.order-list tbody tr:last').index();

      for (rowindex = 0; rowindex <= rownumber; rowindex++) {

          product_cost.push(parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-cost').val()));
          exist_code.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)').text());
          var quantity = parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val());
          exist_qty.push(quantity);
          tax_rate.push(parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-rate').val()));
          tax_name.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-name').val());
          tax_method.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-method').val());
          temp_unit_name = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit').val().split(',');
          unit_name.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit').val());
          unit_operator.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit-operator').val());
          unit_operation_value.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit-operation-value').val());
          $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit').val(temp_unit_name[0]);
      }

      $('.selectpicker').selectpicker({
          style: 'btn-link',
      });

      $('[data-toggle="tooltip"]').tooltip();

      //assigning previous value
      $('select[name="status"]').val($('input[name="status_hidden"]').val());
      $('select[name="from_warehouse_id"]').val($('input[name="from_warehouse_id_hidden"]').val());
      $('select[name="to_warehouse_id"]').val($('input[name="to_warehouse_id_hidden"]').val());
      $('.selectpicker').selectpicker('refresh');
      $('#item').text($('input[name="item"]').val() + '(' + $('input[name="total_qty"]').val() + ')');
      $('#subtotal').text(parseFloat($('input[name="total_cost"]').val()).toFixed(2));
      if (!$('input[name="shipping_cost"]').val())
          $('input[name="shipping_cost"]').val('0.00');
      $('#shipping_cost').text(parseFloat($('input[name="shipping_cost"]').val()).toFixed(2));
      $('#grand_total').text(parseFloat($('input[name="grand_total"]').val()).toFixed(2));
      $('select[name="from_warehouse_id"]').prop('disabled', true);

      var id = $('select[name="from_warehouse_id"]').val();
      $.get('../getproduct/' + id, function (data) {
          lims_product_array = [];
          product_code = data[0];
          product_name = data[1];
          product_qty = data[2];
          $.each(product_code, function (index) {
              if (exist_code.includes(product_code[index])) {
                  pos = exist_code.indexOf(product_code[index]);
                  product_qty[index] = product_qty[index] + exist_qty[pos];
              }
              lims_product_array.push(product_code[index] + ' (' + product_name[index] + ')');
          });
      });
      //assigning value end

      $('select[name="from_warehouse_id"]').on('change', function () {
          var id = $('select[name="from_warehouse_id"]').val();
          $.get('../getproduct/' + id, function (data) {
              lims_product_array = [];
              product_code = data[0];
              product_name = data[1];
              product_qty = data[2];
              $.each(product_code, function (index) {
                  lims_product_array.push(product_code[index] + ' (' + product_name[index] + ')');
              });
          });
      });

      $('#lims_productcodeSearch').on('input', function () {
          var warehouse_id = $('select[name="from_warehouse_id"]').val();
          temp_data = $('#lims_productcodeSearch').val();

          if (!warehouse_id) {
              $('#lims_productcodeSearch').val(temp_data.substring(0, temp_data.length - 1));
              alert('Please select Warehouse!');
          }
      });

      var lims_productcodeSearch = $('#lims_productcodeSearch');

      lims_productcodeSearch.autocomplete({
          source: function (request, response) {
              var matcher = new RegExp(".?" + $.ui.autocomplete.escapeRegex(request.term), "i");
              response($.grep(lims_product_array, function (item) {
                  return matcher.test(item);
              }));
          },
          response: function (event, ui) {
              if (ui.content.length == 1) {
                  var data = ui.content[0].value;
                  $(this).autocomplete("close");
                  productSearch(data);
              }
              ;
          },
          select: function (event, ui) {
              var data = ui.item.value;
              productSearch(data);
          }
      });

      //Change quantity
      $("#myTable").on('input', '.qty', function () {
          rowindex = $(this).closest('tr').index();
          checkQuantity($(this).val(), true);
      });

      $("#myTable").on("change", ".batch-no", function () {
          rowindex = $(this).closest('tr').index();
          var product_id = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-id').val();
          var warehouse_id = $('#from-warehouse-id').val();
          $.get('../../check-batch-availability/' + product_id + '/' + $(this).val() + '/' + warehouse_id, function (data) {
              if (data['message'] != 'ok') {
                  alert(data['message']);
                  $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.batch-no').val('');
                  $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-batch-id').val('');
              } else {
                  $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-batch-id').val(data['product_batch_id']);
                  code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-code').val();
                  pos = product_code.indexOf(code);
                  product_qty[pos] = data['qty'];
              }
          });
      });

      //Delete product
      $("table.order-list tbody").on("click", ".ibtnDel", function (event) {
          rowindex = $(this).closest('tr').index();
          product_cost.splice(rowindex, 1);
          tax_rate.splice(rowindex, 1);
          tax_name.splice(rowindex, 1);
          tax_method.splice(rowindex, 1);
          unit_name.splice(rowindex, 1);
          unit_operator.splice(rowindex, 1);
          unit_operation_value.splice(rowindex, 1);
          $(this).closest("tr").remove();
          calculateTotal();
      });

      //Edit product
      $("table.order-list").on("click", ".edit-product", function () {
          rowindex = $(this).closest('tr').index();
          edit();
      });

      //Update product
      $('button[name="update_btn"]').on("click", function () {
          var imeiNumbers = $("#editModal input[name=imei_numbers]").val();
          if (imeiNumbers || is_imei[rowindex]) {
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.imei-number').val(imeiNumbers);
          }

          var edit_qty = $('input[name="edit_qty"]').val();
          var edit_unit_cost = $('input[name="edit_unit_cost"]').val();

          var row_unit_operator = unit_operator[rowindex].slice(0, unit_operator[rowindex].indexOf(","));
          var row_unit_operation_value = unit_operation_value[rowindex].slice(0, unit_operation_value[rowindex].indexOf(","));

          if (row_unit_operator == '*') {
              product_cost[rowindex] = $('input[name="edit_unit_cost"]').val() / row_unit_operation_value;
          } else {
              product_cost[rowindex] = $('input[name="edit_unit_cost"]').val() * row_unit_operation_value;
          }

          var position = $('select[name="edit_unit"]').val();
          var temp_operator = temp_unit_operator[position];
          var temp_operation_value = temp_unit_operation_value[position];
          $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.purchase-unit').val(temp_unit_name[position]);
          temp_unit_name.splice(position, 1);
          temp_unit_operator.splice(position, 1);
          temp_unit_operation_value.splice(position, 1);

          temp_unit_name.unshift($('select[name="edit_unit"] option:selected').text());
          temp_unit_operator.unshift(temp_operator);
          temp_unit_operation_value.unshift(temp_operation_value);

          unit_name[rowindex] = temp_unit_name.toString() + ',';
          unit_operator[rowindex] = temp_unit_operator.toString() + ',';
          unit_operation_value[rowindex] = temp_unit_operation_value.toString() + ',';
          checkQuantity(edit_qty, false);
      });

      function productSearch(data) {
          $.ajax({
              type: 'GET',
              url: '../lims_product_search',
              data: {
                  data: data
              },
              success: function (data) {
                  var flag = 1;
                  $(".product-code").each(function (i) {
                      if ($(this).val() == data[1]) {
                          rowindex = i;
                          var qty = parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val()) + 1;
                          $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val(qty);
                          checkQuantity(String(qty), true);
                          flag = 0;
                      }
                  });
                  $("input[name='product_code_name']").val('');
                  if (flag) {
                      var newRow = $("<tr>");
                      var cols = '';
                      temp_unit_name = (data[6]).split(',');
                      cols += '<td>' + data[0] + '<button type="button" class="edit-product btn btn-link" data-toggle="modal" data-target="#editModal"> <i class="dripicons-document-edit"></i></button></td>';
                      cols += '<td>' + data[1] + '</td>';
                      if (data[11])
                          cols += '<td><input type="text" class="form-control batch-no" required/> <input type="hidden" class="product-batch-id" name="product_batch_id[]"/> </td>';
                      else
                          cols += '<td><input type="text" class="form-control batch-no" disabled/> <input type="hidden" class="product-batch-id" name="product_batch_id[]"/> </td>';
                      cols += '<td><input type="number" class="form-control qty" name="qty[]" value="1" required step="any"/></td>';
                      cols += '<td class="net_unit_cost"></td>';
                      cols += '<td class="tax"></td>';
                      cols += '<td class="sub-total"></td>';
                      cols += '<td><button type="button" class="ibtnDel btn btn-md btn-danger">{{trans("file.delete")}}</button></td>';
                      cols += '<input type="hidden" class="product-code" name="product_code[]" value="' + data[1] + '"/>';
                      cols += '<input type="hidden" class="product-id" name="product_id[]" value="' + data[9] + '"/>';
                      cols += '<input type="hidden" name="product_variant_id[]" value="' + data[10] + '"/>';
                      cols += '<input type="hidden" class="purchase-unit" name="purchase_unit[]" value="' + temp_unit_name[0] + '"/>';
                      cols += '<input type="hidden" class="net_unit_cost" name="net_unit_cost[]" />';
                      cols += '<input type="hidden" class="tax-rate" name="tax_rate[]" value="' + data[3] + '"/>';
                      cols += '<input type="hidden" class="tax-value" name="tax[]" />';
                      cols += '<input type="hidden" class="subtotal-value" name="subtotal[]" />';
                      cols += '<input type="hidden" class="imei-number" name="imei_number[]" />';

                      newRow.append(cols);
                      $("table.order-list tbody").prepend(newRow);
                      rowindex = newRow.index();
                      product_cost.splice(rowindex, 0, parseFloat(data[2]));
                      tax_rate.splice(rowindex, 0, parseFloat(data[3]));
                      tax_name.splice(rowindex, 0, data[4]);
                      tax_method.splice(rowindex, 0, data[5]);
                      unit_name.splice(rowindex, 0, data[6]);
                      unit_operator.splice(rowindex, 0, data[7]);
                      unit_operation_value.splice(rowindex, 0, data[8]);
                      is_imei.splice(rowindex, 0, data[12]);
                      checkQuantity(1, true);
                      if (data[12]) {
                          $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.edit-product').click();
                      }
                  }
              }
          });
      }

      function edit() {
          $(".imei-section").remove();
          var imeiNumbers = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.imei-number').val();
          if (imeiNumbers || is_imei[rowindex]) {
              htmlText = '<div class="col-md-12 form-group imei-section"><label>IMEI or Serial Numbers</label><input type="text" name="imei_numbers" value="' + imeiNumbers + '" class="form-control imei_number" placeholder="Type imei or serial numbers and separate them by comma. Example:1001,2001" step="any"></div>';
              $("#editModal .modal-element").append(htmlText);
          }

          var row_product_name = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(1)').text();
          var row_product_code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)').text();
          $('#modal_header').text(row_product_name + '(' + row_product_code + ')');

          var qty = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val();
          $('input[name="edit_qty"]').val(qty);

          unitConversion();
          $('input[name="edit_unit_cost"]').val(row_product_cost.toFixed(2));

          temp_unit_name = (unit_name[rowindex]).split(',');
          temp_unit_name.pop();
          temp_unit_operator = (unit_operator[rowindex]).split(',');
          temp_unit_operator.pop();
          temp_unit_operation_value = (unit_operation_value[rowindex]).split(',');
          temp_unit_operation_value.pop();
          $('select[name="edit_unit"]').empty();
          $.each(temp_unit_name, function (key, value) {
              $('select[name="edit_unit"]').append('<option value="' + key + '">' + value + '</option>');
          });
          $('.selectpicker').selectpicker('refresh');
      }

      function checkQuantity(purchase_qty, flag) {
          var row_product_code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)').text();
          var pos = product_code.indexOf(row_product_code);
          var operator = unit_operator[rowindex].split(',');
          var operation_value = unit_operation_value[rowindex].split(',');
          if (operator[0] == '*')
              total_qty = purchase_qty * operation_value[0];
          else if (operator[0] == '/')
              total_qty = purchase_qty / operation_value[0];
          if (total_qty > parseFloat(product_qty[pos])) {
              alert('Quantity exceeds stock quantity!');
              if (flag) {
                  purchase_qty = purchase_qty.substring(0, purchase_qty.length - 1);
                  $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val(purchase_qty);
              } else {
                  edit();
                  return;
              }
          } else {
              $('#editModal').modal('hide');
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val(purchase_qty);
          }
          calculateRowProductData(purchase_qty);
      }

      function calculateRowProductData(quantity) {
          unitConversion();
          $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-rate').val(tax_rate[rowindex].toFixed(2));

          if (tax_method[rowindex] == 1) {
              var net_unit_cost = row_product_cost;
              var tax = net_unit_cost * quantity * (tax_rate[rowindex] / 100);
              var sub_total = (net_unit_cost * quantity) + tax;

              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_cost').text(net_unit_cost.toFixed(2));
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_cost').val(net_unit_cost.toFixed(2));
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax').text(tax.toFixed(2));
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-value').val(tax.toFixed(2));
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sub-total').text(sub_total.toFixed(2));
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.subtotal-value').val(sub_total.toFixed(2));
          } else {

              var sub_total_unit = row_product_cost;
              var net_unit_cost = (100 / (100 + tax_rate[rowindex])) * sub_total_unit;
              var tax = (sub_total_unit - net_unit_cost) * quantity;
              var sub_total = sub_total_unit * quantity;

              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_cost').text(net_unit_cost.toFixed(2));
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_cost').val(net_unit_cost.toFixed(2));
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax').text(tax.toFixed(2));
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-value').val(tax.toFixed(2));
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sub-total').text(sub_total.toFixed(2));
              $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.subtotal-value').val(sub_total.toFixed(2));
          }

          calculateTotal();
      }

      function unitConversion() {
          var row_unit_operator = unit_operator[rowindex].slice(0, unit_operator[rowindex].indexOf(","));
          var row_unit_operation_value = unit_operation_value[rowindex].slice(0, unit_operation_value[rowindex].indexOf(","));

          if (row_unit_operator == '*') {
              row_product_cost = product_cost[rowindex] * row_unit_operation_value;
          } else {
              row_product_cost = product_cost[rowindex] / row_unit_operation_value;
          }
      }

      function calculateTotal() {
          //Sum of quantity
          var total_qty = 0;
          $(".qty").each(function () {

              if ($(this).val() == '') {
                  total_qty += 0;
              } else {
                  total_qty += parseFloat($(this).val());
              }
          });
          $("#total-qty").text(total_qty);
          $('input[name="total_qty"]').val(total_qty);

          //Sum of tax
          var total_tax = 0;
          $(".tax").each(function () {
              total_tax += parseFloat($(this).text());
          });
          $("#total-tax").text(total_tax.toFixed(2));
          $('input[name="total_tax"]').val(total_tax.toFixed(2));

          //Sum of subtotal
          var total = 0;
          $(".sub-total").each(function () {
              total += parseFloat($(this).text());
          });
          $("#total").text(total.toFixed(2));
          $('input[name="total_cost"]').val(total.toFixed(2));

          calculateGrandTotal();
      }

      function calculateGrandTotal() {

          var item = $('table.order-list tbody tr:last').index();

          var total_qty = parseFloat($('#total-qty').text());
          var subtotal = parseFloat($('#total').text());
          var shipping_cost = parseFloat($('input[name="shipping_cost"]').val());

          if (!shipping_cost)
              shipping_cost = 0.00;

          item = ++item + '(' + total_qty + ')';

          var grand_total = (subtotal + shipping_cost);

          $('#item').text(item);
          $('input[name="item"]').val($('table.order-list tbody tr:last').index() + 1);
          $('#subtotal').text(subtotal.toFixed(2));
          $('#shipping_cost').text(shipping_cost.toFixed(2));
          $('#grand_total').text(grand_total.toFixed(2));
          $('input[name="grand_total"]').val(grand_total.toFixed(2));
      }

      $('input[name="shipping_cost"]').on("input", function () {
          calculateGrandTotal();
      });

      $(window).keydown(function (e) {
          if (e.which == 13) {
              var $targ = $(e.target);
              if (!$targ.is("textarea") && !$targ.is(":button,:submit")) {
                  var focusNext = false;
                  $(this).find(":input:visible:not([disabled],[readonly]), a").each(function () {
                      if (this === e.target) {
                          focusNext = true;
                      } else if (focusNext) {
                          $(this).focus();
                          return false;
                      }
                  });
                  return false;
              }
          }
      });

      $('#transfer-form').on('submit', function (e) {
          $('select[name="from_warehouse_id"]').prop('disabled', false);
          var rownumber = $('table.order-list tbody tr:last').index();
          if (rownumber < 0) {
              alert("Please insert product to order table!")
              e.preventDefault();
              $('select[name="from_warehouse_id"]').prop('disabled', true);
          } else if ($('select[name="from_warehouse_id"]').val() == $('select[name="to_warehouse_id"]').val()) {
              alert('Both Warehouse can not be same!');
              e.preventDefault();
              $('select[name="from_warehouse_id"]').prop('disabled', true);
          } else {
              $("#submit-button").prop('disabled', true);
          }
      });

      $.ajaxSetup({
          headers: {
              'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
      });

      $('#product-location-received').DataTable({
          "bPaginate": false,
          "bLengthChange": false,
          "bFilter": true,
          "bInfo": false,
          "bAutoWidth": false,
          'columnDefs': [
              {
                  "orderable": false,
                  'targets': [0]
              },
              {
                  'render': function (data, type, row, meta) {
                      return '<div class="checkbox"><input id="' + row[1] + '" type="checkbox" class="dt-checkboxes dt-received"><label></label></div>';
                  },
                  'checkboxes': {
                      'selectRow': true,
                      'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes dt-received"><label></label></div>'
                  },
                  'targets': [0]
              }
          ],
          'select': {style: 'multi', selector: 'td:first-child'}
      });

      $("#product-location-received_filter").append('<a href="#location-received-modal" data-target="#location-received-modal" data-toggle="modal" class="btn btn-primary" style="height:31px; padding-top: 4px; margin-left: 10px;"> {{__('file.Location')}}</a>')

      $('[name=location-received-btn]').click(function () {

          if (!$('[name=location-received-select]').val()) {
              alert('{{__('files.Please select a location and try again')}}');
              return;
          }

          var data = $('.dt-received:checked');
          var ids = [];

          for (var i = 0; i < data.length; i++) {
              var row = data[i];
              if ($(row).attr('id')) {
                  ids.push($(row).attr('id'));
              }
          }

          if (ids.length == 0) {
              alert('{{__('files.Please select a product from table to assign location')}}');
              return;
          }

          $.ajax({
              type: 'POST',
              url: '{{url('transfers/assignLocationsReceive')}}',
              data: {
                  location_id: $('[name=location-received-select]').val(),
                  productLocationIds: JSON.stringify(ids)
              },
              success: function (data) {
                  if (data.success) {
                      for (var i = 0; i < ids.length; i++) {
                          $(`#location-received-${ids[i]}`).html(data.location.key);
                          $(`#location-received-live-${ids[i]}`).show();
                          $(`#location-received-warning-${ids[i]}`).hide();
                      }
                      $("#location-received-modal .close").click()
                  }
              }
          });
      })

      $('#product-location-send').DataTable({
          "bPaginate": false,
          "bLengthChange": false,
          "bFilter": true,
          "bInfo": false,
          "bAutoWidth": false,
          'columnDefs': [
              {
                  "orderable": false,
                  'targets': [0]
              },
              {
                  'render': function (data, type, row, meta) {
                      return '<div class="checkbox"><input id="' + row[1] + '" type="checkbox" class="dt-checkboxes dt-send"><label></label></div>';
                  },
                  'checkboxes': {
                      'selectRow': true,
                      'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes dt-send"><label></label></div>'
                  },
                  'targets': [0]
              }
          ],
          'select': {style: 'os', selector: 'td:first-child'}
      });

      $("#product-location-send_filter").append('<a id="btn-modal-location-send" disabled href="#location-send-modal" data-target="#location-send-modal" data-toggle="modal" class="btn btn-primary" style="height:31px; padding-top: 4px; margin-left: 10px;"> {{__('file.Location')}}</a>')

      var salesSelectedId = null;
      $('.dt-send').click(function () {

          var id = $(this).attr('id');
          if (id) {
              $('#btn-modal-location-send').removeClass('disabled');

              var selections = $('.dt-send:checked');

              for (var i = 0; i < selections.length; i++) {
                  var row = selections[i];
                  if ($(row).attr('id') != id) {
                      $(row).prop('checked', false);
                  }
              }
          }
          var selections = $('.dt-send:checked');
          if (selections.length == 0) {
              $('#btn-modal-location-send').addClass('disabled');
          } else {
              getProductInWarehouse(id, {{$lims_transfer_data->from_warehouse_id}})
          }
      });

      var checkbox = $('.dt-send');
      for (var i = 0; i < checkbox.length; i++) {
          var row = checkbox[i];
          if (!$(row).attr('id')) {
              $(row).parent().hide();
          }
      }

      $('#btn-modal-location-send').addClass('disabled');

      function getProductInWarehouse(saleLocationId, saleWarehouseId) {

          salesSelectedId = null;
          $.ajax({
              type: 'POST',
              url: '{{url('transfers/productInWarehouseSend')}}',
              data: {
                  sales_location_id: saleLocationId,
                  sales_warehouse_id: saleWarehouseId
              },
              success: function (result) {
                  if (result.success) {

                      $("[name=location-send-select]").find('option').remove();
                      $("[name=location-send-select]").selectpicker("refresh");

                      if (result.data.length > 0) {
                          for (var i = 0; i < result.data.length; i++) {
                              var row = result.data[i];
                              var desc = row.name + ' [' + row.code + '] ';
                              $("[name=location-send-select]").append(`<option value="${row.id}">${row.key} - (${row.count} ${desc})</option>`);
                              $('[name=location-send-select]').selectpicker("refresh");
                          }
                          salesSelectedId = saleLocationId;
                      }

                  }
              }
          });
      }

      $('[name=location-send-btn]').click(function () {

          if (!$('[name=location-send-select]').val()) {
              alert('{{__('files.Please select a location and try again')}}');
              return;
          }

          $.ajax({
              type: 'POST',
              url: '{{url('transfers/assignLocationsSend')}}',
              data: {
                  location_id: $('[name=location-send-select]').val(),
                  sales_warehouse_id: {{$lims_transfer_data->from_warehouse_id}},
                  sales_location_id: salesSelectedId
              },
              success: function (data) {
                  if (data.success) {
                      $(`#location-send-${salesSelectedId}`).html(data.location.key);
                      $(`#location-send-date-${salesSelectedId}`).html(data.date_out);
                      $(`#location-send-live-${salesSelectedId}`).show();
                      $(`#location-send-warning-${salesSelectedId}`).hide();
                      $("#location-send-modal .close").click()
                  }
              }
          });
      })
  </script>
@endpush
