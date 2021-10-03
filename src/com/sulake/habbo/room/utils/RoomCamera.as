package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_941:int = 3;
       
      
      private var var_2417:int = -1;
      
      private var var_2422:int = -2;
      
      private var var_355:Vector3d = null;
      
      private var var_407:Vector3d = null;
      
      private var var_2424:Boolean = false;
      
      private var var_2420:Boolean = false;
      
      private var var_2416:Boolean = false;
      
      private var var_2421:Boolean = false;
      
      private var var_2425:int = 0;
      
      private var var_2418:int = 0;
      
      private var var_2419:int = 0;
      
      private var var_2423:int = 0;
      
      private var var_1380:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_407;
      }
      
      public function get targetId() : int
      {
         return this.var_2417;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2422;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2424;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2420;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2416;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2421;
      }
      
      public function get screenWd() : int
      {
         return this.var_2425;
      }
      
      public function get screenHt() : int
      {
         return this.var_2418;
      }
      
      public function get roomWd() : int
      {
         return this.var_2419;
      }
      
      public function get roomHt() : int
      {
         return this.var_2423;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2417 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2422 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2424 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2420 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2416 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2421 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2425 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2418 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2419 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2423 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_355 == null)
         {
            this.var_355 = new Vector3d();
         }
         if(this.var_355.x != param1.x || this.var_355.y != param1.y || this.var_355.z != param1.z)
         {
            this.var_355.assign(param1);
            this.var_1380 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_355 = null;
         this.var_407 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_407 != null)
         {
            return;
         }
         this.var_407 = new Vector3d();
         this.var_407.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_355 != null && this.var_407 != null)
         {
            ++this.var_1380;
            _loc4_ = Vector3d.dif(this.var_355,this.var_407);
            if(_loc4_.length <= param2)
            {
               this.var_407 = this.var_355;
               this.var_355 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_941 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1380 <= const_941)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_407 = Vector3d.sum(this.var_407,_loc4_);
            }
         }
      }
   }
}
