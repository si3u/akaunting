<?php

namespace App\Models\Setting;

use App\Models\Model;

class Size extends Model
{

    protected $table = 'sizes';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['company_id', 'name', 'key', 'enabled'];

    /**
     * Sortable columns.
     *
     * @var array
     */
    public $sortable = ['name', 'key', 'enabled'];

    public function items()
    {
        return $this->hasMany('App\Models\Item\Item');
    }

    public function bill_items()
    {
        return $this->hasMany('App\Models\Expense\BillItem');
    }

    public function invoice_items()
    {
        return $this->hasMany('App\Models\Income\InvoiceItem');
    }

    /**
     * Convert key to string.
     *
     * @param  string  $value
     * @return void
     */
    public function setKeyAttribute($value)
    {
        $this->attributes['key'] = (string) $value;
    }
}
