package game.proto {
import com.google.protobuf.*;
import game.proto.GameMember;

public class game_start_notify extends Message {
    public function game_start_notify() {
    }

    private var _state:int = 0;
    public function get state():int {
        return _state;
    }
    public function set state(value:int):void {
        _state = value;
    }

    private var _members:Vector.<game.proto.GameMember> = new Vector.<game.proto.GameMember>();
    public function get members():Vector.<game.proto.GameMember> {
        return _members;
    }
    public function set members(value:Vector.<game.proto.GameMember>):void {
        _members = value || new Vector.<game.proto.GameMember>();
    }

    override public function writeTo(output:CodedOutputStream):void {
        if (!(_state == 0)) {
            output.writeUInt32(1, _state);
        }
        if (_members.length > 0) {
            output.writeVector(_members, 2, FieldDescriptorType.MESSAGE);
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
                    _state = input.readUInt32();
                    break;
                }
                case 18: {
                    _members.push(input.readMessage(new game.proto.GameMember()));
                    break;
                }
            }
        }
    }

}
}
