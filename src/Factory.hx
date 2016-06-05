typedef FactoryData = {
    var timer:Float;
}

class Factory extends defold.support.Script<FactoryData> {
    static var frequency = 0.5;
    static var bonus_prob = 0.2;
    static var min_y = 60;
    static var max_y = 600;

    override function init(data:FactoryData) {
        data.timer = 1 / frequency;
        // make the game deterministic
        lua.Math.randomseed(0);
    }

    override function update(data:FactoryData, dt:Float) {
        data.timer = data.timer - dt;
        if (data.timer <= 0) {
            data.timer = 1 / frequency;
            var p = Go.get_position();
            p.y = Vmath.lerp(Math.random(), min_y, max_y);
            var component = "#star_factory";
            if (Math.random() < bonus_prob)
                component = "#bonus_factory";
            defold.Factory.create(component, p);
        }
    }
}
