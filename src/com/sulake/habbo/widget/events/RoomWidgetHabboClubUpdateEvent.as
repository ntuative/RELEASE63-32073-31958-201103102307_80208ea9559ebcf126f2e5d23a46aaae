package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_263:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2564:int = 0;
      
      private var var_2566:int = 0;
      
      private var var_2565:int = 0;
      
      private var var_2563:Boolean = false;
      
      private var var_2348:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_263,param6,param7);
         this.var_2564 = param1;
         this.var_2566 = param2;
         this.var_2565 = param3;
         this.var_2563 = param4;
         this.var_2348 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2564;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2566;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2565;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2563;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2348;
      }
   }
}
