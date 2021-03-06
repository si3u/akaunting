@extends('layouts.admin')

@section('title', trans('general.title.new', ['type' => trans_choice('general.invoices', 1)]))

@section('content')
<!-- Default box -->
<div class="box box-success">
    {!! Form::open(['url' => 'incomes/invoices', 'files' => true, 'role' => 'form']) !!}

    <div class="box-body">
        <div class="form-group col-md-6 required {{ $errors->has('customer_id') ? 'has-error' : ''}}">
            {!! Form::label('customer_id', trans_choice('general.customers', 1), ['class' => 'control-label']) !!}
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-user"></i></div>
                {!! Form::select('customer_id', $customers, null, array_merge(['class' => 'form-control', 'placeholder' => trans('general.form.select.field', ['field' => trans_choice('general.customers', 1)])])) !!}
                <span class="input-group-btn">
                    <button type="button" onclick="createCustomer();" class="btn btn-primary">{{ trans('general.add_new') }}</button>
                </span>
            </div>
            {!! $errors->first('customer_id', '<p class="help-block">:message</p>') !!}
        </div>

        {{ Form::selectGroup('currency_code', trans_choice('general.currencies', 1), 'exchange', $currencies, setting('general.default_currency')) }}

        {{ Form::textGroup('invoiced_at', trans('invoices.invoice_date'), 'calendar',['id' => 'invoiced_at', 'class' => 'form-control', 'required' => 'required', 'data-inputmask' => '\'alias\': \'yyyy/mm/dd\'', 'data-mask' => ''], Date::now()->toDateString()) }}

        {{ Form::textGroup('due_at', trans('invoices.due_date'), 'calendar',['id' => 'due_at', 'class' => 'form-control', 'required' => 'required', 'data-inputmask' => '\'alias\': \'yyyy/mm/dd\'', 'data-mask' => '']) }}

        {{ Form::textGroup('invoice_number', trans('invoices.invoice_number'), 'file-text-o', ['required' => 'required'], $number) }}

        {{ Form::textGroup('order_number', trans('invoices.order_number'), 'shopping-cart', []) }}

        {{ Form::textGroup('loai_vai', trans('general.loai_vai'), '', []) }}
        {{ Form::textGroup('kieu_dang', trans('general.kieu_dang'), '', []) }}
        {{ Form::textGroup('size_total', trans_choice('general.sizes', 1), '', ['readonly' => 'readonly']) }}

        {{ Form::textGroup('mau_sac', trans('general.mau_sac'), '', []) }}
        {{ Form::textGroup('mat_truoc', trans('general.mat_truoc'), '', []) }}
        {{ Form::textGroup('mat_sau', trans('general.mat_sau'), '', []) }}
        {{ Form::textGroup('bung', trans('general.bung'), '', []) }}
        {{ Form::textGroup('co', trans('general.co'), '', []) }}
        {{ Form::textGroup('tay', trans('general.tay'), '', []) }}
        {{ Form::textGroup('hong', trans('general.hong'), '', []) }}
        {{ Form::textGroup('lai_ao', trans('general.lai_ao'), '', []) }}
        {{ Form::textGroup('quan', trans('general.quan'), '', []) }}

        <div class="form-group col-md-12">
            {!! Form::label('items', 'Items', ['class' => 'control-label']) !!}
            <div class="table-responsive">
                <table class="table table-bordered" id="items">
                    <thead>
                        <tr style="background-color: #f9f9f9;">
                            <th width="5%"  class="text-center">{{ trans('general.actions') }}</th>
                            <th width="40%" class="text-left">{{ trans('general.name') }}</th>
                            <th width="10%" class="text-right">{{ trans('invoices.number_shirt') }}</th>
                            <th width="15%" class="text-right">{{ trans_choice('general.sizes', 1) }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $item_row = 0; ?>
                        <tr id="item-row-{{ $item_row }}">
                            <td class="text-center" style="vertical-align: middle;">
                                <button type="button" onclick="$(this).tooltip('destroy'); $('#item-row-{{ $item_row }}').remove();" data-toggle="tooltip" title="{{ trans('general.delete') }}" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i></button>
                            </td>
                            <td>
                                <input class="form-control typeahead" placeholder="{{ trans('general.form.enter', ['field' => trans_choice('invoices.item_name', 1)]) }}" name="item[{{ $item_row }}][name]" type="text" id="item-name-{{ $item_row }}">
                                <input name="item[{{ $item_row }}][item_id]" type="hidden" id="item-id-{{ $item_row }}">
                            </td>
                            <td>
                                <input class="form-control text-right" name="item[{{ $item_row }}][number_shirt]" type="text" id="item-number-shirt-{{ $item_row }}">
                            </td>
                            <td>
                                {!! Form::select('item[' . $item_row . '][size_id]', $sizes, setting('general.default_size'), ['id'=> 'item-size-'. $item_row, 'class' => 'form-control select2', 'placeholder' => trans('general.form.select.field', ['field' => trans_choice('general.sizes', 1)])]) !!}
                            </td>
                        </tr>
                        <?php $item_row++; ?>
                        <tr id="addItem">
                            <td class="text-center"><button type="button" onclick="addItem();" data-toggle="tooltip" title="{{ trans('general.add') }}" class="btn btn-xs btn-primary" data-original-title="{{ trans('general.add') }}"><i class="fa fa-plus"></i></button></td>
                            <td class="text-right" colspan="5"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        {{ Form::textareaGroup('notes', trans_choice('general.notes', 2)) }}

        {{ Form::fileGroup('attachment', trans('general.attachment')) }}
    </div>
    <!-- /.box-body -->

    <div class="box-footer">
        {{ Form::saveButtons('incomes/invoices') }}
    </div>
    <!-- /.box-footer -->

    {!! Form::close() !!}
</div>
@endsection

@push('js')
    <script src="{{ asset('vendor/almasaeed2010/adminlte/plugins/datepicker/bootstrap-datepicker.js') }}"></script>
    <script src="{{ asset('public/js/bootstrap-fancyfile.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-3-typeahead/4.0.1/bootstrap3-typeahead.min.js"></script>
@endpush

@push('css')
    <link rel="stylesheet" href="{{ asset('vendor/almasaeed2010/adminlte/plugins/datepicker/datepicker3.css') }}">
    <link rel="stylesheet" href="{{ asset('public/css/bootstrap-fancyfile.css') }}">
@endpush

@push('scripts')
    <script type="text/javascript">
        var item_row = '{{ $item_row }}';

        function addItem() {
            html  = '<tr id="item-row-' + item_row + '">';
            html += '  <td class="text-center" style="vertical-align: middle;">';
            html += '      <button type="button" onclick="$(this).tooltip(\'destroy\'); $(\'#item-row-' + item_row + '\').remove();" data-toggle="tooltip" title="{{ trans('general.delete') }}" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i></button>';
            html += '  </td>';
            html += '  <td>';
            html += '      <input class="form-control typeahead" placeholder="{{ trans('general.form.enter', ['field' => trans_choice('invoices.item_name', 1)]) }}" name="item[' + item_row + '][name]" type="text" id="item-name-' + item_row + '">';
            html += '      <input name="item[' + item_row + '][item_id]" type="hidden" id="item-id-' + item_row + '">';
            html += '  </td>';
            html += '  <td>';
            html += '      <input class="form-control text-right" name="item[' + item_row + '][number_shirt]" type="text" id="item-number-shirt-' + item_row + '">';
            html += '  </td>';
            html += '  <td>';
            html += '      <select class="form-control select2" name="item[' + item_row + '][size_id]" id="item-size-' + item_row + '">';
            html += '         <option selected="selected" value="">{{ trans('general.form.select.field', ['field' => trans_choice('general.sizes', 1)]) }}</option>';
            @foreach($sizes as $size_key => $size_value)
            html += '         <option value="{{ $size_key }}">{{ $size_value }}</option>';
            @endforeach
            html += '      </select>';
            html += '  </td>';

            $('#items tbody #addItem').before(html);
            //$('[rel=tooltip]').tooltip();

            $('[data-toggle="tooltip"]').tooltip('hide');

            $('#item-row-' + item_row + ' .select2').select2({
                placeholder: "{{ trans('general.form.select.field', ['field' => trans_choice('general.sizes', 1)]) }}"
            });

            item_row++;
        }

        $(document).ready(function(){
            //Date picker
            $('#invoiced_at').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true
            });

            //Date picker
            $('#due_at').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true
            });

            $(".select2").select2({
                placeholder: "{{ trans('general.form.select.field', ['field' => trans_choice('general.sizes', 1)]) }}"
            });

            $("#customer_id").select2({
                placeholder: "{{ trans('general.form.select.field', ['field' => trans_choice('general.customers', 1)]) }}"
            });

            $("#currency_code").select2({
                placeholder: "{{ trans('general.form.select.field', ['field' => trans_choice('general.currencies', 1)]) }}"
            });

            $('#attachment').fancyfile({
                text  : '{{ trans('general.form.select.file') }}',
                style : 'btn-default',
                placeholder : '{{ trans('general.form.no_file_selected') }}'
            });

            var autocomplete_path = "{{ url('items/items/autocomplete') }}";

            $(document).on('click', '.form-control.typeahead', function() {
                input_id = $(this).attr('id').split('-');

                item_id = parseInt(input_id[input_id.length-1]);

                $(this).typeahead({
                    minLength: 3,
                    displayText:function (data) {
                        return data.name;
                    },
                    source: function (query, process) {
                        $.ajax({
                            url: autocomplete_path,
                            type: 'GET',
                            dataType: 'JSON',
                            data: 'query=' + query + '&type=invoice&currency_code=' + $('#currency_code').val(),
                            success: function(data) {
                                return process(data);
                            }
                        });
                    },
                    afterSelect: function (data) {
                        $('#item-id-' + item_id).val(data.item_id);
                        $('#item-quantity-' + item_id).val('1');
                        $('#item-price-' + item_id).val(data.sale_price);
                        $('#item-tax-' + item_id).val(data.tax_id);

                        // This event Select2 Stylesheet
                        $('#item-tax-' + item_id).trigger('change');

                        $('#item-total-' + item_id).html(data.total);

                        //totalItem();
                    }
                });
            });

            $(document).on('change', '#currency_code, #items tbody select', function(){
                //totalItem();
            });

            $(document).on('keyup', '#items tbody .form-control', function(){
                //totalItem();
            });

            $(document).on('change', '#customer_id', function (e) {
                $.ajax({
                    url: '{{ url("incomes/customers/currency") }}',
                    type: 'GET',
                    dataType: 'JSON',
                    data: 'customer_id=' + $(this).val(),
                    success: function(data) {
                        $('#currency_code').val(data.currency_code);

                        // This event Select2 Stylesheet
                        $('#currency_code').trigger('change');
                    }
                });
            });
        });

        {{--function totalItem() {--}}
            {{--$.ajax({--}}
                {{--url: '{{ url("items/items/totalItem") }}',--}}
                {{--type: 'POST',--}}
                {{--dataType: 'JSON',--}}
                {{--data: $('#currency_code, #items input[type=\'text\'],#items input[type=\'hidden\'], #items textarea, #items select'),--}}
                {{--headers: { 'X-CSRF-TOKEN': '{{ csrf_token() }}' },--}}
                {{--success: function(data) {--}}
                    {{--if (data) {--}}
                        {{--$.each( data.items, function( key, value ) {--}}
                            {{--$('#item-total-' + key).html(value);--}}
                        {{--});--}}

                        {{--$('#sub-total').html(data.sub_total);--}}
                        {{--$('#tax-total').html(data.tax_total);--}}
                        {{--$('#grand-total').html(data.grand_total);--}}
                    {{--}--}}
                {{--}--}}
            {{--});--}}
        {{--}--}}

        function createCustomer() {
            $('#modal-create-customer').remove();

            modal  = '<div class="modal fade" id="modal-create-customer" style="display: none;">';
            modal += '  <div class="modal-dialog  modal-lg">';
            modal += '      <div class="modal-content">';
            modal += '          <div class="modal-header">';
            modal += '              <h4 class="modal-title">{{ trans('general.title.new', ['type' => trans_choice('general.customers', 1)]) }}</h4>';
            modal += '          </div>';
            modal += '          <div class="modal-body">';
            modal += '              {!! Form::open(['id' => 'form-create-customer', 'role' => 'form']) !!}';
            modal += '              <div class="row">';
            modal += '                  <div class="form-group col-md-6 required">';
            modal += '                      <label for="name" class="control-label">{{ trans('general.name') }}</label>';
            modal += '                      <div class="input-group">';
            modal += '                          <div class="input-group-addon"><i class="fa fa-id-card-o"></i></div>';
            modal += '                          <input class="form-control" placeholder="{{ trans('general.name') }}" required="required" name="name" type="text" id="name">';
            modal += '                      </div>';
            modal += '                  </div>';
            modal += '                  <div class="form-group col-md-6 required">';
            modal += '                      <label for="email" class="control-label">{{ trans('general.email') }}</label>';
            modal += '                      <div class="input-group">';
            modal += '                          <div class="input-group-addon"><i class="fa fa-envelope"></i></div>';
            modal += '                          <input class="form-control" placeholder="{{ trans('general.email') }}" required="required" name="email" type="text" id="email">';
            modal += '                      </div>';
            modal += '                  </div>';
            modal += '                  <div class="form-group col-md-6">';
            modal += '                      <label for="tax_number" class="control-label">{{ trans('general.phone') }}</label>';
            modal += '                      <div class="input-group">';
            modal += '                          <div class="input-group-addon"><i class="fa fa-phone"></i></div>';
            modal += '                          <input class="form-control" placeholder="{{ trans('general.phone') }}" name="phone" type="text" id="phone">';
            modal += '                      </div>';
            modal += '                  </div>';
            modal += '                  <div class="form-group col-md-6 required">';
            modal += '                      <label for="email" class="control-label">{{ trans_choice('general.currencies', 1) }}</label>';
            modal += '                      <div class="input-group">';
            modal += '                          <div class="input-group-addon"><i class="fa fa-exchange"></i></div>';
            modal += '                          <select class="form-control" required="required" id="currency_code" name="currency_code">';
            modal += '                              <option value="">{{ trans('general.form.select.field', ['field' => trans_choice('general.currencies', 1)]) }}</option>';
            @foreach($currencies as $currency_code => $currency_name)
            modal += '                              <option value="{{ $currency_code }}" {{ (setting('general.default_currency') == $currency_code) ? 'selected' : '' }}>{{ $currency_name }}</option>';
            @endforeach
            modal += '                          </select>';
            modal += '                      </div>';
            modal += '                  </div>';
            modal += '                  <div class="form-group col-md-12">';
            modal += '                      <label for="address" class="control-label">{{ trans('general.address') }}</label>';
            modal += '                      <textarea class="form-control" placeholder="{{ trans('general.address') }}" rows="3" name="address" cols="50" id="address"></textarea>';
            modal += '                  </div>';
            modal += '                  {!! Form::hidden('enabled', '1', []) !!}';
            modal += '              </div>';
            modal += '              {!! Form::close() !!}';
            modal += '          </div>';
            modal += '          <div class="modal-footer">';
            modal += '              <div class="pull-left">';
            modal += '              {!! Form::button('<span class="fa fa-save"></span> &nbsp;' . trans('general.save'), ['type' => 'button', 'id' =>'button-create-customer', 'class' => 'btn btn-success']) !!}';
            modal += '              <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times-circle"></span> &nbsp;{{ trans('general.cancel') }}</button>';
            modal += '              </div>';
            modal += '          </div>';
            modal += '      </div>';
            modal += '  </div>';
            modal += '</div>';

            $('body').append(modal);

            $("#modal-create-customer #currency_code").select2({
                placeholder: "{{ trans('general.form.select.field', ['field' => trans_choice('general.currencies', 1)]) }}"
            });

            $('#modal-create-customer').modal('show');
        }

        $(document).on('click', '#button-create-customer', function (e) {
            $('#modal-create-customer .modal-header').before('<span id="span-loading" style="position: absolute; height: 100%; width: 100%; z-index: 99; background: #6da252; opacity: 0.4;"><i class="fa fa-spinner fa-spin" style="font-size: 16em !important;margin-left: 35%;margin-top: 8%;"></i></span>');

            $.ajax({
                url: '{{ url("incomes/customers/customer") }}',
                type: 'POST',
                dataType: 'JSON',
                data: $("#form-create-customer").serialize(),
                beforeSend: function () {
                    $(".form-group").removeClass("has-error");
                    $(".help-block").remove();
                },
                success: function(data) {
                    $('#span-loading').remove();

                    $('#modal-create-customer').modal('hide');

                    $("#customer_id").append('<option value="' + data.id + '" selected="selected">' + data.name + '</option>');
                    $("#customer_id").select2('refresh');
                },
                error: function(error, textStatus, errorThrown) {
                    $('#span-loading').remove();

                    if (error.responseJSON.name) {
                        $("input[name='name']").parent().parent().addClass('has-error');
                        $("input[name='name']").parent().after('<p class="help-block">' + error.responseJSON.name + '</p>');
                    }

                    if (error.responseJSON.email) {
                        $("input[name='email']").parent().parent().addClass('has-error');
                        $("input[name='email']").parent().after('<p class="help-block">' + error.responseJSON.email + '</p>');
                    }

                    if (error.responseJSON.currency_code) {
                        $("select[name='currency_code']").parent().parent().addClass('has-error');
                        $("select[name='currency_code']").parent().after('<p class="help-block">' + error.responseJSON.currency_code + '</p>');
                    }
                }
            });
        });
    </script>
@endpush
