package game {
import com.google.protobuf.*;

public class NetHeader extends Message {
    public function NetHeader() {
    }

    private var _uid:Int64 = new Int64(0, 0);
    public function get uid():Int64 {
        return _uid;
    }
    public function set uid(value:Int64):void {
        _uid = value || new Int64(0, 0);
    }

    private var _proto:String = "";
    public function get proto():String {
        return _proto;
    }
    public function set proto(value:String):void {
        _proto = value || "";
    }

    override public function writeTo(output:CodedOutputStream):void {
        if (!(_uid.isZero())) {
            output.writeUInt64(1, _uid);
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
                case 8: {
                    _uid = input.readUInt64();
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
