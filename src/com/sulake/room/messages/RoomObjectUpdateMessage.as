package com.sulake.room.messages
{
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectUpdateMessage
   {
       
      
      protected var var_83:IVector3d;
      
      protected var var_258:IVector3d;
      
      public function RoomObjectUpdateMessage(param1:IVector3d, param2:IVector3d)
      {
         super();
         this.var_83 = param1;
         this.var_258 = param2;
      }
      
      public function get loc() : IVector3d
      {
         return this.var_83;
      }
      
      public function get dir() : IVector3d
      {
         return this.var_258;
      }
   }
}
