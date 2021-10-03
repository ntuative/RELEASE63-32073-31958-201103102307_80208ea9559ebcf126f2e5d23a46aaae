package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_843;
         param1["bitmap"] = const_865;
         param1["border"] = const_783;
         param1["border_notify"] = const_1515;
         param1["button"] = const_435;
         param1["button_thick"] = const_862;
         param1["button_icon"] = const_1657;
         param1["button_group_left"] = const_811;
         param1["button_group_center"] = const_776;
         param1["button_group_right"] = const_714;
         param1["canvas"] = const_711;
         param1["checkbox"] = const_706;
         param1["closebutton"] = const_1014;
         param1["container"] = const_368;
         param1["container_button"] = const_652;
         param1["display_object_wrapper"] = const_782;
         param1["dropmenu"] = const_562;
         param1["dropmenu_item"] = const_535;
         param1["frame"] = const_353;
         param1["frame_notify"] = const_1537;
         param1["header"] = const_831;
         param1["html"] = const_1219;
         param1["icon"] = const_1013;
         param1["itemgrid"] = const_994;
         param1["itemgrid_horizontal"] = const_468;
         param1["itemgrid_vertical"] = const_761;
         param1["itemlist"] = const_1174;
         param1["itemlist_horizontal"] = const_402;
         param1["itemlist_vertical"] = const_369;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1386;
         param1["menu"] = const_1531;
         param1["menu_item"] = const_1385;
         param1["submenu"] = const_1049;
         param1["minimizebox"] = const_1678;
         param1["notify"] = const_1647;
         param1["null"] = const_792;
         param1["password"] = const_647;
         param1["radiobutton"] = const_873;
         param1["region"] = const_518;
         param1["restorebox"] = const_1450;
         param1["scaler"] = const_635;
         param1["scaler_horizontal"] = const_1470;
         param1["scaler_vertical"] = const_1465;
         param1["scrollbar_horizontal"] = const_457;
         param1["scrollbar_vertical"] = const_844;
         param1["scrollbar_slider_button_up"] = const_1115;
         param1["scrollbar_slider_button_down"] = const_1106;
         param1["scrollbar_slider_button_left"] = const_1089;
         param1["scrollbar_slider_button_right"] = const_1132;
         param1["scrollbar_slider_bar_horizontal"] = const_1101;
         param1["scrollbar_slider_bar_vertical"] = const_1205;
         param1["scrollbar_slider_track_horizontal"] = const_1176;
         param1["scrollbar_slider_track_vertical"] = const_1136;
         param1["scrollable_itemlist"] = const_1558;
         param1["scrollable_itemlist_vertical"] = const_565;
         param1["scrollable_itemlist_horizontal"] = const_987;
         param1["selector"] = const_813;
         param1["selector_list"] = const_654;
         param1["submenu"] = const_1049;
         param1["tab_button"] = const_564;
         param1["tab_container_button"] = const_1231;
         param1["tab_context"] = const_487;
         param1["tab_content"] = const_1086;
         param1["tab_selector"] = const_633;
         param1["text"] = const_555;
         param1["input"] = const_871;
         param1["toolbar"] = const_1567;
         param1["tooltip"] = const_335;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
