using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default :  System.Web.UI.Page
{
    public Params pp = new Params();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        try { 
            string p = File.ReadAllText(Server.MapPath("/params.json"));
            pp = Newtonsoft.Json.JsonConvert.DeserializeObject<Params>(p);
        }
        catch { }
        if (!Page.IsPostBack)
        {
            URL.Text = "" + pp.URL;
            USERNAME.Text = "" + pp.USERNAME;
            PASSWORD.Text = "" + pp.PASSWORD;
            DOMAIN.Text = "" + pp.DOMAIN;
            SUBJECT.Text = "" + pp.SUBJECT;
            MESSAGE.Text = "" + pp.MESSAGE;
            ENABLED.Checked = pp.ENABLED;
        }
        else
        {
            pp.URL = URL.Text;
            pp.USERNAME = USERNAME.Text;
            pp.PASSWORD = PASSWORD.Text;
            pp.DOMAIN = DOMAIN.Text;
            pp.SUBJECT = SUBJECT.Text;
            pp.MESSAGE = MESSAGE.Text;
            pp.ENABLED = ENABLED.Checked;
        }
        try
        {
            File.WriteAllText(Server.MapPath("/params.json"), Newtonsoft.Json.JsonConvert.SerializeObject(pp));
        }
        catch { }
    }

    protected void BT_Valider_Click(object sender, EventArgs e)
    {
        L_Result.Text = "";

        WS.svcUserAdmin ws = new WS.svcUserAdmin();
        ws.Url = pp.URL;

        Console("Smartermail Enable/Disable user process");
        Console("Connexion au WS : " + ws.Url);
        Console("Domaine : " + pp.DOMAIN);
        Console("<br/>");
        string[] emails = EMAILS.Text.Split(new string[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
        foreach(string email in emails)
        {
            var obj1 = ws.SetRequestedUserSettings(pp.USERNAME, pp.PASSWORD, email, new string[] { "isenabled="+pp.ENABLED });
            
            Console(email + " : " + Newtonsoft.Json.JsonConvert.SerializeObject(obj1),error: obj1.ResultCode != 0);

            
            WS.GenericResult obj3;
            if (!pp.ENABLED)
                obj3 = ws.UpdateUserAutoResponseInfo2(pp.USERNAME, pp.PASSWORD, email, pp.ENABLED, pp.SUBJECT, pp.MESSAGE, DateTime.MinValue.ToUniversalTime(), DateTime.MaxValue.ToUniversalTime());
            else
                obj3 = ws.UpdateUserAutoResponseInfo2(pp.USERNAME, pp.PASSWORD, email, pp.ENABLED,"", "", DateTime.MinValue.ToUniversalTime(), DateTime.Now.ToUniversalTime());

            Console(email + " : " + Newtonsoft.Json.JsonConvert.SerializeObject(obj3), error: obj3.ResultCode != 0);

            Console("<br/>");
        }
        P_Result.Visible = true;
    }

    void Console(string ch, bool error=false)
    {
        if(error)
            L_Result.Text = L_Result.Text + "<span class='text-danger'>" + ch + "</span><br/>";
        else
            L_Result.Text = L_Result.Text + ch + "<br/>";
    }
}