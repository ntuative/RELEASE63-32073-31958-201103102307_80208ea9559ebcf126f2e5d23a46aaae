package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_178;
         param1["bound_to_parent_rect"] = const_100;
         param1["child_window"] = const_1019;
         param1["embedded_controller"] = const_1199;
         param1["resize_to_accommodate_children"] = const_70;
         param1["input_event_processor"] = const_29;
         param1["internal_event_handling"] = const_890;
         param1["mouse_dragging_target"] = const_266;
         param1["mouse_dragging_trigger"] = const_372;
         param1["mouse_scaling_target"] = const_292;
         param1["mouse_scaling_trigger"] = const_423;
         param1["horizontal_mouse_scaling_trigger"] = const_257;
         param1["vertical_mouse_scaling_trigger"] = const_269;
         param1["observe_parent_input_events"] = const_1114;
         param1["optimize_region_to_layout_size"] = const_452;
         param1["parent_window"] = const_1210;
         param1["relative_horizontal_scale_center"] = const_190;
         param1["relative_horizontal_scale_fixed"] = const_134;
         param1["relative_horizontal_scale_move"] = const_374;
         param1["relative_horizontal_scale_strech"] = const_358;
         param1["relative_scale_center"] = const_985;
         param1["relative_scale_fixed"] = const_686;
         param1["relative_scale_move"] = const_1127;
         param1["relative_scale_strech"] = const_1211;
         param1["relative_vertical_scale_center"] = const_194;
         param1["relative_vertical_scale_fixed"] = const_146;
         param1["relative_vertical_scale_move"] = const_362;
         param1["relative_vertical_scale_strech"] = const_313;
         param1["on_resize_align_left"] = const_853;
         param1["on_resize_align_right"] = const_484;
         param1["on_resize_align_center"] = const_475;
         param1["on_resize_align_top"] = const_632;
         param1["on_resize_align_bottom"] = const_508;
         param1["on_resize_align_middle"] = const_462;
         param1["on_accommodate_align_left"] = const_1108;
         param1["on_accommodate_align_right"] = const_478;
         param1["on_accommodate_align_center"] = const_846;
         param1["on_accommodate_align_top"] = const_1179;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_639;
         param1["route_input_events_to_parent"] = const_433;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1067;
         param1["scalable_with_mouse"] = const_1233;
         param1["reflect_horizontal_resize_to_parent"] = const_463;
         param1["reflect_vertical_resize_to_parent"] = const_520;
         param1["reflect_resize_to_parent"] = const_312;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1048;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
