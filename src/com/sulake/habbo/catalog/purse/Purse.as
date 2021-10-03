package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_186:int = 0;
       
      
      private var var_2542:int = 0;
      
      private var var_1423:Dictionary;
      
      private var var_1809:int = 0;
      
      private var var_1810:int = 0;
      
      private var var_2082:Boolean = false;
      
      private var var_2521:int = 0;
      
      private var var_2527:int = 0;
      
      public function Purse()
      {
         this.var_1423 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2542;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2542 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1809;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1809 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1810;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1810 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1809 > 0 || this.var_1810 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2082;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2082 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2521;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2521 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2527;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2527 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1423;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1423 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1423[param1];
      }
   }
}
