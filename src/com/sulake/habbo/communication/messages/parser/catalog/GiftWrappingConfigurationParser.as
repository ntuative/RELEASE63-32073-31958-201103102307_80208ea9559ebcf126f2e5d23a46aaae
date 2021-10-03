package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2575:Boolean;
      
      private var var_2574:int;
      
      private var var_1820:Array;
      
      private var var_755:Array;
      
      private var var_754:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2575;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2574;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1820;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_755;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_754;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1820 = [];
         this.var_755 = [];
         this.var_754 = [];
         this.var_2575 = param1.readBoolean();
         this.var_2574 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1820.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_755.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_754.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
