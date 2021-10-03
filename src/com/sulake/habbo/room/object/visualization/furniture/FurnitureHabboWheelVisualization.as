package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_937:int = 10;
      
      private static const const_613:int = 20;
      
      private static const const_1296:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
       
      
      private var var_317:Array;
      
      private var var_783:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_317 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_783)
            {
               this.var_783 = true;
               this.var_317 = new Array();
               this.var_317.push(const_1296);
               this.var_317.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_937)
         {
            if(this.var_783)
            {
               this.var_783 = false;
               this.var_317 = new Array();
               this.var_317.push(const_937 + param1);
               this.var_317.push(const_613 + param1);
               this.var_317.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(this.var_317.length > 0)
            {
               super.setAnimation(this.var_317.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
