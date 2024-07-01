<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Store;
use Illuminate\Support\Facades\Http;

class StoreFinderController extends Controller
{
    public function index(Request $request)
    {
        return view('storeFinder');
    }

    public function getNearestStores(Request $request)
    {
        //config searvices
        $apiKey = config('services.google.key');
        $caCertPath = config('services.google.ca_cert');
        $userLatitude = $request->input('user_latitude', 0);
        $userLongitude = $request->input('user_longitude', 0);
        $radius = $request->input('radius', 10000);
        $response = Http::withOptions([
            'verify' => $caCertPath,
        ])->get('https://maps.googleapis.com/maps/api/place/nearbysearch/json', [
            'location' => "{$userLatitude},{$userLongitude}",
            'radius' => $radius,
            'key' => $apiKey,
            'type' => 'store',
        ]);
        //dd($response);
        
        $stores = $response->json()['results'];
        //check if existing
        foreach ($stores as $store) {
            $existingStore = Store::where('title', $store['name'])
                                  ->where('address', $store['vicinity'])
                                  ->first();
            if ($existingStore) {
                //update
                $existingStore->update([
                    'latitude' => $store['geometry']['location']['lat'],
                    'longitude' => $store['geometry']['location']['lng'],
                ]);
            } else {
                //add
                Store::create([
                    'title' => $store['name'],
                    'address' => $store['vicinity'],
                    'latitude' => $store['geometry']['location']['lat'],
                    'longitude' => $store['geometry']['location']['lng'],
                ]);
            }
        }
        return response()->json(['stores' => $stores]);    
    }

    public function list(Request $request)
    {
        $data = Store::latest()->get();
        return view('list',compact('data'));
    }
}
