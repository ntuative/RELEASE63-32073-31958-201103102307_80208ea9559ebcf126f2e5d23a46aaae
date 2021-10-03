package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_709:int = 500;
       
      
      private var var_1433:Vector3d;
      
      private var var_2855:Vector3d;
      
      private var var_83:Vector3d;
      
      private var var_258:Vector3d;
      
      private var _lastUpdateTime:int = 0;
      
      private var var_2567:int;
      
      private var var_1170:int = 500;
      
      public function MovingObjectLogic()
      {
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this._lastUpdateTime;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1170 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               this.var_83 = new Vector3d(param1.loc.x,param1.loc.y,param1.loc.z);
               _loc3_ = _loc2_.targetLoc;
               _loc4_ = Vector3d.dif(_loc3_,this.var_83);
               this.var_2567 = this._lastUpdateTime;
               this.var_1433 = _loc4_;
            }
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this.var_1433 != null)
         {
            _loc2_ = param1 - this.var_2567;
            if(_loc2_ > this.var_1170)
            {
               _loc2_ = this.var_1170;
            }
            _loc3_ = Vector3d.product(this.var_1433,_loc2_ / Number(this.var_1170));
            _loc4_ = Vector3d.sum(this.var_83,_loc3_);
            if(object != null)
            {
               object.setLocation(_loc4_);
            }
            if(_loc2_ == this.var_1170)
            {
               this.var_1433 = null;
            }
         }
         this._lastUpdateTime = param1;
      }
   }
}
