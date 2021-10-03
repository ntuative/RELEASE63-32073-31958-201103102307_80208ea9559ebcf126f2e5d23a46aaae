package com.sulake.habbo.widget.events
{
   public class RoomWidgetAvatarInfoEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_125:String = "RWAIE_AVATAR_INFO";
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2210:Boolean;
      
      private var var_2211:int;
      
      public function RoomWidgetAvatarInfoEvent(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_125,param5,param6);
         this._userId = param1;
         this._userName = param2;
         this.var_2211 = param3;
         this.var_2210 = param4;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2211;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2210;
      }
   }
}
