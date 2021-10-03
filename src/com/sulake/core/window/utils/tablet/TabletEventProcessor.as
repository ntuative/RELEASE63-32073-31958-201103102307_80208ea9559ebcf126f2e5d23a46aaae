package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2838:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var_139 = param1.desktop;
         var_72 = param1.var_1241 as WindowController;
         _lastClickTarget = param1.var_1242 as WindowController;
         var_167 = param1.renderer;
         var_810 = param1.var_1240;
         param2.begin();
         param2.end();
         param1.desktop = var_139;
         param1.var_1241 = var_72;
         param1.var_1242 = _lastClickTarget;
         param1.renderer = var_167;
         param1.var_1240 = var_810;
      }
   }
}
