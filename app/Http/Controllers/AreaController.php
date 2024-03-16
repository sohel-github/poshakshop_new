<?php

namespace App\Http\Controllers;

use App\Models\Area;
use App\Models\District;
use Illuminate\Http\Request;

class AreaController extends Controller
{
    
    public function index(Request $request)
    {
        $areas = Area::paginate(15);
        $districts = District::all();
        return view('backend.setup_configurations.areas.index', compact('areas','districts'));
    }
    public function getAreaById(Request $request)
    {
        $areas = Area::where('district_id', $request->id)->get();
        $response['data'] = $areas;
        return response()->json($response);
    }
    

    public function store(Request $request)
    {
        $area = new Area;

        $area->name = $request->name;
        $area->district_id = $request->district_id;
        $area->cost = $request->cost;

        $area->save();

        flash(translate('Area has been inserted successfully'))->success();

        return back();
    }

    public function edit(Request $request, $id)
    {
        $districts  = District::all();
        $areas = Area::findOrFail($id);

        return view('backend.setup_configurations.areas.edit', compact('districts', 'areas'));
    }

    public function update(Request $request, $id)
    {
        $area = Area::findOrFail($id);

        $area->name = $request->name;
        $area->district_id = $request->district_id;
        $area->cost = $request->cost;

        $area->save();

        flash(translate('Area has been updated successfully'))->success();
        return back();
    }

    public function destroy($id)
    {
        Area::destroy($id);

        flash(translate('Area has been deleted successfully'))->success();
        return redirect()->route('areas.index');
    }
}