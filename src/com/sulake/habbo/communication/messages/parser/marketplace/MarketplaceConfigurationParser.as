package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1495:Boolean;
      
      private var var_2055:int;
      
      private var var_1923:int;
      
      private var var_1924:int;
      
      private var var_2054:int;
      
      private var var_2057:int;
      
      private var var_2056:int;
      
      private var var_2053:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1495;
      }
      
      public function get commission() : int
      {
         return this.var_2055;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1923;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1924;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2057;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2054;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2056;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2053;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1495 = param1.readBoolean();
         this.var_2055 = param1.readInteger();
         this.var_1923 = param1.readInteger();
         this.var_1924 = param1.readInteger();
         this.var_2057 = param1.readInteger();
         this.var_2054 = param1.readInteger();
         this.var_2056 = param1.readInteger();
         this.var_2053 = param1.readInteger();
         return true;
      }
   }
}
