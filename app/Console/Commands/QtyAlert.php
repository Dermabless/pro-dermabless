<?php

namespace App\Console\Commands;

use App\Product;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Telegram\Bot\Laravel\Facades\Telegram;

class QtyAlert extends Command
{
	/**
	 * The name and signature of the console command.
	 *
	 * @var string
	 */
	protected $signature = 'qtyalert:find';

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'Qty Alert';

	/**
	 * Create a new command instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * Execute the console command.
	 *
	 * @return int
	 */
	public function handle()
	{

		logger('alert command fire');

		$products = DB::table('products')
			->where('is_active', true)
			->where(function ($query) {
				$query->where('last_notified', '<', now()->format('Y-m-d'))
					->orWhereNull('last_notified');
			})
			->where('alert_quantity', '>', 'qty')
			->get();

		$total = count($products);

		if ($total > 0) {
			Telegram::sendMessage([
				'chat_id' => '-1001809438039',
				'text' => "Tenemos $total productos por debajo de la cantidad mínima:"
			]);
			Telegram::sendMessage([
				'chat_id' => '-752062503',
				'text' => "Tenemos $total productos por debajo de la cantidad mínima:"
			]);

			$url = config('app.url');

			$productIds = [];
			foreach ($products as $product) {
				$compra = $product->alert_quantity - $product->qty;
				Telegram::sendMessage([
					'chat_id' => '-1001809438039',
					'text' => "[$product->name - $product->code]($url/products/$product->id/edit) | en stock $product->qty | mínimo $product->alert_quantity | compra mínima $compra producto" . ($compra > 1 ? 's' : ''),
					'parse_mode' => "markdown"
				]);
				Telegram::sendMessage([
					'chat_id' => '-752062503',
					'text' => "[$product->name - $product->code]($url/products/$product->id/edit) | en stock $product->qty | mínimo $product->alert_quantity | compra mínima $compra producto" . ($compra > 1 ? 's' : ''),
					'parse_mode' => "markdown"
				]);
				$productIds [] = $product->id;
			}
			DB::table('products')
				->whereIn('id', $productIds)
				->update(['last_notified' => now()]);
		}
	}
}
