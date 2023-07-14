<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table = 'products';
    protected $primaryKey = 'product_id';
    protected $guarded = [];
    public function productDetail(){
        return $this->hasMany(ProductDetail::class,'product_id','product_id');
    }
}
