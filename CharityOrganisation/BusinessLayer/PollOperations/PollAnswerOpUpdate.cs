using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.PollOperations
{
    public class PollAnswerOpUpdate : PollAnswerOpBase {
        private PollAnswerDb updateAnswer;

        public PollAnswerDb UpdateAnswer
        {
            get { return updateAnswer; }
            set { updateAnswer = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            entiteti.PollAnswerUpdate(updateAnswer.IdPollAnswer,updateAnswer.Answer,updateAnswer.Score,updateAnswer.IdQuestion);
            return base.izvrsi(entiteti);
        }
    }

    public class PollAnswerOpUpvote : PollAnswerOpBase
    {
        private bool upvote = false;

        public bool Upvote
        {
            get { return upvote; }
            set { upvote = value; }
        }

        private int answerId;

        public int AnswerId
        {
            get { return answerId; }
            set { answerId = value; }
        }

        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            if (upvote) {
                entiteti.PollAnswerUpvote(this.answerId);
            }
            else
            {
                
            }
            return base.izvrsi(entiteti);
        }
    }
}