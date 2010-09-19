package hxSteeringBehaviors.behavior.combined; 
	
	import hxSteeringBehaviors.Vehicle;
	import hxSteeringBehaviors.behavior.AbstractBehavior;
	import hxSteeringBehaviors.behavior.Alignment;
	import hxSteeringBehaviors.behavior.Cohesion;
	import hxSteeringBehaviors.behavior.Separation;

	/**
	 * Flocking Behavior
	 * as described by Craig Reynolds 
	 * 
	 * @author Eugene Zatepyakin
	 */
	class Flocking extends AbstractBehavior {
		
		public var separate:Separation;
		public var align:Alignment;
		public var cohere:Cohesion;
		
		public function new(?separateList:Iterable<Vehicle>, ?alignList:Iterable<Vehicle>, ?cohereList:Iterable<Vehicle>)
		{
			super();
			separate = new Separation(separateList);
			align = new Alignment(alignList);
			cohere = new Cohesion(cohereList);
		}

		public override function apply(veh:Vehicle):Void
		{
			separate.apply(veh);
			align.apply(veh);
			cohere.apply(veh);
		}
	}
