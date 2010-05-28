package hxSteeringBehaviors.behavior; 
	using hxSteeringBehaviors.Float3DTools;
	import hxSteeringBehaviors.Vehicle;
	import hxSteeringBehaviors.behavior.AbstractBehavior;
	import hxSteeringBehaviors.Float3D;

	/**
	 * @author Eugene Zatepyakin
	 */
	class Flee extends AbstractBehavior {
		
		public var target:Float3D;
		
		public function new(target:Float3D) 
		{
			super();
			this.target = target;
		}
		
		public override function apply(veh:Vehicle):Void
		{
			accumulator.setDiff(veh.position, target);
			
			var goalLength:Float = 1.1 * veh.velocity.approximateLength();
			accumulator.setApproximateTruncate(goalLength);
			accumulator.setDiff(accumulator, veh.velocity);
			accumulator.setApproximateTruncate(veh.maxForce);
			
			veh.applyGlobalForce(accumulator);
		}
	}
