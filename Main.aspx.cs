using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.NET_Drill1
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            NorthwindsDataContext db = new NorthwindsDataContext();

            var products = from p in db.Products
                           select p;

            MyGrid.DataSourceID = LinqDataSource2.ID;
            MyGrid.DataBind();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            MyGrid.DataSourceID = LinqDataSource1.ID;
            MyGrid.DataBind();
        }

    }
}