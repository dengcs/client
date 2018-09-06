package game.handler
{
	import game.NetMessage;
	import game.query_players_resp;
	import com.google.protobuf.CodedInputStream;
	import game.manager.MessageManager;
	import laya.utils.Handler;

	/**
	 * ...
	 * @dengcs
	 */
	public final class PlayerHandler{

		public function PlayerHandler(){			
			registerMessage();
		}

		private function registerMessage():void
		{
			var msgManager:MessageManager = MessageManager.getInstance();
			msgManager.registerMessage("query_players_resp", new Handler(this, handler_query_players_resp));
		}

		private function handler_query_players_resp(ntMessage:NetMessage):void
		{
			var resp_q:query_players_resp = new query_players_resp();
			resp_q.readFrom(new CodedInputStream(ntMessage.payload));
			trace(resp_q)
		}
	}

}