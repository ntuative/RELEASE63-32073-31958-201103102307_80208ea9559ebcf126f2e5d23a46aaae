package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_776:TileHeightMap = null;
      
      private var var_1206:LegacyWallGeometry = null;
      
      private var var_1207:RoomCamera = null;
      
      private var var_775:SelectedRoomObjectData = null;
      
      private var var_777:SelectedRoomObjectData = null;
      
      private var var_2651:String = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1206 = new LegacyWallGeometry();
         this.var_1207 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_776;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_776 != null)
         {
            this.var_776.dispose();
         }
         this.var_776 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1206;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1207;
      }
      
      public function get worldType() : String
      {
         return this.var_2651;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_2651 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_775;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_775 != null)
         {
            this.var_775.dispose();
         }
         this.var_775 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_777;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_777 != null)
         {
            this.var_777.dispose();
         }
         this.var_777 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_776 != null)
         {
            this.var_776.dispose();
            this.var_776 = null;
         }
         if(this.var_1206 != null)
         {
            this.var_1206.dispose();
            this.var_1206 = null;
         }
         if(this.var_1207 != null)
         {
            this.var_1207.dispose();
            this.var_1207 = null;
         }
         if(this.var_775 != null)
         {
            this.var_775.dispose();
            this.var_775 = null;
         }
         if(this.var_777 != null)
         {
            this.var_777.dispose();
            this.var_777 = null;
         }
      }
   }
}
