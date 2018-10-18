public class StateAndReward {

	
	/* State discretization function for the angle controller */
	public static String getStateAngle(double angle, double vx, double vy) {

		/* TODO: IMPLEMENT THIS FUNCTION */
		int stat = discretize2(angle, 8, -3.1415,
				3.1415);

		String state = "A"+stat;
		//System.out.println(state);
		return state;
	}

	/* Reward function for the angle controller */
	public static double getRewardAngle(double angle, double vx, double vy) {

		/* TODO: IMPLEMENT THIS FUNCTION */
		int state = discretize2(angle, 8, -3.1415,
				3.1415);
		
		double reward = 0;
		
		switch (state)
		{
		case 0:
		case 7:
			reward = -4;
			break;
		case 1:
		case 6:
			reward = -2;
			break;
		case 2:
		case 5:
			reward = -1;
			break;
		case 3:
		case 4:
			reward = 0;
			break;
		}

		System.out.println(reward);
		return reward;
	}

	/* State discretization function for the full hover controller */
	public static String getStateHover(double angle, double vx, double vy) {

		/* TODO: IMPLEMENT THIS FUNCTION */
		
		int angle_state = discretize2(angle, 11, -3.1415, 3.1415);
		int vx_state = discretize(vx, 7, -2, 2);
		int vy_state = discretize(vy, 5, -2, 2);

		String state = "A"+angle_state + "VX" + vx_state + "VY" + vy_state;
		
		return state;
	}

	/* Reward function for the full hover controller */
	public static double getRewardHover(double angle, double vx, double vy) {

		/* TODO: IMPLEMENT THIS FUNCTION */
		
		double reward = 0;
		
		int angle_state = discretize2(angle, 11, -3, 3);
		int vx_state = discretize(vx, 7, -2, 2);
		int vy_state = discretize(vy, 5, -2, 2);
		
		reward = (7-Math.abs(5 - angle_state))
				 + (5-Math.abs(3 - vx_state))
				 + (5-Math.abs(2 - vy_state));
		

		return reward;
	}

	// ///////////////////////////////////////////////////////////
	// discretize() performs a uniform discretization of the
	// value parameter.
	// It returns an integer between 0 and nrValues-1.
	// The min and max parameters are used to specify the interval
	// for the discretization.
	// If the value is lower than min, 0 is returned
	// If the value is higher than max, nrValues-1 is returned
	// otherwise a value between 1 and nrValues-2 is returned.
	//
	// Use discretize2() if you want a discretization method that does
	// not handle values lower than min and higher than max.
	// ///////////////////////////////////////////////////////////
	public static int discretize(double value, int nrValues, double min,
			double max) {
		if (nrValues < 2) {
			return 0;
		}

		double diff = max - min;

		if (value < min) {
			return 0;
		}
		if (value > max) {
			return nrValues - 1;
		}

		double tempValue = value - min;
		double ratio = tempValue / diff;

		return (int) (ratio * (nrValues - 2)) + 1;
	}

	// ///////////////////////////////////////////////////////////
	// discretize2() performs a uniform discretization of the
	// value parameter.
	// It returns an integer between 0 and nrValues-1.
	// The min and max parameters are used to specify the interval
	// for the discretization.
	// If the value is lower than min, 0 is returned
	// If the value is higher than max, nrValues-1 is returned
	// otherwise a value between 0 and nrValues-1 is returned.
	// ///////////////////////////////////////////////////////////
	public static int discretize2(double value, int nrValues, double min,
			double max) {
		double diff = max - min;

		if (value < min) {
			return 0;
		}
		if (value > max) {
			return nrValues - 1;
		}

		double tempValue = value - min;
		double ratio = tempValue / diff;

		return (int) (ratio * nrValues);
	}

}
