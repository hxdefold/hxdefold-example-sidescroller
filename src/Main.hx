class Main extends defold.support.Script<{}> {
    override function init(_) {
        // set blue background
        Msg.post("@render:", DefoldMessages.ClearColor, {color: Vmath.vector4(0.52, 0.80, 1, 0)});
        Msg.post(".", DefoldMessages.AcquireInputFocus);
    }

    override function on_input(_, action_id:Hash, action:defold.support.InputAction) {
        if (action_id == hash("ok") && action.pressed) {
            lua.Lua.print('OK');
        } else if (action_id == hash("profiler_toggle") && action.pressed) {
            Msg.post("@system:", DefoldMessages.ToggleProfile);
            return true;
        }
        return false;
    }
}
