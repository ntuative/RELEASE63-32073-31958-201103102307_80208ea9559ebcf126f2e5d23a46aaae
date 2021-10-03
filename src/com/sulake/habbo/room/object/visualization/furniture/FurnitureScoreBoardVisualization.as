package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureScoreBoardVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1258:String = "ones_sprite";
      
      private static const const_1256:String = "tens_sprite";
      
      private static const const_1257:String = "hundreds_sprite";
      
      private static const const_1259:String = "thousands_sprite";
       
      
      public function FurnitureScoreBoardVisualization()
      {
         super();
      }
      
      override public function get animationId() : int
      {
         return 0;
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:String = getSpriteTag(param1,_direction,param2);
         var _loc4_:int = super.animationId;
         switch(_loc3_)
         {
            case const_1258:
               return _loc4_ % 10;
            case const_1256:
               return _loc4_ / 10 % 10;
            case const_1257:
               return _loc4_ / 100 % 10;
            case const_1259:
               return _loc4_ / 1000 % 10;
            default:
               return super.getFrameNumber(param1,param2);
         }
      }
   }
}
