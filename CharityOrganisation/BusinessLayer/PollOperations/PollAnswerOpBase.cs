using CharityOrganisation.DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.PollOperations
{
    public class PollAnswerDb : DbItem {
        private int idPollAnswer;

        public int IdPollAnswer
        {
            get { return idPollAnswer; }
            set { idPollAnswer = value; }
        }
        private string answer;

        public string Answer
        {
            get { return answer; }
            set { answer = value; }
        }
        private int score;

        public int Score
        {
            get { return score; }
            set { score = value; }
        }
        private int? idQuestion;

        public int? IdQuestion
        {
            get { return idQuestion; }
            set { idQuestion = value; }
        }
    }

    public abstract class PollAnswerOpBase : Operacija
    {
        private bool givenId = false;

        public bool GivenId
        {
            get { return givenId; }
            set { givenId = value; }
        }

        private bool onlyActive = false;

        public bool OnlyActive
        {
            get { return onlyActive; }
            set { onlyActive = value; }
        }

        private int questionId;

        public int QuestionId
        {
            get { return questionId; }
            set { questionId = value; }
        }

        public override OperacijaRezultat izvrsi(CharityOrganisationDatabaseEntities entiteti)
        {
            IEnumerable<PollAnswerDb> iePollAnswers;

            if (this.givenId)
            {
                iePollAnswers = from answer in entiteti.PollAnswers
                                where (answer.idPollQuestion == this.questionId)
                                select new PollAnswerDb
                                  {
                                      IdPollAnswer=answer.idPollAnswer,
                                      Answer=answer.pollAnswer1,
                                      IdQuestion=answer.idPollQuestion,
                                      Score=answer.answerScore
                                  };
            }
            else if(this.onlyActive){
                iePollAnswers = from answer in entiteti.PollAnswers
                                join question in entiteti.PollQuestions
                                on answer.idPollQuestion equals question.idPollQuestion
                                where (question.pollActive==1)
                                select new PollAnswerDb
                                {
                                    IdPollAnswer = answer.idPollAnswer,
                                    Answer = answer.pollAnswer1,
                                    IdQuestion = answer.idPollQuestion,
                                    Score = answer.answerScore
                                };
            }
            else
            {
                iePollAnswers = from answer in entiteti.PollAnswers
                                select new PollAnswerDb
                                {
                                    IdPollAnswer = answer.idPollAnswer,
                                    Answer = answer.pollAnswer1,
                                    IdQuestion = answer.idPollQuestion,
                                    Score = answer.answerScore
                                };
            }

            PollAnswerDb[] niz = iePollAnswers.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
}