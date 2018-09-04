package {
	import common.GameConstants;

	import laya.display.Stage;
	import laya.net.ResourceVersion;
	import laya.webgl.WebGL;
	import laya.wx.mini.MiniAdpter;
	import laya.utils.Handler;
	import game.query_players;
	import game.NetMessage;
	import game.NetError;
	import game.NetHeader;
	import laya.events.Event;
	import laya.net.Socket;
	import laya.utils.Byte;
	import com.google.protobuf.Message;
	import com.google.protobuf.ByteArray;
	import com.google.protobuf.Int64;
	import com.google.protobuf.CodedInputStream;
	import com.google.protobuf.CodedOutputStream;
	public class LayaSample {
		private var socket:Socket;
		private var output:Byte;
		
		public function LayaSample() {
			MiniAdpter.init();
			//初始化引擎
			Laya.init(GameConstants.stageWidth, GameConstants.stageHeight, WebGL);
			
			Laya.stage.alignH = Stage.ALIGN_CENTER;
			Laya.stage.alignV = Stage.ALIGN_TOP;
			Laya.stage.scaleMode = Stage.SCALE_FIXED_WIDTH;
			Laya.stage.screenMode = Stage.SCREEN_HORIZONTAL;
			
			//设置版本控制类型为使用文件名映射的方式
            ResourceVersion.type = ResourceVersion.FILENAME_VERSION;
            //加载版本信息文件
            ResourceVersion.enable("version.json", Handler.create(this, beginLoad));   
		}

		private function beginLoad():void {
			//加载引擎需要的资源
			//Laya.loader.load(atlasUrls(), Handler.create(this, onLoaded));
			onLoaded();
		}
		
		private function onLoaded():void {
			socket = new Socket();
			//socket.connect("echo.websocket.org", 80);
			socket.connectByUrl("ws://192.168.188.83:51001");
			
			output = socket.output;
			
			socket.on(Event.OPEN, this, onSocketOpen);
			socket.on(Event.CLOSE, this, onSocketClose);
			socket.on(Event.MESSAGE, this, onMessageReveived);
			socket.on(Event.ERROR, this, onConnectError);
		}
		

		private function atlasUrls():Array
		{
			var urls:Array=[];

			return urls;
		}

		private function onSocketOpen(e:*=null):void
		{
			trace("Connected");

			var ntError:NetError = new NetError();
			var ntHeader:NetHeader = new NetHeader();
			var ntMessage:NetMessage = new NetMessage();
			var q_player:query_players = new query_players();

			ntError.code = 1;
			ntHeader.uid = "100001";
			ntHeader.proto = "query_players";
			ntMessage.error = ntError;
			ntMessage.header = ntHeader;
			//var sendMsg:ByteArray = Message.toByteArray(ntMessage);
			//trace("length",sendMsg.length);
			
			//output.writeArrayBuffer(sendMsg, 0, sendMsg.length);

			//socket.flush();

			var bytes:ByteArray = new ByteArray();
			ntHeader.writeTo(new CodedOutputStream(bytes));
			trace(bytes.length)
			var readheader:NetHeader = new NetHeader();
			bytes.position = 0;
			readheader.readFrom(new CodedInputStream(bytes, bytes.length));
			trace(readheader);
		}
		
		private function onSocketClose(e:*=null):void
		{
			trace("Socket closed");
		}
		
		private function onMessageReveived(message:*=null):void
		{
			trace("Message from server:");
		}

		private function onConnectError(e:Event=null):void
		{
			trace("error");
		}
	}
}