package game {
import com.google.protobuf.*;

public class NetHeader extends Message {
    public function NetHeader() {
    }

    private var _uid:String = "";
    public function get uid():String {
        return _uid;
    }
    public function set uid(value:String):void {
        _uid = value || "";
    }

    private var _proto:String = "";
    public function get proto():String {
        return _proto;
    }
    public function set proto(value:String):void {
        _proto = value || "";
    }

    override public function writeTo(output:CodedOutputStream):void {
        if (!(_uid.length == 0)) {
            output.writeString(1, _uid);
        }
        if (!(_proto.length == 0)) {
            output.writeString(2, _proto);
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
                case 18: {
                    _proto = input.readString();
                    break;
                }
            }
        }
    }

}
}
