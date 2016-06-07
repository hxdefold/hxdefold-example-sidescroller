import defold.support.InputAction;

typedef SpaceshipData = {
    var speed:Float;
}

class Spaceship extends defold.support.Script<SpaceshipData> {
    static var max_speed = 150;
    static var min_y = 60;
    static var max_y = 600;

    override function init(data:SpaceshipData) {
        // Let the script receive input from the player
        Msg.post(".", DefoldMessages.AcquireInputFocus);
        // the current speed of the space ship
        data.speed = 0;

        // Animate the ship so it's swaying back and forth
        Go.set(".", "euler.z", -5);
        Go.animate(".", "euler.z", PLAYBACK_LOOP_PINGPONG, 5, GoEasing.EASING_INOUTSINE, 2);
    }

    override function update(data:SpaceshipData, dt:Float) {
        var p = Go.get_position();
        p.y = p.y + data.speed * dt;
        if (p.y < min_y)
            p.y = min_y;
        else if (p.y > max_y)
            p.y = max_y;
        Go.set_position(p);
        data.speed = 0;
    }

    override function on_input(data:SpaceshipData, action_id:Hash, action:InputAction) {
        if (action_id == hash("up"))
            data.speed = max_speed;
        else if (action_id == hash("down"))
            data.speed = -max_speed;
        return false;
    }
}
