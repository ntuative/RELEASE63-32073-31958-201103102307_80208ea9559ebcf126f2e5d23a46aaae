package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2185:int;
      
      private var var_2379:int;
      
      private var var_2380:int;
      
      private var _dayOffsets:Array;
      
      private var var_1855:Array;
      
      private var var_1854:Array;
      
      private var var_2381:int;
      
      private var var_2378:int;
      
      public function MarketplaceItemStatsParser()
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
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2185 = param1.readInteger();
         this.var_2379 = param1.readInteger();
         this.var_2380 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1855 = [];
         this.var_1854 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1855.push(param1.readInteger());
            this.var_1854.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2378 = param1.readInteger();
         this.var_2381 = param1.readInteger();
         return true;
      }
   }
}
