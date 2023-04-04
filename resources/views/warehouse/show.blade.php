@extends('layout.main')

@section('content')
  <section class="forms">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-header d-flex align-items-center">
              <h4>{{trans('file.Warehouse Detail')}}</h4>
            </div>
            <div class="card-body">

              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">
                    <h5>{{trans('file.General Data')}} *</h5>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">
                    <h5>{{trans('file.Locations')}} *</h5>
                  </a>
                </li>
              </ul>

              <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                  <div class="row mt-5">
                    <div class="col-md-12">
                      <div class="row">
                        <div class="col-md-4">
                          <div class="form-group">
                            <strong>{{trans('file.name')}}</strong>
                            <div class="input-group">
                              {{$lims_warehouse_data->name}}
                            </div>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <strong>{{trans('file.Phone Number')}}</strong>
                          <div class="form-group">
                            {{$lims_warehouse_data->phone}}
                          </div>
                        </div>
                        <div class="col-md-4">
                          <strong>{{trans('file.Email')}}</strong>
                          <div class="form-group">
                            {{$lims_warehouse_data->email}}
                          </div>
                        </div>
                        <div class="col-md-4">
                          <strong>{{trans('file.Address')}}</strong>
                          <div class="form-group">
                            {{$lims_warehouse_data->address}}
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                  <div class="table-responsive mt-3">
                    <table id="product-data-table" class="table table-hover">
                      <thead>
                      <tr>
                        <th>{{trans('file.name')}}</th>
                        <th>{{trans('file.Code')}}</th>
                        <th>{{trans('file.Location')}}</th>
                        <th>{{trans('file.Document')}}</th>
                        <th>{{trans('file.Date In')}}</th>
                      </tr>
                      </thead>
                      <tbody>
                      @php
                        $withLocation = 0;
                        $products_locations = \App\ProductLocation::whereNull('date_out')
                        ->leftjoin('location', 'location.id', '=', 'product_locations.location_id')
                        ->where('warehouse_id',$lims_warehouse_data->id)
                        ->with([
                          'product',
                          'productPurchase.purchase',
                          'productTransfer.transfer',
                          'location'
                        ])->get();
                      @endphp
                      @foreach($products_locations as $product)
                        @php
                          $withLocation += ($product->location_id?1:0);
                        @endphp
                        <tr>
                          <td>
                            {{$product->product->name}}
                          </td>
                          <td>{{$product->product->code}}</td>
                          <td>
                            @if(!$product->location )
                              <i class="fa fa-exclamation-triangle text-warning"> {{$product->location?$product->location->key:''}}</i>
                            @else
                              <i class="fa fa-check-circle text-success"> {{$product->location?$product->location->key:''}}</i>
                            @endif

                          </td>
                          <td>
                            @if($product->product_purchase_id && $product->productPurchase && $product->productPurchase->purchase)
                              <a href="{{url('purchases/'.$product->productPurchase->purchase->id.'/edit')}}">{{$product->productPurchase->purchase->reference_no}}</a>
                            @elseif($product->product_transfer_id && $product->productTransfer && $product->productTransfer->transfer)
                              <a href="{{url('transfers/'.$product->productTransfer->transfer->id.'/edit')}}">{{$product->productTransfer->transfer->reference_no}}</a>
                            @endif
                          </td>
                          <td>{{$product->created_at->format('d/m/Y H:i a')}}</td>
                        </tr>
                      @endforeach
                      </tbody>
                      <tfoot class="tfoot active">
                      <th style="width: 200px">{{__('file.Total Product')}}</th>
                      <th id="total-qty">{{count($products_locations)}}</th>
                      <th></th>
                      <th>{{trans('file.Total Location')}}</th>
                      <th>{{$withLocation}}</th>
                      </tfoot>
                    </table>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

@endsection

@push('scripts')
  <script type="text/javascript">

      $('#product-data-table').DataTable({
          "sPaginationType": "full_numbers",
          dom: '<"row"lfB>rtip',
          buttons: [
              {
                  extend: 'pdf',
                  text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                  exportOptions: {
                      columns: ':visible:not(.not-exported)',
                      rows: ':visible',
                      stripHtml: false,
                      format: {
                          body: function (data, row, column, node) {
                              return data.replace(/<.*?>/ig, "")
                          }
                      }
                  },
                  customize: function (doc) {
                      for (var i = 1; i < doc.content[1].table.body.length; i++) {
                          if (doc.content[1].table.body[i][0].text.indexOf('<img src=') !== -1) {
                              var imagehtml = doc.content[1].table.body[i][0].text;
                              var regex = /<img.*?src=['"](.*?)['"]/;
                              var src = regex.exec(imagehtml)[1];
                              var tempImage = new Image();
                              tempImage.src = src;
                              var canvas = document.createElement("canvas");
                              canvas.width = tempImage.width;
                              canvas.height = tempImage.height;
                              var ctx = canvas.getContext("2d");
                              ctx.drawImage(tempImage, 0, 0);
                              var imagedata = canvas.toDataURL("image/png");
                              delete doc.content[1].table.body[i][0].text;
                              doc.content[1].table.body[i][0].image = imagedata;
                              doc.content[1].table.body[i][0].fit = [30, 30];
                          }
                      }
                  },
              },
              {
                  extend: 'csv',
                  text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                  exportOptions: {
                      columns: ':visible:not(.not-exported)',
                      rows: ':visible',
                      format: {
                          body: function (data, row, column, node) {
                              return data.replace(/<.*?>/ig, "")
                          }
                      }
                  }
              },
              {
                  extend: 'print',
                  text: '<i title="print" class="fa fa-print"></i>',
                  exportOptions: {
                      columns: ':visible:not(.not-exported)',
                      rows: ':visible',
                      stripHtml: false
                  }
              }
          ],
      });

  </script>
@endpush
