<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\F1;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class F1Controller extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $f1 = F1::all();
       return response()->json([
        'status' => true,
        'message' => "Data Berhasil Di Temukan",
        'data' => $f1
       ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'posisi' => 'required',
            'tim' => 'required',
            'desctim' => 'required',
            'point' => 'required',
            'logo' => 'required'
        ]);

        if($validator->fails()){
            return response()->json([
                'status' => false,
                'message' => 'Validasi Error',
                'error' => $validator->errors()
            ], 422);
        }

       $f1 = F1::create($request->all());
       return response()->json([
        'status' => true,
        'message' => "Data Berhasil Di Tambah",
        'data' => $f1
       ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $f1 = F1::findOrFail($id);
        return response()->json([
            'status' => true,
            'message' => "Data Berhasil Di Temukan",
            'data' => $f1
           ], 201);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validator = Validator::make($request->all(),[
            'posisi' => 'required',
            'tim' => 'required',
            'desctim' => 'required',
            'point' => 'required',
            'logo' => 'required'
        ]);

        if($validator->fails()){
            return response()->json([
                'status' => false,
                'message' => 'Validasi Error',
                'error' => $validator->errors()
            ], 422);
        }

       $f1 = F1::findOrFail($id);
       $f1->update($request->all());
       return response()->json([
        'status' => true,
        'message' => "Data Berhasil Di Update",
        'data' => $f1
       ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $f1 = F1::findOrFail($id);
        $f1->delete();
        return response()->json([
            'status' => true,
            'message' => "Data Berhasil Di Hapus",
            'data' => $f1
        ], 204);
    }
}
