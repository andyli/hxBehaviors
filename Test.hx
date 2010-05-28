import flash.Lib;
import flash.display.Sprite;
import flash.events.Event;

import hxSteeringBehaviors.Vehicle;
import hxSteeringBehaviors.VehicleGroup;
import hxSteeringBehaviors.behavior.AbstractBehavior;
import hxSteeringBehaviors.behavior.Alignment;
import hxSteeringBehaviors.behavior.Arrival;
import hxSteeringBehaviors.behavior.Cohesion;
import hxSteeringBehaviors.behavior.Flee;
import hxSteeringBehaviors.behavior.Seek;
import hxSteeringBehaviors.behavior.Separation;
import hxSteeringBehaviors.behavior.UnalignedCollisionAvoidance;
import hxSteeringBehaviors.behavior.Wander;
import hxSteeringBehaviors.behavior.combined.Flocking;
import hxSteeringBehaviors.behavior.combined.LeaderFollowing;

import sandy.core.Scene3D;
import sandy.core.scenegraph.ATransformable;
import sandy.core.scenegraph.Camera3D;
import sandy.core.scenegraph.Group;
import sandy.core.scenegraph.TransformGroup;
import sandy.primitive.Box;
import sandy.primitive.Cone;

class Test extends Sprite{
	public var scene:Scene3D;
	public var camera:Camera3D;
	public var obj:ATransformable;

	public function new():Void {
		super();


		camera = new Camera3D( 300, 300 );
		camera.z = -400;

		var root:Group = new Group();

		var c = new Cone(null, 10, 100, 5, 1);
		c.rotateX = 90;
		var t = new TransformGroup();
		t.addChild(c);
		obj = t;
		root.addChild(t);

		scene = new Scene3D( "scene", this, camera, root );
		
		addEventListener( Event.ENTER_FRAME, enterFrameHandler );
	}

	private function enterFrameHandler( event:Event ):Void {
		obj.translate(0,10,10);
		obj.lookAt(0,0,0);
		scene.render();
	}

	static public function main():Void {
		Lib.current.addChild(new Test());
	}
}
