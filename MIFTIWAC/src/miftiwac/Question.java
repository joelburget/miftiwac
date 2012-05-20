package miftiwac;
import java.io.Serializable;

public class Question implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String questionText;
	public int type;
	public String[] answerTexts;
	public int answer;
}
