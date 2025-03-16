<?php

namespace App\Exports;


use AllowDynamicProperties;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Modules\Sale\Entities\Sale;

#[AllowDynamicProperties] class SalesExport implements FromCollection, WithHeadings, WithMapping
{

    public function __construct($startDate, $endDate, $customerId = null, $saleStatus = null, $paymentStatus = null)
    {
        $this->startDate = $startDate;
        $this->endDate = $endDate;
        $this->customerId = $customerId;
        $this->saleStatus = $saleStatus;
        $this->paymentStatus = $paymentStatus;
    }


    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Sale::whereDate('date', '>=', $this->startDate)
            ->whereDate('date', '<=', $this->endDate)
            ->when($this->customerId, function ($query) {
                return $query->where('customer_id', $this->customerId);
            })
            ->when($this->saleStatus, function ($query) {
                return $query->where('status', $this->saleStatus);
            })
            ->when($this->paymentStatus, function ($query) {
                return $query->where('payment_status', $this->paymentStatus);
            })
            ->with('saleDetails', 'saleDetails.product')
            ->orderBy('date', 'desc')->get();
    }

    /**
     * Map each Sale model to a row in the Excel file
     */
    public function map($sale): array
    {
        $products = $sale->saleDetails->map(function($detail) {
            return $detail->product->product_name;
        })->join(', ');

        return [
            'date' => \Carbon\Carbon::parse($sale->date)->format('d M, Y'),
            'reference' => $sale->reference,
            'customer' => $sale->customer->customer_name ?? $sale->customer_name,
            'payment_method' => $sale->payment_method,
            'products' => $products,
            'status' => $sale->status,
            'total' => $sale->total_amount,
            'paid' => $sale->paid_amount,
            'due' => $sale->due_amount,
            'payment_status' => $sale->payment_status
        ];
    }


    public function headings(): array
    {
        return [
            'Date',
            'Reference',
            'Customer',
           'payment_method'=>'Payment Method',
            'Products',
            'Status',
            'Total',
            'Paid',
            'Due',
            'Payment Status'
        ];
    }

}
