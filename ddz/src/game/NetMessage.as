package game {
import com.google.protobuf.*;
import game.NetError;
import game.NetHeader;

public class NetMessage extends Message {
    public function NetMessage() {
    }

    private var _header:game.NetHeader = null;
    public function get header():game.NetHeader {
        return _header;
    }
    public function set header(value:game.NetHeader):void {
        _header = value;
    }

    private var _error:game.NetError = null;
    public function get error():game.NetError {
        return _error;
    }
    public function set error(value:game.NetError):void {
        _error = value;
    }

    private var _payload:ByteArray = new ByteArray();
    public function get payload():ByteArray {
        return _payload;
    }
    public function set payload(value:ByteArray):void {
        _payload = value || new ByteArray();
    }

    override public function writeTo(output:CodedOutputStream):void {
        if (!(_header == null)) {
            output.writeMessage(1, _header);
        }
        if (!(_error == null)) {
            output.writeMessage(2, _error);
        }
        if (!(_payload.length == 0)) {
            output.writeBytes(3, _payload);
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
                    _header = new game.NetHeader();
                    input.readMessage(_header);
                    break;
                }
                case 18: {
                    _error = new game.NetError();
                    input.readMessage(_error);
                    break;
                }
                case 26: {
                    _payload = input.readBytes();
                    break;
                }
            }
        }
    }

}
}
