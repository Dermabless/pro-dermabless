<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Location extends Model
{

	protected $table = 'location';

	protected $fillable = [
		"warehouse_id",
		'shelf',//estante
		"section",//seccion
		"row",//fila
		"slot",//slot
		"key",//key
		"active"
	];

	public function warehouse()
	{
		return $this->belongsTo(Warehouse::class);
	}

	public function stock()
	{
		return ProductLocation::whereNull('date_out')->where('location_id', $this->id)->count();
	}
}
