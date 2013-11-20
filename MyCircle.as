package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Johanna
	 */
	public class MyCircle extends Sprite
	{
		public var isEvil:Boolean = false;				//Initierar is.Evil:Boolean och BOX_SIDE:int.
		public const BOX_SIDE:int = 20;
		
		public function MyCircle() 								//Ritar upp en en cirkel och ger den kordinater om hur stor den ska vara.
		{
			this.graphics.beginFill(Math.random() * 0xffffff);
			this.graphics.drawCircle(30, 30, BOX_SIDE);
			this.graphics.endFill();
		}	
	}
}