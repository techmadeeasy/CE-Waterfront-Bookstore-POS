<?php

namespace Modules\Sale\DataTables;

use Modules\Sale\Entities\Sale;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class SalesDataTable extends DataTable
{

    public function dataTable($query) {
        return datatables()
            ->eloquent($query)
            ->addColumn('total_amount', function ($data) {
                return format_currency($data->total_amount);
            })
            ->addColumn('products', function ($data) {
                return $data->saleDetails->map(function ($saleDetail) {
                    return $saleDetail->product->product_name;
                })->implode(', ');
            })
            ->addColumn('paid_amount', function ($data) {
                return format_currency($data->paid_amount);
            })
            ->addColumn('payment_method', function ($data) {
                return $data->payment_method;
            })
            ->addColumn('due_amount', function ($data) {
                return format_currency($data->due_amount);
            })
            ->addColumn('payment_status', function ($data) {
                return view('sale::partials.payment-status', compact('data'));
            })
            ->addColumn('sales_person', function ($data) {
                return $data->salePerson ? $data->salePerson->name : 'N/A';
            })
            ->addColumn('created_at', function ($data) {
                 return $data->created_at->format('d M Y');
            })
            ->addColumn('action', function ($data) {
                return view('sale::partials.actions', compact('data'));
            });
    }

    public function query(Sale $model) {
        return $model->newQuery()->with('saleDetails', 'saleDetails.product', 'salePerson');
    }

    public function html() {
        return $this->builder()
            ->setTableId('sales-table')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->dom("<'row'<'col-md-3'l><'col-md-5 mb-2'B><'col-md-4'f>> .
                                'tr' .
                                <'row'<'col-md-5'i><'col-md-7 mt-2'p>>")
            ->orderBy(8)
            ->buttons(
                Button::make('excel')
                    ->text('<i class="bi bi-file-earmark-excel-fill"></i> Excel'),
                Button::make('print')
                    ->text('<i class="bi bi-printer-fill"></i> Print'),
                Button::make('reset')
                    ->text('<i class="bi bi-x-circle"></i> Reset'),
                Button::make('reload')
                    ->text('<i class="bi bi-arrow-repeat"></i> Reload')
            );
    }

    protected function getColumns() {
        return [
            Column::make('reference')
                ->className('text-center align-middle'),

            Column::make('customer_name')
                ->title('Customer')
                ->className('text-center align-middle'),

            Column::make('products')
                ->title('Products')
                ->className('text-center align-middle'),

            Column::computed('payment_method')
                ->className('text-center align-middle'),

            Column::computed('total_amount')
                ->className('text-center align-middle'),

            Column::computed('paid_amount')
                ->className('text-center align-middle'),

            Column::computed('due_amount')
                ->className('text-center align-middle'),

            Column::computed('payment_status')
                ->className('text-center align-middle'),

            Column::computed('sales_person')
                ->className('text-center align-middle'),

            Column::computed('action')
                ->exportable(false)
                ->printable(false)
                ->className('text-center align-middle'),

            Column::make('created_at')
                ->visible(false)
        ];
    }

    protected function filename() {
        return 'Sales_' . date('YmdHis');
    }
}
