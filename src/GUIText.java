import java.util.Scanner;

public class GUIText implements GUIFace {

	@Override
	public void display() {
		Scanner scanner = new Scanner(System.in);
		int ans = -1;

		if (Miftiwac.dynamicPageType == 1) {
			System.out.println(Miftiwac.text[0]);
			System.out.println("(" + Miftiwac.text[1] + ")");
			System.out.print("Please enter 1 for yes, 0 for no: ");
			ans = scanner.nextInt();
		} else if (Miftiwac.dynamicPageType == 2) {
			System.out.println(Miftiwac.text[0]);
			System.out.println("(" + Miftiwac.text[1] + ")");
			System.out.print("Please enter an integer: ");
			ans = scanner.nextInt();
		} else if (Miftiwac.dynamicPageType == 3) {
			System.out.println(Miftiwac.text[0]);
			System.out.println("(" + Miftiwac.text[1] + ")");
			for (int i = 1; i < Miftiwac.text.length; i++) {
				System.out.println(i + ": " + Miftiwac.text[i]);
			}
			System.out.print("Please enter the number of your selection: ");
			ans = scanner.nextInt();
		} else if (Miftiwac.dynamicPageType == 4) {
			System.out.println("Genre: " + Miftiwac.text[0]);
			System.out.println("Subgenre: " + Miftiwac.text[1]);
			System.out.println("Explanation: " + Miftiwac.text[2]);
		}
		
		Miftiwac.answer = ans;
	}
}
