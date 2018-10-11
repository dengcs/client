package game.handler
{
	import game.manager.MessageManager;
	import laya.utils.Handler;
	import game.proto.NetMessage;
	import game.proto.room_create_resp;
	import com.google.protobuf.CodedInputStream;
	import game.proto.room_quit_resp;
	import game.proto.room_invite_resp;

	/**
	 * ...
	 * @dengcs
	 */
	public final class RoomHandler{

		public function RoomHandler(){			
			registerMessage();
		}

		private function registerMessage():void
		{
			var msgManager:MessageManager = MessageManager.getInstance();
			msgManager.registerMessage("room_create_resp", new Handler(this, handler_room_create));
			msgManager.registerMessage("room_quit_resp", new Handler(this, handler_room_quit));
			msgManager.registerMessage("room_invite_resp", new Handler(this, handler_room_invite));
		}

		private function handler_room_create(ntMessage:NetMessage):void
		{
			var resp_data:room_create_resp = new room_create_resp();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)
		}

		private function handler_room_quit(ntMessage:NetMessage):void
		{
			var resp_data:room_quit_resp = new room_quit_resp();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)
		}

		private function handler_room_invite(ntMessage:NetMessage):void
		{
			var resp_data:room_invite_resp = new room_invite_resp();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)
		}
	}

}