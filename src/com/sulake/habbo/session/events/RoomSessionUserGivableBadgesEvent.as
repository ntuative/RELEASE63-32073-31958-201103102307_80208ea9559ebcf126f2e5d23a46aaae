package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserGivableBadgesEvent extends RoomSessionEvent
   {
      
      public static const const_73:String = "RSUBE_GIVABLE_BADGES";
       
      
      private var var_257:Array;
      
      public function RoomSessionUserGivableBadgesEvent(param1:IRoomSession, param2:Array, param3:Boolean = false, param4:Boolean = false)
      {
         this.var_257 = [];
         super(const_73,param1,param3,param4);
         this.var_257 = param2;
      }
      
      public function get badges() : Array
      {
         return this.var_257;
      }
   }
}
