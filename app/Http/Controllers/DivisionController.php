<?php

namespace App\Http\Controllers;

use App\Models\Division;
use App\Models\Country;
use Illuminate\Http\Request;

class DivisionController extends Controller
{
    
    public function index(Request $request)
    {
        $divisions = Division::paginate(15);
        //dd($divisions);
        $countries = Country::where('status', 1)->get();
        return view('backend.setup_configurations.divisions.index', compact('divisions','countries'));
    }

    public function getDivision()
    {
        $divisions = Division::all();
        $response['data'] = $divisions;
        return response()->json($response);
    }



    public function store(Request $request)
    {
        $division = new Division;

        $division->name = $request->name;
        $division->country_id = $request->country_id;

        $division->save();

        flash(translate('Division has been inserted successfully'))->success();

        return back();
    }

    public function edit(Request $request, $id)
    {
        $division  = Division::findOrFail($id);
        $countries = Country::where('status', 1)->get();
        return view('backend.setup_configurations.divisions.edit', compact('division', 'countries'));
    }

    public function update(Request $request, $id)
    {
        $division = Division::findOrFail($id);

        $division->name = $request->name;
        $division->country_id = $request->country_id;

        $division->save();

        flash(translate('Division has been updated successfully'))->success();
        return back();
    }

    public function destroy($id)
    {
        $city = Division::findOrFail($id);

        Division::destroy($id);

        flash(translate('Division has been deleted successfully'))->success();
        return redirect()->route('divisions.index');
    }
}