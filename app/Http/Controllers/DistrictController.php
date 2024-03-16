<?php

namespace App\Http\Controllers;

use App\Models\Division;
use App\Models\District;
use Illuminate\Http\Request;

class DistrictController extends Controller
{
    
    public function index(Request $request)
    {
        $divisions = Division::paginate(15);
        $districts = District::paginate(15);
        return view('backend.setup_configurations.districts.index', compact('divisions','districts'));
    }
    public function getDistrictById(Request $request)
    {
        $districts = District::where('division_id', $request->id)->get();
        $response['data'] = $districts;
        return response()->json($response);
    }


    public function store(Request $request)
    {
        $district = new District;

        $district->name = $request->name;
        $district->division_id = $request->division_id;

        $district->save();

        flash(translate('District has been inserted successfully'))->success();

        return back();
    }

    public function edit(Request $request, $id)
    {
        $district  = District::findOrFail($id);
        $divisions = Division::all();

        return view('backend.setup_configurations.districts.edit', compact('district', 'divisions'));
    }

    public function update(Request $request, $id)
    {
        $district = District::findOrFail($id);

        $district->name = $request->name;
        $district->division_id = $request->division_id;

        $district->save();

        flash(translate('District has been updated successfully'))->success();
        return back();
    }

    public function destroy($id)
    {
        District::destroy($id);

        flash(translate('District has been deleted successfully'))->success();
        return redirect()->route('districts.index');
    }
}