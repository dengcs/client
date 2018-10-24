package game.proto {
import com.google.protobuf.*;

public class game_quit__notify extends Message {
    public function game_quit__notify() {
    }

    private var _uid:String = "";
    public function get uid():String {
        return _uid;
    }
    public function set uid(value:String):void {
        _uid = value || "";
    }

    override public function writeTo(output:CodedOutputStream):void {
        if (!(_uid.length == 0)) {
            output.writeString(1, _uid);
        }

        super.writeTo(output);
    }

    override public function readFrom(input:CodedInputStream):void {
        while(true) {
            var tag:int = input.readTag();
            switch(tag) {
                case 0: {
                    return;
                }
                default: {
                    if (!input.skipField(tag)) {
                        return;
                    }
                    break;
                }
                case 10: {
                    _uid = input.readString();
                    break;
                }
            }
        }
    }

}
}
