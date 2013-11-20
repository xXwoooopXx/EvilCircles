package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Johanna
	 */
	public class Main extends Sprite 
	{
		private var t:TextField = new TextField(); 						//Initierar ett t:TextField, boxes:Vector <MyCircle> och score:int.
		private var boxes:Vector.<MyCircle> = new Vector.<MyCircle>();
		private var score:int = 0;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			t.text = "Score: 0";					//Lägger till ett textfält på scenen och ritar upp en liten box runt den.
			addChild(t);
			
			t.background = true;
			t.backgroundColor = 0x94E292;
			t.x = 720;
			t.y = 0;
			t.width = 100;
			t.height = 20;
			t.border = true;
			t.borderColor = 0xFF80FF;
			t.textColor = 0x513957  

			
			
		for (var i:int = 0; i < 20; i++)   		//Initierar MyCircle.
		{
			var box:MyCircle = new MyCircle();
			addChild(box);
			boxes.push(box);
			box.x = (Math.random() * 700);
			box.y = (Math.random() * 500);
			box.addEventListener(MouseEvent.CLICK, clickBox);
			if (i == 5)
				box.isEvil = true;
		}
	
			stage.addEventListener(KeyboardEvent.KEY_DOWN, space);			//Lägger till en lyssnare på¨scenen som lysnar efter KEY_DOWN.
		}
		
		private function space(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32) 
			{						
				while (boxes.length > 0)			// Ta bort alla cirklar ur vectorn och tar bort alla cirklar ifrån scenen.
				{
					removeChild(boxes[0]);
					boxes.shift();
				}

				score = 0;							// Nollställer poängen.
				t.text = "Score:" + score;
				
				for (var i:int = 0; i < 20; i++) 	// Lägger ut 20 nya cirklar.
				{
					var box:MyCircle = new MyCircle();
					addChild(box);
					boxes.push(box);
					box.x = (Math.random() * 700);
					box.y = (Math.random() * 500);
					box.addEventListener(MouseEvent.CLICK, clickBox);
					if (i == 5)
						box.isEvil = true;
				}
			}
		}
			
		private function clickBox(e:Event):void 
		{
			if (MyCircle(e.target).isEvil)
			{
				while (boxes.length > 0)
				{
					removeChild(boxes[0]);			//Tar bort alla cirklar om man trycker på den slumpade cirkeln som är "isEvil."
					boxes.shift();
				}
			}
				else 
				{
					e.target.y = -200;				//Lägger alla cirklar man trycker på, på y-punkten (-200) utanför skärmen så den försvinner och lägger til en Score för varje cirkel som man trycker på.
					score += 1;						
					t.text = "Score:" + score;	
				}			
		}
	}
}
	