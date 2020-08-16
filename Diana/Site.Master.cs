﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Diana
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!UsuarioLogueado)
                Response.Redirect("Login.aspx");
        }

        public bool UsuarioLogueado { get { return Session["usuario"]!=null; } }
    }
}