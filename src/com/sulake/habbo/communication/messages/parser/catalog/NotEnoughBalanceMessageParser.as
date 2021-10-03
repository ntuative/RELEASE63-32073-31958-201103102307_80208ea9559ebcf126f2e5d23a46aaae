package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1622:int = 0;
      
      private var var_1621:int = 0;
      
      private var var_1647:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1622;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1621;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1647;
      }
      
      public function flush() : Boolean
      {
         this.var_1622 = 0;
         this.var_1621 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1622 = param1.readInteger();
         this.var_1621 = param1.readInteger();
         this.var_1647 = param1.readInteger();
         return true;
      }
   }
}
