public class Question {
	private String questionText;
	private int type;
	private String[] answerTexts;
	private int answer;

	public Question() {
		this.questionText = "";
		this.type = 0;
		this.answerTexts = new String[0];
		this.answer = 0;
	}
	
	public String getQuestionText() {
		return questionText;
	}

	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String[] getAnswerTexts() {
		return answerTexts;
	}

	public void setAnswerTexts(String[] answerTexts) {
		this.answerTexts = answerTexts;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}
}
