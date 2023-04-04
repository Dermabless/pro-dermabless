<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductLocation extends Model
{
	protected $table = 'product_locations';
	protected $fillable = [
		"product_id",
		"product_purchase_id",
		"product_transfer_id",
		"sales_location_id",
		"location_id",
		"date_out",
		"before_location_id"
	];

    protected $casts = [
        'date_out' => 'datetime'
    ];

	public function product()
	{
		return $this->belongsTo(Product::class);
	}

	public function productPurchase()
	{
		return $this->belongsTo(ProductPurchase::class);
	}

	public function productTransfer()
	{
		return $this->belongsTo(ProductTransfer::class);
	}

	public function salesLocation()
	{
		return $this->belongsTo(SalesLocation::class);
	}

	public function location()
	{
		return $this->belongsTo(Location::class);
	}
}
