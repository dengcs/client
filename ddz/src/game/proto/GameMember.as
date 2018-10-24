package game.proto {
import com.google.protobuf.*;

public class GameMember extends Message {
    public function GameMember() {
    }

    private var _teamid:int = 0;
    public function get teamid():int {
        return _teamid;
    }
    public function set teamid(value:int):void {
        _teamid = value;
    }

    private var _uid:String = "";
    public function get uid():String {
        return _uid;
    }
    public function set uid(value:String):void {
        _uid = value || "";
    }

    private var _sex:int = 0;
    public function get sex():int {
        return _sex;
    }
    public function set sex(value:int):void {
        _sex = value;
    }

    private var _nickname:String = "";
    public function get nickname():String {
        return _nickname;
    }
    public function set nickname(value:String):void {
        _nickname = value || "";
    }

    private var _portrait:String = "";
    public function get portrait():String {
        return _portrait;
    }
    public function set portrait(value:String):void {
        _portrait = value || "";
    }

    private var _portraitBoxId:int = 0;
    public function get portraitBoxId():int {
        return _portraitBoxId;
    }
    public function set portraitBoxId(value:int):void {
        _portraitBoxId = value;
    }

    private var _state:int = 0;
    public function get state():int {
        return _state;
    }
    public function set state(value:int):void {
        _state = value;
    }

    private var _ulevel:int = 0;
    public function get ulevel():int {
        return _ulevel;
    }
    public function set ulevel(value:int):void {
        _ulevel = value;
    }

    private var _vlevel:int = 0;
    public function get vlevel():int {
        return _vlevel;
    }
    public function set vlevel(value:int):void {
        _vlevel = value;
    }

    override public function writeTo(output:CodedOutputStream):void {
        if (!(_teamid == 0)) {
            output.writeUInt32(1, _teamid);
        }
        if (!(_uid.length == 0)) {
            output.writeString(2, _uid);
        }
        if (!(_sex == 0)) {
            output.writeUInt32(4, _sex);
        }
        if (!(_nickname.length == 0)) {
            output.writeString(5, _nickname);
        }
        if (!(_portrait.length == 0)) {
            output.writeString(6, _portrait);
        }
        if (!(_portraitBoxId == 0)) {
            output.writeUInt32(7, _portraitBoxId);
        }
        if (!(_state == 0)) {
            output.writeUInt32(8, _state);
        }
        if (!(_ulevel == 0)) {
            output.writeUInt32(9, _ulevel);
        }
        if (!(_vlevel == 0)) {
            output.writeUInt32(10, _vlevel);
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
                    _teamid = input.readUInt32();
                    break;
                }
                case 18: {
                    _uid = input.readString();
                    break;
                }
                case 32: {
                    _sex = input.readUInt32();
                    break;
                }
                case 42: {
                    _nickname = input.readString();
                    break;
                }
                case 50: {
                    _portrait = input.readString();
                    break;
                }
                case 56: {
                    _portraitBoxId = input.readUInt32();
                    break;
                }
                case 64: {
                    _state = input.readUInt32();
                    break;
                }
                case 72: {
                    _ulevel = input.readUInt32();
                    break;
                }
                case 80: {
                    _vlevel = input.readUInt32();
                    break;
                }
            }
        }
    }

}
}
