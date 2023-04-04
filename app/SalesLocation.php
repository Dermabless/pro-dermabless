<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SalesLocation extends Model
{
	protected $table = 'sales_location';
	protected $fillable = [
		"product_id",
		"product_sales_id",
		"product_transfer_id"
	];

	public function product()
	{
		return $this->belongsTo(Product::class);
	}

	public function productSales()
	{
		return $this->belongsTo(Product_Sale::class);
	}

	public function productLocation()
	{
		return $this->hasOne(ProductLocation::class);
	}
}
