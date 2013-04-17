using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Nancy;
using Nancy.Security;
using Nancy.ModelBinding;

namespace Handler
{
	public class Home : NancyModule
	{
		public Home()
			: base("handler")
		{
			Get["/account"] = parameters =>
			{
				string response = string.Empty;
				Accounts objAccount = new Accounts();
				objAccount.Number = "21212";
				objAccount.Type = "2";
				response = Newtonsoft.Json.JsonConvert.SerializeObject(objAccount);

				return response;
			};

			Get["/name"] = parameters =>
			{
				string response = string.Empty;

				if (this.Request.Headers.ContentType == "text/xml")
				{
					response = "<xml>This is xml</xml>";
				}
				else if (this.Request.Headers.ContentType == "text/json")
				{
					response = "Name:ashish";
				}
				else
				{
					Member objMember = new Member();
					objMember.Id = "1";
					objMember.Password = "ashish";
					objMember.c_unqid = 1;
					objMember.AreYouHappy = true;
					objMember.CountryId = 2;
					objMember.Notes = "This is notes";
					objMember.Name = "MembeR Name";
					objMember.Sex = Member.Gener.Female;
					if (objMember.Hobbies == null) { objMember.Hobbies = new List<string>(); }

					objMember.Hobbies.Add("1");
					objMember.Hobbies.Add("2");

					if (objMember.TestList == null) { objMember.TestList = new List<int>(); }
					objMember.TestList.Add(1);
					objMember.TestList.Add(3);

					if (objMember.Accounts == null) { objMember.Accounts = new List<Accounts>(); }
					Accounts objAccount = new Accounts();
					objAccount.Number = "21212";
					objAccount.Type = "2";
					objMember.Accounts.Add(objAccount);

					response = Newtonsoft.Json.JsonConvert.SerializeObject(objMember);
					//response = "This is text response";
				}
				return response;
			};
				
			Post["/name/{memberid}"] = parameters =>
			{
				var obj = this.Bind<Member>();
				//var obj = new Member();
				//obj.Id = "1";
				//obj.Name = this.Request.Headers.ContentType ;
				//return obj.ToString();
				return string.Empty;
			};

			Post["/name"] = parameters =>
			{
				string response = string.Empty;
				IMember obj = this.Bind<Member>();
				Accounts objAccouts = this.Bind<Accounts>();
				//var obj = new Member();
				//obj.Id = "1";
				//obj.Name = this.Request.Headers.ContentType ;
				response = Newtonsoft.Json.JsonConvert.SerializeObject(obj);
				return response;
			};

			Get["/names"] = parameters =>
			{
				return string.Concat("Your Name Is ", parameters.name);
			};

		}
	}
}

public interface IMember
{
	bool AreYouHappy { get; set; }
	int c_unqid { get; set; }
	string Photo { get; set; }
	string Id { get; set; }
	string Notes { get; set; }
	string Password { get; set; }
	string Name { get; set; }
	List<Accounts> Accounts { get; set; }
	List<string> Hobbies { get; set; }
	List<int> TestList { get; set; }
}

public class Member : IMember
{
	public enum Gener : int
	{ 
		None=0,
		Male=1,
		Female=2
	}

	public bool AreYouHappy { get; set; }
	public int c_unqid { get; set; }
	public string Photo { get; set; }
	public Gener Sex { get; set; }
	public string Id { get; set; }
	public string Notes { get; set; }
	public string Password { get; set; }
	public string Name { get; set; }
	public List<Accounts> Accounts { get; set; }
	public List<string> Hobbies { get; set; }
	public List<int> TestList { get; set; }

	public int CountryId { get; set; }

	public override string ToString()
	{
		return Newtonsoft.Json.JsonConvert.SerializeObject(this);
		//return string.Format("<id>{0}</id><name>{1}</name>", Id, Name);
	}

	public void PrintMessage() { 
	
	}

	public int GetNumber() {
		return 1;
	}

	public List<Accounts> GetAccount()
	{
		return new List<Accounts> ();
	}
}

public class Accounts
{
	public string Number { get; set; }
	public string Type { get; set; }
}

public class Module : NancyModule
{
	public Module()
	{
		Get["/greet/{name}"] = x =>
		{
			return string.Concat("Hello ", x.name);
		};
	}
}

//namespace Handler
//{
//    public class Home : NancyModule
//    {
//        public Home()
//            : base("/handler")
//        {
//            Get["/home"] = parameters =>
//            {
//                return "This is from nancy handler";
//            };

//            Get["/name"] = parameters =>
//            {
//                return "My name is NAncy";
//            };

//        }
//    }
//}
