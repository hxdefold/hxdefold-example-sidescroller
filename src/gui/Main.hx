package gui;

import defold.Gui.GuiEasing;

private typedef Data = {
    var score:Int;
    var score_node:Node;
}

class Main extends defold.support.GuiScript<Data> {
    override function init(data:Data) {
        data.score = 0;
        trace(Gui);
        data.score_node = Gui.get_node("score");
    }

    function scale_down(data:Data, node:Node) {
        var s = 1.0;
        Gui.animate(node, Gui.PROP_SCALE, Vmath.vector4(s, s, s, 0), EASING_OUT, 0.05);
    }

    override function on_message<T>(data:Data, message_id:Message<T>, message:T, sender:Url) {
        switch (message_id) {
            case Messages.AddScore:
                var s = 1.2;
                data.score += message.amount;
                Gui.set_text(data.score_node, Std.string(data.score));
                Gui.animate(data.score_node, Gui.PROP_SCALE, Vmath.vector4(s, s, s, 0), EASING_OUT, 0.1, 0.0, scale_down);
        }
    }
}
