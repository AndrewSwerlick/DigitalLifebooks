using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalLifeBooks.Models;
using System.Net.Mail;



namespace DigitalLifeBooks
{
	public partial class testemail : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			Response.Write("http://" + Request.ServerVariables["HTTP_HOST"] + "/");
			Response.End();


//			var msg = new MailMessage("noreply@digitallifebooks.org", "colleen@digitallifebooks.org");
			var msg = new MailMessage("dlb@slingfive.com", "gulltop@gmail.com");
			msg.Subject = "You Have Mail!";
			msg.IsBodyHtml = true;
			msg.Body = "<h1>Testing 123</h1>";

			var smtp = new SmtpClient();
			smtp.Send(msg);

			Response.Write("Done");
		}
	}
}