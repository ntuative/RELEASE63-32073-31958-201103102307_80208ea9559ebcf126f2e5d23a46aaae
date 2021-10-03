package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_ROLL:int = 3;
      
      private static const const_1324:int = 2;
      
      private static const const_1325:int = 1;
      
      private static const ANIMATION_DURATION:int = 15;
       
      
      private var var_317:Array;
      
      private var var_1157:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_317 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1324)
         {
            this.var_317 = new Array();
            this.var_317.push(const_1325);
            this.var_1157 = ANIMATION_DURATION;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_1157 > 0)
         {
            --this.var_1157;
         }
         if(this.var_1157 == 0)
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
