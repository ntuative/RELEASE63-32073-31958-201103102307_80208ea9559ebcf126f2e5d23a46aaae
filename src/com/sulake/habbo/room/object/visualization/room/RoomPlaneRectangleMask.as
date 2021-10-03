package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2551:Number = 0.0;
      
      private var var_2552:Number = 0.0;
      
      private var var_2576:Number = 0.0;
      
      private var var_2577:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2551 = param1;
         this.var_2552 = param2;
         this.var_2576 = param3;
         this.var_2577 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2551;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2552;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2576;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2577;
      }
   }
}
