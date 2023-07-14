<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductDetail extends Model
{
    use HasFactory;
    protected $table ='products_detail';
    protected $primaryKey = 'product_detail_id';
    protected $guarded = [];
}
