import java.util.Scanner;

public class GUIText implements GUIFace {

	@Override
	public void display() {
		Scanner scanner = new Scanner(System.in);
		int ans = -1;

		if (MiftiwacM.dynamicPageType == 1) {
			System.out.println(MiftiwacM.text[0]);
			System.out.println("(" + MiftiwacM.text[1] + ")");
			System.out.print("Please enter 1 for yes, 0 for no: ");
			ans = scanner.nextInt();
		} else if (MiftiwacM.dynamicPageType == 2) {
			System.out.println(MiftiwacM.text[0]);
			System.out.println("(" + MiftiwacM.text[1] + ")");
			System.out.print("Please enter an integer: ");
			ans = scanner.nextInt();
		} else if (MiftiwacM.dynamicPageType == 3) {
			System.out.println(MiftiwacM.text[0]);
			System.out.println("(" + MiftiwacM.text[1] + ")");
			for (int i = 1; i < MiftiwacM.text.length; i++) {
				System.out.println(i + ": " + MiftiwacM.text[i]);
			}
			System.out.print("Please enter the number of your selection: ");
			ans = scanner.nextInt();
		} else if (MiftiwacM.dynamicPageType == 4) {
			System.out.println("Subgenre: " + MiftiwacM.text[1]);
			System.out.println("Explanation: " + MiftiwacM.text[2]);
		}
		
		MiftiwacM.answer = ans;
	}
}
