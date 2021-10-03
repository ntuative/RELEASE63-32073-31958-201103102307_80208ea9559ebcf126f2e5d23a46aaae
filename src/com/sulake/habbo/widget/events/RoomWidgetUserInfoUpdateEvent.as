package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_119:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_143:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1169:int = 2;
      
      public static const const_1177:int = 3;
      
      public static const const_1590:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1845:String = "";
      
      private var var_2176:int;
      
      private var var_2205:int = 0;
      
      private var var_2203:int = 0;
      
      private var _figure:String = "";
      
      private var var_45:BitmapData = null;
      
      private var var_257:Array;
      
      private var var_1710:Array;
      
      private var var_1374:int = 0;
      
      private var var_2384:String = "";
      
      private var var_2385:int = 0;
      
      private var var_2383:int = 0;
      
      private var var_1702:Boolean = false;
      
      private var var_1696:String = "";
      
      private var var_2756:Boolean = false;
      
      private var var_2760:Boolean = true;
      
      private var var_1192:int = 0;
      
      private var var_2758:Boolean = false;
      
      private var var_2755:Boolean = false;
      
      private var var_2754:Boolean = false;
      
      private var var_2761:Boolean = false;
      
      private var var_2753:Boolean = false;
      
      private var var_2759:Boolean = false;
      
      private var var_2757:int = 0;
      
      private var var_1700:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_257 = [];
         this.var_1710 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1845 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1845;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2176 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2176;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2205 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2205;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2203 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2203;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_45 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_45;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_257 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_257;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1710;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1710 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1374 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1374;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2384 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2384;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2756 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2756;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1192 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1192;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2758 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2758;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2755 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2755;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2754 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2754;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2761 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2761;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2753 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2753;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2759 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2759;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2757 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2757;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2760 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2760;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1700 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1700;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2385 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2385;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2383 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2383;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1702 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1702;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1696 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1696;
      }
   }
}
