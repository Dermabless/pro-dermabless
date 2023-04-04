<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Location;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Keygen;

class LocationController extends Controller
{

	public function index()
	{
		$lims_location_all = Location::where('active', true)->with('warehouse')->get();
		return view('location.create', compact('lims_location_all'));
	}

	public function store(Request $request)
	{

		$input = $request->all();
		$input['key'] = $input['shelf'] . $input['section'] . $input['row'] . $input['slot'];

		$validator = Validator::make($input, [
			'key' => [
				'max:255',
				Rule::unique('location')->ignore($request->location_id)->where(function ($query) use ($request, $input) {
					return $query->where('active', 1)->where('key', $input['key'])->where('warehouse_id', $input['warehouse_id']);
				}),
			],
			'warehouse_id' => 'required',
			'shelf' => 'required',
			'section' => 'required',
			'row' => 'required'
		]);

		// If validation fails, redirect to the settings page and send the errors
		if ($validator->fails()) {
			return redirect('location')->withErrors($validator)->withInput();
		}

		$input = $request->all();
		$input['active'] = true;
		$input['key'] = $input['shelf'] . $input['section'] . $input['row'] . $input['slot'];
		Location::create($input);
		return redirect('location')->with('message', 'Data inserted successfully');
	}

	public function edit($id)
	{
		$lims_location_data = Location::findOrFail($id);
		return $lims_location_data;
	}

	public function update(Request $request, $id)
	{

		$input = $request->all();
		$input['key'] = $input['shelf'] . $input['section'] . $input['row'] . $input['slot'];

		$validator = Validator::make($input, [
			'key' => [
				'max:255',
				Rule::unique('location')->ignore($request->location_id)->where(function ($query) use ($request, $input) {
					return $query->where('active', 1)->where('key', $input['key'])->where('warehouse_id', $input['warehouse_id']);
				}),
			],
			'warehouse_id' => 'required',
			'shelf' => 'required',
			'section' => 'required',
			'row' => 'required'
		]);

		// If validation fails, redirect to the settings page and send the errors
		if ($validator->fails()) {
			return redirect('location')->withErrors($validator)->withInput();
		}

		$lims_location_data = Location::find($request->location_id);
		$input['key'] = $input['shelf'] . $input['section'] . $input['row'] . $input['slot'];
		$lims_location_data->update($input);
		return redirect('location')->with('message', 'Data updated successfully');
	}

	public function importLocation(Request $request)
	{
		//get file
		$upload = $request->file('file');
		$ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
		if ($ext != 'csv')
			return redirect()->back()->with('not_permitted', 'Please upload a CSV file');
		$filename = $upload->getClientOriginalName();
		$upload = $request->file('file');
		$filePath = $upload->getRealPath();
		//open and read
		$file = fopen($filePath, 'r');
		$header = fgetcsv($file);
		$escapedHeader = [];
		//validate
		foreach ($header as $key => $value) {
			$lheader = strtolower($value);
			$escapedItem = preg_replace('/[^a-z]/', '', $lheader);
			array_push($escapedHeader, $escapedItem);
		}
		//looping through othe columns
		while ($columns = fgetcsv($file)) {
			if ($columns[0] == "")
				continue;
			foreach ($columns as $key => $value) {
				$value = preg_replace('/\D/', '', $value);
			}
			$data = array_combine($escapedHeader, $columns);

			$key = $data['shelf'] . $data['section'] . $data['row'] . $data['slot'];
			$location = Location::firstOrNew(['warehouse_id' => $data['warehouse'], 'key' => $key, 'active' => true]);
			$location->warehouse_id = $data['warehouse'];
			$location->shelf = $data['shelf'];
			$location->section = $data['section'];
			$location->row = $data['row'];
			$location->slot = $data['slot'];
			$location->active = true;
			$location->key = $key;
			$location->save();
		}
		return redirect('location')->with('message', 'Location imported successfully');
	}

	public function deleteBySelection(Request $request)
	{
		$location_id = $request['locationIdArray'];
		foreach ($location_id as $id) {
			$lims_location_data = Location::find($id);
			$lims_location_data->active = false;
			$lims_location_data->save();
		}
		return 'Location deleted successfully!';
	}

	public function destroy($id)
	{
		$lims_location_data = Location::find($id);
		$lims_location_data->active = false;
		$lims_location_data->save();
		return redirect('location')->with('not_permitted', 'Data deleted successfully');
	}
}
