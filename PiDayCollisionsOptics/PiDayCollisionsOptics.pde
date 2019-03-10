import java.math.BigDecimal;
import java.math.MathContext;
import org.nevec.rjm.*;
String pi;
MathContext mc;

void setup() {
  mc = new MathContext(100);
  pi = loadStrings("pi.txt")[0];
  int digits = 50;
  BigDecimal PI = new BigDecimal(pi);
  BigDecimal m1 = BigDecimal.ONE;
  BigDecimal m2 = BigDecimal.valueOf(100).pow(digits-1);
  BigDecimal theta = BigDecimalMath.atan(BigDecimalMath.sqrt(m1.divide(m2), mc));
  String collisions = PI.divide(theta, mc).toString();
  int dot = collisions.indexOf('.');
  println(collisions.substring(0, dot));
}
