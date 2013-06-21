class Lms {

  Lms() {
  }

  double y[] =  { 400, 330, 369, 232, 540};
  double x[][] = {{ 1, 1, 1, 1, 1}, {2104, 1600, 2400, 1416, 3000}, { 3, 3, 3, 2, 4}};

  public static void main(String[] args) {
    double[] theta = {0, 0, 0};
 //   double[] theta = {89.60, 0.1392, -87.38};
 //   double[] theta = {-70.4346, 0.0638, 103.4360};
    double alpha = 0.000000002;
    log("Lms");
    log(theta);
    Lms lms = new Lms();
    for (int i = 0; i < 500; i++) {
      //theta = lms.batchLms(theta, alpha);
      lms.stochasticLms(theta, alpha);
      log(theta);
      double squares = 0;
      for (int j=0; j<5; j++) {
        double delta = lms.y_hyp(j, theta);
        squares += delta * delta;
      }
      log("---squares-" + squares);
    }
  }

  //------------------------stochastic gradient descent
  private void stochasticLms(double[] theta, double alpha) {
    for (int dataIndex = 0; dataIndex < 5; dataIndex++) {
      for (int i = 0; i< 3; i++) {
        theta[i] = theta[i] + alpha * stochasticDelta(i, dataIndex, theta);
      }
    }
  }

  private double stochasticDelta(int thetaIndex, int dataIndex, double[] theta) {
    double result = 0;
    result += y_hyp(thetaIndex, theta) * x[thetaIndex][dataIndex];
    return result;
  }
  //------------------------stochastic gradient descent

  //------------------------batch gradient descent
  private double[] batchLms(double[] theta, double alpha) {
    double[] newTheta = theta;
      newTheta = new double[3];
      for (int i = 0; i< 3; i++) {
        newTheta[i] = batchNewTheta(i, theta, alpha);
      }
    return newTheta;
  }

  private double batchNewTheta(int thetaIndex, double[] theta,
                          double alpha) {

    return theta[thetaIndex]
        + alpha * batchDelta(thetaIndex, theta);
  }

  private double batchDelta(int thetaIndex, double[] theta) {
    double result = 0;
    for (int i = 0; i < 5; i++) {
      result += y_hyp(i, theta) * x[thetaIndex][i];
    }
    return result;
  }
  //------------------------batch gradient descent

  private double y_hyp(int dataIndex, double[] theta) {
    double result = y[dataIndex] - hypothesis(theta, x[1][dataIndex], x[2][dataIndex]);
    return result;
  }
  private double hypothesis(double[] theta, double x1, double x2) {
    double result =  theta[0] + theta[1] * x1 + theta[2] * x2;
    return result;
  }

  private static void log(double[] numbers) {
    StringBuilder s = new StringBuilder();
    s.append("[");
    for (double number : numbers) {
      s.append(number);
      s.append(", ");
    }
    s.append("]");
    log(s.toString());
  }
  private static void log(String s) {
    System.out.println(s);
  }
}
