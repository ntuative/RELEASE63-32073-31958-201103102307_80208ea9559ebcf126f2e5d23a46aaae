package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPetPackageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_556:String = "RWOPPUE_OPEN_PET_PACKAGE_REQUESTED";
      
      public static const const_472:String = "RWOPPUE_OPEN_PET_PACKAGE_RESULT";
      
      public static const const_349:String = "RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE";
       
      
      private var var_339:int = -1;
      
      private var var_45:BitmapData = null;
      
      private var var_1553:int = 0;
      
      public function RoomWidgetPetPackageUpdateEvent(param1:String, param2:int, param3:BitmapData, param4:int, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         this.var_339 = param2;
         this.var_45 = param3;
         this.var_1553 = param4;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_1553;
      }
      
      public function get image() : BitmapData
      {
         return this.var_45;
      }
      
      public function get objectId() : int
      {
         return this.var_339;
      }
   }
}
