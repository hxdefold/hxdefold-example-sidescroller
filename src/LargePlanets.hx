class LargePlanets extends defold.support.Script<{}> {
    static var speed = -60;

    override function update(_, dt:Float) {
        var p = Go.get_position();
        // apply the speed
        p.x = p.x + speed * dt;
        // reset clouds to far right when they reach the far left to create infinite scrolling
        if (p.x <= -1280 * 2)
            p.x = 1280 * 2;
        Go.set_position(p);
    }
}
