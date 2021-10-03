package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2185:int;
      
      private var var_2379:int;
      
      private var var_2380:int;
      
      private var _dayOffsets:Array;
      
      private var var_1855:Array;
      
      private var var_1854:Array;
      
      private var var_2381:int;
      
      private var var_2378:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2185;
      }
      
      public function get offerCount() : int
      {
         return this.var_2379;
      }
      
      public function get historyLength() : int
      {
         return this.var_2380;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1855;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1854;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2381;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2378;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2185 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2379 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2380 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1855 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1854 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2381 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2378 = param1;
      }
   }
}
