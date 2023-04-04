@extends('layout.main')
@section('content')
  <section>

    <div class="container-fluid">
      <a href="#" data-toggle="modal" data-target="#createModal" class="btn btn-info"><i class="dripicons-plus"></i> {{trans('file.Add Location')}}</a>
      <a href="#" data-toggle="modal" data-target="#importLocation" class="btn btn-primary"><i class="dripicons-copy"></i> {{trans('file.Import Location')}}</a>
    </div>
    <div class="table-responsive">
      <table id="location-table" class="table">
        <thead>
        <tr>
          <th class="not-exported"></th>
          <th>{{trans('file.Warehouse')}}</th>
          <th>{{trans('file.Code')}}</th>
          <th>{{trans('file.Stock Quantity')}}</th>
          <th class="not-exported">{{trans('file.action')}}</th>
        </tr>
        </thead>
        <tbody>
        @foreach($lims_location_all as $key => $location)
			<?php
			$stock_qty = 0;
			//                        App\Product_Warehouse::
			//                    join('products', 'product_warehouse.product_id', '=', 'products.id')
			//                    ->where([ ['product_warehouse.warehouse_id', $warehouse->id],
			//                              ['products.is_active', true]
			//                    ])->sum('product_warehouse.qty');
			?>
            <tr data-id="{{$location->id}}">
              <td>{{$key}}</td>
              <td>{{ $location->warehouse->name }}</td>
              <td>{{ $location->key}}</td>
              <td>{{$location->stock()}}</td>
              <td>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('file.action')}}
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                  </button>
                  <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                    <li>
                      <button type="button" data-id="{{$location->id}}" class="open-EditLocationDialog btn btn-link" data-toggle="modal" data-target="#editModal"><i class="dripicons-document-edit"></i> {{trans('file.edit')}}
                      </button>
                    </li>
                    <li class="divider"></li>
                    {{ Form::open(['route' => ['location.destroy', $location->id], 'method' => 'DELETE'] ) }}
                    <li>
                      <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> {{trans('file.delete')}}</button>
                    </li>
                    {{ Form::close() }}
                  </ul>
                </div>
              </td>
            </tr>
        @endforeach
        </tbody>
      </table>
    </div>
  </section>

  <div id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        {!! Form::open(['route' => 'location.store', 'method' => 'post']) !!}
        <div class="modal-header">
          <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Add Location')}}</h5>
          <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
        </div>
        <div class="modal-body">
          <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>

          <div class="form-group">
            <label><strong>{{trans('file.Warehouse')}} *</strong></label>
            <select name="warehouse_id" class="selectpicker form-control customer-input" data-live-search="true" data-live-search-style="begins" title="{{trans('file.Select the warehouse...')}}">
              @php
                $warehouses = \App\Warehouse::where('is_active', true)->get();
              @endphp
              @foreach($warehouses as $warehouse)
                <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
              @endforeach
            </select>
          </div>

          <div class="form-group">
            <label>{{trans('file.Shelf')}} *</label>
            <input type="text" name="shelf" class="form-control" required>
          </div>
          <div class="form-group">
            <label>{{trans('file.Section')}} *</label>
            <input type="text" name="section" class="form-control" required>
          </div>
          <div class="form-group">
            <label>{{trans('file.Row')}} *</label>
            <input type="text" name="row" class="form-control">
          </div>
          <div class="form-group">
            <label>{{trans('file.Slot')}}</label>
            <input type="text" name="slot" class="form-control">
          </div>
          <div class="form-group">
            <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
          </div>
        </div>
        {{ Form::close() }}
      </div>
    </div>
  </div>

  <div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        {!! Form::open(['route' => ['location.update', 1], 'method' => 'put']) !!}
        <div class="modal-header">
          <h5 id="exampleModalLabel" class="modal-title"> {{trans('file.Update Location')}}</h5>
          <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
        </div>
        <div class="modal-body">
          <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>

          <div class="form-group">
            <label><strong>{{trans('file.Warehouse')}} *</strong></label>
            <select name="warehouse_id" class="selectpicker form-control customer-input" data-live-search="true" data-live-search-style="begins" title="{{trans('file.Select the warehouse...')}}">
              @php
                $warehouses = \App\Warehouse::where('is_active', true)->get();
              @endphp
              @foreach($warehouses as $warehouse)
                <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
              @endforeach
            </select>
          </div>

          <input hidden type="text" name="location_id" required/>

          <div class="form-group">
            <label>{{trans('file.Shelf')}} *</label>
            <input type="text" name="shelf" class="form-control" required>
          </div>
          <div class="form-group">
            <label>{{trans('file.Section')}} *</label>
            <input type="text" name="section" class="form-control" required>
          </div>
          <div class="form-group">
            <label>{{trans('file.Row')}} *</label>
            <input type="text" name="row" class="form-control">
          </div>
          <div class="form-group">
            <label>{{trans('file.Slot')}} </label>
            <input type="text" name="slot" class="form-control">
          </div>
          <div class="form-group">
            <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
          </div>
        </div>
        {{ Form::close() }}
      </div>
    </div>
  </div>

  <div id="importLocation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        {!! Form::open(['route' => 'location.import', 'method' => 'post', 'files' => true]) !!}
        <div class="modal-header">
          <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Import Location')}}</h5>
          <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
        </div>
        <div class="modal-body">
          <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
          <p>{{trans('file.The correct column order is')}} (warehouse*, shelf, section, row, slot) {{trans('file.and you must follow this')}}.</p>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label>{{trans('file.Upload CSV File')}} *</label>
                {{Form::file('file', array('class' => 'form-control','required'))}}
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label> {{trans('file.Sample File')}}</label>
                <a href="sample_file/sample_location.csv" class="btn btn-info btn-block btn-md"><i class="dripicons-download"></i> {{trans('file.Download')}}</a>
              </div>
            </div>
          </div>
          <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
        </div>
        {{ Form::close() }}
      </div>
    </div>
  </div>


@endsection

@push('scripts')
  <script type="text/javascript">

      $("ul#setting").siblings('a').attr('aria-expanded', 'true');
      $("ul#setting").addClass("show");
      $("ul#setting #location-menu").addClass("active");

      var location_id = [];
      var user_verified = <?php echo json_encode(env('USER_VERIFIED')) ?>;

      $.ajaxSetup({
          headers: {
              'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
      });

      function confirmDelete() {
          if (confirm("Are you sure want to delete?")) {
              return true;
          }
          return false;
      }

      $(document).ready(function () {

          $(document).on('click', '.open-EditLocationDialog', function () {
              var url = "location/"
              var id = $(this).data('id').toString();
              url = url.concat(id).concat("/edit");

              $.get(url, function (data) {
                  $('#editModal [name=warehouse_id]').val(data['warehouse_id']).trigger('change');
                  $("#editModal input[name='location_id']").val(data['id']);
                  $("#editModal input[name='shelf']").val(data['shelf']);
                  $("#editModal input[name='section']").val(data['section']);
                  $("#editModal input[name='row']").val(data['row']);
                  $("#editModal input[name='slot']").val(data['slot']);
                  $("#editModal input[name='active']").val(data['active']);
              });
          });
      });

      $('#location-table').DataTable({
          "order": [],
          'language': {
              'lengthMenu': '_MENU_ {{trans("file.records per page")}}',
              "info": '<small>{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)</small>',
              "search": '{{trans("file.Search")}}',
              'paginate': {
                  'previous': '<i class="dripicons-chevron-left"></i>',
                  'next': '<i class="dripicons-chevron-right"></i>'
              }
          },
          'columnDefs': [
              {
                  "orderable": false,
                  'targets': [0, 1, 2]
              },
              {
                  'render': function (data, type, row, meta) {
                      if (type === 'display') {
                          data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                      }

                      return data;
                  },
                  'checkboxes': {
                      'selectRow': true,
                      'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                  },
                  'targets': [0]
              }
          ],
          'select': {style: 'multi', selector: 'td:first-child'},
          'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
          dom: '<"row"lfB>rtip',
          buttons: [
              {
                  extend: 'pdf',
                  text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                  exportOptions: {
                      columns: ':visible:Not(.not-exported)',
                      rows: ':visible'
                  },
              },
              {
                  extend: 'csv',
                  text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                  exportOptions: {
                      columns: ':visible:Not(.not-exported)',
                      rows: ':visible'
                  },
              },
              {
                  extend: 'print',
                  text: '<i title="print" class="fa fa-print"></i>',
                  exportOptions: {
                      columns: ':visible:Not(.not-exported)',
                      rows: ':visible'
                  },
              },
              {
                  text: '<i title="delete" class="fa fa-trash-o"></i>',
                  className: 'btn-danger',
                  className: 'btn-danger',
                  action: function (e, dt, node, config) {
                      if (user_verified == '1') {
                          location_id.length = 0;
                          $(':checkbox:checked').each(function (i) {
                              if (i) {
                                  location_id[i - 1] = $(this).closest('tr').data('id');
                              }
                          });
                          if (location_id.length && confirm("Are you sure want to delete?")) {
                              $.ajax({
                                  type: 'POST',
                                  url: 'location/deletebyselection',
                                  data: {
                                      locationIdArray: location_id
                                  },
                                  success: function (data) {
                                      alert(data);
                                  }
                              });
                              dt.rows({page: 'current', selected: true}).remove().draw(false);
                          } else if (!location_id.length)
                              alert('No Location is selected!');
                      } else
                          alert('This feature is disable for demo!');
                  }
              },
              {
                  extend: 'colvis',
                  text: '<i title="column visibility" class="fa fa-eye"></i>',
                  columns: ':gt(0)'
              },
          ],
      });

      $.ajaxSetup({
          headers: {
              'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
      });

      $("#select_all").on("change", function () {
          if ($(this).is(':checked')) {
              $("tbody input[type='checkbox']").prop('checked', true);
          } else {
              $("tbody input[type='checkbox']").prop('checked', false);
          }
      });

      $("#export").on("click", function (e) {
          e.preventDefault();
          var location = [];
          $(':checkbox:checked').each(function (i) {
              location[i] = $(this).val();
          });
          $.ajax({
              type: 'POST',
              url: '/exportlocation',
              data: {

                  locationArray: location
              },
              success: function (data) {
                  alert('Exported to CSV file successfully! Click Ok to download file');
                  window.location.href = data;
              }
          });
      });
  </script>
@endpush
