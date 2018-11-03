package game.handler
{
	import game.manager.MessageManager;
	import game.proto.NetMessage;
	import laya.utils.Handler;
	import game.proto.game_leave_resp;
	import com.google.protobuf.CodedInputStream;
	import game.proto.game_start_notify;
	import game.proto.game_update_notify;
	import game.proto.game_update;
	import game.net.NetClient;
	import laya.d3.core.particleShuriKen.module.TextureSheetAnimation;

	/**
	 * ...
	 * @dengcs
	 */
	public class GameHandler{
		public function GameHandler(){
			registerMessage();
		}

		private function registerMessage():void
		{
			var msgManager:MessageManager = MessageManager.getInstance();
			msgManager.registerMessage("game_leave_resp", new Handler(this, handler_game_leave));
			msgManager.registerMessage("game_start_notify", new Handler(this, notify_game_start));
			msgManager.registerMessage("game_update_notify", new Handler(this, notify_game_update));
		}

		private function handler_game_leave(ntMessage:NetMessage):void
		{
			var resp_data:game_leave_resp = new game_leave_resp();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)
		}

		private function notify_game_start(ntMessage:NetMessage):void
		{
			var resp_data:game_start_notify = new game_start_notify();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)

			var sendMsg:game_update = new game_update();
			sendMsg.data = "{\"op\":\"test\"}"
			NetClient.send("game_update", sendMsg);
		}

		private function notify_game_update(ntMessage:NetMessage):void
		{
			var resp_data:game_update_notify = new game_update_notify();
			resp_data.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_data)
		}
	}

}