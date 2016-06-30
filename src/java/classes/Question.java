package classes;

public class Question {

	int q_no, positive_marks, negative_marks;
	String question, choice1, choice2, choice3, choice4, q_type, correct_ans, flag;

	public Question(int q_no, int positive_marks, int negative_marks, String question, String choice1, String choice2, String choice3, String choice4, String q_type, String correct_ans, String flag) {
		this.q_no = q_no;
		this.positive_marks = positive_marks;
		this.negative_marks = negative_marks;
		this.question = question;
		this.choice1 = choice1;
		this.choice2 = choice2;
		this.choice3 = choice3;
		this.choice4 = choice4;
		this.q_type = q_type;
		this.correct_ans = correct_ans;
		this.flag = flag;
	}

	public Question(int q_no, int positive_marks, int negative_marks, String question, String choice1, String choice2, String choice3, String choice4, String flag) {
		this.q_no = q_no;
		this.positive_marks = positive_marks;
		this.negative_marks = negative_marks;
		this.question = question;
		this.choice1 = choice1;
		this.choice2 = choice2;
		this.choice3 = choice3;
		this.choice4 = choice4;
		this.flag = flag;
	}

	
}
