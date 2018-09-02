package game {
import com.google.protobuf.*;

public class NetError extends Message {
    public function NetError() {
    }

    private var _code:int = 0;
    public function get code():int {
        return _code;
    }
    public function set code(value:int):void {
        _code = value;
    }

    override public function writeTo(output:CodedOutputStream):void {
        if (!(_code == 0)) {
            output.writeUInt32(1, _code);
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
                    _code = input.readUInt32();
                    break;
                }
            }
        }
    }

}
}
