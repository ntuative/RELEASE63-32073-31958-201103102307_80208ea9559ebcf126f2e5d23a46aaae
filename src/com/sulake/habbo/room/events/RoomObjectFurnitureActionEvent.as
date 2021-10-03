package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectFurnitureActionEvent extends RoomObjectEvent
   {
      
      public static const const_551:String = "ROFCAE_DICE_OFF";
      
      public static const const_444:String = "ROFCAE_DICE_ACTIVATE";
      
      public static const ROOM_OBJECT_USE_HABBOWHEEL:String = "ROFCAE_USE_HABBOWHEEL";
      
      public static const const_469:String = "ROFCAE_STICKIE";
      
      public static const const_532:String = "ROFCAE_VIRAL_GIFT";
      
      public static const const_571:String = "ROFCAE_ENTER_ONEWAYDOOR";
      
      public static const const_514:String = "ROFCAE_QUEST_VENDING";
      
      public static const const_528:String = "ROFCAE_SOUND_MACHINE_START";
      
      public static const ROOM_OBJECT_SOUND_MACHINE_STOP:String = "ROFCAE_SOUND_MACHINE_STOP";
      
      public static const const_492:String = "ROFCAE_SOUND_MACHINE_DISPOSE";
      
      public static const const_424:String = "ROFCAE_JUKEBOX_INIT";
      
      public static const const_580:String = "ROFCAE_SOUND_MACHINE_STOP";
      
      public static const const_494:String = "ROFCAE_JUKEBOX_DISPOSE";
       
      
      public function RoomObjectFurnitureActionEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
