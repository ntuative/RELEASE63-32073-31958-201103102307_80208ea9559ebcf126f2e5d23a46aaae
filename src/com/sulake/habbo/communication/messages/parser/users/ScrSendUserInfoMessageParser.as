package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1823:int = 1;
      
      public static const const_1530:int = 2;
       
      
      private var var_894:String;
      
      private var var_2518:int;
      
      private var var_2526:int;
      
      private var var_2525:int;
      
      private var var_2523:int;
      
      private var var_2520:Boolean;
      
      private var var_2082:Boolean;
      
      private var var_2521:int;
      
      private var var_2527:int;
      
      private var var_2522:Boolean;
      
      private var var_2524:int;
      
      private var var_2519:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_894 = param1.readString();
         this.var_2518 = param1.readInteger();
         this.var_2526 = param1.readInteger();
         this.var_2525 = param1.readInteger();
         this.var_2523 = param1.readInteger();
         this.var_2520 = param1.readBoolean();
         this.var_2082 = param1.readBoolean();
         this.var_2521 = param1.readInteger();
         this.var_2527 = param1.readInteger();
         this.var_2522 = param1.readBoolean();
         this.var_2524 = param1.readInteger();
         this.var_2519 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_894;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2518;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2526;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2525;
      }
      
      public function get responseType() : int
      {
         return this.var_2523;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2520;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2082;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2521;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2527;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2522;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2524;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2519;
      }
   }
}
