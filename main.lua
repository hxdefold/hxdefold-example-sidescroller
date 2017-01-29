-- Generated by Haxe 3.4.0 (git build lua_slim @ a45dd1a)
local function _hx_anon_newindex(t,k,v) t.__fields__[k] = true; rawset(t,k,v); end
local _hx_anon_mt = {__newindex=_hx_anon_newindex}
local function _hx_a(...)
  local __fields__ = {};
  local ret = {__fields__ = __fields__};
  local max = select('#',...);
  local tab = {...};
  local cur = 1;
  while cur < max do
    local v = tab[cur];
    __fields__[v] = true;
    ret[v] = tab[cur+1];
    cur = cur + 2
  end
  return setmetatable(ret, _hx_anon_mt)
end

local function _hx_e()
  return setmetatable({__fields__ = {}}, _hx_anon_mt)
end

local function _hx_o(obj)
  return setmetatable(obj, _hx_anon_mt)
end

local function _hx_new(prototype)
  return setmetatable({__fields__ = {}}, {__newindex=_hx_anon_newindex, __index=prototype})
end

local _hxClasses = {}
Int = (function() _hxClasses.Int = _hx_o({__fields__={__name__=true},__name__={"Int"}}); return _hxClasses.Int end)();
Dynamic = (function() 
_hxClasses.Dynamic = _hx_o({__fields__={__name__=true},__name__={"Dynamic"}}); return _hxClasses.Dynamic end)();
Float = (function() 
_hxClasses.Float = _hx_e(); return _hxClasses.Float end)();
Float.__name__ = {"Float"}
Bool = (function() 
_hxClasses.Bool = _hx_e(); return _hxClasses.Bool end)();
Bool.__ename__ = {"Bool"}
Class = (function() 
_hxClasses.Class = _hx_o({__fields__={__name__=true},__name__={"Class"}}); return _hxClasses.Class end)();
Enum = _hx_e();

local _hx_array_mt = {
  __newindex = function(t,k,v)
    local len = t.length
    t.length =  k >= len and (k + 1) or len
    rawset(t,k,v)
  end
}

local function _hx_tab_array(tab,length)
  tab.length = length
  return setmetatable(tab, _hx_array_mt)
end

local _hx_exports = _hx_exports or {}
_hx_exports["gui"] = _hx_exports["gui"] or _hx_e()
local Array = _hx_e()
local defold = {}
defold.support = {}
defold.support.Script = _hx_e()
local BonusStar = _hx_e()
local Factory = _hx_e()
local LargePlanets = _hx_e()
local Main = _hx_e()
local Messages = _hx_e()
local SmallPlanets = _hx_e()
local Spaceship = _hx_e()
local Star = _hx_e()
local String = _hx_e()
local Std = _hx_e()
defold.GoMessages = _hx_e()
defold.PhysicsMessages = _hx_e()
defold.RenderMessages = _hx_e()
defold.SysMessages = _hx_e()
defold.support.GuiScript = _hx_e()
defold.types = {}
defold.types._Message = {}
defold.types._Message.Message_Impl_ = _hx_e()
local gui = {}
gui.Main = _hx_e()
local haxe = {}
haxe.io = {}
haxe.io.Eof = _hx_e()
local lua = {}
lua.Boot = _hx_e()

local _hx_bind, _hx_bit, _hx_staticToInstance, _hx_funcToField, _hx_maxn, _hx_print, _hx_apply_self, _hx_box_mr, _hx_bit_clamp, _hx_table, _hx_bit_raw

Array.new = {}
Array.prototype = _hx_a(
  'join', function(self,sep) 
    local tbl = ({});
    local _gthis = self;
    local cur_length = 0;
    local i = _hx_o({__fields__={hasNext=true,next=true},hasNext=function() 
      do return cur_length < _gthis.length end;
    end,next=function() 
      cur_length = cur_length + 1;
      do return _gthis[cur_length - 1] end;
    end});
    while (i:hasNext()) do 
      _G.table.insert(tbl,Std.string(i:next()));
      end;
    do return _G.table.concat(tbl,sep) end
  end,
  'push', function(self,x) 
    _G.rawset(self,self.length,x);
    _G.rawset(self,"length",self.length + 1);
    do return _G.rawget(self,"length") end
  end,
  'iterator', function(self) 
    local _gthis = self;
    local cur_length = 0;
    do return _hx_o({__fields__={hasNext=true,next=true},hasNext=function() 
      do return cur_length < _gthis.length end;
    end,next=function() 
      cur_length = cur_length + 1;
      do return _gthis[cur_length - 1] end;
    end}) end
  end
)

defold.support.Script.new = function() 
  local self = _hx_new(defold.support.Script.prototype)
  defold.support.Script.super(self)
  return self
end
defold.support.Script.super = function(self) 
end
defold.support.Script.prototype = _hx_a(
  'init', function(self,_self) 
  end,
  'final', function(self,_self) 
  end,
  'update', function(self,_self,dt) 
  end,
  'on_message', function(self,_self,message_id,message,sender) 
  end,
  'on_input', function(self,_self,action_id,action) 
    do return false end
  end,
  'on_reload', function(self,_self) 
  end
)

BonusStar.new = function() 
  local self = _hx_new(BonusStar.prototype)
  BonusStar.super(self)
  return self
end
BonusStar.super = function(self) 
  defold.support.Script.super(self);
end
_hx_exports["BonusStar"] = BonusStar
BonusStar.prototype = _hx_a(
  'update', function(self,_,dt) 
    local p = _G.go.get_position();
    p.x = p.x + (BonusStar.speed * dt);
    if (p.x < -32) then 
      _G.go.delete();
    end;
    _G.go.set_position(p);
  end,
  'on_message', function(self,_,message_id,message,sender) 
    if (message_id == defold.PhysicsMessages.CollisionResponse) then 
      _G.msg.post("main#gui",Messages.AddScore,_hx_o({__fields__={amount=true},amount=BonusStar.score}));
      _G.go.delete();
    end;
  end
)
BonusStar.__super__ = defold.support.Script
setmetatable(BonusStar.prototype,{__index=defold.support.Script.prototype})

Factory.new = function() 
  local self = _hx_new(Factory.prototype)
  Factory.super(self)
  return self
end
Factory.super = function(self) 
  defold.support.Script.super(self);
end
_hx_exports["Factory"] = Factory
Factory.prototype = _hx_a(
  'init', function(self,data) 
    data.timer = 1 / Factory.frequency;
    _G.math.randomseed(0);
  end,
  'update', function(self,data,dt) 
    data.timer = data.timer - dt;
    if (data.timer <= 0) then 
      data.timer = 1 / Factory.frequency;
      local p = _G.go.get_position();
      p.y = _G.vmath.lerp(_G.math.random(),Factory.min_y,Factory.max_y);
      local component = "#star_factory";
      if (_G.math.random() < Factory.bonus_prob) then 
        component = "#bonus_factory";
      end;
      _G.factory.create(component,p);
    end;
  end
)
Factory.__super__ = defold.support.Script
setmetatable(Factory.prototype,{__index=defold.support.Script.prototype})

LargePlanets.new = function() 
  local self = _hx_new(LargePlanets.prototype)
  LargePlanets.super(self)
  return self
end
LargePlanets.super = function(self) 
  defold.support.Script.super(self);
end
_hx_exports["LargePlanets"] = LargePlanets
LargePlanets.prototype = _hx_a(
  'update', function(self,_,dt) 
    local p = _G.go.get_position();
    p.x = p.x + (LargePlanets.speed * dt);
    if (p.x <= -2560) then 
      p.x = 2560;
    end;
    _G.go.set_position(p);
  end
)
LargePlanets.__super__ = defold.support.Script
setmetatable(LargePlanets.prototype,{__index=defold.support.Script.prototype})

Main.new = function() 
  local self = _hx_new(Main.prototype)
  Main.super(self)
  return self
end
Main.super = function(self) 
  defold.support.Script.super(self);
end
_hx_exports["Main"] = Main
Main.prototype = _hx_a(
  'init', function(self,_) 
    _G.msg.post("@render:",defold.RenderMessages.ClearColor,_hx_o({__fields__={color=true},color=_G.vmath.vector4(0.52,0.80,1,0)}));
    _G.msg.post(".",defold.GoMessages.AcquireInputFocus);
  end,
  'on_input', function(self,_,action_id,action) 
    if ((action_id == _G.hash("ok")) and action.pressed) then 
      _G.print("OK");
    else
      if ((action_id == _G.hash("profiler_toggle")) and action.pressed) then 
        _G.msg.post("@system:",defold.SysMessages.ToggleProfile);
        do return true end;
      end;
    end;
    do return false end
  end
)
Main.__super__ = defold.support.Script
setmetatable(Main.prototype,{__index=defold.support.Script.prototype})

Messages.new = {}

SmallPlanets.new = function() 
  local self = _hx_new(SmallPlanets.prototype)
  SmallPlanets.super(self)
  return self
end
SmallPlanets.super = function(self) 
  defold.support.Script.super(self);
end
_hx_exports["SmallPlanets"] = SmallPlanets
SmallPlanets.prototype = _hx_a(
  'update', function(self,_,dt) 
    local p = _G.go.get_position();
    p.x = p.x + (SmallPlanets.speed * dt);
    if (p.x <= -1280) then 
      p.x = 1280;
    end;
    _G.go.set_position(p);
  end
)
SmallPlanets.__super__ = defold.support.Script
setmetatable(SmallPlanets.prototype,{__index=defold.support.Script.prototype})

Spaceship.new = function() 
  local self = _hx_new(Spaceship.prototype)
  Spaceship.super(self)
  return self
end
Spaceship.super = function(self) 
  defold.support.Script.super(self);
end
_hx_exports["Spaceship"] = Spaceship
Spaceship.prototype = _hx_a(
  'init', function(self,data) 
    _G.msg.post(".",defold.GoMessages.AcquireInputFocus);
    data.speed = 0;
    _G.go.set(".","euler.z",-5);
    _G.go.animate(".","euler.z",_G.go.PLAYBACK_LOOP_PINGPONG,5,_G.go.EASING_INOUTSINE,2);
  end,
  'update', function(self,data,dt) 
    local p = _G.go.get_position();
    p.y = p.y + (data.speed * dt);
    if (p.y < Spaceship.min_y) then 
      p.y = Spaceship.min_y;
    else
      if (p.y > Spaceship.max_y) then 
        p.y = Spaceship.max_y;
      end;
    end;
    _G.go.set_position(p);
    data.speed = 0;
  end,
  'on_input', function(self,data,action_id,action) 
    if (action_id == _G.hash("up")) then 
      data.speed = Spaceship.max_speed;
    else
      if (action_id == _G.hash("down")) then 
        data.speed = -Spaceship.max_speed;
      end;
    end;
    do return false end
  end
)
Spaceship.__super__ = defold.support.Script
setmetatable(Spaceship.prototype,{__index=defold.support.Script.prototype})

Star.new = function() 
  local self = _hx_new(Star.prototype)
  Star.super(self)
  return self
end
Star.super = function(self) 
  defold.support.Script.super(self);
end
_hx_exports["Star"] = Star
Star.prototype = _hx_a(
  'update', function(self,_,dt) 
    local p = _G.go.get_position();
    p.x = p.x + (Star.speed * dt);
    if (p.x < -32) then 
      _G.go.delete();
    end;
    _G.go.set_position(p);
  end,
  'on_message', function(self,_,message_id,message,sender) 
    if (message_id == defold.PhysicsMessages.CollisionResponse) then 
      _G.msg.post("main#gui",Messages.AddScore,_hx_o({__fields__={amount=true},amount=Star.score}));
      _G.go.delete();
    end;
  end
)
Star.__super__ = defold.support.Script
setmetatable(Star.prototype,{__index=defold.support.Script.prototype})

String.new = {}
String.__index = function(s,k) 
  if (k == "length") then 
    do return _G.string.len(s) end;
  else
    local o = String.prototype;
    local field = k;
    if ((function() 
      local _hx_1
      if (o.__fields__ ~= nil) then 
      _hx_1 = o.__fields__[field] ~= nil; else 
      _hx_1 = o[field] ~= nil; end
      return _hx_1
    end )()) then 
      do return String.prototype[k] end;
    else
      if (String.__oldindex ~= nil) then 
        do return String.__oldindex[k] end;
      else
        do return nil end;
      end;
    end;
  end;
end
String.fromCharCode = function(code) 
  do return _G.string.char(code) end;
end
String.prototype = _hx_a(
  'toString', function(self) 
    do return self end
  end
)

Std.new = {}
Std.string = function(s) 
  do return lua.Boot.__string_rec(s) end;
end

defold.GoMessages.new = {}

defold.PhysicsMessages.new = {}

defold.RenderMessages.new = {}

defold.SysMessages.new = {}

defold.support.GuiScript.new = function() 
  local self = _hx_new(defold.support.GuiScript.prototype)
  defold.support.GuiScript.super(self)
  return self
end
defold.support.GuiScript.super = function(self) 
end
defold.support.GuiScript.prototype = _hx_a(
  'init', function(self,_self) 
  end,
  'final', function(self,_self) 
  end,
  'update', function(self,_self,dt) 
  end,
  'on_message', function(self,_self,message_id,message,sender) 
  end,
  'on_input', function(self,_self,action_id,action) 
    do return false end
  end,
  'on_reload', function(self,_self) 
  end
)

defold.types._Message.Message_Impl_.new = {}
defold.types._Message.Message_Impl_._new = function(s) 
  do return _G.hash(s) end;
end

gui.Main.new = function() 
  local self = _hx_new(gui.Main.prototype)
  gui.Main.super(self)
  return self
end
gui.Main.super = function(self) 
  defold.support.GuiScript.super(self);
end
_hx_exports["gui"]["Main"] = gui.Main
gui.Main.prototype = _hx_a(
  'init', function(self,data) 
    data.score = 0;
    data.score_node = _G.gui.get_node("score");
  end,
  'scale_down', function(self,data,node) 
    _G.gui.animate(node,_G.gui.PROP_SCALE,_G.vmath.vector4(1.0,1.0,1.0,0),_G.gui.EASING_OUT,0.05);
  end,
  'on_message', function(self,data,message_id,message,sender) 
    if (message_id == Messages.AddScore) then 
      data.score = data.score + message.amount;
      _G.gui.set_text(data.score_node,Std.string(data.score));
      _G.gui.animate(data.score_node,_G.gui.PROP_SCALE,_G.vmath.vector4(1.2,1.2,1.2,0),_G.gui.EASING_OUT,0.1,0.0,_hx_bind(self,self.scale_down));
    end;
  end
)
gui.Main.__super__ = defold.support.GuiScript
setmetatable(gui.Main.prototype,{__index=defold.support.GuiScript.prototype})

haxe.io.Eof.new = {}
haxe.io.Eof.prototype = _hx_a(
  'toString', function(self) 
    do return "Eof" end
  end
)

lua.Boot.new = {}
lua.Boot.isArray = function(o) 
  if (_G.type(o) == "table") then 
    if ((o.__enum__ == nil) and (_G.getmetatable(o) ~= nil)) then 
      do return _G.getmetatable(o).__index == Array.prototype end;
    else
      do return false end;
    end;
  else
    do return false end;
  end;
end
lua.Boot.printEnum = function(o,s) 
  if (o.length == 2) then 
    do return o[0] end;
  else
    local str = Std.string(o[0]) .. "(";
    s = s .. "\t";
    local _g1 = 2;
    local _g = o.length;
    while (_g1 < _g) do 
      _g1 = _g1 + 1;
      local i = _g1 - 1;
      if (i ~= 2) then 
        str = str .. ("," .. lua.Boot.__string_rec(o[i],s));
      else
        str = str .. lua.Boot.__string_rec(o[i],s);
      end;
      end;
    do return str .. ")" end;
  end;
end
lua.Boot.printClassRec = function(c,result,s) 
  if (result == nil) then 
    result = "";
  end;
  local f = lua.Boot.__string_rec;
  for k,v in pairs(c) do if result ~= '' then result = result .. ', ' end result = result .. k .. ':' .. f(v, s.. '	') end;
  do return result end;
end
lua.Boot.__string_rec = function(o,s) 
  if (s == nil) then 
    s = "";
  end;
  local _g = type(o);
  local _g1 = _g;
  if (_g1) == "boolean" then 
    do return tostring(o) end;
  elseif (_g1) == "function" then 
    do return "<function>" end;
  elseif (_g1) == "nil" then 
    do return "null" end;
  elseif (_g1) == "number" then 
    if (o == _G.math.huge) then 
      do return "Infinity" end;
    else
      if (o == -_G.math.huge) then 
        do return "-Infinity" end;
      else
        if (o ~= o) then 
          do return "NaN" end;
        else
          do return tostring(o) end;
        end;
      end;
    end;
  elseif (_g1) == "string" then 
    do return o end;
  elseif (_g1) == "table" then 
    if (o.__enum__ ~= nil) then 
      do return lua.Boot.printEnum(o,s) end;
    else
      if ((o.toString ~= nil) and not lua.Boot.isArray(o)) then 
        do return o:toString() end;
      else
        if (lua.Boot.isArray(o)) then 
          local o2 = o;
          if (s.length > 5) then 
            do return "[...]" end;
          else
            local _g2 = _hx_tab_array({ }, 0);
            local _g11 = 0;
            while (_g11 < o2.length) do 
              local i = o2[_g11];
              _g11 = _g11 + 1;
              _g2:push(lua.Boot.__string_rec(i,s .. 1));
              end;
            do return "[" .. _g2:join(",") .. "]" end;
          end;
        else
          if (o.__class__ ~= nil) then 
            do return "{" .. lua.Boot.printClassRec(o,"",s .. "\t") .. "}" end;
          else
            local fields = lua.Boot.fieldIterator(o);
            local buffer = ({});
            local first = true;
            _G.table.insert(buffer,"{ ");
            local f = fields;
            while (f:hasNext()) do 
              local f1 = f:next();
              if (first) then 
                first = false;
              else
                _G.table.insert(buffer,", ");
              end;
              _G.table.insert(buffer,"" .. Std.string(f1) .. " : " .. Std.string(o[f1]));
              end;
            _G.table.insert(buffer," }");
            do return _G.table.concat(buffer,"") end;
          end;
        end;
      end;
    end;
  elseif (_g1) == "thread" then 
    do return "<thread>" end;
  elseif (_g1) == "userdata" then 
    do return "<userdata>" end;else
  _G.error("Unknown Lua type",0); end;
end
lua.Boot.fieldIterator = function(o) 
  local tbl = (function() 
    local _hx_1
    if (o.__fields__ ~= nil) then 
    _hx_1 = o.__fields__; else 
    _hx_1 = o; end
    return _hx_1
  end )();
  local cur = _G.pairs(tbl);
  local next_valid = function(tbl1,val) 
    while (lua.Boot.hiddenFields[val] ~= nil) do 
      val = cur(tbl1,val);
      end;
    do return val end;
  end;
  local cur_val = next_valid(tbl,cur(tbl,nil));
  do return _hx_o({__fields__={next=true,hasNext=true},next=function() 
    local ret = cur_val;
    cur_val = next_valid(tbl,cur(tbl,cur_val));
    do return ret end;
  end,hasNext=function() 
    do return cur_val ~= nil end;
  end}) end;
end
local _hx_string_mt = _G.getmetatable('');
String.__oldindex = _hx_string_mt.__index;
_hx_string_mt.__index = String.__index;
_hx_string_mt.__add = function(a,b) return Std.string(a)..Std.string(b) end;
_hx_string_mt.__concat = _hx_string_mt.__add
_hx_array_mt.__index = Array.prototype

BonusStar.score = 5000
BonusStar.speed = -240
Factory.frequency = 0.5
Factory.bonus_prob = 0.2
Factory.min_y = 60
Factory.max_y = 600
LargePlanets.speed = -60
Messages.AddScore = _G.hash("add_score")
SmallPlanets.speed = -30
Spaceship.max_speed = 150
Spaceship.min_y = 60
Spaceship.max_y = 600
Star.score = 1000
Star.speed = -240
defold.GoMessages.AcquireInputFocus = _G.hash("acquire_input_focus")
defold.GoMessages.Disable = _G.hash("disable")
defold.GoMessages.Enable = _G.hash("enable")
defold.GoMessages.ReleaseInputFocus = _G.hash("release_input_focus")
defold.GoMessages.RequestTransform = _G.hash("request_transform")
defold.GoMessages.SetParent = _G.hash("set_parent")
defold.GoMessages.TransformResponse = _G.hash("transform_response")
defold.PhysicsMessages.ApplyForce = _G.hash("apply_force")
defold.PhysicsMessages.CollisionResponse = _G.hash("collision_response")
defold.PhysicsMessages.ContactPointResponse = _G.hash("contact_point_response")
defold.PhysicsMessages.RequestVelocity = _G.hash("request_velocity")
defold.PhysicsMessages.RayCastResponse = _G.hash("ray_cast_response")
defold.PhysicsMessages.TriggerResponse = _G.hash("trigger_response")
defold.PhysicsMessages.VelocityResponse = _G.hash("velocity_response")
defold.RenderMessages.ClearColor = _G.hash("clear_color")
defold.RenderMessages.DrawLine = _G.hash("draw_line")
defold.RenderMessages.DrawText = _G.hash("draw_text")
defold.RenderMessages.WindowResized = _G.hash("window_resized")
defold.SysMessages.Exit = _G.hash("exit")
defold.SysMessages.Reboot = _G.hash("reboot")
defold.SysMessages.SetUpdateFrequency = _G.hash("set_update_frequency")
defold.SysMessages.StartRecord = _G.hash("start_record")
defold.SysMessages.StopRecord = _G.hash("stop_record")
defold.SysMessages.ToggleProfile = _G.hash("toggle_profile")
lua.Boot.hiddenFields = {__id__=true, hx__closures=true, super=true, prototype=true, __fields__=true, __ifields__=true, __class__=true, __properties__=true}
do

end
_hx_bind = function(o,m)
  if m == nil then return nil end;
  local f;
  if o._hx__closures == nil then
    _G.rawset(o, '_hx__closures', {});
  else 
    f = o._hx__closures[m];
  end
  if (f == nil) then
    f = function(...) return m(o, ...) end;
    o._hx__closures[m] = f;
  end
  return f;
end
_G.math.randomseed(_G.os.time());
return _hx_exports
