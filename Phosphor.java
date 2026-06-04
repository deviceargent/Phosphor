import com.formdev.flatlaf.FlatDarkLaf;

public class Phosphor
	extends FlatDarkLaf
{
	public static final String NAME = "Phosphor";

	public static boolean setup() {
		return setup( new Phosphor() );
	}

	public static void installLafInfo() {
		installLafInfo( NAME, Phosphor.class );
	}

	@Override
	public String getName() {
		return NAME;
	}
}
